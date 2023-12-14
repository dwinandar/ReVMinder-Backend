const express = require("express");
const cookieParser = require("cookie-parser");

const cors = require("cors");
const routes = require("./routes");
const bodyParser = require("body-parser");

const app = express();
app.use(express.json());
app.use(cookieParser());
// app.use;
app.use(
  cors({
    origin: ["http://localhost:5173"],
    methods: ["POST", "GET"],
    credentials: true,
  }),
);

app.use(bodyParser.json());

app.use(routes);

const PORT = 8080;
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
