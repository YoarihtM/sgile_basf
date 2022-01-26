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
        successRedirect: '/menu',
        failureRedirect: '/login',
        failureFlash: true
    })(req, res, next);
};

export const menu = async (req, res) => {
    try {
        res.render('menu');
    } catch (error) {
        res.status(500);
        res.send(error);
    }
};

export const logout = async (req, res) => {
    req.logOut();
    res.redirect('/login');
};

export const perfil = async (req, res) => {
    res.render('users/perfil')
};