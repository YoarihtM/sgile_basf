import { jsPDF } from 'jspdf';
import { getConnection, queries } from '../database';

export const newUserCreated = async (userData) => {
    const doc = new jsPDF();

    const pool = await getConnection();
    const result = await pool
    .request()
    .input('id', userData.tipoUsuario)
    .query(queries.getUserType);

    const tipoUsuario = result.recordset[0].nombre;

    doc.setFontSize(24);
    doc.setFont('Helvetica');

    doc.text('Nuevo usuario creado', 65, 20);

    doc.setFont('times');
    doc.setFontSize(12);

    let msj = 'El usuario ' + userData.nombre + ' ' + userData.apPaterno + ' ' + userData.apMaterno + ' con No. de empleado ' + userData.numEmpleado + ' ha sido creado con éxito.';
    
    doc.text(msj, 15, 30, {
        align: 'justify'
    });

    msj = 'Por favor, haga entrega de este documento al nuevo usuario de tipo ' + tipoUsuario + '.';

    doc.text(msj, 15, 35);

    msj = 'La siguiente información permitirá el acceso al sistema para el usuario. ';

    doc.text(msj, 15, 40);

    msj = 'Correo de acceso: ' + userData.email;

    doc.text(msj, 30, 50);

    msj = 'Contraseña: ' + userData.contrasena;

    doc.text(msj, 30, 55);

    const nombreDoc = userData.nombre + userData.numEmpleado + '.pdf'

    doc.save(nombreDoc);

    return nombreDoc;
};