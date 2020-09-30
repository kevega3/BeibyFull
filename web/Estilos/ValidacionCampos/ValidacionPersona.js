const nom = document.getElementById('validate');
const ape = document.getElementById('apellido');
const tipodoc = document.getElementById('tipodoc');
const numdoc = document.getElementById('numerodoc');
const email = document.getElementById('email');
const numcon = document.getElementById('contacto');
const direc = document.getElementById('direc');
const rol = document.getElementById('rol');


nom.addEventListener('keyup', e => {
    e.preventDefault();

    checkNombre();
});

ape.addEventListener('keyup', e => {
    e.preventDefault();

    checkApellido();
});

tipodoc.addEventListener('change', e => {
    e.preventDefault();

    checkTipodoc();
});

numdoc.addEventListener('keyup', e => {
    e.preventDefault();

    checkNumerodoc();
});

email.addEventListener('keyup', e => {
    e.preventDefault();

    checkEmail();
});

numcon.addEventListener('keyup', e => {
    e.preventDefault();

    checkContacto();
});

direc.addEventListener('keyup', e => {
    e.preventDefault();

    checkDireccion();
});

rol.addEventListener('change', e => {
    e.preventDefault();

    checkRol();
});

function check() {
    if (!checkNombre() || !checkApellido() || !checkTipodoc() || !checkNumerodoc() || !checkEmail() || !checkContacto() || !checkDireccion() || !checkRol()) {
        checkNombre();
        checkApellido();
        checkTipodoc();
        checkNumerodoc();
        checkEmail();
        checkContacto();
        checkDireccion();
        checkRol();
        generar();
        Swal.fire({
            icon: 'error',
            title: '!Verifique los campos!'
        });
        return false;

    } else {

        generar();


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

function checkApellido() {
    const apeValue = ape.value.trim();
    if (apeValue === '') {
        setErrorFor(ape, '¡Este campo es obligatorio!');
        return false;
    } else if (!valApellido(apeValue)) {
        setErrorFor(ape, '¡Apellido inválido!');
        return false;
    } else {
        setSuccessFor(ape);
        return true;
    }
}

function checkTipodoc() {
    const tipodocValue = tipodoc.value.trim();
    if (tipodocValue === '-Seleccione una opción-') {
        setErrorFor(tipodoc, '¡Seleccione un tipo de documento!');
        return false;
    } else {
        setSuccessFor(tipodoc);
        return true;
    }
}

function checkNumerodoc() {
    const numdocValue = numdoc.value.trim();
    if (numdocValue === '') {
        setErrorFor(numdoc, '¡Este campo es obligatorio!');
        return false;
    } else if (!valNumdoc(numdocValue)) {
        setErrorFor(numdoc, '¡Documento inválido!');
        return false;
    } else {
        setSuccessFor(numdoc);
        return true;
    }
}

function checkEmail() {
    const emailValue = email.value.trim();
    if (emailValue === '') {
        setErrorFor(email, '¡Este campo es obligatorio!');
        return false;
    } else if (!valEmail(emailValue)) {
        setErrorFor(email, '¡Correo inválido!');
        return false;
    } else {
        setSuccessFor(email);
        return true;
    }
}

function checkContacto() {
    const numconValue = numcon.value.trim();
    if (numconValue === '') {
        setErrorFor(numcon, '¡Este campo es obligatorio!');
        return false;
    } else if (!valContacto(numconValue)) {
        setErrorFor(numcon, '¡Teléfono inválido!');
        return false;
    } else {
        setSuccessFor(numcon);
        return true;
    }
}

function checkDireccion() {
    const direcValue = direc.value.trim();
    if (direcValue === '') {
        setErrorFor(direc, '¡Este campo es obligatorio!');
        return false;
    } else if (!valDireccion(direcValue)) {
        setErrorFor(direc, '¡Dirección inválida!');
        return false;
    } else {
        setSuccessFor(direc);
        return true;
    }
}

function checkRol() {
    const rolValue = rol.value;
    if (rolValue === '-Seleccione una opción-') {
        setErrorFor(rol, '¡Seleccione un rol!');
        return false;
    } else {
        setSuccessFor(rol);
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

function valApellido(ape) {
    return /^[a-zA-ZÀ-ÿ\s]{1,40}$/.test(ape);
}

function valNumdoc(numdoc) {
    return /^[0-9]{7,10}$/.test(numdoc);
}

function valEmail(email) {
    return /^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$/.test(email);
}

function valContacto(numcon) {
    return /^[0-9]{7,10}$/.test(numcon);
}

function valDireccion(direc) {
    return /^[0-9a-zA-ZÀ-ÿ\s.#-]{1,25}$/.test(direc);
}

function generar() {
    var Caracteres = "0123456789";
    var tam = 8;
    var pass = "";
    for (var i = 0; i < tam; i++) {
        var rand = Math.floor(Math.random() * Caracteres.length);
        pass += Caracteres.substring(rand, rand + 1);
    }
    document.getElementById("clave").value = pass;
}
