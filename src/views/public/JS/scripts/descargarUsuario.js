import jsPDF from '../jspdf';

const infoUsuario = () => {
    const nombre = document.querySelector('#nombre');
    const apPaterno = document.querySelector('#apPaterno');
    const apMaterno = document.querySelector('#apMaterno');
    const numEmpleado = document.querySelector('#numEmpleado');

    const nombreCompleto = `${nombre.value} ${apPaterno.value} ${apMaterno.value}`;
    
    const docUsuario = new jsPDF();

    docUsuario.setFontSize(40);
    docUsuario.text(40, 20, 'Nuevo usuario creado');

    console.log(nombreCompleto);
}