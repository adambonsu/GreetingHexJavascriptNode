require("dotenv").config();

// Get the port from the environment variable or use 3000 as default
const port = process.env.PORT || 3000;

console.log("DEBUG: PORT = " + port);
const app = require("./app");
app.listen(port, () => {
  console.log("Server is now running");
});
