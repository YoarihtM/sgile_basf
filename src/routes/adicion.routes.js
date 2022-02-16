import { Router } from 'express';
import { solicitudAdicion, solicitudAdicionRegistrada } from '../controllers/adicion.controller';
import { isLoggedIn, isNotLoggedIn } from '../lib/auth';

const router = Router();

router.get('/calidad/solicitud-adicion', isLoggedIn, solicitudAdicion);

router.post('/calidad/solicitud-adicion', isLoggedIn, solicitudAdicionRegistrada);

export default router;