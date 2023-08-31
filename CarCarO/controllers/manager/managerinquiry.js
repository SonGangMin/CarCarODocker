const { inquirys } = require("../../models");
const models = require("../../models");

exports.renderManagerInquiry = async (req, res, next) => {
  try {
    const PAGE_SIZE = 15;
    const page = req.query.page ? parseInt(req.query.page, 10) : 1;
    const offset = (page - 1) * PAGE_SIZE;
    const total = await models.inquirys.count();
    const totalPages = Math.ceil(total / PAGE_SIZE);

    const twits = await models.inquirys.findAll({
      nest: true,
      order: [["answer", "DESC"]],
      offset,
      limit: PAGE_SIZE,
    });
    // console.log("자료확인--", twits[0]);
    res.render("manager/managerinquiry", {
      twits,
      title: "1대1문의하기",
      totalPages,
      currentPage: page,
    });
  } catch (err) {
    console.error(err);
    next(err);
  }
};

exports.renderManagerInquiryanswer = async (req, res, next) => {
  try {
    const number = req.params.number;
    const title = await models.inquirys.findOne({
      where: { number },
    });
    if (!title) {
      return res.status(404).send("해당 게시글을 찾을 수 없습니다.");
    }
    res.render("manager/managerinquiry_answer", { title });
  } catch (err) {
    console.error(err);
    next(err);
  }
};

exports.updateManagerInquiryanswer = async (req, res, next) => {
  const number = req.params.number;
  try {
    const answer = req.body.answer;
    await models.inquirys.update({ answer }, { where: { number } });
    res.redirect(`/manager/managerinquiry/`);
  } catch (err) {
    console.error(err);
    next(err);
  }
};
