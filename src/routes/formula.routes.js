import { Router } from 'express';
import { runOnChangeOnly } from 'nodemon/lib/config/defaults';
import { formula, formulaColor, formulaColorBusqueda, lotePasta, lotePastaBusqueda, nuevaFormula, nuevaFormulaRegistrada, nuevaPasta, nuevaPastaRegistrada, nuevoColor, nuevoColorRegistrado, nuevoLotePasta, nuevoLotePastaRegistrado } from '../controllers/formula.controller'
import { isLoggedIn } from '../lib/auth';

const router = Router();

router.get('/formula', isLoggedIn, formula);

router.get('/formula/nuevo-color', isLoggedIn, nuevoColor);

router.post('/formula/nuevo-color', isLoggedIn, nuevoColorRegistrado);

router.get('/formula/nueva-pasta', isLoggedIn, nuevaPasta);

router.post('/formula/nueva-pasta', isLoggedIn, nuevaPastaRegistrada);

router.get('/formula/nuevo-lote-pasta', isLoggedIn, nuevoLotePasta);

router.post('/formula/nuevo-lote-pasta', isLoggedIn, nuevoLotePastaRegistrado);

router.get('/formula/lotes-pasta', isLoggedIn, lotePasta);

router.post('/formula/lotes-pasta', isLoggedIn, lotePastaBusqueda);

router.get('/formula/nueva-formula', isLoggedIn, nuevaFormula);

router.post('/formula/nueva-formula', isLoggedIn, nuevaFormulaRegistrada);

router.get('/formula/formulas-color', isLoggedIn, formulaColor);

router.post('/formula/formulas-color', isLoggedIn, formulaColorBusqueda);

router.get('/formula/pastas-formula', isLoggedIn);

router.post('/formula/pastas-formula', isLoggedIn);

export default router;