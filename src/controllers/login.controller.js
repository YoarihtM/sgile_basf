import res from "express/lib/response";
const passport = require('passport');

export const login = (req, res) => {
    res.render('login');
};

export const loginRedirect = (req, res) => {
    res.redirect('login');
};

export const loginAuth = (req, res, next) => {
    passport.authenticate('local.signin', {
            successRedirect: '/profile',
            failureRedirect: '/login',
            failureFlash: true
        })(req, res, next);
};

export const profile = async (req, res) => {
    try {
        res.render('profile');
    } catch (error) {
        res.status(500);
        res.send(error);
    }
};