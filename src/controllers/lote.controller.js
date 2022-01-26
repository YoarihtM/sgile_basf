import res, { get, json, send } from 'express/lib/response';
import { getConnection, sql, queries } from '../database'

export const lotes = (req, res) => {
    res.render('material-batch/lotes')
}