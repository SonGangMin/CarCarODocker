const express = require("express");
const router = express.Router();
const { renderManager } = require("../../controllers/manager/managerboard");
const { isManager } = require("../../middlewares/index");

router.get("/", isManager, renderManager);

module.exports = router;
