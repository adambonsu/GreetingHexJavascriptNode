const express = require("express");
const swaggerUi = require("swagger-ui-express");
const YAML = require("yamljs");
const path = require("path");

const greetingRoutes = require("./routes/greeting.routes");
const app = express();
const swaggerDocument = YAML.load(
  path.join(__dirname, "./api/greetings.spec.yml")
);

app.use("/", greetingRoutes);
app.use("/api-docs", swaggerUi.serve, swaggerUi.setup(swaggerDocument));

app.get("/", (req, res) => {
  res.send("Hello World!");
});

module.exports = app;
