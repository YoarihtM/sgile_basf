import { getConnection, sql, queries } from '../database'

export const getAllAdds = async (req, res) => {

    try {
        
        const pool = await getConnection();
        const result = await pool
        .request()
        .query(queries.getAllAdds)

        res.json(result.recordset);

    } catch (error) {

        res.status(500);
        res.send(error.message);

    }

};

export const getAllAddsFin = async (req, res) => {

    try {
        
        const pool = await getConnection();
        const result = await pool
        .request()
        .query(queries.getAllAddsFin)

        res.json(result.recordset);

    } catch (error) {

        res.status(500);
        res.send(error.message);

    }

};