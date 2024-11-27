const express = require('express');
const router = express.Router();

router.get('/home',(req, res)=>{
    res.render('layouts/home',{
        currentPath: req.path,
    });
});
router.post('/home', (req,res) => {
    res.send('received');
})

router.get('/loading',(req, res)=>{
    res.render('partials/loader',{
        currentPath: req.path,
    });
});
router.post('/loading', (req,res) => {
    res.send('received');
})


module.exports = router;