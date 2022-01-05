import { Router } from "express";
import { login, loginAuth, loginRedirect } from "../controllers/login.controller";

const router = Router();

router.get('/', loginRedirect);

router.get('/login', login);

router.post('/login', loginAuth)

export default router;