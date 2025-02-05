const express = require("express");
const router = express.Router();
const greetingController = require("../controllers/greeting.controller");

router.get("/greeting", greetingController.getGreeting);

module.exports = router;
