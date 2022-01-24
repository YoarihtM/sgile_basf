import { Router } from 'express';
import { runOnChangeOnly } from 'nodemon/lib/config/defaults';
import { getUsers, getUserById, deleteUser, updtUserById, users, createAdmin, createModerador, createAccLim, createSoloVista, createNewAdmin, createNewModer, createNewAccLim, createNewSoloVi } from '../controllers/users.controller'
import { isLoggedIn, isNotLoggedIn } from '../lib/auth';

const router = Router();

router.get('/usuarios', isLoggedIn, users );

router.get('/usuarios/crear-administrador', isLoggedIn, createAdmin );

router.get('/usuarios/crear-moderador', isLoggedIn, createModerador);

router.get('/usuarios/crear-acceso_limitado', isLoggedIn, createAccLim);

router.get('/usuarios/crear-solo_vista', isLoggedIn, createSoloVista);

router.post('/usuarios/crear-administrador', isLoggedIn, createNewAdmin);

router.post('/usuarios/crear-moderador', isLoggedIn, createNewModer);

router.post('/usuarios/crear-acceso_limitado', isLoggedIn, createNewAccLim);

router.post('/usuarios/crear-solo_vista', isLoggedIn, createNewSoloVi);


export default router;