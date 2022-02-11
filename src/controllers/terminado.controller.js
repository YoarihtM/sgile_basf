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

export const terminadoInicioRegistrado = async (req, res) => {

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
        idUsuario,
        numEmpleado,
        fechaHora,
        comentarioEvTerm
    } = req.body;

    const pool = await getConnection();
    const loteExist = await pool
    .request()
    .input('cod_lote', sql.VarChar(30), lote)
    .query(queries.getBatchByCode)

    if(loteExist.recordset.length > 0){
        req.flash('message', 'El lote que se está intentando registrar ya existe, vuelve a intentar');
        res.redirect('/terminado/inicio-evaluacion');
    }else{

        await pool
        .request()
        .input('cod_lote', sql.VarChar(30), lote)
        .input('id_color', sql.Int, idColor)
        .input('cod_sap_color', sql.VarChar(20), sapColor)
        .input('cliente', sql.VarChar(50), cliente)
        .input('descripcion', sql.VarChar(50), descripcion)
        .input('tecnologia', sql.VarChar(30), tecnologia)
        .input('tam_lote', sql.Float, parseFloat(tamano))
        .input('contenedor', sql.VarChar(20), contenedor)
        .input('comentario', sql.Text, comentarioLote)
        .query(queries.addNewBatch);

        const idLoteConsult = await pool
        .request()
        .input('cod_lote', sql.VarChar(30), lote)
        .query(queries.getBatchIdByCode);

        const idLote = idLoteConsult.recordset[0].id;

        await pool
        .request()
        .input('id_usuario', sql.Int, parseInt(idUsuario))
        .input('num_empleado', sql.VarChar(15), numEmpleado)
        .input('id_lote', sql.Int, parseInt(idLote))
        .input('cod_lote', sql.VarChar(30), lote)
        .input('fecha', sql.VarChar(30), fechaHora)
        .input('comentario', sql.Text, comentarioEvTerm)
        .query(queries.addNewDoneEvaluation);

        req.flash('success', 'El inicio de la Evaluación de Terminado se ha registrado exitosamente');
        res.redirect('/terminado/inicio-evaluacion');

    }
};

export const terminadoFin = (req, res) => {
    res.render('done/terminado-fin')
}