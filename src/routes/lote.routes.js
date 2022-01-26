import { Router } from 'express';
import { isLoggedIn } from '../lib/auth';
import { lotes } from '../controllers/lote.controller'
const router = Router();

router.get('/lotes', isLoggedIn, lotes);


export default router;