const express = require("express");
const greetingRoutes = require("./routes/greeting.routes");
const app = express();

app.use("/", greetingRoutes);

app.get("/", (req, res) => {
  res.send("Hello World!");
});

module.exports = app;
