import { Router } from 'express';
import { getAllBatch, getBatchById, addNewBatch } from '../controllers/lote.controller';

const router = Router();

router.get('/batch-all', getAllBatch);

router.get('/batch/:id', getBatchById);

router.post('/batch-new', addNewBatch);

export default router;