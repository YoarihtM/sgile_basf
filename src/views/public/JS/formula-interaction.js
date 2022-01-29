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
    
    baseAgua.value = 'agua';
    baseAgua.text = 'Base Agua';
    
    baseSolvente.value = 'solvente';
    baseSolvente.text = 'Base Solvente';

    selectedOption.text = 'Seleccione la tecnología';
    
    divPasta.classList.add('form-group');
    divPasta.classList.add('align-self-center');
    divPasta.classList.add('d-flex');
    divPasta.classList.add('w-100');
    divPasta.classList.add('my-3');
    divPasta.id = idDiv ;
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
    selectorTecnologia.id = idSelectTecnologia;
    selectorTecnologia.ariaLabel = 'Seleccion de tecnologia';
    selectorTecnologia.setAttribute('name', idSelectTecnologia);
    selectorTecnologia.add(selectedOption, 0);
    selectorTecnologia.add(baseAgua, 1);
    selectorTecnologia.add(baseSolvente, 2);
    selectedOption.selected = true;
    divPasta.appendChild(selectorTecnologia);

    btnEliminar.classList.add('btn');
    btnEliminar.classList.add('btn-outline-danger');
    btnEliminar.type = 'button';
    btnEliminar.innerHTML = '<i class="bi bi-x-lg"></i>';
    divPasta.appendChild(btnEliminar);
    
};

const eliminarInputPasta = () => {
    if(cantidadPastas !== 0){
        let idDiv = '#divPasta' + cantidadPastas.toString();
        const divPasta = document.querySelector(idDiv);
        divPasta.remove();
        cantidadPastas -= 1;
    }else{
        alert('Debe existir al menos una pasta');
    }

};