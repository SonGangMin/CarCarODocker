const passport = require("passport");
const local = require("./localStrategy");
const kakao = require("./kakaoStrategy");
const models = require("../models");
const { users } = require("../models");

module.exports = () => {
    passport.serializeUser((user, done) => {
    // console.log("4444444->", user);
    done(null, user.id);
    });

    passport.deserializeUser((id, done) => {
    // console.log("6666666->", id);
    models.users
        .findOne({ where: { id } })
        .then((user) => done(null, user))
        .catch((err) => done(err));
    });

    local();
    kakao();
};
