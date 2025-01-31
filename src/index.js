
const express = require('express');
const morgan = require('morgan');
const path = require('path');
const  { create, engine } = require('express-handlebars');
const session = require('express-session');
const validator = require('express-validator');
const passport = require('passport');
const flash = require('connect-flash');
const MySQLStore = require('express-mysql-session')(session);
const bodyParser = require('body-parser');
const helpers = require('./lib/helpers');
const { database } = require('./keys');
const dotenv = require('dotenv');
dotenv.config();

//Initializations
const app = express();
require('./lib/passport');

//Settings
app.set('port', process.env.PORT);
app.set('views', path.join(__dirname, 'views'));
const exphbs = create({
    defaultLayout: 'main',
    layoutsDir: path.join(__dirname, 'views', 'layouts'),
    partialsDir: path.join(__dirname, 'views', 'partials'),
    extname: '.hbs',
    helpers: helpers
  });



app.engine('.hbs', exphbs.engine); 
app.set('view engine', '.hbs');


//Middlewares
app.use(morgan('dev'));
app.use(express.urlencoded({extended: true}));
app.use(express.json());
app.set('trust proxy', 1); // Habilita proxy en Railway

app.use(session({
    secret: process.env.SECRET,
    resave: false,
    saveUninitialized: false,
    cookie: {
      secure: process.env.NODE_ENV === 'production', // Solo en HTTPS
      httpOnly: true, // Evita acceso desde JavaScript en el cliente
      sameSite: 'lax' // Protege contra ataques CSRF
    },
    store: new MySQLStore(database)
  }));
app.use(passport.initialize());
app.use(passport.session());


//Global variables
app.use(flash());
app.use((req, res, next) => {
    res.locals.message = req.flash('message');
    res.locals.success = req.flash('success');
    res.locals.user = req.user;
    res.locals.currentPath = req.path;
    next();
});

// Luego, define el middleware de errores sin req.flash()
app.use((err, req, res, next) => {
    console.error(err);
    res.status(500).send('Internal Server Error');
});
//Routes 
app.use(require('./routes/index'));
app.use(require('./routes/authentication'));

 
//Public
app.use(express.static(path.join(__dirname,'public')));




//Starting server 
app.listen(app.get('port'), () => {
    console.log('Server on port', app.get('port'));
})

