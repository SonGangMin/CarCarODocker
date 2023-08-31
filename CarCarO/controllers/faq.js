const { Op } = require("sequelize");

exports.leftpopup = async (req, res, next) => {
    try {
        res.render('leftpopup', {
            title: 'Sample',
            req: req
        });
    } catch (error) {
        next(error);
    }
};

exports.rightpopup = async (req, res, next) => {
    try {
        res.render('rightpopup', {
            title: 'Sample',
            req: req
        });
    } catch (error) {
        next(error);
    }
};