export const queries = {

    getAllAdds: 'SELECT * FROM inicio_adicion',
    addNewAdds: 'INSERT INTO inicio_adicion (id, id_usuario, num_empleado, id_lote, cod_lote, pasta, cantidad, comentario) VALUES (@id, @id_usuario, @num_empleado, @id_lote, @cod_lote, @pasta, @cantidad, @comentario)',

// -------------------------------------------------------------------------------------------------------

    getAllAddsFin: 'SELECT * FROM fin_adicion',

// -------------------------------------------------------------------------------------------------------

    getAllColor: 'SELECT * FROM color',
    addNewColor: 'INSERT INTO color (cod_sap, descripcion, tipo, comentario) VALUES (@cod_sap, @descripcion, @tipo, @comentario)',
    getIdColor: 'SELECT id FROM color WHERE cod_sap = @cod_sap',
    getColorInfo: 'SELECT * FROM color WHERE cod_sap = @cod_sap',

// -------------------------------------------------------------------------------------------------------

    getAllPaste: 'SELECT cod_sap FROM pasta',
    addNewPaste: 'INSERT INTO pasta (cod_sap, descripcion, tecnologia) VALUES (@cod_sap, @descripcion, @tecnologia)',
    getPasteBySAP: 'SELECT * FROM pasta WHERE cod_sap = @cod_sap',

// -------------------------------------------------------------------------------------------------------

    addNewPasteBatch: 'INSERT INTO lote_pasta (cod_lote, comentario) VALUES (@cod_lote, @comentario)',
    getPasteBatchById: 'SELECT * FROM lote_pasta WHERE id = @id',
    getPasteBatchByCode: 'SELECT * FROM lote_pasta WHERE cod_lote = @cod_lote',

// -------------------------------------------------------------------------------------------------------

    addNewRelationPasteBatch: 'INSERT INTO pasta_lote_pasta (cod_sap, id_lote) VALUES (@cod_sap, @id_lote)',
    getBatchesRelatedBySap: 'SELECT id_lote FROM pasta_lote_pasta WHERE cod_sap = @cod_sap',

// -------------------------------------------------------------------------------------------------------

    getAllFormula: 'SELECT * FROM formula',
    addNewFormula: 'INSERT INTO formula (bom, comentario) VALUES (@bom, @comentario)',
    getIdFormula: 'SELECT id FROM formula WHERE bom = @bom', 
    getFormulaById: 'SELECT * FROM formula WHERE id = @id',

// -------------------------------------------------------------------------------------------------------

    addNewRelationColorFormula: 'INSERT INTO color_formula (id_color, sap_color, id_formula) VALUES (@id_color, @sap_color, @id_formula)',

// -------------------------------------------------------------------------------------------------------

    addNewRelationFormulaPaste: 'INSERT INTO pasta_formula (id_formula, cod_sap, cantidad) VALUES (@id_formula, @cod_sap, @cantidad)',
    getAllFormulaRelatedByColor: 'SELECT id_formula FROM color_formula WHERE sap_color = @sap_color',
    getAllPastesRelatedByFormula: 'SELECT * FROM pasta_formula WHERE id_formula = @id_formula',

// -------------------------------------------------------------------------------------------------------

    getAllBatch: 'SELECT * FROM lote',
    getBatchByCode: 'SELECT * FROM lote WHERE cod_lote = @cod_lote',
    getBatchIdByCode: 'SELECT id FROM lote WHERE cod_lote = @cod_lote',
    addNewBatch: 'INSERT INTO lote (cod_lote, id_color, cod_sap_color, cliente, descripcion, tecnologia, tam_lote, contenedor, comentario) VALUES (@cod_lote, @id_color, @cod_sap_color, @cliente, @descripcion, @tecnologia, @tam_lote, @contenedor, @comentario)',

// -------------------------------------------------------------------------------------------------------

    addNewDoneEvaluation: 'INSERT INTO inicio_eval_terminado (id_usuario, num_empleado, id_lote, cod_lote, fecha, comentario) VALUES (@id_usuario, @num_empleado, @id_lote, @cod_lote, @fecha, @comentario)',
    getDoneEvaluation: 'SELECT * FROM inicio_eval_terminado WHERE cod_lote = @cod_lote',
    addNewEndDoneEvaluation: 'INSERT INTO fin_eval_terminado (id_usuario, num_empleado, id_lote, cod_lote, fecha, comentario) VALUES (@id_usuario, @num_empleado, @id_lote, @cod_lote, @fecha, @comentario)',
    getEndDoneEvaluation: 'SELECT * FROM fin_eval_terminado WHERE cod_lote = @cod_lote',

// -------------------------------------------------------------------------------------------------------

    addNewQualityStart: 'INSERT INTO inicio_calidad (id_usuario, num_empleado, id_lote, cod_lote, fecha, comentario) VALUES (@id_usuario, @num_empleado, @id_lote, @cod_lote, @fecha, @comentario)',
    addNewQualityEnd: 'INSERT INTO fin_calidad (id_usuario, num_empleado, id_lote, cod_lote, fecha, comentario) VALUES (@id_usuario, @num_empleado, @id_lote, @cod_lote, @fecha, @comentario)',
    getQualityStartByBatch: 'SELECT * FROM inicio_calidad WHERE cod_lote = @cod_lote',
    getQualityEndByBatch: 'SELECT * FROM fin_calidad WHERE cod_lote = @cod_lote',
    
    addNewTintingStart: 'INSERT INTO inicio_entonado (id_usuario, num_empleado, id_lote, cod_lote, fecha, comentario) VALUES (@id_usuario, @num_empleado, @id_lote, @cod_lote, @fecha, @comentario)',
    addNewTintingEnd: 'INSERT INTO fin_entonado (id_usuario, num_empleado, id_lote, cod_lote, fecha, comentario) VALUES (@id_usuario, @num_empleado, @id_lote, @cod_lote, @fecha, @comentario)',
    getTintingStartByBatch: 'SELECT * FROM inicio_entonado WHERE cod_lote = @cod_lote',
    getTintingEndByBatch: 'SELECT * FROM fin_entonado WHERE cod_lote = @cod_lote',

// -------------------------------------------------------------------------------------------------------
    
    getAllUsers: 'SELECT * FROM usuario',
    addNewUser: 'INSERT INTO usuario (num_empleado, nombre, ap_paterno, ap_materno, departamento, tipo_usuario, email, contrasena, telefono, img_perfil) VALUES (@num_empleado, @nombre, @ap_paterno, @ap_materno, @departamento, @tipo_usuario, @email, @contrasena, @telefono, @img_perfil)',
    getUserById: 'SELECT * FROM usuario WHERE id = @id',
    getUserByEmployeeNumber: 'SELECT * FROM usuario WHERE num_empleado = @num_empleado',
    deleteUser: 'DELETE FROM usuario WHERE num_empleado = @num_empleado',
    checkEmail: 'SELECT * FROM usuario WHERE email = @email',
    // updtUserById: 'UPDATE '

// -------------------------------------------------------------------------------------------------------

    getUserType: 'SELECT nombre FROM tipo_usuario WHERE id = @id'
};