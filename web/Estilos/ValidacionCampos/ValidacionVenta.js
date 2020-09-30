const emp = document.getElementById('codempleado');
const cli = document.getElementById('codcliente');
const pro = document.getElementById('codproducto');
const can = document.getElementById('cantidad');

emp.addEventListener('keyup', e => {
    e.preventDefault();

    checkEmpleado();
});

cli.addEventListener('keyup', e => {
    e.preventDefault();

    checkCliente();
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
    if (!checkEmpleado() || !checkCliente() || !checkProducto() || !checkCantidad()) {
        checkEmpleado();
        checkCliente();
        checkProducto();
        checkCantidad();

        Swal.fire({
            icon: 'error',
            title: '!Verifique los campos!'
        });
        return false;

    }
}

function gvent() {
    var fil = document.getElementById('table').getElementsByTagName('tbody')[0].getElementsByTagName('tr').length;
    if (fil === 0) {
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

function checkEmpleado() {
    const empValue = emp.value.trim();
    if (empValue === '') {
        setErrorFor(emp, '¡Este campo es obligatorio');
        return false;
    } else if (!valEmpleado(empValue)) {
        setErrorFor(emp, '¡Documento inválido!.');
        return false;
    } else {
        setSuccessFor(emp);
        return true;
    }
}

function checkCliente() {
    const cliValue = cli.value.trim();
    if (cliValue === '') {
        setErrorFor(cli, '¡Este campo es obligatorio');
        return false;
    } else if (!valCliente(cliValue)) {
        setErrorFor(cli, '¡Documento inválido!.');
        return false;
    } else {
        setSuccessFor(cli);
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

function checkCantidad( ) {
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

function valEmpleado(emp) {
    return /^[0-9]{7,10}$/.test(emp);
}

function valCliente(cli) {
    return /^[0-9]{7,10}$/.test(cli);
}

function valProducto(pro) {
    return /^[0-9]{6,10}$/.test(pro);
}

function valCantidad(can) {
    return /^[0-9]{1,4}$/.test(can);
}
