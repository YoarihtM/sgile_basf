export const queries = {
    getAllUsers: 'SELECT * FROM usuario',
    addNewUser: 'INSERT INTO usuario (num_empleado, nombre, ap_paterno, ap_materno, departamento, tipo_usuario, email, telefono, img_perfil) VALUES (@num_empleado, @nombre, @ap_paterno, @ap_materno, @departamento, @tipo_usuario, @email, @telefono, @img_perfil)',
    getUserById: 'SELECT * FROM usuario WHERE id = @id',
    deleteUser: 'DELETE FROM usuario WHERE id = @id'
};