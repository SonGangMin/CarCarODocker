const models = require("../models");
const { Op } = require("sequelize");

exports.renderInquiry = async (req, res, next) => {
    try {
        const PAGE_SIZE = 15;
        const page = req.query.page ? parseInt(req.query.page, 10) : 1;
        const offset = (page - 1) * PAGE_SIZE;
        const total = await models.inquirys.count();
        const totalPages = Math.ceil(total / PAGE_SIZE);
        const twits = await models.inquirys.findAll({
        order: [
            ["createdAt", "DESC"],
        ],
        offset,
        limit: PAGE_SIZE,
        });
      // console.log("자료확인--", twits[0]);
        res.render("myinquiry", {
            twits,
            title: "내 문의",
            totalPages,
            currentPage: page,
        });
        } catch (err) {
            console.error(err);
            next(err);
    }
};