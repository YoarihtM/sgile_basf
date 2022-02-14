import { Router } from 'express';
import { runOnChangeOnly } from 'nodemon/lib/config/defaults';
import { entonado, finEntonado } from '../controllers/entonado.controller';
import { isLoggedIn, isNotLoggedIn } from '../lib/auth'

const router = Router();

router.get('/calidad/entonado-fin', isLoggedIn, entonado );

router.post('/calidad/entonado-fin', isLoggedIn, finEntonado);


export default router;