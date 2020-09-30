const ove = document.getElementById('codproveedor');
const sed = document.getElementById('codsede');
const pro = document.getElementById('codproducto');
const can = document.getElementById('cantidad');

ove.addEventListener('keyup', e => {
    e.preventDefault();

    checkProveedor();
});

sed.addEventListener('keyup', e => {
    e.preventDefault();

    checkSede();
});

pro.addEventListener('keyup', e => {
    e.preventDefault();

    checkProducto();
});

can.addEventListener('keyup', e => {
    e.preventDefault();

    checkCantidad();
});

function check() {
    if (!checkProveedor() || !checkSede() || !checkProducto() || !checkCantidad()) {
        checkProveedor();
        checkSede();
        checkProducto();
        checkCantidad();

        Swal.fire({
            icon: 'error',
            title: '!Verifique los campos!'
        });
        return false;
    }
}

function gcomp() {
    var fil = document.getElementById('table').getElementsByTagName('tbody')[0].getElementsByTagName('tr').length;
    if (fil === 0){
        Swal.fire({
            icon: 'error',
            title: '!No hay productos en la lista!'
        });
        return false;
    } else {
        Swal.fire({
            icon: 'success',
            title: '!Realizado con éxito!'
        });
        return true;
    }
}


function checkProveedor() {
    const oveValue = ove.value.trim();
    if (oveValue === '') {
        setErrorFor(ove, '¡Este campo es obligatorio');
        return false;
    } else if (!valProveedor(oveValue)) {
        setErrorFor(ove, '¡Identificación inválida!.');
        return false;
    } else {
        setSuccessFor(ove);
        return true;
    }
}

function checkSede() {
    const sedValue = sed.value.trim();
    if (sedValue === '') {
        setErrorFor(sed, '¡Este campo es obligatorio');
        return false;
    } else if (!valSede(sedValue)) {
        setErrorFor(sed, '¡ID sede inválido!.');
        return false;
    } else {
        setSuccessFor(sed);
        return true;
    }
}

function checkProducto() {
    const proValue = pro.value.trim();
    if (proValue === '') {
        setErrorFor(pro, '¡Este campo es obligatorio');
        return false;
    } else if (!valProducto(proValue)) {
        setErrorFor(pro, '¡Código inválido!.');
        return false;
    } else {
        setSuccessFor(pro);
        return true;
    }
}

function checkCantidad() {
    const canValue = can.value.trim();
    if (canValue === '') {
        setErrorFor(can, '¡Este campo es obligatorio');
        return false;
    } else if (!valCantidad(canValue)) {
        setErrorFor(can, '¡Cantidad inválida!.');
        return false;
    } else {
        setSuccessFor(can);
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

function valProveedor(ove) {
    return /^[0-9]{7,10}$/.test(ove);
}

function valSede(sed) {
    return /^[0-9]{1,1}$/.test(sed);
}

function valProducto(pro) {
    return /^[0-9]{6,10}$/.test(pro);
}

function valCantidad(can) {
    return /^[0-9]{1,5}$/.test(can);
}
