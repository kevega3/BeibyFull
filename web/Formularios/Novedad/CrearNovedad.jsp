<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>                      
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
        <link href="Estilos/ValidacionCampos/ValidacionStyles.css" rel="stylesheet" type="text/css"/>
        <link href="Estilos/CSS/EstiloNovedad.css" rel="stylesheet" type="text/css"/>
        <link href="Estilos/CSS/scrollbarmostrar.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <div class="card-header" >
            <h2>Registrar Novedad</h2>
        </div>
        <div class="card" >
            <form id="registro" action="ControladorNovedad" method="get">
                <div class="form-control col-6 ">
                    <label>Fecha:</label>
                    <input readonly="true" name="txtfecha" type="date" id="fechaActual">                   
                </div>
                <div class="form-control d-flex parte1" >
                    <div class="form-control">
                        <label>Destino:</label><br>
                        <input id="destino" placeholder="Destino" type="text" name="txtdestino">
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten letras, números, espacios y acentos."></i>
                        <small>¡Error!</small>
                    </div>
                    <div class="form-control">
                        <label>Descripción:</label><br>
                        <input id="descripcion" placeholder="Descripción" type="text" name="txtdescripcion" >
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten letras, espacios y acentos."></i>
                        <small>¡Error!</small>
                    </div>
                </div>
                <div class="form-control d-flex parte2" >
                    <div class="form-control " >
                        <label for="">Código producto:</label>
                        <input id="codigo" type="text" name="txtcodigoproducto" placeholder="Código" value="${pro.getNserie()}">
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten números, entre 6 y 12 carácteres."></i>
                        <small>¡Error!</small>
                    </div>
                    <div class="form-control col-5" >
                        <button type="submit" name="accion" value="BuscarP" class="btn btn-outline-info"><span class="fas fa-search" ></span></button>
                    </div> 
                </div>
                <div class="form-control d-flex parte3" >
                    <div class="form-control  "> 
                        <input id="cantidad" type="number" name="txtcantidad" value="1">
                        <i class="fas fa-check-circle"></i>
                    </div>
                    <div class="form-control  ">
                        <input readonly="true" type="text" name="Stock" placeholder="Stock" value=" ${pro.getCantiadad()}" >
                    </div>
                </div>
                <div class="form-control d-flex parte4" >
                    <button title="Buscar Producto" id="btncrear" class="btn btn-primary btn-lg " onclick="return check();" type="submit" name="accion" value="Agregar">Agregar</button>
                </div>
            </form>
        </div>
        <script>
            window.onload = function () {
                var fecha = new Date(); //Fecha actual
                var mes = fecha.getMonth() + 1; //obteniendo mes
                var dia = fecha.getDate(); //obteniendo dia
                var ano = fecha.getFullYear(); //obteniendo año
                if (dia < 10)
                    dia = '0' + dia; //agrega cero si el menor de 10
                if (mes < 10)
                    mes = '0' + mes; //agrega cero si el menor de 10
                document.getElementById('fechaActual').value = ano + "-" + mes + "-" + dia;
            };
        </script>
        <script src="Estilos/ValidacionCampos/ValidacionNovedad.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
