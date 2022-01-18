const passport = require('passport');
const localStrategy = require('passport-local').Strategy;

import { pool } from 'mssql';
import { getConnection, sql, queries } from '../database'
import { matchPassword } from '../lib/helpers'


passport.use('local.signin', new localStrategy({
    usernameField: 'correo',
    passwordField: 'contrasena',
    passReqToCallback: true
}, async (req, correo, contrasena, done) => {

    const pool = await getConnection();
    const result = await pool
    .request()
    .input('email', correo)
    .query(queries.checkEmail);

    const user = result.recordset[0]
    
    if(result.recordset.length > 0) {
        const validPassword = await matchPassword(contrasena, user.contrasena);

        if(validPassword){
            done(null, user, req.flash('success', 'Bienvenido ' + user.nombre));
            // console.log(req.flash('success'));
        }else{
            done(null, false, req.flash('message', 'Contraseña incorrecta'));
            // console.log(req.flash('message'));
        }
    }else{
        done(null, false, req.flash('message', 'El usuario no existe'))
        // console.log(req.flash('message'));
    }

}));

passport.serializeUser((user, done) => {
    done(null, user.id);
});

passport.deserializeUser(async (id, done) => {
    const pool = await getConnection();
    const result = await pool
    .request()
    .input('id', id)
    .query(queries.getUserById);

    const finalUser = result.recordset[0];
    done(null, finalUser);
});