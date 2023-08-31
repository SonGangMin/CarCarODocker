const { cars, hashtags, users, likes } = require("../models");
const moment = require("moment");
const multer = require("multer");
const path = require("path");
const fs = require("fs");
const { Op } = require("sequelize");
const {
  getPagingDataCount,
  getPagination,
  getPagingData,
} = require("./pagination");

// 내차찾기 페이지
exports.renderFindcar = async (req, res, next) => {
  try {
    const page = req.query.page ? parseInt(req.query.page, 10) : 1;
    const isMine = req.user && req.user.id;
    const total = await cars.count();
    const sortOption = req.query.sort || "createdAt_desc";
    let order;
    switch (sortOption) {
      case "createdAt_desc":
        order = [["createdAt", "DESC"]];
        break;
      case "year_asc":
        order = [["year", "ASC"]];
        break;
      case "year_desc":
        order = [["year", "DESC"]];
        break;
      case "mileage_asc":
        order = [["mile", "ASC"]];
        break;
      case "mileage_desc":
        order = [["mile", "DESC"]];
        break;
      case "price_asc":
        order = [["price", "ASC"]];
        break;
      case "price_desc":
        order = [["price", "DESC"]];
        break;
      case "likes_desc":
        order = [["likes_count", "DESC"]];
        break;
      default:
        order = [["createdAt", "DESC"]]; // 최근 등록순
    }
    const twentyFourHoursAgo = moment().subtract(24, "hours").toDate();
    const recenttotal = await cars.count({
      where: {
        createdAt: {
          [Op.gte]: twentyFourHoursAgo,
        },
      },
    });
    const { limit, offset } = getPagination(page, 16);
    const listCount = await cars.findAll({
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
      order,
      offset,
      limit,
    });
    const totalItems = total;
    const twits = listCount;
    const pagingData = getPagingDataCount(totalItems, page, limit);
    // console.log("111111111111->", pagingData);

    // console.log(twits);
    // res.json(twits);
    res.render("carfind", {
      title: "내차찾기",
      twits,
      total,
      pagingData,
      totalItems,
      isMine,
      recenttotal,
      sortOption,
      req: req,
    });
  } catch (err) {
    console.error(err);
    next(err);
  }
};

exports.carLike = async (req, res, next) => {
  try {
    await likes.create({
      number: null,
      user_id: req.user.id,
      car_num: req.body.carNum,
    });
    res.redirect("back");
  } catch (err) {
    console.error(err);
    next(err);
  }
};
exports.carDislike = async (req, res, next) => {
  try {
    await likes.destroy({
      where: { car_num: req.body.carNum, user_id: req.user.id },
    });
    res.redirect("back");
  } catch (err) {
    console.error(err);
    next(err);
  }
};

// 내차찾기 검색
exports.renderCarSearch = async (req, res, next) => {
  try {
    const page = req.query.page ? parseInt(req.query.page, 10) : 1;
    const isMine = req.user && req.user.id;
    const twentyFourHoursAgo = moment().subtract(24, "hours").toDate();
    const total = await cars.count();
    const recenttotal = await cars.count({
      where: {
        createdAt: {
          [Op.gte]: twentyFourHoursAgo,
        },
      },
    });
    const { limit, offset } = getPagination(page, 16);
    const {
      from,
      brand,
      model,
      lowprice,
      highprice,
      trans,
      startyear,
      endyear,
      fuel,
      shortmile,
      longmile,
    } = req.query;

    const where = {
      price: {
        [Op.between]: [parseInt(lowprice), parseInt(highprice)],
      },
      year: {
        [Op.between]: [parseInt(startyear), parseInt(endyear)],
      },
      mile: {
        [Op.between]: [parseInt(shortmile), parseInt(longmile)],
      },
      model: {
        [Op.like]: [`%${model}%`],
      },
    };

    if (trans) {
      where.trans = trans;
    }
    if (from) {
      where.from = from;
      // console.log("자동차 국내외 : ", from);
    }
    if (brand) {
      where.brand = brand;
    }
    if (fuel) {
      where.fuel = fuel;
    }
    const totalItems = await cars.count({
      where,
    });
    const sortOption = req.query.sort || "createdAt_desc";
    let order;
    switch (sortOption) {
      case "createdAt_desc":
        order = [["createdAt", "DESC"]];
        break;
      case "year_asc":
        order = [["year", "ASC"]];
        break;
      case "year_desc":
        order = [["year", "DESC"]];
        break;
      case "mileage_asc":
        order = [["mile", "ASC"]];
        break;
      case "mileage_desc":
        order = [["mile", "DESC"]];
        break;
      case "price_asc":
        order = [["price", "ASC"]];
        break;
      case "price_desc":
        order = [["price", "DESC"]];
        break;
      default:
        order = [["createdAt", "DESC"]]; // 최근 등록순
    }
    const listCount = await cars.findAll({
      where,
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
      order,
      offset,
      limit,
    });
    const Cars = listCount;
    const pagingData = getPagingDataCount(totalItems, page, limit);
    // res.json({ totalItems });
    res.render("carfind_search", {
      Cars,
      title: "차량검색결과",
      isMine,
      total,
      recenttotal,
      from,
      brand,
      model,
      lowprice,
      highprice,
      trans,
      startyear,
      endyear,
      fuel,
      shortmile,
      longmile,
      pagingData,
      totalItems,
      req: req,
    });
  } catch (err) {
    console.error(err);
    next(err);
  }
};

// 등록된차 리스트 페이지
exports.renderSalecar = async (req, res, next) => {
  try {
    const pageNum = parseInt(req.query.page) || 1;
    const limit = 5;
    const offset = (pageNum - 1) * limit;

    // 전체 데이터 수 구하기
    const countResult = await cars.findAndCountAll({
      where: { user_id: req.user.id },
    });
    const totalCount = countResult.count;

    const totalPages = Math.ceil(totalCount / limit);

    const Cars = await cars.findAll({
      attributes: [
        "num",
        "carNum",
        "model",
        "brand",
        "picture",
        "year",
        "mile",
        "fuel",
        "hashtag",
      ],
      order: [["num", "DESC"]],
      where: { user_id: req.user.id },
      offset: offset,
      limit: limit,
    });

    res.render("carsale", {
      title: "내차팔기",
      Cars,
      currentPage: pageNum,
      totalPages,
      totalCount, // 전체 데이터 수 추가
      req: req,
    });
  } catch (error) {
    console.error(error);
    next(error);
  }
};

// 등록된 차량 상세
exports.renderDetail = async (req, res, next) => {
  const num = req.params.num;
  const isMine = req.user && req.user.id;
  try {
    const Cars = await cars.findOne({
      where: { num },
    });
    const Hashs = await hashtags.findAll({
      where: { cars_num: num },
    });
    const Users = await users.findOne({
      where: { id: Cars.user_id },
    });
    const isOwner = req.user && Cars.user_id === req.user.id;
    const status2 = Cars.status === 2;
    // console.log("Cars.user_id====================", Cars.user_id);
    // console.log("users.id=======================", req.user.id);

    res.render("cardetail", {
      title: Cars.model,
      Cars,
      isOwner,
      status2,
      req: req,
      Hashs,
      Users,
      isMine,
    });
  } catch (error) {
    console.error(error);
    next(error);
  }
};

// 내차팔기 등록 페이지
exports.renderCarup = (req, res) => {
  res.render("carupload", {
    title: "내차등록하기",
    req: req,
  });
};

// 내차팔기 db 등록
exports.uploadPost = async (req, res, next) => {
  const {
    carNum,
    from,
    brand,
    model,
    mile,
    year,
    fuel,
    trans,
    seater,
    disp,
    type,
    method,
    color,
    area,
    tel,
    roof,
    nav,
    key,
    light,
    sensor,
    camera,
    box,
    leather,
    heated,
    airbag,
    etc,
    price,
    hashtag,
  } = req.body;
  try {
    const files = [];
    for (const file of req.files) {
      files.push({ filename: file.filename, url: `/carImg/${file.filename}` });
    }
    const Cars = await cars.create({
      num: null,
      carNum,
      from,
      brand,
      model,
      mile,
      year,
      fuel,
      trans,
      picture: files,
      seater,
      disp,
      type,
      method,
      color,
      area,
      tel,
      roof,
      nav,
      key,
      light,
      sensor,
      camera,
      box,
      leather,
      heated,
      airbag,
      etc,
      price,
      hashtag,
      user_id: req.user.id,
    });
    const Hashtags = req.body.hashtag.match(/#[^\s#]*/g);
    if (Hashtags) {
      const result = await Promise.all(
        Hashtags.map((tag) => {
          return hashtags.findOrCreate({
            where: {
              cars_hashtag: tag.slice(1).toLowerCase(),
              cars_num: Cars.num,
            },
          });
        })
      );
      // await post.addHashtags(result.map(r => r[0]));
    }

    res.status(200).json({ msg: "/car/carsale" });
  } catch (error) {
    console.error(error);
    next(error);
  }
};

// 수정 등록
exports.editBtn = async (req, res, next) => {
  const {
    num,
    carNum,
    from,
    brand,
    model,
    mile,
    year,
    fuel,
    trans,
    seater,
    disp,
    type,
    method,
    color,
    area,
    tel,
    roof,
    nav,
    key,
    light,
    sensor,
    camera,
    box,
    leather,
    heated,
    airbag,
    etc,
    price,
    hashtag,
  } = req.body;
  try {
    const files = [];
    for (const file of req.files) {
      files.push({ filename: file.filename, url: `/carImg/${file.filename}` });
    }
    const carNum = req.params.carNum;
    const Cars = await cars.update(
      {
        carNum,
        from,
        brand,
        model,
        mile,
        year,
        fuel,
        trans,
        picture: files,
        seater,
        disp,
        type,
        method,
        color,
        area,
        tel,
        roof,
        nav,
        key,
        light,
        sensor,
        camera,
        box,
        leather,
        heated,
        airbag,
        etc,
        price,
        hashtag,
        user_id: req.user.id,
      },
      {
        where: { carNum },
      }
    );
    const Hashtags = req.body.hashtag.match(/#[^\s#]*/g);
    await hashtags.destroy({
      where: { cars_num: num },
    });
    if (Hashtags) {
      const result = await Promise.all(
        Hashtags.map((tag) => {
          return hashtags.findOrCreate({
            where: {
              cars_hashtag: tag.slice(1).toLowerCase(),
              cars_num: num,
            },
          });
        })
      );
      // await post.addHashtags(result.map(r => r[0]));
    }

    res.status(200).json({ msg: "/car/carsale" });
  } catch (error) {
    console.error(error);
    next(error);
  }
};
// 해시태그
exports.renderHashtag = async (req, res, next) => {
  const query = req.query.hashtag;
  if (!query) {
    return res.redirect("/");
  }
  try {
    const hashtag = await hashtags.findOne({ where: { title: query } });
    let cars = [];
    if (hashtag) {
      cars = await hashtag.getPosts({
        include: [{ model: cars }],
      });
    }

    return res.render("carsale", {
      title: `${query}`,
      twits: cars,
      req: req,
    });
  } catch (error) {
    console.error(error);
    return next(error);
  }
};

// 리스트 수정
exports.carEdit = async (req, res, next) => {
  try {
    const carNum = req.params.carNum;
    const Cars = await cars.findOne({
      where: {
        carNum,
      },
    });
    const from = Cars?.from || "";
    res.render("caredit", {
      title: "내차 수정하기",
      Cars,
      from,
      req: req,
    });
  } catch (error) {
    console.error(error);
    next(error);
  }
};

// 게시글, 리스트 삭제
exports.listDelete = async (req, res, next) => {
  try {
    const carNum = req.params.carNum;
    await cars.destroy({
      where: { carNum },
    });
    res.redirect("back");
  } catch (error) {
    console.error(error);
    next(error);
  }
};

// 판매완료
exports.saleComp = async (req, res, next) => {
  const { carNum } = req.params;
  try {
    const Cars = await cars.update({ status: 2 }, { where: { carNum } });

    res.redirect(`/car/detail/${carNum}`);
  } catch (error) {
    console.error(error);
    next(error);
  }
};
