export const queries = {

    getAllAdds: 'SELECT * FROM inicio_adicion',
    addNewAdds: 'INSERT INTO inicio_adicion (id, id_usuario, num_empleado, id_lote, cod_lote, pasta, cantidad, comentario) VALUES (@id, @id_usuario, @num_empleado, @id_lote, @cod_lote, @pasta, @cantidad, @comentario)',

// -------------------------------------------------------------------------------------------------------

    getAllAddsFin: 'SELECT * FROM fin_adicion',

// -------------------------------------------------------------------------------------------------------

    getAllColor: 'SELECT * FROM color',
    addNewColor: 'INSERT INTO color (cod_sap, descripcion, id_formula, comentario) VALUES (@cod_sap, @descripcion, @id_formula, @comentario)',

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

// -------------------------------------------------------------------------------------------------------

    getAllBatch: 'SELECT * FROM lote',
    getBatchById: 'SELECT * FROM lote WHERE cod_lote = @cod_lote',
    addNewBatch: 'INSERT INTO lote (cod_lot, id_color, cod_sap_color, descripcion, tecnologia, tam_lote, contenedor, comentario) VALUES (@cod_lot, @id_color, @cod_sap_color, @descripcion, @tecnologia, @tam_lote, @contenedor, @comentario)',

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