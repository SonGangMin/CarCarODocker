const express = require("express");
const router = express.Router();
const models = require("../models");
const path = require("path");
const fs = require("fs");
const { isLoggedIn } = require("../middlewares");
const { Op } = require("sequelize");
const { leftpopup, rightpopup } = require("../controllers/faq")


router.get("/", async (req, res, next) => {
  try {
    const faq = await models.faqs.findAll({
      nest: true,
      order: [["createdAt", "DESC"]],
    });
    // console.log("자료확인--", faq[0]);
    res.render("faq", {
      twits: faq,
      title: "FAQ",
      req: req
    });
  } catch (err) {
    console.error(err);
    next(err);
  }
});

router.get("/inquiry", isLoggedIn, function (req, res, next) {
  res.render("inquiry", { 
    title: "1:1문의",
    req: req 
  });
});
router.post("/inquiry", isLoggedIn, function (req, res, next) {
  const title = req.body.title;
  const content = req.body.content;
  const user_id = req.body.user_id;

  models.inquirys
    .create({
      title: title,
      content: content,
      user_id: user_id,
    })
    .then((result) => {
      // console.log(result);
      res.redirect("/faq");
    })
    .catch((err) => {
      console.error(err);
      next(err);
    });
});

router.get("/faqSearch/:keyword", async (req, res, next) => {
  const query = req.query.keyword;
  if (!query) {
    return res.redirect("/faq");
  }
  try {
    const results = await models.faqs.findAll({
      where: {
        [Op.or]: [
          { title: { [Op.like]: `%${query}%` } },
          { content: { [Op.like]: `%${query}%` } },
        ],
      },
    });
    res.render("faqSearch", {
      results,
      title: `검색 결과: ${query}`,
      req: req
    });
  } catch (err) {
    console.error(err);
    next(err);
  }
});

// router.get('/faqSearch/:keyword', async (req, res, next) => {
//   const
// })

router.get("/leftpopup", leftpopup);
router.get("/rightpopup", rightpopup);

module.exports = router;
