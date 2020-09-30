const nom = document.getElementById('validate');

nom.addEventListener('keyup', e => {
    e.preventDefault();

    checkNombre();
});

function check(){
    if (!checkNombre()) {
        checkNombre();
        
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
