const express = require('express');
const router = express.Router();

router.get('/home',(req, res)=>{
    res.render('home');
});
router.post('/home', (req,res) => {
    res.send('received');
})


module.exports = router;