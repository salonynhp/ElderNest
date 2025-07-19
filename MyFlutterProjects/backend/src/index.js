const express = require('express');
const {dbConnection} = require("./config/dbConnection");
const app = express();
const PORT = 3000;

// Middleware
app.use(express.json());

// Sample route
app.get('/', (req, res) => {
  res.send('Backend is working!');
});


// api to find the number of objects in my collection of Databases

app.get("/user-read",async(req,res)=>{

  //database ban kar isme copy hua
  let myDb = await dbConnection();
  //table creation in DB
  let loginCollection = myDb.collection("User");

  let UserData = await loginCollection.find().toArray();

    res.send({
        status:1,
        msg:"List of Users :",
        UserData
    })
})


// Insert Into DataBase
app.post("/user-insert",async(req,res)=>{

  //database ban kar isme copy hua
  let myDb = await dbConnection();
  //table creation in DB
  let loginCollection = myDb.collection("User");

  //Insertion from the json from Thunder client copying from req body
  let obj = {
    name:req.body.name,
    email:req.body.email,
    password:req.body.password
  }

  let insertRes = await loginCollection.insertOne(obj);

    res.send({
        status:1,
        msg:"User Inserted !!",
        insertRes
    })
})




// // Start the server
app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`);
});