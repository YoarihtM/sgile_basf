let cantidadPastas = 0;
const container = document.querySelector('#contenedor-principal');
const containerInfoPasta = document.querySelector('#infoPasta');

const crearDiv = (id) => {
    const div = document.createElement('div');
    div.classList.add('form-group');
    div.classList.add('align-self-center');
    div.classList.add('d-flex');
    div.classList.add('w-100');
    div.classList.add('my-3');
    div.id = id;

    return div;
};

const crearInput = (id, placeholder) =>{
    const input = document.createElement('input');
    input.classList.add('form-control');
    input.classList.add('w-100');
    input.type = 'text';
    input.id = id;
    input.placeholder = placeholder;
    input.setAttribute('name', id);
    console.log('Crear input');

    return input;
};

const crearRadio = (id, name, label) => {
    const radio = document.createElement('input');
    radio.classList.add('form-check-input');
    radio.type = 'radio';
    radio.id = id;
    radio.setAttribute('name', name);
    radio.setAttribute('onclick', 'divActual(this)');

    const lblRadio = document.createElement('label');
    lblRadio.classList.add('form-check-label');
    lblRadio.classList.add('text-light');
    lblRadio.setAttribute('for', id);
    lblRadio.innerText = label;

    return {radio, lblRadio};
};

const divActual = (elemento) => {
    console.log(elemento);
};

const crearOpcion = (valor) => {
    const option = document.createElement('option');

    option.value = valor;
    option.text = valor;

    return option;
};

const crearSelectorTecnologia = (id) => {
    const select = document.createElement('select');
    const selectedOption = crearOpcion('Seleccione la tecnología');
    const baseAgua = crearOpcion('Base Agua');
    const baseSolvente = crearOpcion('Base Solvente');
    
    select.classList.add('form-select');
    select.classList.add('me-2');
    select.ariaLabel = 'Seleccion de tecnología';
    select.id = id;
    select.setAttribute('name', id);
    select.add(selectedOption, 0);
    select.add(baseAgua, 1);
    select.add(baseSolvente, 2);
    selectedOption.selected = true;
    
    return select;
};

const crearSelectorPastas = (id) => {
    const select = document.createElement('select');
    const selectedOption = crearOpcion('Seleccione la Pasta');

    select.classList.add('form-select');
    select.ariaLabel = 'Seleccion de pasta';
    select.add(selectedOption, 0);
        info.forEach(pasta => {
            const sap = crearOpcion(pasta.cod_sap);
            select.add(sap);
        });
    select.id = id;
    select.setAttribute('name', id);
    selectedOption.selected = true;

    return select;
};

const crearBtnBorrar = (id) => {
    const boton = document.createElement('button');
    
    boton.classList.add('btn');
    boton.classList.add('btn-danger');
    boton.type = 'button';
    boton.id = id;
    boton.setAttribute('onclick', 'eliminarInputPasta(this)');
    boton.innerHTML = '<i class="bi bi-x-lg"></i>';

    return boton;
};

const pastaExistente = (elemento) => {

    if(elemento.id == 'existente'){
        containerInfoPasta.innerHTML = '';
        const selecPasta = crearSelectorPastas('sap');
        containerInfoPasta.append(selecPasta);
    }else{
        console.log('otro');
    }

};

const pastaNueva = (elemento) => {

    if(elemento.id == 'nueva'){
        console.log('nueva');
    }else{
        console.log('otro');
    }

};

const crearInputPasta = () => {
    cantidadPastas += 1;

    console.log(cantidadPastas);
};

const eliminarInputPasta = (boton) => {
    cantidadPastas -= 1;

    console.log(cantidadPastas);
};