let cantidadPastas = 0;
const container = document.querySelector('#contenedor-principal');

const crearInputPasta = () => {
    cantidadPastas += 1;
    const divPasta = document.createElement('div');
    const inputSap = document.createElement('input');
    const inputDescripcion = document.createElement('input');
    const selectorTecnologia = document.createElement('select');
    const baseAgua = document.createElement('option');
    const baseSolvente = document.createElement('option');
    const selectedOption = document.createElement('option');
    const btnEliminar = document.createElement('button');
    let idDiv = 'divPasta' + cantidadPastas.toString();
    let idInputSap = 'sap' + cantidadPastas.toString();
    let idInputDescripcion = 'descripcion' + cantidadPastas.toString();
    let idSelectTecnologia = 'tecnologia' + cantidadPastas.toString();
    let idBtnEliminar = 'eliminar' + cantidadPastas.toString();

    baseAgua.value = 'Base Agua';
    baseAgua.text = 'Base Agua';

    baseSolvente.value = 'Base Solvente';
    baseSolvente.text = 'Base Solvente';

    selectedOption.text = 'Seleccione la tecnología';

    divPasta.classList.add('form-group');
    divPasta.classList.add('align-self-center');
    divPasta.classList.add('d-flex');
    divPasta.classList.add('w-100');
    divPasta.classList.add('my-3');
    divPasta.id = idDiv;
    container.appendChild(divPasta);

    inputSap.classList.add('form-control');
    inputSap.classList.add('w-100');
    inputSap.type = 'text';
    inputSap.id = idInputSap;
    inputSap.placeholder = 'Código SAP de la Pasta';
    inputSap.setAttribute('name', idInputSap);
    divPasta.appendChild(inputSap);

    inputDescripcion.classList.add('form-control');
    inputDescripcion.classList.add('w-100');
    inputDescripcion.classList.add('mx-2');
    inputDescripcion.type = 'text';
    inputDescripcion.id = idInputDescripcion;
    inputDescripcion.placeholder = 'Descripcion';
    inputDescripcion.setAttribute('name', idInputDescripcion);
    divPasta.appendChild(inputDescripcion);

    selectorTecnologia.classList.add('form-select');
    selectorTecnologia.classList.add('me-2');
    selectorTecnologia.id = idSelectTecnologia;
    selectorTecnologia.ariaLabel = 'Seleccion de tecnologia';
    selectorTecnologia.setAttribute('name', idSelectTecnologia);
    selectorTecnologia.add(selectedOption, 0);
    selectorTecnologia.add(baseAgua, 1);
    selectorTecnologia.add(baseSolvente, 2);
    selectedOption.selected = true;
    divPasta.appendChild(selectorTecnologia);

    btnEliminar.classList.add('btn');
    btnEliminar.classList.add('btn-danger');
    btnEliminar.type = 'button';
    btnEliminar.id = idBtnEliminar;
    btnEliminar.setAttribute('onclick', 'eliminarInputPasta(this)');
    btnEliminar.innerHTML = '<i class="bi bi-x-lg"></i>';
    divPasta.appendChild(btnEliminar);

};

const eliminarInputPasta = (boton) => {
    const indice = boton.id[boton.id.length - 1];
    let idDiv = '#divPasta' + indice;
    let idSap = '#sap' + indice;
    let idDescripcion = '#descripcion' + indice;
    let idTecnologia = '#tecnologia' + indice;
    let divPasta = document.querySelector(idDiv);
    let sap = document.querySelector(idSap);
    let descripcion = document.querySelector(idDescripcion);
    let tecnologia = document.querySelector(idTecnologia);

    divPasta.remove();
    sap.remove();
    descripcion.remove();
    tecnologia.remove();
    boton.remove();

    for (let i = (indice * 1) + 1; i <= cantidadPastas; i++) {
        idDiv = '#divPasta' + i.toString();
        idSap = '#sap' + i.toString();
        idDescripcion = '#descripcion' + i.toString();
        idTecnologia = '#tecnologia' + i.toString();
        divPasta = document.querySelector(idDiv);
        sap = document.querySelector(idSap);
        descripcion = document.querySelector(idDescripcion);
        tecnologia = document.querySelector(idTecnologia);
        let idBtn = '#eliminar' + i.toString();
        let btn = document.querySelector(idBtn);

        divPasta.id = 'divPasta' + (i - 1).toString();
        divPasta.setAttribute('name', 'divPasta' + (i - 1).toString());

        sap.id = 'sap' + (i - 1).toString();
        sap.setAttribute('name', 'sap' + (i - 1).toString());

        descripcion.id = 'descripcion' + (i - 1).toString();
        descripcion.setAttribute('name', 'descripcion' + (i - 1).toString());

        tecnologia.id = 'tecnologia' + (i - 1).toString();
        tecnologia.setAttribute('name', 'tecnologia' + (i - 1).toString());

        btn.id = 'eliminar' + (i - 1).toString();
        btn.setAttribute('name', 'eliminar' + (i - 1).toString());
    }

    if (cantidadPastas !== 0) {
        cantidadPastas -= 1;
    }

    console.log(cantidadPastas);
};