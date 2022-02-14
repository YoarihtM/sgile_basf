import { getConnection, sql, queries } from "../database";

export const entonado = (req, res) => {

    res.render('quality/entonado');

};

export const finEntonado = async (req, res) => {

    const {
        lote,
        idUsuario,
        numEmpleado,
        fechaHora,
        comentario
    } = req.body;

    const pool = await getConnection();

    const calidadRegistrado = await pool
    .request()
    .input('cod_lote', sql.VarChar(30), lote)
    .query(queries.getQualityStartByBatch);

    const entonadoRegistrado = await pool
    .request()
    .input('cod_lote', sql.VarChar(30), lote)
    .query(queries.getTintingStartByBatch);

    if(calidadRegistrado.recordset.length > 0 && entonadoRegistrado.recordset.length > 0){
        const entonadoFinRegistrado = await pool
        .request()
        .input('cod_lote', sql.VarChar(30), lote)
        .query(queries.getTintingEndByBatch);

        if(entonadoFinRegistrado.recordset.length > 0){
            req.flash('message', 'El Lote ya ha finalizado su proceso de Entonado');
            res.redirect('/calidad/entonado-fin');
        }else{
            await pool
            .request()
            .input('id_usuario', sql.Int, parseInt(idUsuario))
            .input('num_empleado', sql.VarChar(15), numEmpleado)
            .input('id_lote', sql.Int, parseInt(calidadRegistrado.recordset[0].id_lote))
            .input('cod_lote', sql.VarChar(30), lote)
            .input('fecha', sql.VarChar(30), fechaHora)
            .input('comentario', sql.Text, comentario)
            .query(queries.addNewTintingEnd);

            req.flash('success', 'El Lote ha finalizado satisfactoriamente su proceso de Entonado');
            res.redirect('/calidad/entonado-fin');
        }

    }else{
        req.flash('message', 'El Lote ingresado aún no ha sido iniciado en Control de Calidad ni en Entonado');
        res.redirect('/calidad/entonado-fin');
    }

};