const express = require('express');
const morgan = require('morgan');
const { create } = require('express-handlebars');
const path = require('path');

//Initializations
const app = express();

//Settings
app.set('port', process.env.PORT || 4000);
app.set('views', path.join(__dirname, 'views'));
const exphbs = create({
    defaultLayout: 'main',
    layoutsDir: path.join(__dirname, 'views', 'layouts'),
    partialsDir: path.join(__dirname, 'views', 'partials'),
    extname: '.hbs',
    helpers: require('./lib/handlebars')
  });

app.engine('.hbs', exphbs.engine); 
app.set('view engine', '.hbs');

//Middlewares
app.use(morgan('dev'));
app.use(express.urlencoded({extended: false}));
app.use(express.json());

//Global variables
app.use((req,res,next) =>{
    next();
})

//Routes 
app.use(require('./routes/index'));
app.use(require('./routes/authentication'));

 
 
//Public
app.use(express.static(path.join(__dirname,'public')));

//Starting server 
app.listen(app.get('port'), () => {
    console.log('Server on port', app.get('port'));
})