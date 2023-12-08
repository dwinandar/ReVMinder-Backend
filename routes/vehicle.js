const express = require("express");
const {
  getMobilData,
  getMotorData,
  addMobilData,
  addMotorData,
  getMobilDataById,
  getMotorDataById,
  deleteMobilById,
  deleteMotorById,
  getTotalMobil,
  getTotalMotor,
} = require("../controllers/vehicle");

const app = express();

app.get("/mobil", getMobilData);
app.get("/motor", getMotorData);

app.post("/insert/mobil", addMobilData);
app.post("/insert/motor", addMotorData);

app.get("/read/mobil/:id", getMobilDataById);
app.get("/read/motor/:id", getMotorDataById);

app.delete("/delete/mobil/:id", deleteMobilById);
app.delete("/delete/motor/:id", deleteMotorById);

app.get("/totaldatamobil", getTotalMobil);
app.get("/totaldatamotor", getTotalMotor);

module.exports = app;
