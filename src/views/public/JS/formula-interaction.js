let cantidadPastas = 0;
const container = document.querySelector('#contenedor-principal');
const containerInfoPasta = document.querySelector('#infoPasta');

const crearDiv = (id) => {
    const div = document.createElement('div');
    div.classList.add('align-self-center');
    div.classList.add('d-flex');
    div.classList.add('w-100');
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

    return input;
};

const crearRadio = (id, name, label) => {
    const radio = document.createElement('input');
    radio.classList.add('form-check-input');
    radio.type = 'radio';
    radio.id = id;
    radio.setAttribute('name', name);

    const lblRadio = document.createElement('label');
    lblRadio.classList.add('form-check-label');
    lblRadio.classList.add('text-light');
    lblRadio.setAttribute('for', `#${id}`);
    lblRadio.innerText = label;

    return {radio, lblRadio};
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
    boton.classList.add('ms-auto');
    boton.type = 'button';
    boton.id = id;
    boton.setAttribute('onclick', 'borrarRegistroPasta(this)');
    boton.innerHTML = '<i class="bi bi-x-lg"></i>';

    return boton;
};

const pastaExistente = (elemento) => {

    if(elemento.id == 'existente'){
        containerInfoPasta.innerHTML = '';
        const selecPasta = crearSelectorPastas('sap');
        containerInfoPasta.append(selecPasta);
    }else{
        let posicion = elemento.id[elemento.id.length - 1];
        const divInfo = document.querySelector(`#infoPasta${posicion}`);

        console.log(divInfo);
    }

};

const pastaNueva = (elemento) => {

    if(elemento.id == 'nueva'){
        containerInfoPasta.innerHTML = '';
        containerInfoPasta.classList.add('form-group');
        const inputSap = crearInput('sap', 'Código SAP de la pasta');
        const inputDesc = crearInput('descripcion', 'Descripción');
        const selecTec = crearSelectorTecnologia('tecnologia');

        inputSap.classList.add('me-2');
        inputDesc.classList.add('me-2');

        containerInfoPasta.append(inputSap);
        containerInfoPasta.append(inputDesc);
        containerInfoPasta.append(selecTec);
    }else{
        console.log('otro');
    }

};

const crearRegistroPasta = () => {
    cantidadPastas += 1;

    const divPasta = crearDiv(`divPasta${cantidadPastas}`);
    const divRadios = crearDiv(`radios${cantidadPastas}`);
    const existente = crearRadio(`existente${cantidadPastas}`, `tipoPasta${cantidadPastas}`, 'Pasta existente');
    const divExistente = crearDiv(`divExistente${cantidadPastas}`);
    const divNueva = crearDiv(`divNueva${cantidadPastas}`);
    const nueva = crearRadio(`nueva${cantidadPastas}`, `tipoPasta${cantidadPastas}`, 'Nueva pasta');
    const divInfo = crearDiv(`infoPasta${cantidadPastas}`);
    const btnEliminar = crearBtnBorrar(`eliminar${cantidadPastas}`);

    existente.radio.setAttribute('onclick', 'pastaExistente(this)');
    nueva.radio.setAttribute('onclick', 'pastaNueva(this)');
    
    divExistente.classList.add('form-check');
    divExistente.classList.add('mx-3');
    divExistente.classList.add('ms-auto');
    divExistente.classList.remove('align-self-center');
    divExistente.classList.remove('d-flex');
    divExistente.classList.remove('w-100');
    divExistente.append(existente.radio);
    divExistente.append(existente.lblRadio);

    divNueva.classList.add('form-check');
    divNueva.classList.add('mx-3');
    divNueva.classList.add('ms-auto');
    divNueva.classList.remove('align-self-center');
    divNueva.classList.remove('d-flex');
    divNueva.classList.remove('w-100');
    divNueva.append(nueva.radio);
    divNueva.append(nueva.lblRadio);

    divRadios.classList.add('justify-content-evenly');
    divRadios.classList.add('my-1');
    divRadios.append(divExistente);
    divRadios.append(divNueva);
    divRadios.append(btnEliminar);

    divInfo.classList.add('my-1');
    
    divPasta.classList.add('flex-column');
    divPasta.classList.add('form-group');
    divPasta.classList.add('my-3');
    divPasta.append(divRadios);
    divPasta.append(divInfo);
    
    container.append(divPasta);

    console.log(cantidadPastas);
};

const borrarRegistroPasta = (boton) => {
    cantidadPastas -= 1;

    console.log(cantidadPastas);
};