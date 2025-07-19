const { MongoClient } = require('mongodb');

// Connection URL
const dbConnectionUrl = 'mongodb://127.0.0.1:27017';
const client = new MongoClient(dbConnectionUrl);

let dbConnection= async ()=>{
 await client.connect();
 const db = client.db("ElderlyNest");
 return db;
}

module.exports={dbConnection};