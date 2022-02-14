import { getConnection, sql, queries } from "../database";

export const calidad = (req, res) => {
    res.render('quality/calidad');
};

export const calidadInicio = (req, res) => {
    res.render('quality/inicioCalidad')
};

export const calidadInicioRegistrado = async (req, res) => {

    const {
        lote,
        idUsuario,
        numEmpleado,
        fechaHora,
        comentario
    } = req.body;

    const pool = await getConnection();

    const terminadoRegistrado = await pool
    .request()
    .input('cod_lote', sql.VarChar(30), lote)
    .query(queries.getEndDoneEvaluation);

    if(terminadoRegistrado.recordset.length > 0){
        const existe = await pool 
        .request()
        .input('cod_lote', sql.VarChar(30), lote)
        .query(queries.getQualityStartByBatch);

        const existeEnt = await pool 
        .request()
        .input('cod_lote', sql.VarChar(30), lote)
        .query(queries.getTintingStartByBatch);

        if(existe.recordset.length > 0 && existeEnt.recordset.length > 0){
            req.flash('message', 'El Lote ya ha sido iniciado en Control de Calidad y en Entonado');
            res.redirect('/calidad/calidad-inicio');
        }else{

            await pool
            .request()
            .input('id_usuario', sql.Int, parseInt(idUsuario))
            .input('num_empleado', sql.VarChar(15), numEmpleado)
            .input('id_lote', sql.Int, parseInt(terminadoRegistrado.recordset[0].id_lote))
            .input('cod_lote', sql.VarChar(30), lote)
            .input('fecha', sql.VarChar(30), fechaHora)
            .input('comentario', sql.Text, comentario)
            .query(queries.addNewQualityStart);

            await pool
            .request()
            .input('id_usuario', sql.Int, parseInt(idUsuario))
            .input('num_empleado', sql.VarChar(15), numEmpleado)
            .input('id_lote', sql.Int, parseInt(terminadoRegistrado.recordset[0].id_lote))
            .input('cod_lote', sql.VarChar(30), lote)
            .input('fecha', sql.VarChar(30), fechaHora)
            .input('comentario', sql.Text, comentario)
            .query(queries.addNewTintingStart);

            req.flash('success', 'El Lote se ha iniciado satisfactoriamente en Control de Calidad y Entonado');
            res.redirect('/calidad/calidad-inicio');
        }

    }else{
        req.flash('message', 'El Lote ingresado aún no ha finalizado su Evaluación de Terminado');
        res.redirect('/calidad/calidad-inicio');
    }

};

export const calidadFin = (req, res) => {
    res.render('quality/finCalidad');
};

export const calidadFinRegistrado = async (req, res) => {

    const {
        lote,
        idUsuario,
        numEmpleado,
        fechaHora,
        comentario
    } = req.body;

    const pool = await getConnection();

    const entonadoRegistrado = await pool
    .request()
    .input('cod_lote', sql.VarChar(30), lote)
    .query(queries.getTintingEndByBatch);


    if(entonadoRegistrado.recordset.length > 0){
        const existe = await pool 
        .request()
        .input('cod_lote', sql.VarChar(30), lote)
        .query(queries.getQualityEndByBatch);

        if(existe.recordset.length > 0){
            req.flash('message', 'El Lote ya ha terminado su proceso en Control de Calidad');
            res.redirect('/calidad/calidad-fin');
        }else{

            await pool
            .request()
            .input('id_usuario', sql.Int, parseInt(idUsuario))
            .input('num_empleado', sql.VarChar(15), numEmpleado)
            .input('id_lote', sql.Int, parseInt(entonadoRegistrado.recordset[0].id_lote))
            .input('cod_lote', sql.VarChar(30), lote)
            .input('fecha', sql.VarChar(30), fechaHora)
            .input('comentario', sql.Text, comentario)
            .query(queries.addNewQualityEnd);

            req.flash('success', 'El Lote ha finalizado su proceso satisfactoriamente en Control de Calidad y Entonado');
            res.redirect('/calidad/calidad-fin');
        }

    }else{
        req.flash('message', 'El Lote ingresado aún no ha finalizado su proceso en Entonado');
        res.redirect('/calidad/calidad-fin');
    }

};