const {advertises} = require('../../models');
// 광고관리 페이지
exports.renderAdvertise = async (req, res) => {
    try{
        const pageNum = parseInt(req.query.page) || 1;
        const limit = 5;
        const offset = (pageNum - 1) * limit;
        const countResult = await advertises.findAndCountAll({});
        const totalCount = countResult.count;
        const totalPages = Math.ceil(totalCount / limit);
        const Adver = await advertises.findAll({
            order: [["no", "DESC"]],
            offset: offset,
            limit: limit,
        });

        res.render('manager/advertise', {
            title: "광고관리",
            Adver,
            currentPage: pageNum,
            offset: offset,
            totalPages,
            totalCount,
        });
    } catch(error){
        console.error(error);
    }
};

// 광고등록 페이지
exports.renderAddAdvertise = (req, res) => {
    res.render('manager/addAdvertise', {
        title: '광고등록'
    });
};

// 광고수정 페이지
exports.renderEditAdver = async (req, res) => {
    try{
        const no = req.params.no;
        const Adver = await advertises.findOne({
            where: {no}
        });
        res.render('manager/editAdvertise', {
            title: '광고수정',
            Adver
        });
    } catch(error){
        console.error(error);
    }
};

// 광고상세 페이지
exports.renderAdverDetail = async (req, res) => {
    try{
        const no = req.params.no;
        const Adver = await advertises.findOne({
            where: {no}
        });
        res.render('manager/adverDetail', {
            title: '광고등록',
            Adver,
        });
    } catch(error){
        console.error(error);
    }
};

// 광고 등록하기
exports.afterUploadImage = async (req, res) => {
    const { title, href } = req.body;
    console.log('filename111111111 => ', req.files);

    try{
        const files = [];
        for (const file of req.files) {
          files.push({ filename: file.filename, url: `/img/${file.filename}` });
        }
        console.log('11111111111111', files);
        const upload = await advertises.create({
          title,
          href,
          img:files,
        })
        if(upload === null){
          console.log("게시물 등록 에러!");
          res.status(400).json({"msg":"uploadError"});
        }else{
          console.log("게시물 등록!");
          const url = `/manager/advertise/adverDetail/${upload.no}`;
          res.status(200).json({url});
        }
        
      }catch (error){
        console.error(error);
        res.status(500).json({"msg":error});
      }
    // return res.json({url: `/adverImg/${req.file.filename}`});
};

// 광고수정
exports.afterEditImage = async (req, res) => {
    const { title, href } = req.body;
    console.log('filename111111111 => ', req.files);
    const no = req.params.no;
    try{
        const files = [];
        for (const file of req.files) {
          files.push({ filename: file.filename, url: `/img/${file.filename}` });
        }
        console.log('11111111111111', files);
        const upload = await advertises.update({
          title,
          href,
          img:files,
        },{
            where: {no}
        })
        if(upload === null){
          console.log("게시물 등록 에러!");
          res.status(400).json({"msg":"uploadError"});
        }else{
          console.log("게시물 등록!");
          const url = `/manager/advertise/adverDetail/${upload.no}`;
          res.status(200).json({url});
        }
        
      }catch (error){
        console.error(error);
        res.status(500).json({"msg":error});
      }
    // return res.json({url: `/adverImg/${req.file.filename}`});
};
// 광고삭제
exports.DelAdver = async (req, res) => {
    const no = req.params.no;
    try{
        await advertises.destroy({
            where: {no}
        })
        res.redirect('/manager/advertise')
      }catch (error){
        console.error(error);
      }
};