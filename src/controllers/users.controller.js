import { type } from 'express/lib/response';
import { getConnection, sql, queries } from '../database'
import { createPassword, encryptPassword, matchPassword } from '../lib/helpers';
import { reports } from '../lib/reporting';

export const users = (req, res) => {
    res.render('users/usuarios');
};

export const createAdmin = (req, res) => {
    res.render('users/crearAdmin');
};

export const createModerador = (req, res) => {
    res.render('users/crearModerador');
};

export const createAccLim = (req, res) => {
    res.render('users/crearAccesoLim');
};

export const createSoloVista = (req, res) => {
    res.render('users/crearSoloVista');
};

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



export const createNewAdmin = async (req, res) => {
    const tipo_usuario = 1;
    
    const {
        num_empleado,
        nombre,
        ap_paterno,
        ap_materno,
        departamento,
        email
    } = req.body;
    
    let {
        telefono,
        img_perfil
    } = req.body;
    
    if (telefono == null || telefono == undefined) {
        telefono = '';
    }

    if (img_perfil == null || img_perfil == undefined) {
        img_perfil = null;
    }
    
    const contrasena = createPassword();
    
    // const contrasenaCifrada = await encryptPassword(contrasena);
    
    res.json({
        num_empleado,
        nombre,
        ap_paterno,
        ap_materno,
        departamento,
        tipo_usuario,
        email,
        contrasena,
        telefono,
        img_perfil
    });
};

export const createNewModer = async (req, res) => {
    const tipo_usuario = 2;
    
    const {
        num_empleado,
        nombre,
        ap_paterno,
        ap_materno,
        departamento,
        email,
        contrasena
    } = req.body;
    
    let {
        telefono,
        img_perfil
    } = req.body;
    
    if (telefono == null || telefono == undefined) {
        telefono = '';
    }
    
    if (img_perfil == null || img_perfil == undefined) {
        img_perfil = null;
    }
    
    // const contrasenaCifrada = await encryptPassword(contrasena);
    
    res.json({
        num_empleado,
        nombre,
        ap_paterno,
        ap_materno,
        departamento,
        tipo_usuario,
        email,
        contrasena,
        telefono,
        img_perfil
    });
};

export const createNewAccLim = async (req, res) => {
    const tipo_usuario = 3;
    
    const {
        num_empleado,
        nombre,
        ap_paterno,
        ap_materno,
        departamento,
        email,
        contrasena
    } = req.body;
    
    let {
        telefono,
        img_perfil
    } = req.body;
    
    if (telefono == null || telefono == undefined) {
        telefono = '';
    }
    
    if (img_perfil == null || img_perfil == undefined) {
        img_perfil = null;
    }
    
    // const contrasenaCifrada = await encryptPassword(contrasena);
    
    res.json({
        num_empleado,
        nombre,
        ap_paterno,
        ap_materno,
        departamento,
        tipo_usuario,
        email,
        contrasena,
        telefono,
        img_perfil
    });
};

export const createNewSoloVi = async (req, res) => {
    const tipo_usuario = 4;
    
    const {
        num_empleado,
        nombre,
        ap_paterno,
        ap_materno,
        departamento,
        email,
        contrasena
    } = req.body;
    
    let {
        telefono,
        img_perfil
    } = req.body;
    
    if (telefono == null || telefono == undefined) {
        telefono = '';
    }
    
    if (img_perfil == null || img_perfil == undefined) {
        img_perfil = null;
    }
    
    // const contrasenaCifrada = await encryptPassword(contrasena);
    
    res.json({
        num_empleado,
        nombre,
        ap_paterno,
        ap_materno,
        departamento,
        tipo_usuario,
        email,
        contrasena,
        telefono,
        img_perfil
    });
};

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
            };