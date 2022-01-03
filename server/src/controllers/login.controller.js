import res from "express/lib/response";

export const login = async (req, res) => {
    res.render('login');
}