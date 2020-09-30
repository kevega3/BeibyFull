const pro = document.getElementById('tipoprod');

pro.addEventListener('keyup', e => {
    e.preventDefault();

    checkTipoProd();
});

function check(){
    if (!checkTipoProd()) {
        checkTipoProd();
        
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

function checkTipoProd() {
    const proValue = pro.value.trim();
    if (proValue === '') {
        setErrorFor(pro, '¡Este campo es obligatorio');
        return false;
    } else if (!valTipoProd(proValue)) {
        setErrorFor(pro, '¡Tipo de Producto inválido!');
        return false;
    } else {
        setSuccessFor(pro);
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

function valTipoProd(pro) {
    return /^[a-zA-ZÀ-ÿ\s]{1,40}$/.test(pro);
}
