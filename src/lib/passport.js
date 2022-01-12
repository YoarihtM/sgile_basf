const passport = require('passport');
const localStrategy = require('passport-local').Strategy;

passport.use('local.signin', new localStrategy({
    usernameField: 'correo',
    passwordField: 'contrasena',
    passReqToCallback: true
}, async (req, correo, contrasena, done) => {

    console.log(req.body);

    console.log('Correo:', correo);
    console.log('Contraseña:', contrasena);

    
    // try {
    //     const pool = await getConnection();
    //     const result = await pool
    //     .request()
    //     .input('email', correo)
    //     .query(queries.checkEmail)

    //     console.log(result.recordset[0]);

    // } catch (error) {
    //     res.status(500);
    //     res.send(error);
    // }

}));

// passport.serializeUser((usr, done) => {

// });