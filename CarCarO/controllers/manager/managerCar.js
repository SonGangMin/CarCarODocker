const { cars, users, hashtags } = require("../../models");
const {
  getPagingDataCount,
  getPagination,
  getPagingData,
} = require("../pagination");

// 등록된 차리스트 뿌리기
exports.renderCar = async (req, res, next) => {
  try {
    const page = req.query.page ? parseInt(req.query.page, 10) : 1;
    // 전체 데이터 수 구하기
    const countResult = await cars.findAndCountAll({
      where: { status: 1 },
    });
    const totalCount = countResult.count;
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
      case "recommend_desc":
        order = [["recommends", "DESC"]];
        break;
      default:
        order = [["createdAt", "DESC"]]; // 최근 등록순
    }
    const { limit, offset } = getPagination(page, 5);
    const Cars = await cars.findAll({
      nest: true,
      where: { status: 1 },
      order,
      offset,
      limit,
    });
    const pagingData = getPagingDataCount(totalCount, page, limit);
    res.render("manager/managerCar", {
      title: "내차팔기",
      Cars,
      totalCount,
      pagingData,
      sortOption, // 전체 데이터 수 추가
    });
  } catch (error) {
    console.error(error);
    next(error);
  }
};

// 판매완료 리스트
exports.renderSaleComp = async (req, res) => {
  try {
    const pageNum = parseInt(req.query.page) || 1;
    const limit = 5;
    const offset = (pageNum - 1) * limit;

    // 전체 데이터 수 구하기
    const countResult = await cars.findAndCountAll({
      where: { status: 2 },
    });
    const totalCount = countResult.count;

    const totalPages = Math.ceil(totalCount / limit);

    const Cars = await cars.findAll({
      order: [["num", "DESC"]],
      where: { status: 2 },
      offset: offset,
      limit: limit,
    });

    res.render("manager/managerSaleComp", {
      title: "내차팔기",
      Cars,
      currentPage: pageNum,
      totalPages,
      totalCount, // 전체 데이터 수 추가
    });
  } catch (error) {
    console.error(error);
    next(error);
  }
};

// 정렬
exports.renderArray = async (req, res, next) => {
  try {
    const pageNum = parseInt(req.query.page) || 1;
    const limit = 5;
    const offset = (pageNum - 1) * limit;

    // 전체 데이터 수 구하기
    const countResult = await cars.findAndCountAll({
      where: { status: 1 },
    });
    const totalCount = countResult.count;

    const totalPages = Math.ceil(totalCount / limit);

    const array = decodeURIComponent(req.query.array);
    order = [];
    if (array === "최신순") {
      order.push(["createdAt", "DESC"]);
    } else if (array === "등록순") {
      order.push(["num", "DESC"]);
    }

    const Cars = await cars.findAll({
      where: { status: 1 },
      order: order,
      offset: offset,
      limit: limit,
    });

    res.render("manager/managerCar", {
      title: "내차팔기",
      Cars,
      currentPage: pageNum,
      totalPages,
      totalCount, // 전체 데이터 수 추가
    });
  } catch (error) {
    console.error(error);
    next(error);
  }
};

// 차량상세
exports.renderDetail = async (req, res, next) => {
  const carNum = req.params.carNum;
  try {
    const Cars = await cars.findOne({
      where: { carNum },
    });
    const isOwner = req.user && Cars.user_id === req.user.id;
    const status2 = cars.status === 2;
    const Hashs = await hashtags.findAll({
      where: { cars_num: Cars.num },
    });
    const Users = await users.findOne({
      where: { id: Cars.user_id },
    });

    res.render("manager/managerDetail", {
      title: Cars.model,
      Cars,
      isOwner,
      status2,
      Hashs,
      Users,
    });
  } catch (error) {
    console.error(error);
    next(error);
  }
};

// 추천차량등록
exports.addRecommend = async (req, res, next) => {
  const carNum = req.params.carNum;
  try {
    const recommend = await cars.findOne({ where: { carNum } });
    if (recommend.recommends === 0) {
      await cars.update({ recommends: 1 }, { where: { carNum } });
    } else if (recommend.recommends === 1) {
      await cars.update({ recommends: 0 }, { where: { carNum } });
    }
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

    res.redirect(`/manager/managerCar/saleComp`);
  } catch (error) {
    console.error(error);
    next(error);
  }
};

// 판매완료 취소처리
exports.saleCancle = async (req, res, next) => {
  const { carNum } = req.params;
  try {
    await cars.update({ status: 1 }, { where: { carNum } });
    res.status(200).send({ success: true });
  } catch (error) {
    console.error(error);
    next(error);
  }
};
