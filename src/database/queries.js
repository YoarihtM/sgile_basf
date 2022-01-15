export const queries = {

    getAllAdds: 'SELECT * FROM inicio_adicion',
    addNewAdds: 'INSERT INTO inicio_adicion (id, id_usuario, num_empleado, id_lote, cod_lote, pasta, cantidad, comentario) VALUES (@id, @id_usuario, @num_empleado, @id_lote, @cod_lote, @pasta, @cantidad, @comentario)',

// -------------------------------------------------------------------------------------------------------

    getAllAddsFin: 'SELECT * FROM fin_adicion',

// -------------------------------------------------------------------------------------------------------

    getAllColor: 'SELECT * FROM color',
    addNewColor: 'INSERT INTO color (cod_sap, descripcion, id_formula, comentario) VALUES (@cod_sap, @descripcion, @id_formula, @comentario)',

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
    getUserById: 'SELECT * FROM usuario WHERE num_empleado = @num_empleado',
    deleteUser: 'DELETE FROM usuario WHERE num_empleado = @num_empleado',
    checkEmail: 'SELECT * FROM usuario WHERE email = @email'
    // updtUserById: 'UPDATE '
};