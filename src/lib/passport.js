import { Passport } from "passport";
import { Strategy } from "passport-local";

const passport = Passport();
const strategy = Strategy();

passport.use('local');