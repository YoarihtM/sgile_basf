import res from "express/lib/response";
const passport = require('passport');

export const login = async (req, res) => {
    try {
        res.render('login');
    } catch (error) {
        res.error(500);
        res.send(error.message);
    }
};

export const loginRedirect = async (req, res) => {
    try {
        res.redirect('login');
    } catch (error) {
        res.error(500);
        res.send(error.message);
    }
};

export const loginAuth = async (req, res) => {
    try {

        passport.authenticate('local.signin', {
            successRedirect: '/profile',
            failureRedirect: '/login',
            failureFlash: true
        });

    } catch (error) {
        res.error(500);
        res.send(error.message);
    }
};

export const profile = async (req, res) => {
    try {
        res.render('profile');
    } catch (error) {
        res.status(500);
        res.send(error);
    }
};