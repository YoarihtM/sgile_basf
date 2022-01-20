import { Router } from 'express';
import { runOnChangeOnly } from 'nodemon/lib/config/defaults';
import { getUsers, createNewUser, getUserById, deleteUser, updtUserById, users, createAdmin, createModerador, createAccLim, createSoloVista } from '../controllers/users.controller'
import { isLoggedIn, isNotLoggedIn } from '../lib/auth';

const router = Router();

router.get('/usuarios', isLoggedIn, users );

router.get('/usuarios/crear-administrador', isLoggedIn, createAdmin );

router.get('/usuarios/crear-moderador', isLoggedIn, createModerador);

router.get('/usuarios/crear-acceso_limitado', isLoggedIn, createAccLim);

router.get('/usuarios/crear-solo_vista', isLoggedIn, createSoloVista);

router.post('/usuarios', createNewUser);

router.get('/usuarios/:num_empleado', getUserById);

router.delete('/usuarios/:num_empleado', deleteUser);

// router.put('/users', updtUserById);

export default router;