import { Router } from 'express';
import { runOnChangeOnly } from 'nodemon/lib/config/defaults';
import { formula, nuevaPasta, nuevaPastaRegistrada, nuevoColor, nuevoColorRegistrado } from '../controllers/formula.controller'
import { isLoggedIn } from '../lib/auth';

const router = Router();

router.get('/formula', isLoggedIn, formula);

router.get('/formula/nuevo-color', isLoggedIn, nuevoColor);

router.post('/formula/nuevo-color', isLoggedIn, nuevoColorRegistrado);

router.get('/formula/nueva-pasta', isLoggedIn, nuevaPasta);

router.post('/formula/nueva-pasta', isLoggedIn, nuevaPastaRegistrada);

// router.put('/users', updtUserById);

export default router;