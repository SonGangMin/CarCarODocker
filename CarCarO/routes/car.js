const express = require("express");
const {
  renderFindcar,
  renderSalecar,
  renderCarup,
  renderHashtag,
  uploadPost,
  renderDetail,
  carEdit,
  editBtn,
  listDelete,
  renderCarSearch,
  carLike,
  saleComp,
  carDislike,
} = require("../controllers/car");
const { isLoggedIn } = require("../middlewares");
const fs = require("fs");
const multer = require("multer");
const path = require("path");

const router = express.Router();

// 내차찾기 페이지
router.get("/carfind", renderFindcar);

router.post("/carLike", carLike);
router.post("/carDislike", carDislike);
// 내차찾기 검색
router.get("/carfind/search/", renderCarSearch);
// 내차팔기 리스트 페이지
router.get("/carsale", isLoggedIn, renderSalecar);
// 내차팔기 등록 페이지
router.get("/carupload", isLoggedIn, renderCarup);
// 내차팔기 수정 페이지
router.get("/caredit/:carNum", isLoggedIn, carEdit);
// 내차팔기 리스트 삭제
router.post("/delete/:carNum", isLoggedIn, listDelete);
// 내차팔기 리스트 상세 페이지
router.get("/detail/:num", renderDetail);
// 해시태그 검색 리스트 페이지
router.get("/hashtag", isLoggedIn, renderHashtag);
// 팔기완료 등록
router.post("/saleComp/:carNum", saleComp);

// 내차팔기 등록
const upload = multer({
  storage: multer.diskStorage({
    destination(req, file, cb) {
      cb(null, "carImg/");
    },
    filename(req, file, done) {
      const ext = path.extname(file.originalname);
      const fileName = `${path.basename(
        file.originalname,
        ext
      )}_${Date.now()}${ext}`;
      done(null, fileName);
    },
  }),
  fileFilter: (req, file, cb) => {
    const typeArray = file.mimetype.split("/");
    const fileType = typeArray[1];

    if (
      fileType == "jpg" ||
      fileType == "png" ||
      fileType == "jpeg" ||
      fileType == "gif" ||
      fileType == "webp"
    ) {
      req.fileValidationError = null;
      cb(null, true);
    } else {
      req.fileValidationError =
        "jpg,jpeg,png,gif,webp 파일만 업로드 가능합니다.";
      cb(null, false);
    }
  },
  limits: { fileSize: 5 * 1024 * 1024 },
});

// 내차 등록 이미지 업로드
router.post("/multiple-upload", upload.array("files"), uploadPost);

// 내차팔기 수정 등록
router.post("/edit/:carNum", upload.array("files"), isLoggedIn, editBtn);
// 페이지네이션
const data = [
  /* your data here */
];
const itemsPerPage = 10;
const totalPages = Math.ceil(data.length / itemsPerPage);

// In your route handler function

module.exports = router;
