const express = require('express');
const router = express.Router();
const pool = require('../database');
 

router.get('/signup',(req, res)=>{
    res.render('auth/signup');
});
router.post('/signup', (req,res) => {
    res.send('received');
})

module.exports = router;