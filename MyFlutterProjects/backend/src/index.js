const bcrypt = require("bcryptjs");
const express = require('express');
const { dbConnection } = require("./config/dbConnection");
const userRoutes = require("../API/UserController.js"); // 👈 Imported controller

const app = express();
const PORT = 3000;

// Middleware
app.use(express.json());

// Routes
app.use("/api", userRoutes); // 👈 Use controller under /api prefix



// Start the server
app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`);
});
