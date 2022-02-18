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

    for (let color of colores.recordset) {
        sapColores.push(color.cod_sap);
        const formulas = [];
        const idFormula = await pool
            .request()
            .input('sap_color', sql.VarChar(20), color.cod_sap)
            .query(queries.getAllFormulaRelatedByColor);

        for (let formula of idFormula.recordset) {

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
        bom,
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

    if (loteExist.recordset.length > 0) {
        req.flash('message', 'El lote que se está intentando registrar ya existe, vuelve a intentar');
        res.redirect('/terminado/inicio-evaluacion');
    } else {

        await pool
            .request()
            .input('cod_lote', sql.VarChar(30), lote)
            .input('id_color', sql.Int, idColor)
            .input('cod_sap_color', sql.VarChar(20), sapColor)
            .input('bom', sql.VarChar(30), bom)
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

export const terminadoFin = async (req, res) => {

    res.render('done/terminado-fin');

}

export const terminadoFinRegistrado = async (req, res) => {

    const {
        lote,
        idUsuario,
        numEmpleado,
        fechaHora,
        comentarioEvTerm
    } = req.body;

    const pool = await getConnection();
    const existeInicio = await pool
        .request()
        .input('cod_lote', sql.VarChar(30), lote)
        .query(queries.getDoneEvaluation);

    const inicio = existeInicio.recordset;

    if (inicio.length > 0) {

        const existeFin = await pool
            .request()
            .input('cod_lote', sql.VarChar(30), lote)
            .query(queries.getEndDoneEvaluation);

        const fin = existeFin.recordset;

        if (fin.length > 0) {
            req.flash('message', 'El Lote ya ha sido registrado en Fin de Evaluación de Terminado');
            res.redirect('/terminado/fin-evaluacion');
        } else {

            await pool
                .request()
                .input('id_usuario', sql.Int, parseInt(idUsuario))
                .input('num_empleado', sql.VarChar(15), numEmpleado)
                .input('id_lote', sql.Int, parseInt(inicio[0].id_lote))
                .input('cod_lote', sql.VarChar(30), lote)
                .input('fecha', sql.VarChar(30), fechaHora)
                .input('comentario', sql.Text, comentarioEvTerm)
                .query(queries.addNewEndDoneEvaluation);

            req.flash('success', 'El Fin de Evaluación de Terminado se ha registrado exitosamente');
            res.redirect('/terminado/fin-evaluacion');

        }

    } else {
        req.flash('message', 'El Lote no se ha registrado y no existe ningún Inicio de Evaluación de Terminado');
        res.redirect('/terminado/fin-evaluacion');
    }

};

export const terminadoRegistros = async (req, res) => {

    const pool = await getConnection();
    const lotes = await pool.request().query(queries.getAllBatch);
    const lotesInfo = {};
    const codLotes = [];

    for (let lote of lotes.recordset) {

        let inicio = '';
        let fin = '';

        const evalTermInicio = await pool
            .request()
            .input('cod_lote', sql.VarChar(30), lote.cod_lote)
            .query(queries.getDoneEvaluation);

        const evalTermFin = await pool
            .request()
            .input('cod_lote', sql.VarChar(30), lote.cod_lote)
            .query(queries.getEndDoneEvaluation);

        evalTermInicio.recordset.length > 0 ? inicio = evalTermInicio.recordset[0].fecha : inicio = '';
        evalTermFin.recordset.length > 0 ? fin = evalTermFin.recordset[0].fecha : fin = '';

        codLotes.push(lote.cod_lote);

        lotesInfo[lote.cod_lote] = {
            fechaInicio: inicio,
            fechaFin: fin
        }

    }

    res.render('done/terminado-registros', {
        lotesInfo,
        codLotes
    })
};