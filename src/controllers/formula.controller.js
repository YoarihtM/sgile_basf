import res, { get, json, send } from 'express/lib/response';
import { getConnection, sql, queries } from '../database'

export const formula = (req, res) => {
    res.render('formulas/formulas')
};

export const nuevoColor = async (req, res) => {

    const origen = req.url;

    console.log('Agregar nuevo color desde:', origen);

    res.render('formulas/nuevo-color');
};

export const nuevoColorRegistrado = async (req, res) => {
    const datos = Object.keys(req.body);

    if(datos.length > 8){
        const cantDatos = datos.length - 8;
        const cantPastas = cantDatos/3;
        let nameSapPasta = 'sap';
        let nameDescPasta = 'descripcion';
        let nameTecPasta = 'tecnologia';

        for(let i = 1; i <= cantPastas; i++){
            console.log(req.body[nameSapPasta + i.toString()]);
            console.log(req.body[nameDescPasta + i.toString()]);
            console.log(req.body[nameTecPasta + i.toString()]);
        }
    }

    res.json(req.body);
};