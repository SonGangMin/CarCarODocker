const models = require("../../models");

exports.renderManagerFaq = async (req, res, next) => {
  try {
    const PAGE_SIZE = 15;
    const page = req.query.page ? parseInt(req.query.page, 10) : 1;
    const offset = (page - 1) * PAGE_SIZE;
    const total = await models.faqs.count();
    const totalPages = Math.ceil(total / PAGE_SIZE);

    const twits = await models.faqs.findAll({
      nest: true,
      order: [["createdAt", "DESC"]],
      offset,
      limit: PAGE_SIZE,
    });
    // console.log("자료확인--", twits[0]);
    res.render("manager/managerFaq", {
      twits,
      title: "FAQ",
      totalPages,
      currentPage: page,
    });
  } catch (err) {
    console.error(err);
    next(err);
  }
};

exports.renderUpdate = async (req, res, next) => {
  const number = req.params.number;
  try {
    const faq = await models.faqs.findOne({ where: { number } });
    if (!faq) {
      throw new Error("존재하지 않는 글입니다.");
    }
    res.render("manager/managerFaq_edit", { faq, title: "수정하기" });
  } catch (err) {
    console.error(err);
    next(err);
  }
};

exports.updateManagerFaq = async (req, res, next) => {
  const number = req.params.number;
  const { title, content } = req.body;
  try {
    const faq = await models.faqs.findOne({ where: { number } });
    if (!faq) {
      throw new Error("존재하지 않는 게시글입니다.");
    }
    await models.faqs.update({ title, content }, { where: { number } });
    res.redirect(`/manager/managerFaq/`);
  } catch (err) {
    console.error(err);
    next(err);
  }
};

exports.deleteManagerFaq = async (req, res, next) => {
  const number = req.params.number;
  try {
    const faq = await models.faqs.findOne({ where: { number } });
    if (!faq) {
      throw new Error("존재하지 않는 게시글입니다.");
    }
    await models.faqs.destroy({ where: { number } });
    res.redirect("/manager/managerFaq/");
  } catch (err) {
    console.error(err);
    next(err);
  }
};

exports.upgradeManagerFaq = async (req, res, next) => {
  const number = req.params.number;
  try {
    const faq = await models.faqs.findOne({ where: { number: number } });
    if (!faq) {
      throw new Error("등록되지 않았습니다.");
    }
    await models.faqs.update({ grade: 2 }, { where: { number: number } });
    res.redirect(`/manager/managerFaq/`);
  } catch (err) {
    console.error(err);
    next(err);
  }
};

exports.downgradeManagerFaq = async (req, res, next) => {
  const number = req.params.number;
  try {
    const faq = await models.faqs.findOne({ where: { number: number } });
    if (!faq) {
      throw new Error("내리기 실패했습니다.");
    }
    await models.faqs.update({ grade: 1 }, { where: { number: number } });
    res.redirect(`/manager/managerFaq/`);
  } catch (err) {
    console.error(err);
    next(err);
  }
};

exports.updateManagerFaq = async (req, res, next) => {
  const number = req.params.number;
  const { title, content } = req.body;
  try {
    const faq = await models.faqs.findOne({ where: { number } });
    if (!faq) {
      throw new Error("존재하지 않는 게시글입니다.");
    }
    await models.faqs.update({ title, content }, { where: { number } });
    res.redirect(`/manager/managerFaq/`);
  } catch (err) {
    console.error(err);
    next(err);
  }
};

exports.renderCreateFaq = (req, res, next) => {
  res.render("manager/managerFaq_upload", { title: "FAQ등록하기" });
};

exports.createFaq = async (req, res, next) => {
  try {
    await models.faqs.create({
      number: null,
      title: req.body.title,
      content: req.body.content,
      createdAt: null,
      updatedAt: null,
      grade: 1,
    });
    res.redirect("/manager/managerFaq/");
  } catch (err) {
    console.error(err);
    next(err);
  }
};
