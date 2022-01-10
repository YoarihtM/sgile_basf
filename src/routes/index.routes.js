import { Router } from "express";
import { login, loginAuth, loginRedirect, profile } from "../controllers/login.controller";

const router = Router();

router.get('/', loginRedirect);

router.get('/login', login);

router.post('/login', loginAuth)

router.get('/profile', profile)

export default router;