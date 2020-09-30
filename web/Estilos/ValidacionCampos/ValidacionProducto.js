const nserie = document.getElementById('nserie');
const nombre = document.getElementById('validate');
const valor = document.getElementById('valor');
const exis = document.getElementById('cexistencias');
const tipoprod = document.getElementById('tipoprod');
const marca = document.getElementById('marca');


nserie.addEventListener('keyup', e => {
    e.preventDefault();

    checkNSerie();
});

nombre.addEventListener('keyup', e => {
    e.preventDefault();

    checkNombre();
});

valor.addEventListener('keyup', e => {
    e.preventDefault();

    checkValor();
});

exis.addEventListener('keyup', e => {
    e.preventDefault();

    checkExistencias();
});

tipoprod.addEventListener('change', e => {
    e.preventDefault();

    checkTipoProducto();
});

marca.addEventListener('change', e => {
    e.preventDefault();

    checkMarca();
});

function check() {
    if (!checkNSerie() || !checkNombre() || !checkValor() || !checkExistencias() || !checkTipoProducto() || !checkMarca()) {
        checkNSerie();
        checkNombre();
        checkValor();
        checkExistencias();
        checkTipoProducto();
        checkMarca();
        
        Swal.fire({
            icon: 'error',
            title: '!Verifique los campos!'
        });
        return false;
        
    } else {
        Swal.fire({
            icon: 'success',
            title: '!Registro exitoso!'
        });
    }
}

function checkNSerie() {
    const nserieValue = nserie.value.trim();
    if (nserieValue === '') {
        setErrorFor(nserie, '¡Este campo es obligatorio!');
        return false;
    } else if (!valNSerie(nserieValue)) {
        setErrorFor(nserie, '¡Número de serie inválido!');
        return false;
    } else {
        setSuccessFor(nserie);
        return true;
    }
}

function checkNombre() {
    const nombreValue = nombre.value.trim();
    if (nombreValue === '') {
        setErrorFor(nombre, '¡Este campo es obligatorio!');
        return false;
    } else if (!valNombre(nombreValue)) {
        setErrorFor(nombre, '¡Nombre inválido!');
        return false;
    } else {
        setSuccessFor(nombre);
        return true;
    }
}

function checkValor() {
    const valorValue = valor.value.trim();
    if (valorValue === '') {
        setErrorFor(valor, '¡Este campo es obligatorio!');
        return false;
    } else if (!valValor(valorValue)) {
        setErrorFor(valor, '¡Valor inválido!');
        return false;
    } else {
        setSuccessFor(valor);
        return true;
    }
}

function checkExistencias() {
    const exisValue = exis.value.trim();
    if (exisValue === '') {
        setErrorFor(exis, '¡Este campo es obligatorio!');
        return false;
    } else if (!valExistencias(exisValue)) {
        setErrorFor(exis, '¡Existencia inválida!');
        return false;
    } else {
        setSuccessFor(exis);
        return true;
    }
}

function checkTipoProducto() {
    const tipoprodValue = tipoprod.value;
    if (tipoprodValue === '-Seleccione una opción-') {
        setErrorFor(tipoprod, '¡Seleccione un tipo de producto!');
        return false;
    } else {
        setSuccessFor(tipoprod);
        return true;
    }
}

function checkMarca() {
    const marcaValue = marca.value;
    if (marcaValue === '-Seleccione una opción-') {
        setErrorFor(marca, '¡Seleccione una marca!');
        return false;
    } else {
        setSuccessFor(marca);
        return true;
    }
}

function setErrorFor(input, message) {
    const formControl = input.parentElement;
    const small = formControl.querySelector('small');
    formControl.className = 'form-control error';
    small.innerText = message;
}

function setSuccessFor(input) {
    const formControl = input.parentElement;
    formControl.className = 'form-control success';
}

function valNSerie(nserie) {
    return /^[0-9]{6,10}$/.test(nserie);
}

function valNombre(nombre) {
    return /^[0-9a-zA-ZÀ-ÿ\s]{4,40}$/.test(nombre);
}

function valValor(valor) {
    return /^[0-9.]{1,6}$/.test(valor);
}

function valExistencias(exis) {
    return /^[0-9.]{1,25}$/.test(exis);
}
