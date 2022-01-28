let cantidadPastas = 0;
const container = document.querySelector('#contenedor-principal');

const radiosValue = () => {
    const radios = document.querySelector('input[name=crear-formula]:checked').value;

    if(radios === 'nueva'){
        nueva();
    }else if(radios === 'existente'){
        existente();
    }
};

const nueva = () => {

    const agregar = document.querySelector('#agregarPasta');

    if(agregar === null){
        const divBoton = document.createElement('div');
        divBoton.classList.add('form-group');    
        divBoton.classList.add('my-2');
        divBoton.classList.add('align-self-center');
        divBoton.classList.add('d-flex');
        divBoton.classList.add('w-100');
        divBoton.id = 'divBoton';

        const boton = document.createElement('button');
        boton.classList.add('btn');
        boton.classList.add('btn-opcion');
        boton.classList.add('bg-principal');
        boton.innerText = 'Agregar Pasta'
        boton.id = 'agregarPasta';
        boton.onclick = nuevaPasta;

        divBoton.append(boton);
        container.append(divBoton);
        nuevaPasta();
    }

};

const nuevaPasta = () => {
    cantidadPastas += 1;
    let idInput = 'pasta' + cantidadPastas.toString();
    let idDivPasta = 'divPasta' + cantidadPastas.toString();

    const divPasta = document.createElement('div');
    divPasta.classList.add('form-group');    
    divPasta.classList.add('my-2');
    divPasta.classList.add('align-self-center');
    divPasta.classList.add('d-flex');
    divPasta.classList.add('w-100');
    divPasta.id = idDivPasta;
    
    const pasta = document.createElement('input');
    pasta.classList.add('form-control');
    pasta.classList.add('input-lg');
    pasta.placeholder = 'Codigo SAP';
    pasta.id = idInput;

    divPasta.append(pasta);
    container.append(divPasta);

};

const existente = () => {
    const boton = document.querySelector('#agregarPasta');
    const divBoton = document.querySelector('#divBoton');
    let pastas = '#pasta'
    let divPastas = '#divPasta'

    if(boton !== null){
        boton.remove();
    }

    if(divBoton !== null){
        divBoton.remove();
    }

    if(cantidadPastas !== 0){
        for(let i=1; i<=cantidadPastas; i++){
            let divPasta = document.querySelector(divPastas + i.toString());
            divPasta.remove();
        }
    }

    cantidadPastas = 0;

};