const passport = require("passport");

module.exports ={
    database: {
        host: process.env.DB_HOST ||'localhost' ,
        user: process.env.DB_USER || 'root',
        password: process.env.DB_PASSWORD || 'JU1Pz,98',
        database: process.env.DB_NAME ||  'database_PSB',
        port: process.env.DB_PORT || 3306 || 4000,

    }
}