const express = require("express");
const cookieParser = require("cookie-parser");
const morgan = require("morgan");
const path = require("path");
const session = require("express-session");
const dotenv = require("dotenv");
const ejs = require("ejs");
const nuncjucks = require("nunjucks");
const passport = require("passport");
const multer = require("multer");
const bodyParser = require("body-parser");

dotenv.config();

const pageRouter = require("./routes/page");
const authRouter = require("./routes/auth");
const carRouter = require("./routes/car");
const faqRouter = require("./routes/faq");
const boardRouter = require("./routes/board");
const mypageRouter = require("./routes/mypage");
// const myinquiryRouter = require("./routes/myinquiry");

const managerPageRouter = require("./routes/Manager/managerpage");
const managerUserRouter = require("./routes/Manager/managerUser");
const managerBoardRouter = require("./routes/Manager/managerboard");
const managerfaqRouter = require("./routes/Manager/managerfaq");
const managerinquiryRouter = require("./routes/Manager/managerinquiry");
const managerCarRouter = require("./routes/Manager/managerCar");
const advertiseRouter = require("./routes/Manager/advertise");

const { sequelize } = require("./models");
const passportConfig = require("./passport");

const app = express();
passportConfig();

app.set("views", path.join(__dirname, "views"));
app.set("view engine", "ejs");
// nuncjucks.configure('views', {
//   express: app,
//   watch: true,
// });
// sequelize.sync({force: false})
//   .then(() => {
//     console.log('데이터베이스 연결 성공');
//   })
//   .catch((err) => {
//     console.error(err);
//   });

app.use(morgan("dev"));
app.use("/", express.static(path.join(__dirname, "public")));
app.use("/carImg", express.static(path.join(__dirname, "carImg")));
app.use("/img", express.static(path.join(__dirname, "adverImg")));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser(process.env.COOKIE_SECRET));
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(
  session({
    resave: false,
    saveUninitialized: false,
    secret: process.env.COOKIE_SECRET,
    cookie: {
      httpOnly: true,
      secure: false,
    },
  })
);
app.use(passport.initialize());
app.use(passport.session());

app.use("/", pageRouter);
app.use("/auth", authRouter);
app.use("/car", carRouter);
app.use("/board", boardRouter);
app.use("/faq", faqRouter);
app.use("/mypage", mypageRouter);
// app.use("/myinquiry", myinquiryRouter);

app.use("/manager", managerPageRouter);
app.use("/manager/managerUser", managerUserRouter);
app.use("/manager/managerboard", managerBoardRouter);
app.use("/manager/managerFaq", managerfaqRouter);
app.use("/manager/managerinquiry", managerinquiryRouter);
app.use("/manager/managerCar", managerCarRouter);
app.use("/manager/advertise", advertiseRouter);

app.use((req, res, next) => {
  const error = new Error(`${req.method} ${req.url} 라우터가 없습니다.`);
  error.status = 404;
  next(error);
});

app.use((err, req, res, next) => {
  res.locals.message = err.message;
  res.locals.error = process.env.NODE_ENV !== "production" ? err : {};
  res.status(err.status || 500);
  res.render("error");
});

app.listen(app.get("port"), () => {
  console.log(app.get("port"), "번 포트에서 대기중");
});

module.exports = app;
