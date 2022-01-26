import { Router } from 'express';
import { runOnChangeOnly } from 'nodemon/lib/config/defaults';
import { formula } from '../controllers/formula.controller'
import { isLoggedIn } from '../lib/auth';

const router = Router();

router.get('/formula', isLoggedIn, formula);


// router.put('/users', updtUserById);

export default router;