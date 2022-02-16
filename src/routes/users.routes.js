import { Router } from 'express';
import { runOnChangeOnly } from 'nodemon/lib/config/defaults';
import { users, createNewUser, nuevoUsuario } from '../controllers/users.controller'
import { isLoggedIn, isNotLoggedIn } from '../lib/auth';

const router = Router();

router.get('/nuevo-usuario', isLoggedIn, users );

router.post('/nuevo-usuario', isLoggedIn, nuevoUsuario );

router.post('/users', createNewUser);


export default router;