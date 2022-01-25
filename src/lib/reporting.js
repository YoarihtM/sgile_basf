import { jsPDF } from 'jspdf';

export const newUserCreated = (userData) => {
    const doc = new jsPDF();

    doc.setFontSize(12);
    doc.setFont('times');

    doc.text('Nuevo usuario creado', 70, 20);

    const msj = 'El usuario ' + userData.nombre + ' ' + userData.ap_paterno + ' ' + userData.ap_materno + ' ha sido creado con éxito.';
    
    doc.text(msj, 10, 30);

    doc.save('prueba.pdf');
};