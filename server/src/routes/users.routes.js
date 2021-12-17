import { Router } from 'express';
import { getUsers, createNewUser } from '../controllers/users.controller'

const router = Router();

router.get('/users', getUsers);

router.post('/users', createNewUser);

router.get('/users');

router.delete('/users');

router.put('/users');

export default router;