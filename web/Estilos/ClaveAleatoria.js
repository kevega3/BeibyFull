function generar(){
    var Caracteres ="0123456789";
    var tam = 8;
    var pass="";
    for (var i = 0; i < tam; i++) {
        var rand = Math.floor(Math.random()*Caracteres.length);
        pass += Caracteres.substring(rand,rand+1);
        
    }
    document.getElementById("clave").value=pass;
} 
