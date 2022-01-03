import { Router } from 'express';
import { runOnChangeOnly } from 'nodemon/lib/config/defaults';
import { getAllFormula, addNewFormula } from '../controllers/formula.controller'

const router = Router();

router.get('/formula-all', getAllFormula);

router.post('/formula-new', addNewFormula);


// router.put('/users', updtUserById);

export default router;