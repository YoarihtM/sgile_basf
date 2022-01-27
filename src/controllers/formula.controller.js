import res, { get, json, send } from 'express/lib/response';
import { getConnection, sql, queries } from '../database'

export const formula = (req, res) => {
    res.render('formulas/formulas')
};

export const nuevoColor = async (req, res, done) => {
    let boms = [];

    const pool = await getConnection();
    const result = await pool
    .request()
    .query(queries.getAllFormula);

    const formulas = result.recordset;

    for(let formula of formulas){
        boms.push(formula.bom);
    }

    console.log(boms);
    
    res.render('formulas/nuevo-color', {boms: boms});
};