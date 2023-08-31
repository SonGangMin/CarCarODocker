const { users, cars } = require("../../models");
const {
  getPagingDataCount,
  getPagination,
  getPagingData,
} = require("../pagination");
const bcrypt = require("bcrypt");

// 회원리스트 뿌리기
exports.renderUser = async (req, res) => {
  const page = req.query.page ? parseInt(req.query.page, 10) : 1;
  const { limit, offset } = getPagination(page, 15);
  try {
    const listCount = await users.findAndCountAll({
      include: [
        {
          attributes: ["num"],
          model: cars,
        },
      ],
      order: [
        ["grade", "DESC"],
        ["no", "ASC"],
      ],
      offset,
      limit,
    });
    const { count, rows: Users } = listCount;
    const totalItems = await users.count({});
    const pagingData = getPagingDataCount(totalItems, page, limit);
    // res.json(Users);
    console.log("1111111111111111111111111111", totalItems);
    res.render("manager/managerUser", {
      title: "유저관리",
      Users,
      pagingData,
      totalItems,
    });
  } catch (error) {
    console.error(error);
  }
};

// 회원 권한 수정
exports.gradeEdit = async (req, res, next) => {
  const userId = req.params.id;
  try {
    const User = await users.findOne({ where: { id: userId } });
    if (User.grade === 1) {
      await users.update({ grade: 2 }, { where: { id: userId } });
    } else if (User.grade === 2) {
      await users.update({ grade: 1 }, { where: { id: userId } });
    }
    res.redirect("/manager/managerUser");
  } catch (error) {
    console.error(error);
    next(error);
  }
};

// 회원 탈퇴 시키기
exports.deleteEdit = async (req, res, next) => {
  const userId = req.params.id;
  try {
    const User = await users.destroy({
      where: { id: userId },
    });
    res.redirect("/manager/managerUser");
  } catch (error) {
    console.error(error);
    next(error);
  }
};

exports.renderUserCarsale = async (req, res, next) => {
  const userId = req.params.id;
  try {
    const Cars = await cars.findAndCountAll({
      where: { user_id: userId, status: 1 },
      order: [["createdAt", "DESC"]],
    });
    const SoldCars = await cars.findAndCountAll({
      where: { user_id: userId, status: 2 },
      order: [["createdAt", "DESC"]],
    });
    const { count, rows: twits } = Cars;
    const { count: soldcount, rows: solds } = SoldCars;
    const allcount = count + soldcount;
    res.render("manager/managerUser_carsale", {
      userId,
      allcount,
      count,
      soldcount,
      twits,
      solds,
    });
  } catch (err) {
    console.error(err);
    next(err);
  }
};

exports.renderinfoEdit = async (req, res, next) => {
  try {
    const no = req.params.no;
    const user = await users.findOne({ where: { no } });
    res.render("manager/managerUser_info", {
      user,
    });
  } catch (err) {
    console.error(err);
    next(err);
  }
};

exports.infoEdit = async (req, res, next) => {
  try {
    const { id, password, name, tel, email, birth } = req.body;
    const hash = await bcrypt.hash(password, 12);

    await users.update(
      { id, password: hash, name, tel, email, birth },
      { where: { id } }
    );
    res.json({ success: true });
  } catch (err) {
    console.error(err);
    next(err);
  }
};
