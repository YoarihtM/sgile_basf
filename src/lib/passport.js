const passport = require('passport');
const localStrategy = require('passport-local').Strategy;

import res from 'express/lib/response';
import { getConnection, sql, queries } from '../database'

passport.use('local.signin', new localStrategy({
    usernameField: 'correo',
    passwordField: 'contrasena'
}, (correo, contrasena) => {

    try {
        const pool = await getConnection();
        const result = await pool
        .request()
        .input('email', correo)
        .query(queries.checkEmail)

        console.log(result.recordset[0]);

    } catch (error) {
        res.status(500);
        res.send(error);
    }

}));