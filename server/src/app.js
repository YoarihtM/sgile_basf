import express from 'express';
import config from './config';

import usersRoutes from './routes/users.routes'

const app = express();

//Settings
app.set('port', config.port);

//middlewares
app.use(express.json()); // para recibir informacion en json
app.use(express.urlencoded({extend: false})); // para obtener datos de formularios html

app.use(usersRoutes);

export default app;