const codigo = document.getElementById('codigo');
const nombre = document.getElementById('nombre');
const cantidad = document.getElementById('cantidad');
const stock = document.getElementById('stock');
const sede = document.getElementById('sede');

codigo.addEventListener('keyup', e => {
    e.preventDefault();

    checkCodigo();
});

cantidad.addEventListener('keyup', e => {
    e.preventDefault();

    checkCantidad();
});

sede.addEventListener('change', e => {
    e.preventDefault();

    checkSede();
});

function check() {
    if (!checkCodigo() || !checkCantidad() || !checkSede()) {
        checkCodigo();
        checkCantidad();
        checkSede();

        Swal.fire({
            icon: 'error',
            title: '!Verifique los campos!'
        });
        return false;

    } else {
        Swal.fire({
            icon: 'success',
            title: '!Realizado con éxito!'
        });
    }
}

function checkCodigo() {
    const codigoValue = codigo.value.trim();
    if (codigoValue === '') {
        setErrorFor(codigo, '¡Este campo es obligatorio!');
        return false;
    } else if (!valCodigo(codigoValue)) {
        setErrorFor(codigo, '¡Código inválido!');
        return false;
    } else {
        setSuccessFor(codigo);
        return true;
    }
}

function checkCantidad() {
    const cantidadValue = cantidad.value.trim();
    if (cantidadValue === '') {
        setErrorFor(cantidad, '¡Este campo es obligatorio!');
        return false;
    } else if (!valCantidad(cantidadValue)) {
        setErrorFor(cantidad, '¡Cantidad inválida!');
        return false;
    } else {
        setSuccessFor(cantidad);
        return true;
    }
}

function checkSede() {
    const sedeValue = sede.value;
    if (sedeValue === '-Seleccione una opción-') {
        setErrorFor(sede, '¡Seleccione una sede!');
        return false;
    } else {
        setSuccessFor(sede);
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

function valCodigo(codigo) {
    return /^[0-9]{6,12}$/.test(codigo);
}

function valCantidad(cantidad) {
    return /^[0-9]{1,4}$/.test(cantidad);
}
