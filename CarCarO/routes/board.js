const express = require("express");
const router = express.Router();
const { isLoggedIn } = require("../middlewares");
const {
  renderNewpost,
  createPost,
  renderBoardContent,
  renderBoard,
  renderSearch,
  renderEditPost,
  editPost,
  deletePost,
  createComment,
  editComment,
  deleteComment,
  renderNewpostWithcar,
  newpostWithcar,
} = require("../controllers/board");

// 게시판기능
router.get("/", renderBoard); //게시판 입장
router.get("/newpost", isLoggedIn, renderNewpost); // 게시글작성
router.post("/", isLoggedIn, createPost); // 게시글작성
router.get("/content/:postId", renderBoardContent); // 게시글자세히보기

router.get("/newpostWithcar/:num", isLoggedIn, renderNewpostWithcar);
router.post("/newpostWithcar/", isLoggedIn, newpostWithcar);

router.get("/search/", renderSearch); //검색
router.get("/edit/:postId", renderEditPost); //수정
router.post("/edit/:postId", editPost); //수정
router.post("/delete/:postId", deletePost); //게시글삭제

// 댓글기능
router.post("/content/:postId", createComment); //댓글작성
router.post("/comment/edit/:commentId", editComment);
router.post("/comment/delete/:commentId", deleteComment); //댓글삭제
module.exports = router;
