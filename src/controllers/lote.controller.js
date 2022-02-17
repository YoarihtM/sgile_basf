import res, { get, json, send } from 'express/lib/response';
import { getConnection, sql, queries } from '../database'

export const lotes = (req, res) => {
    res.render('material-batch/lotes')
}

export const loteBom = async (req, res) => {

    const pool = await getConnection();
    const result = await pool.request().query(queries.getAllFormula);

    res.render('material-batch/lotes-bom', {
        boms: result.recordset
    });
};

export const loteCod = async (req, res) => {

    const pool = await getConnection();
    const result = await pool.request().query(queries.getAllBatch);

    res.render('material-batch/lotes-sap', {
        lotes: result.recordset
    });
};

export const loteCodBusqueda = async (req, res) => {

    const {
        lote
    } = req.body;

    const pool = await getConnection();
    const loteInfo = await pool
    .request()
    .input('cod_lote', sql.VarChar(30), lote)
    .query(queries.getBatchByCode);

    const evalTerminado = await pool
    .request()
    .input('cod_lote', sql.VarChar(30), lote)
    .query(queries.getDoneEvaluation);

    const evalTerminadoFin = await pool
    .request()
    .input('cod_lote', sql.VarChar(30), lote)
    .query(queries.getEndDoneEvaluation);

    const calidad = await pool
    .request()
    .input('cod_lote', sql.VarChar(30), lote)
    .query(queries.getQualityStartByBatch);

    const calidadFin = await pool
    .request()
    .input('cod_lote', sql.VarChar(30), lote)
    .query(queries.getQualityEndByBatch);

    
    const entonado = await pool
    .request()
    .input('cod_lote', sql.VarChar(30), lote)
    .query(queries.getTintingStartByBatch);

    
    const entonadoFin = await pool
    .request()
    .input('cod_lote', sql.VarChar(30), lote)
    .query(queries.getTintingEndByBatch);

    res.render('material-batch/lotes-sapBusqueda', {
        loteInfo: loteInfo.recordset,
        evalTerminado: evalTerminado.recordset,
        evalTerminadoFin: evalTerminadoFin.recordset,
        calidad: calidad.recordset,
        calidadFin: calidadFin.recordset,
        entonado: entonado.recordset,
        entonadoFin: entonadoFin.recordset
    })

};