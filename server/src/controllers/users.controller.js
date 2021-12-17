import { getConnection, sql } from '../database/connection'

export const getUsers = async (req, res) => {
    const pool = await getConnection();
    const result = await pool.request().query('SELECT * FROM usuario');
    console.log(result);

    res.json(result.recordset);
};

export const createNewUser = async (req, res) => {

    const {
        num_empleado,
        nombre,
        ap_paterno,
        ap_materno,
        departamento,
        tipo_usuario
    } = req.body;

    let {
        email,
        telefono,
        img_perfil
    } = req.body;

    if(email == null || email == undefined){
        email = '';
    }
    
    if(telefono == null || telefono == undefined){
        telefono = '';
    }
    
    if(img_perfil == null || img_perfil == undefined){
        img_perfil = null;
    }

    console.log(num_empleado,
        nombre,
        ap_paterno,
        ap_materno,
        departamento,
        tipo_usuario,
        email,
        telefono,
        img_perfil);

    //const pool = getConnection()
    
    //await pool.request().input("nombre", sql.VarChar, nombre).query("INSERT INTO usuario (nombre) VALUES (@nombre)")
    
    let hi = 'New User. Welcome ' + nombre

    res.json(hi);
}