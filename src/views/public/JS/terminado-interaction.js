const selector = document.querySelector('#sapColor');
const containerColor = document.querySelector('#divColor')
const selectorFormula = document.querySelector('#bom');

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
        console.log(formula);
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

const obtenerSapColor = () => {
    let valor = selector.value;
    
    if(valor == 'Seleccione un Color existente'){
        console.log('Color no seleccionado');
    } else{
        if(selectorFormula != undefined){
            selectorFormula.remove();
        }
        
        const formula = crearSelectorFormula(formulasColores[valor]);
        containerColor.append(formula);
    }
}