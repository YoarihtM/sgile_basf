import { Router } from 'express';
import { runOnChangeOnly } from 'nodemon/lib/config/defaults';
import { terminado, terminadoInicio } from '../controllers/terminado.controller';
import { isLoggedIn } from '../lib/auth';
const router = Router();

router.get('/terminado', isLoggedIn, terminado);

router.get('/terminado/inicio-evaluacion', isLoggedIn, terminadoInicio);

router.get('/terminado/fin-evaluacion', isLoggedIn, terminadoInicio);

export default router;