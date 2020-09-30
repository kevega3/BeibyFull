const nom = document.getElementById('validate');
const ndoc = document.getElementById('numerodoc');
const dir = document.getElementById('direccion');
const num = document.getElementById('contacto');


nom.addEventListener('keyup', e => {
    e.preventDefault();

    checkNombre();
});

ndoc.addEventListener('keyup', e => {
    e.preventDefault();

    checkNumerodoc();
});

dir.addEventListener('keyup', e => {
    e.preventDefault();

    checkDireccion();
});

num.addEventListener('keyup', e => {
    e.preventDefault();

    checkTelefono();
});

function check() {
    if (!checkNombre() || !checkNumerodoc() || !checkDireccion() || !checkTelefono()) {
        checkNombre();
        checkNumerodoc();
        checkDireccion();
        checkTelefono();
        
        Swal.fire({
            icon: 'error',
            title: '!Verifique los campos!'
        });
        return false;
        
    } else {
        Swal.fire({
            icon: 'success',
            title: '!Registro actializado con éxito!'
        });
    }
}

function checkNombre() {
    const nomValue = nom.value.trim();
    if (nomValue === '') {
        setErrorFor(nom, '¡Este campo es obligatorio!');
        return false;
    } else if (!valNombre(nomValue)) {
        setErrorFor(nom, '¡Nombre inválido!');
        return false;
    } else {
        setSuccessFor(nom);
        return true;
    }
}


function checkNumerodoc() {
    const ndocValue = ndoc.value.trim();
    if (ndocValue === '') {
        setErrorFor(ndoc, '¡Este campo es obligatorio!');
        return false;
    } else if (!valNumDoc(ndocValue)) {
        setErrorFor(ndoc, '¡Documento inválido!');
        return false;
    } else {
        setSuccessFor(ndoc);
        return true;
    }
}

function checkDireccion() {
    const dirValue = dir.value.trim();
    if (dirValue === '') {
        setErrorFor(dir, '¡Este campo es obligatorio!');
        return false;
    } else if (!valDir(dirValue)) {
        setErrorFor(dir, '¡Dirección inválida!');
        return false;
    } else {
        setSuccessFor(dir);
        return true;
    }
}

function checkTelefono() {
    const numValue = num.value.trim();
    if (numValue === '') {
        setErrorFor(num, '¡Este campo es obligatorio!');
        return false;
    } else if (!valNum(numValue)) {
        setErrorFor(num, '¡Teléfono inválido!');
        return false;
    } else {
        setSuccessFor(num);
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

function valNombre(nom) {
    return /^[a-zA-ZÀ-ÿ\s]{1,40}$/.test(nom);
}

function valNumDoc(ndoc) {
    return /^\d{7,10}$/.test(ndoc);
}

function valDir(dir) {
    return /^[0-9a-zA-ZÀ-ÿ\s.#-]{1,25}$/.test(dir);
}

function valNum(num) {
    return /^\d{7,10}$/.test(num);
}
