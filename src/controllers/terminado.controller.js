import { request } from "express";
import { getConnection, sql, queries } from '../database'

export const terminado = (req, res) => {
    res.render('done/terminado');
};

export const terminadoInicio = async (req, res) => {

    const pool = await getConnection();
    const colores = await pool.request().query(queries.getAllColor);
    const sapColores = [];
    const formulasColores = {};

    for(let color of colores.recordset){
        sapColores.push(color.cod_sap);
        const formulas = [];
        const idFormula = await pool
        .request()
        .input('sap_color', sql.VarChar(20), color.cod_sap)
        .query(queries.getAllFormulaRelatedByColor);

        for(let formula of idFormula.recordset){

            const infoFormula = await pool 
            .request()
            .input('id', sql.Int, parseInt(formula.id_formula))
            .query(queries.getFormulaById);

            formulas.push(infoFormula.recordset[0].bom);
        }

        formulasColores[color.cod_sap] = {
            idColor: color.id,
            formulas: formulas
        };
    }
    
    res.render('done/terminado-inicio', {
        colores: sapColores,
        formulas: formulasColores
    });
};

export const terminadoInicioRegistrado = (req, res) => {

    const {
        lote,
        idColor,
        sapColor,
        cliente,
        descripcion,
        tecnologia,
        tamano,
        contenedor,
        comentarioLote,
        
    } = req.body;


    res.json(req.body);
};

export const terminadoFin = (req, res) => {
    res.render('done/terminado-fin')
}