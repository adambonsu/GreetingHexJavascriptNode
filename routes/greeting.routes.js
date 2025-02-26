const express = require("express");
const router = express.Router();
const greetingController = require("../controllers/greeting.controller");

router.get("/greetings", greetingController.getGreeting);

module.exports = router;
