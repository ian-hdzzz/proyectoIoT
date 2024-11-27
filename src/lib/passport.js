const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;

const pool = require('../database');
const helpers = require('../lib/helpers');

passport.use('local.login', new LocalStrategy({
    usernameField: 'email',
    passwordField: 'password',
    passReqToCallback: true
  }, async (req, email, password, done) => {
    const rows = await pool.query('SELECT * FROM user WHERE email = ?', [email]);
    console.log(rows);
    if (rows.length > 0) {
      const user = rows[0];
      const validPassword = await helpers.matchPassword(password, user.password);

      if (validPassword) {
        done(null, user, req.flash('success', 'Welcome '));
      } else {
        done(null, false, req.flash('message', 'Incorrect Password'));
      }
    } else {
      return done(null, false, req.flash('message', 'The Username does not exists.'));
    }
  }));


passport.use('local.signup', new LocalStrategy({
    usernameField: 'email',
    passwordField: 'password',
    passReqToCallback: true

},  async(req, email, password, done) =>{
    console.log(req.body);
    const {name} = req.body;
    const newUser = {
      name,
        email,
        password

    };
    
    newUser.password = await helpers.encryptPassword(password);
    //Saving in the database
    const result = await pool.query('INSERT INTO user SET ?', [newUser]);
    newUser.id = result.insertId;
    return done(null, newUser);

}));

passport.serializeUser((user, done) => {
    console.log('Serializing user:', user);
    done(null, user.id || user.ID);
});

passport.deserializeUser(async (id,done) => {
    const rows = await pool.query('SELECT * FROM user WHERE id = ?', [id]);
    done(null, rows[0]);    
});