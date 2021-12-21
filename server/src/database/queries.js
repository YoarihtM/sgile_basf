import { updtUserById } from "../controllers/users.controller";

export const queries = {
    getAllUsers: 'SELECT * FROM usuario',
    addNewUser: 'INSERT INTO usuario (num_empleado, nombre, ap_paterno, ap_materno, departamento, tipo_usuario, email, telefono, img_perfil) VALUES (@num_empleado, @nombre, @ap_paterno, @ap_materno, @departamento, @tipo_usuario, @email, @telefono, @img_perfil)',
    getUserById: 'SELECT * FROM usuario WHERE num_empleado = @num_empleado',
    deleteUser: 'DELETE FROM usuario WHERE num_empleado = @num_empleado'
    // updtUserById: 'UPDATE '
};