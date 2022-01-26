import { Router } from "express";
import { login, loginAuth, loginRedirect, logout, menu, perfil } from "../controllers/login.controller";
import { isLoggedIn, isNotLoggedIn } from "../lib/auth";


const router = Router();

router.get('/', isNotLoggedIn, loginRedirect);

router.get('/login', isNotLoggedIn, login);

router.post('/login', isNotLoggedIn, loginAuth);

router.get('/menu', isLoggedIn, menu);

router.get('/logout', isLoggedIn, logout);

router.get('/perfil', isLoggedIn, perfil);

export default router;