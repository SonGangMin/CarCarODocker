const express = require("express");
const router = express.Router();
const {
  renderManagerBoard,
  renderManagerBoardContent,
  renderManagerBoardSearch,
  renderManagerBoardEdit,
  editManagerBoard,
  deleteManagerPost,
  editManagerGradedown,
  editManagerGradeup,
  createManagerComment,
  editManagerComment,
} = require("../../controllers/manager/managerboard");
const { isManager } = require("../../middlewares/index");

// 게시판관리
router.get("/", isManager, renderManagerBoard);
router.get("/content/:postId", isManager, renderManagerBoardContent);
router.get("/search/", isManager, renderManagerBoardSearch);
router.get("/edit/:postId", isManager, renderManagerBoardEdit);
router.post("/edit/:postId", isManager, editManagerBoard);
router.post("/delete/:postId", isManager, deleteManagerPost);

// 공지관리
router.post("/editgradeup/:postId", isManager, editManagerGradeup); //공지로등록
router.post("/editgradedown/:postId", isManager, editManagerGradedown); //공지에서 내리기

//댓글관리
router.post("/:postId", isManager, createManagerComment); //댓글작성
router.post("/comment/edit/:commentId", isManager, editManagerComment);
// router.post("/comment/delete/:commentId", deleteComment); //댓글삭제

module.exports = router;
