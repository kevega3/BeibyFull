<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css">
        <link href="Estilos/ValidacionCampos/ValidacionStyles.css" rel="stylesheet" type="text/css"/>
        <link href="Estilos/CSS/EstiloTipoPro.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            if (request.getAttribute("duplicado") != null) {
        %>
        <script>
            Swal.fire({
                icon: 'error',
                title: '¡DATOS YA EXISTENTES!'
            });
        </script>
        <%
            }
        %>
        <div class="card-header" >
            <h2>Registrar Tipo de Producto</h2>
        </div>
        <div class="card" >
            <form id="registrar" name="frmdatos"  action="ControladorTipoProduct" method="get">
                <div class=" d-flex parte1 form-control ">
                    <div class="form-control">
                        <label for="tipoprod">Tipo de producto:</label><br>
                        <input id="tipoprod" type="text" name="txttipoproducto" placeholder="Ej: Pañales ">
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten letras, acentos, espacios y números."></i>
                        <small>¡Error!</small>
                    </div>
                </div>
                <div class=" d-flex parte2 form-control ">
                    <input id="cancelar" class="btn btn-danger btn-lg" type="reset" value="Reiniciar">
                    <div>
                        <button id="btn_registro" class="btn btn-primary btn-lg" onclick="return check();" type="submit" name="accion" value="Agregar" >Agregar</button>
                    </div>
                </div>
            </form>
        </div>
        <script src="Estilos/ValidacionCampos/ValidacionTipoProducto.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    </body>
</html>
