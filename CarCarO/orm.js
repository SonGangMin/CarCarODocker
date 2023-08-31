const SequelizeAuto = require("sequelize-auto");
const auto = new SequelizeAuto("CarCarO", "root", "edurootroot", {
  host: "127.0.0.1", // DB Host 주소
  port: "3306", // 포트 번호
  dialect: "mysql", // 사용하는 DBMS 종류
});

auto.run();
