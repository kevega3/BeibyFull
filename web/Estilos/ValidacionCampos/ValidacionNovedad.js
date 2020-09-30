const codi = document.getElementById('codigo');
const descri = document.getElementById('descripcion');
const desti = document.getElementById('destino');


codi.addEventListener('keyup', e => {
    e.preventDefault();

    checkCodigo();
});

descri.addEventListener('keyup', e => {
    e.preventDefault();

    checkDescripcion();
});

desti.addEventListener('keyup', e => {
    e.preventDefault();

    checkDestino();
});

function check() {
    if (!checkCodigo() || !checkDescripcion() || !checkDestino()) {
        checkCodigo();
        checkDescripcion();
        checkDestino();
        
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
    const codiValue = codi.value.trim();
    if (codiValue === '') {
        setErrorFor(codi, '¡Este campo es obligatorio!');
        return false;
    } else if (!valCodigo(codiValue)) {
        setErrorFor(codi, '¡Código inválido!');
        return false;
    } else {
        setSuccessFor(codi);
        return true;
    }
}


function checkDescripcion() {
    const descriValue = descri.value.trim();
    if (descriValue === '') {
        setErrorFor(descri, '¡Este campo es obligatorio!');
        return false;
    } else if (!valDescripcion(descriValue)) {
        setErrorFor(descri, '¡Descripción inválida!');
        return false;
    } else {
        setSuccessFor(descri);
        return true;
    }
}

function checkDestino() {
    const destiValue = desti.value.trim();
    if (destiValue === '') {
        setErrorFor(desti, '¡Este campo es obligatorio!');
        return false;
    } else if (!valDestino(destiValue)) {
        setErrorFor(desti, '¡Destino inválido!');
        return false;
    } else {
        setSuccessFor(desti);
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

function valCodigo(codi) {
    return /^[0-9]{6,12}$/.test(codi);
}

function valDescripcion(descri) {
    return /^[a-zA-ZÀ-ÿ\s]{5,50}$/.test(descri);
}

function valDestino(desti) {
    return /^[0-9a-zA-ZÀ-ÿ\s]{1,25}$/.test(desti);
}
