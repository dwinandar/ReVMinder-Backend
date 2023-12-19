const express = require("express");
const { addService, getMobilById, getService } = require("../controllers/service");
const app = express();

app.post("/tambahservice/:vehicle/:id", addService);
app.post("/tambahservice/:vehicle/:id", addService);
app.get("/:vehicle/:id/riwayatservice", getService)

module.exports = app;
