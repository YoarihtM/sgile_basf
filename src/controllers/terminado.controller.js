import { request } from "express";
import { getConnection, sql, queries } from '../database'

export const terminado = (req, res) => {
    res.render('done/terminado');
};

export const terminadoInicio = async (req, res) => {

    const pool = await getConnection();
    const result = await pool.request().query(queries.getAllBatch);
    
    res.render('done/terminado-inicio');
};

export const terminadoFin = (req, res) => {
    res.render('done/terminado-fin')
}