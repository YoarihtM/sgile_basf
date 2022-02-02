import res, { get, json, redirect, send } from 'express/lib/response';
import { VarChar } from 'mssql';
import { getConnection, sql, queries } from '../database'

export const formula = (req, res) => {
    res.render('formulas/formulas')
};

export const nuevoColor = async (req, res) => {
    const origen = req.url;

    const pool = await getConnection();
    const result = await pool.request().query(queries.getAllPaste);
    console.log(result.recordset);

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

    if(tecnologia == 'Seleccione la tecnología'){
        req.flash('message', 'No se seleccionó la tecnología, vuelve a intentar');
        res.redirect('/formula/nueva-pasta');
    }else{
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
    
            try {
                await pool
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
                
                const result2 = await pool
                .request()
                .input('cod_lote', sql.VarChar(30), lote)
                .query(queries.getPasteBatchByCode);
                
                const idLote = result2.recordset[0].id;
        
                await pool
                .request()
                .input('cod_sap', sql.VarChar(30), sap)
                .input('id_lote', sql.Int, idLote)
                .query(queries.addNewRelationPasteBatch);
                
                req.flash('success', 'Nueva Pasta agregada exitosamente');
                res.redirect('/formula/nueva-pasta');
                
            } catch (error) {
                res.status(500);
                res.send(error.message);
            }
        }
    }
};

export const nuevoLotePasta = async (req, res) => {
    const pool = await getConnection();
    const result = await pool.request().query(queries.getAllPaste);
    
    res.render('formulas/nuevo-lote', {
        sapCodes: result.recordset
    });
};


export const nuevoLotePastaRegistrado = async (req, res) => {

    const {
        sap, 
        lote,
        comentarioLote
    } = req.body;

    if(sap == 'Seleccione la Pasta'){
        req.flash('message', 'No se seleccionó ninguna pasta, vuelve a intentar');
        res.redirect('/formula/nuevo-lote-pasta');
    }else{
        const pool = await getConnection();
        const result = await pool
        .request()
        .input('cod_lote', sql.VarChar(30), lote)
        .query(queries.getPasteBatchByCode);
    
        if(result.recordset.length > 0){
            req.flash('message', '¡El Lote introducido ya existe!');
            res.redirect('/formula/nuevo-lote-pasta');
        }else{
            try {
                await pool
                .request()
                .input('cod_lote', sql.VarChar(30), lote)
                .input('comentario', sql.Text, comentarioLote)
                .query(queries.addNewPasteBatch);
        
                const result2 = await pool
                .request()
                .input('cod_lote', sql.VarChar(30), lote)
                .query(queries.getPasteBatchByCode);
        
                const idLote = result2.recordset[0].id;
        
                await pool
                .request()
                .input('cod_sap', sql.VarChar(30), sap)
                .input('id_lote', sql.Int, idLote)
                .query(queries.addNewRelationPasteBatch);
                
                req.flash('success', 'Nuevo Lote agregado exitosamente');
                res.redirect('/formula/nuevo-lote-pasta');
            } catch (error) {
                res.status(500);
                res.send(error.message);
            }
        }
    }
};

export const lotePasta = async (req, res) => {
    const pool = await getConnection();
    const result = await pool.request().query(queries.getAllPaste);
    
    res.render('formulas/ver-lotePasta', {
        sapCodes: result.recordset
    });
};

export const lotePastaBusqueda = async (req, res) => {

    const {
        sap
    } = req.body;

    if(sap == 'Seleccione la Pasta'){
        req.flash('message', 'No se seleccionó ninguna pasta, vuelve a intentar');
        res.redirect('/formula/lotes-pasta');
    }else{
        const pool = await getConnection();
        const result = await pool
        .request()
        .input('cod_sap', sql.VarChar(30), sap)
        .query(queries.getBatchesRelatedBySap);
    
        const idLotes = [];
    
        result.recordset.forEach(idLote => {
            idLotes.push(idLote.id_lote);
        });
    
        const infoLotes = [];
    
        for(let id of idLotes){
            const result1 = await pool
            .request()
            .input('id', sql.Int, id)
            .query(queries.getPasteBatchById);
    
            infoLotes.push(result1.recordset[0]);
        }
    
        res.render('formulas/lotePasta', {
            sap: sap,
            infoLotes: infoLotes
        });
    }

};

export const nuevaFormula = async (req, res) => {
    res.render('formulas/nueva-formula');
};