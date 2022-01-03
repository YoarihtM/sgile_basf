import express from 'express';
import config from './config';

import adicionRoutes from './routes/adicion.routes'
import bitacoraRoutes from './routes/bitacora.routes'
import calidadRoutes from './routes/calidad.routes'
import colorRoutes from './routes/color.routes'
import entonadoRoutes from './routes/entonado.routes'
import formulaRoutes from './routes/formula.routes'
import loteRoutes from './routes/lote.routes'
import pastaRoutes from './routes/pasta.routes'
import propiedadRoutes from './routes/propiedad.routes'
import pruebaRoutes from './routes/prueba.routes'
import terminadoRoutes from './routes/terminado.routes'
import usersRoutes from './routes/users.routes'
import indexRoutes from './routes/index.routes'

const app = express();
const path = require('path');

//Settings
app.set('port', config.port);
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');
app.use(express.static(__dirname + '/views/public'));

//middlewares
app.use(express.json()); // para recibir informacion en json
app.use(express.urlencoded({extend: false})); // para obtener datos de formularios html

app.use(adicionRoutes);
app.use(bitacoraRoutes);
app.use(calidadRoutes);
app.use(colorRoutes);
app.use(entonadoRoutes);
app.use(formulaRoutes);
app.use(loteRoutes);
app.use(pastaRoutes);
app.use(propiedadRoutes);
app.use(pruebaRoutes);
app.use(terminadoRoutes);
app.use(usersRoutes);
app.use(indexRoutes);

export default app;