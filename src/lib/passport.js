import { Passport } from "passport";
import { Strategy } from "passport-local";

const passport = Passport();
const LocalStrategy = Strategy();

passport.use('local.signin', new LocalStrategy({
    usernameField: 'correo',
    passwordField: 'contrasena'
}));