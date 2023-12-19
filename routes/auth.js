const express = require("express");
const {
  registerUser,
  loginUser,
  verifyUser,
  getUserData,
} = require("../controllers/auth");
const app = express();

app.post("/register", registerUser);
app.post("/login", loginUser);
app.get("/verify", verifyUser, getUserData);

module.exports = app;
