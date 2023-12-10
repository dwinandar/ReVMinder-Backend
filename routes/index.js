const express = require("express");
const app = express();

const auth = require("./auth");
const vehicle = require("./vehicle");

app.use("/", auth);
app.use("/vehicle", vehicle);
app.use("/service", vehicle);

module.exports = app;
