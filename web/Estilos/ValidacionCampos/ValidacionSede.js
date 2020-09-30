const nomb = document.getElementById('validate');
const direc = document.getElementById('direccion');
const barr = document.getElementById('barrio');


nomb.addEventListener('keyup', e => {
    e.preventDefault();

    checkNombre();
});

direc.addEventListener('keyup', e => {
    e.preventDefault();

    checkDireccion();
});

barr.addEventListener('keyup', e => {
    e.preventDefault();

    checkBarrio();
});

function check() {
    if (!checkNombre() || !checkDireccion() || !checkBarrio()) {
        checkNombre();
        checkDireccion();
        checkBarrio();
        
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

function checkNombre() {
    const nomValue = nomb.value.trim();
    if (nomValue === '') {
        setErrorFor(nomb, '¡Este campo es obligatorio!');
        return false;
    } else if (!valNombre(nomValue)) {
        setErrorFor(nomb, '¡Nombre inválido!');
        return false;
    } else {
        setSuccessFor(nomb);
        return true;
    }
}

function checkDireccion() {
    const dirValue = direc.value.trim();
    if (dirValue === '') {
        setErrorFor(direc, '¡Este campo es obligatorio!');
        return false;
    } else if (!valDireccion(dirValue)) {
        setErrorFor(direc, '¡Dirección inválida!');
        return false;
    } else {
        setSuccessFor(direc);
        return true;
    }
}

function checkBarrio() {
    const barrValue = barr.value.trim();
    if (barrValue === '') {
        setErrorFor(barr, '¡Este campo es obligatorio!');
        return false;
    } else if (!valBarrio(barrValue)) {
        setErrorFor(barr, '¡Barrio inválido!');
        return false;
    } else {
        setSuccessFor(barr);
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

function valNombre(nomb) {
    return /^[a-zA-ZÀ-ÿ\s]{1,40}$/.test(nomb);
}

function valDireccion(direc) {
    return /^[0-9a-zA-ZÀ-ÿ\s.#-]{1,25}$/.test(direc);
}

function valBarrio(barr) {
    return /^[0-9a-zA-ZÀ-ÿ\s]{1,40}$/.test(barr);
}
