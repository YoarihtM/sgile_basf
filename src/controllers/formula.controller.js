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

    res.render('formulas/nuevo-color', {
        sapCodes: result.recordset
    });
};

export const nuevoColorRegistrado = async (req, res) => {
    const datos = Object.values(req.body);
    const existentes = [];
    const nuevas = [];

    const pool = await getConnection();

    const {
        sapColor,
        descripcionColor,
        comentarioColor,
        bom,
        comentarioBom
    } = req.body;

    await pool
    .request()
    .input('cod_sap', sql.VarChar(20), sapColor)
    .input('descripcion', sql.VarChar(50), descripcionColor)
    .input('comentario', sql.Text, comentarioColor)
    .query(queries.addNewColor);

    const colorAgregado = await pool
    .request()
    .input('cod_sap', sql.VarChar, sapColor)
    .query(queries.getIdColor);

    const idColor = colorAgregado.recordset[0].id;

    await pool
    .request()
    .input('bom', sql.VarChar(30), bom)
    .input('comentario', sql.Text, comentarioBom)
    .query(queries.addNewFormula);

    const formulaAgregada = await pool
    .request()
    .input('bom', sql.VarChar(30), bom)
    .query(queries.getIdFormula);

    const idFormula = formulaAgregada.recordset[0].id;

    await pool
    .request()
    .input('id_color', sql.Int, parseInt(idColor))
    .input('sap_color', sql.VarChar(20), sapColor)
    .input('id_formula', sql.Int, parseInt(idFormula))
    .query(queries.addNewRelationColorFormula);
    
    for(let dato = 5; dato < datos.length - 1; dato++){
        if (datos[dato] == 'existente'){
            existentes.push({
                sap: datos[dato + 1],
                cantidad: datos[dato + 2]
            });
        }else if (datos[dato] == 'nueva'){
            nuevas.push({
                sap: datos[dato + 1],
                descripcion: datos[dato + 2],
                tecnologia: datos[dato + 3],
                cantidad: datos[dato + 4]
            });
        }else{
            continue;
        }
    }

    for(let pasta of nuevas){
        if(pasta.tecnologia == 'Seleccione la tecnología'){
            req.flash('message', `La nueva pasta con SAP "${pasta.sap}" no se le agregó el tipo de tecnología`);
            res.redirect('/formula/nuevo-color');
            break;
        }else if(parseFloat(pasta.cantidad) == 0.0){
            req.flash('message', `Todas las pastas registradas deben tener al menos 0.001 Kg. La pasta "${pasta.sap}" no se le agregó cantidad alguna`);
            res.redirect('/formula/nuevo-color');
            break;
        }

        const result = await pool
        .request()
        .input('cod_sap', sql.VarChar(30), pasta.sap)
        .query(queries.getPasteBySAP);

        if(result.recordset.length > 0){
            req.flash('message', `La pasta "${pasta.sap}" ya existe`);
            res.redirect('/formula/nuevo-color');
            break;
        }

        await pool
        .request()
        .input('cod_sap', sql.VarChar(30), pasta.sap)
        .input('descripcion', sql.VarChar(30), pasta.descripcion)
        .input('tecnologia', sql.VarChar(30), pasta.tecnologia)
        .query(queries.addNewPaste);

        await pool
        .request()
        .input('id_formula', sql.Int, parseInt(idFormula))
        .input('cod_sap', sql.VarChar(30), pasta.sap)
        .input('cantidad', sql.Float, parseFloat(pasta.cantidad))
        .query(queries.addNewRelationFormulaPaste);
    }

    for(let pasta of existentes){
        if(pasta.sap == 'Seleccione la Pasta'){
            req.flash('message', 'No se seleccionó ninguna pasta existente, vuelve a intentar');
            res.redirect('/formula/nuevo-color');
            break;
        }

        await pool
        .request()
        .input('id_formula', sql.Int, idFormula)
        .input('cod_sap', sql.VarChar(30), pasta.sap)
        .input('cantidad', sql.Float, parseFloat(pasta.cantidad))
        .query(queries.addNewRelationFormulaPaste);

    }

    req.flash('success', 'Nuevo Color agregado exitosamente');
    res.redirect('/formula/nuevo-color');
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