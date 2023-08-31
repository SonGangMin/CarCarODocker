const passport = require('passport');
const KaKaoStrategy = require('passport-kakao').Strategy;

const {users} = require('../models');

module.exports = () => {
    passport.use(new KaKaoStrategy({
        clientID: process.env.KAKAO_ID,
        callbackURL: '/auth/kakao/callback',
    }, async (accessToken, refreshToken, profile, done) => {
        console.log('kakao profile', profile);
        try{
            const exUser = await users.findOne({
                where: {provider: 'kakao'},
            });
            if(exUser){
                done(null, exUser);
            } else{
                const newUser = await users.create({
                    email: 'kakao',
                    name: profile.displayName,
                    password: 'kakao',
                    tel: 'kakao',
                    birth: 'kakao',
                    id: profile.id,
                    provider: 'kakao',
                });
                done(null, newUser);
            }
        } catch(error){
            console.error(error);
            done(error);
        }
    }));
};