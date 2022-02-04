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
        const inputCantidad = crearInput('cantidad', 'Cantidad en Kg');

        inputCantidad.setAttribute('type', 'number');
        inputCantidad.setAttribute('min', '0.000');
        inputCantidad.setAttribute('step', '1');
        inputCantidad.classList.remove('w-100');
        inputCantidad.classList.add('w-25');
        inputCantidad.classList.add('ms-auto');

        selecPasta.classList.add('me-3');

        containerInfoPasta.append(selecPasta);
        containerInfoPasta.append(inputCantidad);
    }else{
        let posicion = elemento.id[elemento.id.length - 1];
        const divInfo = document.querySelector(`#infoPasta${posicion}`);
        const selecPasta = crearSelectorPastas(`sap${posicion}`);
        const inputCantidad = crearInput(`cantidad${posicion}`, 'Cantidad en Kg');
        
        inputCantidad.setAttribute('type', 'number');
        inputCantidad.setAttribute('min', '0.000');
        inputCantidad.setAttribute('step', '1');
        inputCantidad.classList.remove('w-100');
        inputCantidad.classList.add('w-25');
        inputCantidad.classList.add('ms-auto');
        
        selecPasta.classList.add('me-3');
        
        divInfo.innerHTML = '';
        divInfo.append(selecPasta);
        divInfo.append(inputCantidad);
    }

};

const pastaNueva = (elemento) => {

    if(elemento.id == 'nueva'){
        containerInfoPasta.innerHTML = '';
        containerInfoPasta.classList.add('form-group');
        const inputSap = crearInput('sap', 'Código SAP de la pasta');
        const inputDesc = crearInput('descripcion', 'Descripción');
        const selecTec = crearSelectorTecnologia('tecnologia');
        const inputCantidad = crearInput(`cantidad`, 'Cantidad en Kg');

        inputCantidad.setAttribute('type', 'number');
        inputCantidad.setAttribute('min', '0.000');
        inputCantidad.setAttribute('step', '1');
        inputCantidad.setAttribute('required', '');
        inputSap.classList.add('me-2');
        inputSap.setAttribute('required', '');
        inputDesc.classList.add('me-2');
        inputDesc.setAttribute('required', '');
        selecTec.classList.add('me-2');

        containerInfoPasta.append(inputSap);
        containerInfoPasta.append(inputDesc);
        containerInfoPasta.append(selecTec);
        containerInfoPasta.append(inputCantidad);
    }else{
        let posicion = elemento.id[elemento.id.length - 1];
        const divInfo = document.querySelector(`#infoPasta${posicion}`);
        const inputSap = crearInput(`sap${posicion}`, 'Código SAP de la pasta');
        const inputDesc = crearInput(`descripcion${posicion}`, 'Descripción');
        const selecTec = crearSelectorTecnologia(`tecnologia${posicion}`);
        const inputCantidad = crearInput(`cantidad${posicion}`, 'Cantidad en Kg');

        divInfo.innerHTML = '';

        inputCantidad.setAttribute('type', 'number');
        inputCantidad.setAttribute('min', '0.000');
        inputCantidad.setAttribute('step', '1');
        inputCantidad.setAttribute('required', '');

        inputSap.classList.add('me-2');
        inputSap.setAttribute('required', '');

        inputDesc.classList.add('me-2');
        inputDesc.setAttribute('required', '');
        
        selecTec.classList.add('me-2');

        divInfo.append(inputSap);
        divInfo.append(inputDesc);
        divInfo.append(selecTec);
        divInfo.append(inputCantidad);
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
    const selecPasta = crearSelectorPastas(`sap${cantidadPastas}`);
    const inputCantidad = crearInput(`cantidad${cantidadPastas}`, 'Cantidad en Kg');

    inputCantidad.setAttribute('type', 'number');
    inputCantidad.setAttribute('min', '0.000');
    inputCantidad.setAttribute('step', '1');
    inputCantidad.classList.add('ms-auto');
    inputCantidad.classList.remove('w-100');
    inputCantidad.classList.add('w-25');

    selecPasta.classList.add('me-3');

    existente.radio.setAttribute('onclick', 'pastaExistente(this)');
    existente.radio.setAttribute('value', 'existente');
    existente.radio.setAttribute('checked', '');

    divExistente.classList.add('form-check');
    divExistente.classList.add('mx-3');
    divExistente.classList.add('ms-auto');
    divExistente.classList.remove('align-self-center');
    divExistente.classList.remove('d-flex');
    divExistente.classList.remove('w-100');
    divExistente.append(existente.radio);
    divExistente.append(existente.lblRadio);

    nueva.radio.setAttribute('onclick', 'pastaNueva(this)');
    nueva.radio.setAttribute('value', 'nueva');
    
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

    divInfo.append(selecPasta);
    divInfo.append(inputCantidad);
    divInfo.classList.add('my-1');
    
    divPasta.classList.add('flex-column');
    divPasta.classList.add('form-group');
    divPasta.classList.add('my-3');
    divPasta.append(divRadios);
    divPasta.append(divInfo);
    
    container.append(divPasta);
};

const borrarRegistroPasta = (elemento) => {

    const posicion = elemento.id[elemento.id.length - 1];
    const divPasta = document.querySelector(`#divPasta${posicion}`);
    divPasta.innerHTML = '';
    divPasta.remove();

    for(let i = parseInt(posicion) + 1; i <= cantidadPastas; i++){
        let divId = `#divPasta${i}`;
        let div = document.querySelector(divId);
        for(let divElement of div.children){
            let nuevoIdDiv = divElement.id.replace(i, i-1);
            // console.log('id actual div', divElement.id)

            for(let element of divElement.children){
                let nuevoIdElement = element.id.replace(i, i-1);
                // console.log('id actual elemento', element.id);

                for(let subElement of element.children){
                    if(subElement === null){
                        continue;
                    }else{
                        let nuevoIdSub = subElement.id.replace(i, i-1);
                        // console.log('id actual del subelemento', subElement.id);
                        subElement.id = nuevoIdSub;
                        // console.log('nuevo id del subelemento', subElement.id);
                    }
                }

                element.id = nuevoIdElement;
                // console.log('nuevo id elemento', element.id);
            }

            divElement.id = nuevoIdDiv;
            // console.log('nuevo id div', divElement.id);
        }

        div.id = `divPasta${i-1}`
    }

    (cantidadPastas === 0) ? alert('Debe existir al menos una pasta') : cantidadPastas -= 1;
};