const express = require("express");
const {
  registerUser,
  loginUser,
  verifyUser,
  getUserData,
  logout,
  getUser,
} = require("../controllers/auth");
const app = express();

app.post("/register", registerUser);
app.post("/login", loginUser);
app.get("/logout", logout);
app.get("/verify", verifyUser, getUserData);
app.get("/user", verifyUser, getUser);

module.exports = app;
