const nserie = document.getElementById('nserie');
const nombre = document.getElementById('validate');
const valor = document.getElementById('valor');
const exis = document.getElementById('cexistencias');


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

function check() {
    if (!checkNSerie() || !checkNombre() || !checkValor() || !checkExistencias()) {
        checkNSerie();
        checkNombre();
        checkValor();
        checkExistencias();
        
        Swal.fire({
            icon: 'error',
            title: '!Verifique los campos!'
        });
        return false;
        
    } else {
        Swal.fire({
            icon: 'success',
            title: '!Registro actualizado exitosamente!'
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
    return /^[0-9.]{1,25}$/.test(valor);
}

function valExistencias(exis) {
    return /^[0-9.]{1,25}$/.test(exis);
}

