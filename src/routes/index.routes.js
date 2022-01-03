import { Router } from "express";
import { login, loginRedirect } from "../controllers/login.controller";

const router = Router();

router.get('/', loginRedirect);

router.get('/login', login);

export default router;