const express = require("express");
const router = express.Router();
const { renderManagerInquiry, renderManagerInquiryanswer, updateManagerInquiryanswer } = require("../../controllers/manager/managerinquiry");
const { isManager } = require("../../middlewares");


router.get("/", isManager, renderManagerInquiry);
router.get("/:number", isManager, renderManagerInquiryanswer);
router.post("/:number", isManager, updateManagerInquiryanswer);

module.exports = router;