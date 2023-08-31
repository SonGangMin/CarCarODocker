const bcrypt = require("bcrypt");
const passport = require("passport");
const { users } = require("../models");

exports.join = async (req, res, next) => {
  const { id, password, name, email, tel, birth } = req.body;

  try {
    const exUser = await users.findOne({ where: { id } });

    if (exUser) {
      return res.redirect("/join?error=exist");
    }
    // console.log(password);

    const hash = await bcrypt.hash(password, 12);

    await users.create({
      id,
      password: hash,
      name,
      email,
      tel,
      birth,
    });

    return res.redirect("/");
  } catch (error) {
    console.error(error);
    return next(error);
  }
};

exports.login = (req, res, next) => {
  passport.authenticate("local", (authError, user, info) => {
    if (authError) {
      console.error(authError);
      return next(authError);
    }

    if (!user) {
      return res.redirect(`/login/?loginError=${info.message}`);
    }
    return req.login(user, (loginError) => {
      // console.log('5555555555', user);
      if (loginError) {
        console.error(loginError);
        return next(loginError);
      }
      // const previousUrl = req.headers.referer;
      // console.log("ddddddddddddddddddddddddddddddddddddddddddd", previousUrl);
      return res.redirect(req.body.redirectUrl);
    });
  })(req, res, next);
};

exports.logout = (req, res) => {
  req.logout(() => {
    res.redirect("/");
  });
};

// exports.checkid = async (req, res, next) => {
//   const id = req.params.id;
//   try {
//     const user = await models.users.findOne({ where: { id } });
//     if (user) {
//       res.status(200).json({ message: "user exists" });
//     } else {
//       res.status(404).json({ message: "user does not exist" });
//     }
//   } catch (err) {
//     console.error(err);
//     next(err);
//   }
// };

// 아이디 중복확인

exports.checkIdDuplicate = async (req, res, next) => {
  const id = req.query.id;

  if (!id || id.trim() === "") {
    return res.status(400).json({ message: "아이디를 입력해주세요" });
  }
  if (!/^[a-zA-Z0-9]{8,16}$/.test(id)) {
    return res.status(400).json({
      message: "아이디는 영문 + 숫자 조합으로 8~16자리로 설정하셔야 합니다",
    });
  }

  try {
    const user = await users.findOne({ where: { id } });
    if (user) {
      return res.json({ isDuplicate: true });
    } else {
      return res.json({ isDuplicate: false });
    }
  } catch (error) {
    console.error(error);
    next(error);
  }
};

exports.renderfindid = async (req, res, next) => {
  res.render("findid", {
    title: "CarCarO ID 찾기",
  });
};
exports.findid = async (req, res, next) => {
  const { name, email } = req.body;
  try {
    const find = await users.findOne({
      where: { name, email },
    });

    if (find) {
      res.render("findedid", {
        find,
        title: "CarCarO ID 찾기",
      });
    } else {
      res.render("findError", {
        title: "CarCarO ID 찾기 에러",
      });
    }
  } catch (err) {
    console.error(err);
    next(err);
  }
};

exports.renderfindpw = async (req, res, next) => {
  res.render("findpw", {
    title: "비밀번호 찾기",
  });
};

exports.findpw = async (req, res, next) => {
  const { name, id, email } = req.body;
  try {
    const find = await users.findOne({
      where: { name, id, email },
    });
    if (find) {
      res.render("findedpw", {
        find,
        title: "CarCarO PW 찾기",
      });
    } else {
      res.render("findError", {
        title: "CarCarO PW 찾기 에러",
      });
    }
  } catch (err) {
    console.error(err);
    next(err);
  }
};

exports.changepw = async (req, res, next) => {
  const id = req.body.id;
  const password = req.body.password;
  console.log("dddddddddddddddddddddddddd", req.body.password);
  const hash = await bcrypt.hash(password, 12);
  try {
    if (!id) {
      return res.render("findError", {
        title: "ID오류",
      });
    }
    await users.update({ password: hash }, { where: { id } });
    return res.render("successpwchange", {
      title: "비밀번호 수정완료",
    });
  } catch (err) {
    console.error(err);
    next(err);
  }
};
