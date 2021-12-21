import { Router } from 'express';
import { getUsers, createNewUser, getUserById, deleteUser } from '../controllers/users.controller'

const router = Router();

router.get('/users', getUsers);

router.post('/users', createNewUser);

router.get('/users/:id', getUserById);

router.delete('/users/:id', deleteUser);

router.put('/users');

export default router;