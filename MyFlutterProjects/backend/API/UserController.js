const express = require('express');
const bcrypt = require("bcryptjs");
const { dbConnection } = require("../src/config/dbConnection"); // adjust path as needed

const router = express.Router();

// Sample route

router.get('/', (req, res) => {
  res.send('User route is working!');
});

// Helper to generate random code
function generateRandomCode(length = 12) {
  const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  let code = '';
  for (let i = 0; i < length; i++) {
    code += chars.charAt(Math.floor(Math.random() * chars.length));
  }
  return code;
}


// Check uniqueness of code
async function generateUniqueCode(collection) {
  let code;
  let exists;
  do {
    code = generateRandomCode();
    exists = await collection.findOne({ uniqueCode: code });
  } while (exists);
  return code;
}



// POST /userRegister
router.post("/userRegister", async (req, res) => {
  try {
    const { name, email, password } = req.body;

    if (!name || !email || !password) {
      return res.status(400).send({
        status: 0,
        msg: "Name, email, and password are required.",
      });
    }

    const db = await dbConnection();
    const users = db.collection("User");

    const existing = await users.findOne({ email });
    if (existing) {
      return res.status(409).send({
        status: 0,
        msg: "Email already exists.",
      });
    }

    const uniqueCode = await generateUniqueCode(users);
    const hashedPassword = await bcrypt.hash(password, 10);

    const userObj = {
      name,
      email,
      password: hashedPassword,
      uniqueCode,
    };

    const result = await users.insertOne(userObj);

    res.send({
      status: 1,
      msg: "User Registered Successfully",
      data: {
        _id: result.insertedId,
        name,
        email,
        uniqueCode,
      },
    });

  } catch (err) {
    console.error("Registration Error:", err);
    res.status(500).send({
      status: 0,
      msg: "Registration failed",
      error: err.message,
    });
  }
});

module.exports = router;


//old


// api to find the number of objects in my collection of Databases

router.get("/userGetAll",async(req,res)=>{

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


// // Insert Into DataBase
// app.post("/user-insert", async (req, res) => {
//   try {
//     const myDb = await dbConnection();
//     console.log("Connected to DB");

//     const loginCollection = myDb.collection("User2"); // change collection here
//     console.log("Collection ready");

//     const obj = {
//       name: req.body.name,
//       email: req.body.email,
//       password: req.body.password,
//     };
//     console.log("Received Object:", obj);

//     const insertRes = await loginCollection.insertOne(obj);
//     console.log("Insert result:", insertRes);

//     res.send({
//       status: 1,
//       msg: "User Inserted!!!",
//       insertRes,
//     });
//   } catch (err) {
//     console.error("Insert Error:", err.message);
//     res.send({
//       status: 0,
//       msg: "Insert failed",
//       error: err.message,
//     });
//   }
// });
