const passport = require('passport');
const localStrategy = require('passport-local').Strategy;
const bcrypt = require('bcrypt');

const {users} = require('../models');

module.exports = () => {
    passport.use(new localStrategy({
        usernameField: 'id',
        passwordField: 'password',
        passReqToCallback: false,
    }, async (id, password, done) => {
        // console.log("222222->", id, password);
        try {
            const exUser = await users.findOne({where: {id}});

            // console.log("3333333->", exUser);

            if(exUser){
                const result = await bcrypt.compare(password, exUser.password);
                if(result){
                    done(null, exUser);
                } else {
                    done(null, false, { message: '비밀번호가 일치하지 않습니다.' });
                }
            } else {
                done(null, false, {message: '가입되지 않은 회원입니다.'});
            }
        } catch(error){
            console.error(error);
            done(error);
        }
    }));
}