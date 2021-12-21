import { Router } from 'express';
import { runOnChangeOnly } from 'nodemon/lib/config/defaults';
import { getUsers, createNewUser, getUserById, deleteUser, updtUserById } from '../controllers/users.controller'

const router = Router();

router.get('/users', getUsers);

router.post('/users', createNewUser);

router.get('/users/:num_empleado', getUserById);

router.delete('/users/:num_empleado', deleteUser);

// router.put('/users', updtUserById);

export default router;