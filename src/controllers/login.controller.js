import res from "express/lib/response";

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