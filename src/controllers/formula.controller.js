import res, { get, json, redirect, send } from 'express/lib/response';
import { getConnection, sql, queries } from '../database'

export const formula = (req, res) => {
    res.render('formulas/formulas')
};

export const nuevoColor = async (req, res) => {

    const origen = req.url;

    console.log('Agregar nuevo color desde:', origen);

    res.render('formulas/nuevo-color');
};

export const nuevoColorRegistrado = async (req, res) => {
    const datos = Object.keys(req.body);

    if(datos.length > 8){
        const cantDatos = datos.length - 8;
        const cantPastas = cantDatos/3;
        let nameSapPasta = 'sap';
        let nameDescPasta = 'descripcion';
        let nameTecPasta = 'tecnologia';

        for(let i = 1; i <= cantPastas; i++){
            console.log(req.body[nameSapPasta + i.toString()]);
            console.log(req.body[nameDescPasta + i.toString()]);
            console.log(req.body[nameTecPasta + i.toString()]);
        }
    }

    res.json(req.body);
};

export const nuevaPasta = (req, res) => {
    res.render('formulas/nueva-pasta')
};

export const nuevaPastaRegistrada = async (req, res) => {
    const {
        sap,
        descripcion,
        tecnologia,
        lote,
        comentarioLote
    } = req.body;

    const pool = await getConnection();
    const result = await pool
    .request()
    .input('cod_sap', sql.VarChar(30), sap)
    .query(queries.getPasteBySAP);

    const result1 = await pool
        .request()
        .input('cod_lote', sql.VarChar(30), lote)
        .query(queries.getPasteBatchByCode);

    if(result.recordset.length > 0){
        req.flash('message', '¡El SAP introducido ya existe!');
        res.redirect('/formula/nueva-pasta');
    }else if(result1.recordset.length > 0){
        req.flash('message', '¡El Lote introducido ya existe!');
        res.redirect('/formula/nueva-pasta');
    }else{
        const pool1 = await getConnection();
        await pool1
        .request()
        .input('cod_sap', sql.VarChar(30), sap)
        .input('descripcion', sql.VarChar(50), descripcion)
        .input('tecnologia', sql.VarChar(30), tecnologia)
        .query(queries.addNewPaste);

        await pool
        .request()
        .input('cod_lote', sql.VarChar(30), lote)
        .input('comentario', sql.Text, comentarioLote)
        .query(queries.addNewPasteBatch);

        

        console.log(result1);

        req.flash('success', 'Nueva Pasta agregada exitosamente');
        res.redirect('/formula/nueva-pasta');
    }
};