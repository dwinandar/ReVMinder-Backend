const express = require("express");
const { addService, getMobilById, getService, addPengingat, getPengingat } = require("../controllers/service");
const app = express();

app.post("/tambahservice/:vehicle/:id", addService);
app.post("/tambahservice/:vehicle/:id", addService);
app.post("/tambahpengingat/:vehicle/:id", addPengingat)
app.get("/:vehicle/:id/riwayatservice", getService)
app.get("/:vehicle/:id/pengingat", getPengingat)

module.exports = app;
