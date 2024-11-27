const express = require('express');
const router = express.Router();
 const passport = require('passport');
 const {isLoggedIn} = require('../lib/auth');
//SignUp
router.get('/signup',(req, res)=>{
    res.render('auth/signup');
});


router.post('/signup', passport.authenticate('local.signup', {
    successRedirect: '/profile',
    failureRedirect: '/signup',
    failureFlash: true
 }))

 //Log in
router.get('/login',(req, res)=>{
    res.render('auth/login');
});

router.post('/login', (req, res, next) => {

    passport.authenticate('local.login', {
      successRedirect: '/profile',
      failureRedirect: '/login',
      failureFlash: true
    })(req, res, next); 
  });
 
router.get('/logout', (req, res, next) => {
    req.logout((err) => {
        if (err) {
            return next(err); // Maneja el error si ocurre
        }
        res.redirect('/home'); // Redirige al usuario a la página de inicio de sesión
    });
});

router.get('/profile', isLoggedIn, (req, res) =>{
    res.render('layouts/profile')
});

module.exports = router;