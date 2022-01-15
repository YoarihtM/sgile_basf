import { type } from 'express/lib/response';
import { getConnection, sql, queries } from '../database'
import { encryptPassword, matchPassword } from '../lib/helpers';

export const getUsers = async (req, res) => {
    try {
        const pool = await getConnection();
        const result = await pool.request().query(queries.getAllUsers);

        res.json(result.recordset);
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};

// -------------------------------------------------------------------------------------------------------

export const createNewUser = async (req, res) => {

    const {
        num_empleado,
        nombre,
        ap_paterno,
        ap_materno,
        departamento,
        tipo_usuario,
        email,
        contrasena
    } = req.body;

    let {
        telefono,
        img_perfil
    } = req.body;

    console.log(req.body);

    if (telefono == null || telefono == undefined) {
        telefono = '';
    }

    if (img_perfil == null || img_perfil == undefined) {
        img_perfil = null;
    }

    const contrasenaCifrada = await encryptPassword(contrasena);

    try {
        const pool = await getConnection();

        await pool
            .request()
            .input("num_empleado", sql.VarChar(15), num_empleado)
            .input("nombre", sql.VarChar(50), nombre)
            .input("ap_paterno", sql.VarChar(30), ap_paterno)
            .input("ap_materno", sql.VarChar(30), ap_materno)
            .input("departamento", sql.VarChar(30), departamento)
            .input("tipo_usuario", sql.Int, tipo_usuario)
            .input("email", sql.VarChar(50), email)
            .input("contrasena", sql.VarChar(100), contrasenaCifrada)
            .input("telefono", sql.VarChar(30), telefono)
            .input("img_perfil", sql.Image, img_perfil)
            .query(queries.addNewUser);

        res.json({
            num_empleado,
            nombre,
            ap_paterno,
            ap_materno,
            departamento,
            tipo_usuario,
            email,
            contrasenaCifrada,
            telefono,
            img_perfil
        })

    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
}

// -------------------------------------------------------------------------------------------------------

export const getUserById = async (req, res) => {

    const num_empleado = req.params;

    try {
        const pool = await getConnection();
        const result = await pool
        .request()
        .input('num_empleado', num_empleado.num_empleado)
        .query(queries.getUserById)
        res.send(result.recordset[0])

    } catch (error) {
        res.status(500);
        res.send(error.message);
    }

} 

// -------------------------------------------------------------------------------------------------------

export const deleteUser = async (req, res) => {
    const num_empleado = req.params;

    try {
        const pool = await getConnection();
        const result = await pool
        .request()
        .input('num_empleado', num_empleado.num_empleado)
        .query(queries.deleteUser);

        res.send(result.recordset);

    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
}

// -------------------------------------------------------------------------------------------------------

// export const updtUserById = async (req, res) => {
//     const num_empleado = req.params;

//     try {
//         const pool = await getConnection();
//         const result = await pool
//         .request()
//         .input('num_empleado', num_empleado.num_empleado)
//         .query(queries)
        
//     } catch (error) {
        
//     }
// }