const express = require('express');
const router = express.Router();

router.get('/home',(req, res)=>{
    res.render('layouts/home');
});
router.post('/home', (req,res) => {
    res.send('received');
})


module.exports = router;