const express = require('express');
const router = express.Router();
const {isManager} = require('../../middlewares/');
const {
    renderCar,
    renderDetail,
    renderArray,
    addRecommend,
    renderSaleComp,
    saleComp,
    saleCancle
} = require('../../controllers/manager/managerCar');

// 차량관리 페이지
router.get('/', isManager, renderCar);
// 판매완료차량관리 페이지
router.get('/saleComp', isManager, renderSaleComp);
// 차량상세 페이지
router.get('/detail/:carNum', isManager, renderDetail);
// 차량상세 페이지
router.get('/array', isManager, renderArray);
// 추천차량등록
router.post('/recommend/:carNum', isManager, addRecommend);
// 판매완료
router.post('/saleComp/:carNum', isManager, saleComp);
// 판매완료 취소
router.post('/saleCancle/:carNum', isManager, saleCancle);

module.exports = router;