const selector = document.querySelector('#sapColor');
const containerColor = document.querySelector('#divColor');

const crearOpcion = (valor) => {
    const option = document.createElement('option');

    option.value = valor;
    option.text = valor;

    return option;
};

const crearSelectorFormula = (formulas) =>{
    const select = document.createElement('select');
    const selectedOption = crearOpcion('Seleccione la Fórmula del Color');

    for(let formula of formulas){
        let opcion = crearOpcion(formula);
        select.add(opcion);
    }
    
    select.classList.add('form-select');
    select.classList.add('my-3');
    select.ariaLabel = 'Seleccion de fórmula';
    select.id = 'bom';
    select.setAttribute('name', 'bom');
    select.add(selectedOption, 0);
    selectedOption.selected = true;
    
    return select;
};

const crearBtnFormula = () => {
    const boton = document.createElement('a');
    
    boton.classList.add('btn');
    boton.classList.add('btn-opcion');
    boton.classList.add('bg-principal');
    boton.classList.add('w-25');
    boton.classList.add('ms-auto');
    boton.classList.add('me-auto');
    boton.id = 'nuevaFormula';
    boton.textContent = 'Nueva Fórmula';
    boton.href = '/formula/nueva-formula';
    
    return boton;
};

const obtenerSapColor = () => {
    const selectorFormula = document.querySelector('#bom');
    const parrafo = document.querySelector('#colorInfo');
    const divBtnColor = document.querySelector('#crearColor');
    const btnFormula = document.querySelector('#nuevaFormula');
    let valor = selector.value;

    if(btnFormula != undefined) btnFormula.remove();
    
    if(valor == 'Seleccione un Color existente'){
        selectorFormula.remove();
        parrafo.textContent = 'Sí no encuentra el color, regístrelo como nuevo color';


    } else{
        if(selectorFormula != undefined) selectorFormula.remove();
        
        const idColorInput = document.querySelector('#idColor');
        idColorInput.value = formulasColores[valor].idColor;
        const formula = crearSelectorFormula(formulasColores[valor].formulas);
        containerColor.append(formula);
        parrafo.textContent = 'Sí no encuentra el color o la fórmula, regístrelo';

        const btnFormula = crearBtnFormula();
        divBtnColor.append(btnFormula);
        divBtnColor.classList.remove('justify-content-center');
        divBtnColor.classList.add('justify-content-evenly');

    }
}