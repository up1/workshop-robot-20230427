const express = require('express');
const mysql = require("mysql2")
const path = require("path")
const jwt = require("jsonwebtoken")
const bcrypt = require("bcryptjs")

const app = express();

const db = mysql.createConnection({
    host: process.env.DATABASE_HOST,
    user: process.env.DATABASE_USER,
    password: process.env.DATABASE_PASSWORD,
    database: process.env.DATABASE
})

const publicDir = path.join(__dirname, './public')

app.use(express.static(publicDir))
app.use(express.urlencoded({extended: 'false'}))
app.use(express.json())

app.set('view engine', 'hbs')

db.connect((error) => {
    if(error) {
        console.log(error)
    } else {
        console.log("MySQL connected!")
    }
})

app.get("/", (req, res) => {
    res.render("index")
})

app.get("/register", (req, res) => {
    res.render("register")
})

app.get("/login", (req, res) => {
    res.render("login")
})

app.post("/auth/register", (req, res) => {    
    const { name, email, password, password_confirm } = req.body

    db.query('SELECT email FROM users WHERE email = ?', [email], async (error, result) => {
        if(error){
            console.log(error)
        }

        if( result.length > 0 ) {
            return res.render('register', {
                message: 'This email is already in use'
            })
        } else if(password !== password_confirm) {
            return res.render('register', {
                message: 'This email is already in use'
            })
        }

        // let hashedPassword = await bcrypt.hash(password, 8)       
        db.query('INSERT INTO users SET?', {name: name, email: email, password: password}, (err, result) => {
            if(error) {
                console.log(error)
            } else {
                return res.render('register', {
                    message: 'User registered!'
                })
            }
        })        
    })
})

app.post("/auth/login", async (req, res) => {    
    const { name, password } = req.body
    console.log('before', password)
    let hashedPassword =  await bcrypt.hash(password, 8)
    console.log('after', hashedPassword)
    db.query('SELECT name FROM users WHERE name = ? AND password = ?', [name, password], async (error, result) => {
        if(error){
            console.log(error)
        }

        if( result.length > 0 ) {
            return res.render('login', {
                message: 'Login success'
            })
        } else {
            return res.render('login', {
                message: 'Login failure'
            })
        }      
    })
})

app.listen(3000, ()=> {
    console.log("server started on port 3000")
})