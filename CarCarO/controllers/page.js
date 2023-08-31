const models = require("../models");
const { hashtags, likes, advertises } = require("../models");
const { Op } = require("sequelize");
const {
  getPagingDataCount,
  getPagination,
  getPagingData,
} = require("./pagination");

exports.renderMain = async (req, res, next) => {
  const isMine = req.user && req.user.id;
  // const carNum = req.param
  try {
    const Cars = await models.cars.findAndCountAll({
      nest: true,
      include: [
        {
          attributes: ["user_id"],
          model: likes,
          as: "likes",
        },
        {
          attributes: ["cars_hashtag"],
          model: hashtags,
          as: "hashtags",
        },
      ],
      order: [["createdAt", "desc"]],
    });

    const {count, rows: twits} = Cars;
    console.log("2222222->", twits[0].picture[0]);

    console.log("1111111111->", count);
    const isOwner = req.user && Cars.user_id === req.user.id;
    const status2 = Cars.status === 2;

    const Adver = await advertises.findAll({});

    res.render("index", {
      title: "CarCarO",
      twits,
      isOwner,
      status2,
      isMine,
      Adver,
      req: req
    });
  } catch (error) {
    console.error(error);
    next(error);
  }
};
// exports.renderMain = (req, res) => {
//   const usergrade = req.user && req.user.grade === 2;
//   console.log(usergrade);
//   res.render("index", { title: "CarcarO", usergrade });
// };
// 로그인, 회원가입
exports.renderJoin = async (req, res) => {
  const users = await models.users.findAll({
    attributes: ["id"],
  });
  res.render("join", { users, title: "회원가입" });
  // res.json(users);
};

exports.renderLogin = (req, res) => {
  res.render("login", { title: "로그인" });
};
// 마이페이지

exports.hashtagsearch = async (req, res, next) => {
  const query = req.query.hashtag;
  if (!query) {
    return res.redirect("/index");
  }
  try {
    const page = req.query.page ? parseInt(req.query.page, 10) : 1;
    const { limit, offset } = getPagination(page, 16);
    const isMine = req.user && req.user.id;
    const totalItems = await models.cars.count({
      where: {
        [Op.or]: [{ hashtag: { [Op.like]: `%${query}%` } }],
      },
    });
    const Cars = await models.cars.findAll({
      include: [
        {
          attributes: ["user_id"],
          model: likes,
          as: "likes",
        },
        {
          attributes: ["cars_hashtag"],
          model: hashtags,
          as: "hashtags",
        },
      ],
      where: {
        [Op.or]: [{ hashtag: { [Op.like]: `%${query}%` } }],
      },
      order: [["createdAt", "DESC"]],
      offset,
      limit,
    });
    const pagingData = getPagingDataCount(totalItems, page, limit);
    // res.json(Cars)
    res.render("hashtagsearch", {
      Cars,
      title: `검색 결과: ${query}`,
      totalItems,
      pagingData,
      isMine,
      req: req
    });
  } catch (err) {
    console.error(err);
    next(err);
  }
};
