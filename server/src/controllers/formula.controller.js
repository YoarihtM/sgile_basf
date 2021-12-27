import res, { get, json, send } from 'express/lib/response';
import { getConnection, sql, queries } from '../database'

export const getAllFormula = async (req, res) => {
    try {
        
        const pool = await getConnection();
        const result = await pool
        .request()
        .query(queries.getAllFormula);

        res.json(result.recordset);

    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
}

export const addNewFormula = async (req, res) => {
    const {
        bom
    } = req.body;

    let {
        comentario
    } = req.body;

    if( comentario == null){
        comentario = '';
    }

    try {
        const pool = await getConnection();
        await pool
        .request()
        .input('bom', sql.VarChar(30), bom)
        .input('comentario', sql.Text, comentario)
        .query(queries.addNewFormula);

        res.json({
            bom, 
            comentario
        })

    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
}