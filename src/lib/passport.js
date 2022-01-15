const passport = require('passport');
const localStrategy = require('passport-local').Strategy;

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
        console.log(user);
        const validPassword = await matchPassword(contrasena, user.contrasena);

        if(validPassword){
            done(null, user, req.flash('success', 'Bienvenido' + user.nombre));
        }else{
            done(null, false, req.flash('message', 'Contraseña incorrecta'));
        }
    }else{
        done(null, false, req.flash('message', 'El usuario no existe'))
    }

}));

passport.serializeUser((usr, done) => {
    done(null, usr.id);
});