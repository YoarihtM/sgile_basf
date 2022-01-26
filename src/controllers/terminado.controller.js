import { request } from "express";
import { getConnection } from "../database";

export const terminado = (req, res) => {
    res.render('done/terminado');
};

export const terminadoInicio = async (req, res) => {
    console.log(req.user);

    const pool = await getConnection();
    const result = await request()
    .query();
    
    res.render('done/terminado-inicio');
};

export const terminadoFin = (req, res) => {
    res.render('done/terminado-fin')
}