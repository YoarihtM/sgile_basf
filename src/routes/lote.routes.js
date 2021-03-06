import { Router } from 'express';
import { isLoggedIn } from '../lib/auth';
import { loteBom, loteBomBusqueda, loteCod, loteCodBusqueda, lotes } from '../controllers/lote.controller'
const router = Router();

router.get('/lotes', isLoggedIn, lotes);

router.get('/lotes/consulta-bom', isLoggedIn, loteBom);

router.post('/lotes/consulta-bom', isLoggedIn, loteBomBusqueda);

router.get('/lotes/consulta-lote', isLoggedIn, loteCod);

router.post('/lotes/consulta-lote', isLoggedIn, loteCodBusqueda);

export default router;