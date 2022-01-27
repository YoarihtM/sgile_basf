import res, { get, json, send } from 'express/lib/response';
import { getConnection, sql, queries } from '../database'

export const formula = (req, res) => {
    res.render('formulas/formulas')
};

export const nuevoColor = (req, res) => {
    res.render('formulas/nuevo-color')
};