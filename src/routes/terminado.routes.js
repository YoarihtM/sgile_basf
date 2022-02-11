import { Router } from 'express';
import { runOnChangeOnly } from 'nodemon/lib/config/defaults';
import { terminado, terminadoInicio, terminadoFin, terminadoInicioRegistrado, terminadoRegistros, terminadoFinRegistrado } from '../controllers/terminado.controller';
import { isLoggedIn } from '../lib/auth';
const router = Router();

router.get('/terminado', isLoggedIn, terminado);

router.get('/terminado/inicio-evaluacion', isLoggedIn, terminadoInicio);

router.post('/terminado/inicio-evaluacion', isLoggedIn, terminadoInicioRegistrado);

router.get('/terminado/fin-evaluacion', isLoggedIn, terminadoFin);

router.post('/terminado/fin-evaluacion', isLoggedIn, terminadoFinRegistrado);

router.get('/terminado/registros-evaluacion', isLoggedIn, terminadoRegistros);

export default router;