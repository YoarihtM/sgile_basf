import { getConnection, sql, queries } from '../database'


export const solicitudAdicion = async (req, res) => {

    const pool = await getConnection();
    const pastas = await pool.request().query(queries.getAllPaste);

    res.render('quality/solicitudAdicion', {
        sapCodes: pastas.recordset
    });

};

export const solicitudAdicionRegistrada = async (req, res) => {

    const datos = Object.values(req.body);
    const existentes = [];
    const nuevas = [];

    const pool = await getConnection();

    

    res.json(req.body);

};