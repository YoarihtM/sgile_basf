import res, { get, json, send } from 'express/lib/response';
import { getConnection, sql, queries } from '../database'

export const getAllBatch = async (req, res) => {
    
    try {
        
        const pool = await getConnection();
        const result = await pool
        .request()
        .query(queries.getAllBatch);

        res.json(result.recordset);

    } catch (error) {

        res.status(500);
        res.send(error.message);

    }

};

export const getBatchById = async (req, res) => {

    const cod_lote = req.params;

    try {

        const pool = await getConnection();
        const result = await pool
        .request()
        .input('cod_lote', cod_lote.cod_lote)
        .query(queries.getBatchById);

        res.send(result.recordset);

    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
}

export const addNewBatch = async (req, res) => {
    
    const {
        cod_lot,
        id_color,
        cod_sap_color,
        descripcion,
        tecnologia,
        tam_lote,
        contenedor
    } = req.body;

    let {
        comentario
    } = req.body;

    if(comentario == null || comentario == ''){
        comentario = '';
    }

    try {
        
        const pool = await getConnection();
        await pool
        .request()
        .input('cod_lot', sql.VarChar(30), cod_lot)
        .input('id_color', sql.Int, id_color)
        .input('cod_sap_color', sql.VarChar(20), cod_sap_color)
        .input('descripcion', sql.VarChar(50), descripcion)
        .input('tecnologia', sql.Int, tecnologia)
        .input('tam_lote', sql.Float, tam_lote)
        .input('contenedor', sql.VarChar(20), contenedor)
        .input('comentario', sql.Text, comentario)
        .query(queries.addNewBatch);

        res.json({
            cod_lot,
            id_color,
            cod_sap_color,
            descripcion,
            tecnologia,
            tam_lote,
            contenedor,
            comentario
        });

    } catch (error) {
        res.status(500);
        res.send(error.message);
    }

}