import { Router } from 'express';
import { runOnChangeOnly } from 'nodemon/lib/config/defaults';
import { getUsers, createNewUser, getUserById, deleteUser, updtUserById } from '../controllers/users.controller'

const router = Router();

router.get('/adicion');

router.post('/adicion');

router.get('/adicion/:id');

router.delete('/adicion/:id');

// router.put('/users', updtUserById);

export default router;