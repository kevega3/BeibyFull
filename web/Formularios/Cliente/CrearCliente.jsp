<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css">
        <link href="Estilos/ValidacionCampos/ValidacionStyles.css" rel="stylesheet" type="text/css"/>
        <link href="Estilos/CSS/EstiloCliente.css" rel="stylesheet" type="text/css"/>
        <link href="Estilos/CSS/scrollbarmostrar.css" rel="stylesheet" type="text/css"/>
                <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

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
            <h2>Registrar Cliente</h2>
        </div>
        <div class=" card clientes" >
            <form id="registrar" name="frmdatos"  action="ControladorClient" method="get" >
                <div class=" d-flex parte1 form-control ">
                    <div class=" form-control">
                        <label for="documento">Número de documento:</label><br>
                        <input id="documento" type="number" name="txtnumerodocumento" placeholder="1012022020">
                        <i class=" fas fa-search-plus"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten números, entre 7 y 10 carácteres."></i>
                        <small>¡Error!</small>
                    </div>
                    <div class="form-control ">
                        <label for="nombre">Nombres:</label><br>
                        <input id="nombre"  type="text" name="txtnombres" placeholder="John Doe">
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten letras, espacios y acentos."></i>
                        <small>¡Error!</small>
                    </div>
                </div>
                <div class="d-flex parte2 form-control">
                    <div class="form-control">
                        <label for="apellido">Apellidos:</label><br>
                        <input id="apellido"  type="text" name="txtapellidos" placeholder="Ramírez">
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten letras, espacios y acentos."></i>
                        <small>¡Error!</small>
                    </div>
                    <div class="form-control">
                        <label for="correo">Correo electrónico:</label><br>
                        <input id="correo" type="text" name="txtcorreoelectronico" placeholder="example@organization.com">
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que el correo debe llevar un @ y un ( . ), precedido por un nombre de dominio."></i>
                        <small>¡Error!</small>
                    </div>
                </div>
                <div class="d-flex parte3 form-control">
                    <div class="form-control">
                        <label for="telefono">Teléfono:</label><br>
                        <input id="telefono" type="number" name="txttelefono" placeholder="3133215760 - 3024227">
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten números, entre 7 y 13 digitos."></i>
                        <small>¡Error!</small>
                    </div>
                    <div class="form-control">
                        <label for="direccion">Dirección:</label><br>
                        <input id="direccion"  type="text" name="txtdireccion" placeholder="San Martin Calle 109 a # 109 - 46 ">
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que se admiten letras, espacios, números, guiones y numeral."></i>
                        <small>¡Error!</small>
                    </div>
                </div>
                <div class="form-control parte4 d-flex ">
                    <input id="cancelar" class="btn btn-danger" type="reset" value="Reiniciar">
                    <div>
                        <button id="btn_registro" class="btn btn-success " onclick="return check();" type="submit" name="accion" value="Agregar">Agregar</button> 
                    </div>
                </div>
            </form>
        </div>
        <script src="Estilos/ValidacionCampos/ValidacionCliente.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    </body>
</html>
