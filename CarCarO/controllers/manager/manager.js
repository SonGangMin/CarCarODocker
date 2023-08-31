const models = require("../../models");

exports.renderManager = (req, res) => {
  res.render("manager/managerMain", { title: "관리자페이지" });
};
