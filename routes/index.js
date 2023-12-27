const express = require("express");
const app = express();

const auth = require("./auth");
const vehicle = require("./vehicle");
const service = require("./service");

app.use("/", auth);
app.use("/vehicle", vehicle);
app.use("/service", service);

module.exports = app;
