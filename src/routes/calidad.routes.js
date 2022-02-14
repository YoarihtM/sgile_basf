import { Router } from 'express';
import { runOnChangeOnly } from 'nodemon/lib/config/defaults';
import { calidad, calidadFin, calidadFinRegistrado, calidadInicio, calidadInicioRegistrado } from '../controllers/calidad.controller';
import { isLoggedIn, isNotLoggedIn } from '../lib/auth';

const router = Router();

router.get('/calidad', isLoggedIn, calidad);

router.get('/calidad/calidad-inicio', isLoggedIn, calidadInicio);

router.post('/calidad/calidad-inicio', isLoggedIn, calidadInicioRegistrado);

router.get('/calidad/calidad-fin', isLoggedIn, calidadFin);

router.post('/calidad/calidad-fin', isLoggedIn, calidadFinRegistrado);

export default router;