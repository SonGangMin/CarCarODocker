const express = require("express");
const router = express.Router();
const {
    renderManagerFaq,
    updateManagerFaq,
    renderUpdate,
    deleteManagerFaq,
    upgradeManagerFaq,
    downgradeManagerFaq,
    uploadManagerFaq,
    renderCreateFaq,
    createFaq,
} = require("../../controllers/manager/managerfaq");
const { isManager } = require("../../middlewares/index");

router.get("/", isManager, renderManagerFaq);
router.get("/createfaq", isManager, renderCreateFaq);
router.post("/", isManager, createFaq);
router.get("/:number", isManager, renderUpdate);
router.post("/:number", isManager, updateManagerFaq);
router.post("/delete/:number", isManager, deleteManagerFaq);
router.post("/upgrade/:number", isManager, upgradeManagerFaq);
router.post("/downgrade/:number", isManager, downgradeManagerFaq);

// router.post("/upload/:number", isManager, uploadManagerFaq);



module.exports = router;
