const express = require("express");
const { findID } = requrie("../controllers/findID")

router.post("/findID", findID);

module.exports = router;