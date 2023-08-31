const express = require("express");
const { isLoggedIn, isNotLoggedIn } = require("../middlewares");
const {
  renderMain,
  renderJoin,
  renderLogin,
  renderSalecar,
  renderFindcar,
  renderHeader,
  hashtagsearch,
} = require("../controllers/page");
const {  carLike, carDislike} = require('../controllers/car')

const router = express.Router();

router.use((req, res, next) => {
  res.locals.user = req.user;
  // res.locals.followerCount = 0;
  // res.locals.followingCount = 0;
  // res.locals.followingIdList = [];
  next();
});

// router.get('/join', renderJoin);
router.get("/join", isNotLoggedIn, renderJoin);

// router.get('/login', renderJoin);
router.get("/login", isNotLoggedIn, renderLogin);

router.get("/", renderMain);
router.post("/", carLike);
router.post("/2", carDislike);
router.get("/hashtagsearch/", hashtagsearch);


module.exports = router;
