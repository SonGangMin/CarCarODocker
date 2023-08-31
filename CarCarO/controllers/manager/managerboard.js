const models = require("../../models");
const { Op } = require("sequelize");
const {
  getPagingDataCount,
  getPagination,
  getPagingData,
} = require("../pagination");

exports.renderManager = (req, res) => {
  res.render("manager/managerpage", { title: "관리자페이지" });
};

exports.renderManagerBoard = async (req, res, next) => {
  try {
    const page = req.query.page ? parseInt(req.query.page, 10) : 1;
    const total = await models.boards.count();
    const { limit, offset } = getPagination(page, 15);
    const listCount = await models.boards.findAndCountAll({
      nest: true,
      include: [
        {
          attributes: ["name"],
          model: models.users,
          as: "user",
        },
      ],
      order: [
        ["grade", "DESC"],
        ["createdAt", "DESC"],
      ],
      offset,
      limit,
    });
    const { count: totalItems, rows: twits } = listCount;
    const pagingData = getPagingDataCount(totalItems, page, limit);
    res.render("manager/managerBoard", {
      twits,
      title: "커뮤니티",
      total,
      pagingData,
      totalItems,
    });
  } catch (err) {
    console.error(err);
    next(err);
  }
};

exports.renderManagerBoardContent = async (req, res, next) => {
  try {
    const boardId = req.params.postId;
    const board = await models.boards.findOne({
      where: { postId: boardId },
      include: [
        {
          attributes: ["name"],
          model: models.users,
          as: "user",
        },
        {
          model: models.cars,
          as: "car_num_car",
        },
      ],
    });
    if (!board) {
      return res.status(404).send("해당 게시글을 찾을 수 없습니다.");
    }
    const page = req.query.page ? parseInt(req.query.page, 10) : 1;
    const total = await models.boards.count();
    const { limit, offset } = getPagination(page, 10);

    const listCount = await models.comments.findAndCountAll({
      where: { post_id: req.params.postId },
      include: [
        {
          attributes: ["name"],
          model: models.users,
          as: "user",
        },
      ],
      order: [["createdAt", "ASC"]],
      offset,
      limit,
    });
    const { count: totalItems, rows: comments } = listCount;
    const pagingData = getPagingDataCount(totalItems, page, limit);
    res.render("manager/managerBoard_content", {
      board,
      title: "게시글 내용 보기",
      comments,
      pagingData,
      totalItems,
    });
  } catch (err) {
    console.error(err);
    next(err);
  }
};

exports.renderManagerBoardSearch = async (req, res, next) => {
  try {
    const page = req.query.page ? parseInt(req.query.page, 10) : 1;
    const total = await models.boards.count();
    const { limit, offset } = getPagination(page, 15);
    let where = {};
    const { searchType, result } = req.query;
    if (result) {
      if (searchType === "title") {
        where = {
          title: { [Op.like]: `%${result}%` },
        };
      } else if (searchType === "content") {
        where = {
          content: { [Op.like]: `%${result}%` },
        };
      } else if (searchType === "title_content") {
        where = {
          [Op.or]: [
            { title: { [Op.like]: `%${result}%` } },
            { content: { [Op.like]: `%${result}%` } },
          ],
        };
      } else {
        where = {
          [Op.or]: [
            { user_id: { [Op.like]: `%${result}%` } },
            { "$user.name$": { [Op.like]: `%${result}%` } },
          ],
        };
      }
    }
    const listCount = await models.boards.findAndCountAll({
      include: [
        {
          attributes: ["name"],
          model: models.users,
          as: "user",
        },
      ],
      where,
      order: [["createdAt", "DESC"]],
      offset,
      limit,
    });
    const { count: totalItems, rows: results } = listCount;
    const pagingData = getPagingDataCount(totalItems, page, limit);
    res.render("manager/managerBoard_search", {
      results,
      title: `검색 결과: ${result}`,
      total,
      pagingData,
      totalItems,
    });
  } catch (err) {
    console.error(err);
    next(err);
  }
};

exports.renderManagerBoardEdit = async (req, res, next) => {
  const postId = req.params.postId;
  try {
    const post = await models.boards.findOne({ where: { postId: postId } });
    if (!post) {
      throw new Error("존재하지 않는 게시글입니다.");
    }
    if (post.userId !== req.session.userId) {
      throw new Error("게시글 수정 권한이 없습니다.");
    }
    res.render("manager/managerBoard_edit", { post, title: "수정하기" });
  } catch (err) {
    console.error(err);
    next(err);
  }
};

exports.editManagerBoard = async (req, res, next) => {
  const postId = req.params.postId;
  const { title, content } = req.body;
  try {
    const post = await models.boards.findOne({ where: { postId: postId } });
    if (!post) {
      throw new Error("존재하지 않는 게시글입니다.");
    }
    await models.boards.update(
      { title, content },
      { where: { postId: postId } }
    );
    res.redirect(`/manager/managerboard/content/${postId}`);
  } catch (err) {
    console.error(err);
    next(err);
  }
};

exports.deleteManagerPost = async (req, res, next) => {
  const postId = req.params.postId;
  try {
    const post = await models.boards.findOne({ where: { postId: postId } });
    if (!post) {
      throw new Error("존재하지 않는 게시글입니다.");
    }
    if (post.userId !== req.session.userId) {
      throw new Error("게시글 삭제 권한이 없습니다.");
    }
    await models.boards.destroy({ where: { postId: postId } });
    res.redirect("/manager/managerboard/");
  } catch (err) {
    console.error(err);
    next(err);
  }
};

exports.editManagerGradeup = async (req, res, next) => {
  const postId = req.params.postId;
  try {
    const post = await models.boards.findOne({ where: { postId } });
    if (!post) {
      throw new Error("존재하지 않는 게시글입니다.");
    }
    await models.boards.update({ grade: 2 }, { where: { postId } });
    res.redirect("/manager/managerboard");
  } catch (err) {
    console.error(err);
    next(err);
  }
};
exports.editManagerGradedown = async (req, res, next) => {
  const postId = req.params.postId;
  try {
    const post = await models.boards.findOne({ where: { postId } });
    if (!post) {
      throw new Error("존재하지 않는 게시글입니다.");
    }
    await models.boards.update({ grade: 1 }, { where: { postId } });
    res.redirect("/manager/managerboard");
  } catch (err) {
    console.error(err);
    next(err);
  }
};
exports.createManagerComment = async (req, res, next) => {
  // console.log("req.body =>", req.body);
  // console.log("==========", req.params.postId);
  postId = req.params.postId;
  try {
    await models.comments.create({
      number: null,
      content: req.body.content,
      createdAt: null,
      updatedAt: null,
      user_id: req.user.id,
      post_id: req.params.postId,
    });
    res.redirect(`/manager/managerboard/${postId}`);
  } catch (err) {
    console.error(err);
    next(err);
  }
};

exports.editManagerComment = async (req, res, next) => {
  const commentId = req.params.commentId;
  const { content } = req.body;
  try {
    await models.comments.update({ content }, { where: { number: commentId } });
    res.redirect("back");
  } catch (err) {
    console.error(err);
    next(err);
  }
};
