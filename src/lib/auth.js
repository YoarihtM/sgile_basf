
export const isLoggedIn = (req, res, next) => {
    if(req.isAuthenticated()){
        return next();
    } else {
        return res.redirect('/login');
    }
};

export const isNotLoggedIn = (req, res, next) => {
    if(!req.isAuthenticated()){
        return next();
    } else { 
        return res.redirect('/menu');
    }
};