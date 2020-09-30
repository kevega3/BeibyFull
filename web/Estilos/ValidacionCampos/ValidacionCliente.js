const ndoc = document.getElementById('documento');
const nom = document.getElementById('nombre');
const ape = document.getElementById('apellido');
const corr = document.getElementById('correo');
const num = document.getElementById('telefono');
const dir = document.getElementById('direccion');

ndoc.addEventListener('keyup', e => {
    e.preventDefault();

    checkNumeroDoc();
});

nom.addEventListener('keyup', e => {
    e.preventDefault();

    checkNombre();
});

ape.addEventListener('keyup', e => {
    e.preventDefault();

    checkApellido();
});

corr.addEventListener('keyup', e => {
    e.preventDefault();

    checkCorreo();
});

num.addEventListener('keyup', e => {
    e.preventDefault();

    checkTelefono();
});

dir.addEventListener('keyup', e => {
    e.preventDefault();

    checkDireccion();
});

function check(){
    if (!checkNumeroDoc() || !checkNombre() || !checkApellido() || !checkCorreo() || !checkTelefono() || !checkDireccion()) {
        checkNumeroDoc();
        checkNombre();
        checkApellido();
        checkCorreo();
        checkTelefono();
        checkDireccion();
        
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


function checkNumeroDoc() {
    const ndocValue = ndoc.value.trim();
    if (ndocValue === '') {
        setErrorFor(ndoc, '¡Este campo es obligatorio');
        return false;
    } else if (!valNumDoc(ndocValue)) {
        setErrorFor(ndoc, '¡Documento inválido!');
        return false;
    } else {
        setSuccessFor(ndoc);
        return true;
    }
}

function checkNombre() {
    const nomValue = nom.value.trim();
    if (nomValue === '') {
        setErrorFor(nom, '¡Este campo es obligatorio');
        return false;
    } else if (!valNombre(nomValue)) {
        setErrorFor(nom, '¡Nombre inválido!');
        return false;
    } else {
        setSuccessFor(nom);
        return true;
    }
}

function checkApellido() {
    const apeValue = ape.value.trim();
    if (apeValue === '') {
        setErrorFor(ape, '¡Este campo es obligatorio');
        return false;
    } else if (!valApellido(apeValue)) {
        setErrorFor(ape, '¡Apellido inválido!');
        return false;
    } else {
        setSuccessFor(ape);
        return true;
    }
}

function checkCorreo() {
    const corrValue = corr.value.trim();
    if (corrValue === '') {
        setErrorFor(corr, '¡Este campo es obligatorio');
        return false;
    } else if (!valCorreo(corrValue)) {
        setErrorFor(corr, '¡Correo electrónico inválido!');
        return false;
    } else {
        setSuccessFor(corr);
        return true;
    }
}

function checkTelefono() {
    const numValue = num.value.trim();
    if (numValue === '') {
        setErrorFor(num, '¡Este campo es obligatorio');
        return false;
    } else if (!valTelefono(numValue)) {
        setErrorFor(num, '¡Teléfono inválido!');
        return false;
    } else {
        setSuccessFor(num);
        return true;
    }
}

function checkDireccion() {
    const dirValue = dir.value.trim();
    if (dirValue === '') {
        setErrorFor(dir, '¡Este campo es obligatorio');
        return false;
    } else if (!valDireccion(dirValue)) {
        setErrorFor(dir, '¡Dirección inválida!');
        return false;
    } else {
        setSuccessFor(dir);
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

function valNumDoc(ndoc) {
    return /^[0-9]{7,10}$/.test(ndoc);
}

function valNombre(nom) {
    return /^[a-zA-ZÀ-ÿ\s]{1,40}$/.test(nom);
}

function valApellido(ape) {
    return /^[a-zA-ZÀ-ÿ\s]{1,40}$/.test(ape);
}

function valCorreo(corr) {
    return /^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$/.test(corr);
}

function valTelefono(num) {
    return /^[0-9]{7,10}$/.test(num);
}

function valDireccion(dir) {
    return /^[0-9a-zA-ZÀ-ÿ\s.#-]{1,25}$/.test(dir);
}
