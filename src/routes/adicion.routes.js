import { Router } from 'express';
import { getAllAdds, getAllAddsFin } from '../controllers/adicion.controller';

const router = Router();

router.get('/inicio-adicion', getAllAdds);

router.get('/fin-adicion', getAllAddsFin);

router.post('/adicion');

router.get('/adicion/:id');

export default router;