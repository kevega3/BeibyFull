<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css">
        <link rel="stylesheet" href="Estilos/ValidacionCampos/ValidacionStyles.css" type="text/css">
        <link href="Estilos/CSS/EstiloProveedor.css" rel="stylesheet" type="text/css"/>
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
        <div class="card-header">
            <h2>Registrar proveedor</h2>
        </div>       
        <div class="card">
            <form id="registroProveedor" class="form" name="frmdatos" action="ControladorProveedor" method="get">
                <div class="d-flex parte1 form-control" style="height: 160px;">
                    <div class="form-control">
                        <label for="validate">Nombre:</label><br>
                        <input id="validate" placeholder="Proveedor" type="text" name="txtnombre" >
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten letras, espacios y acentos."></i>
                        <small>¡Error!</small>
                    </div>
                    <div class="form-control">
                        <label for="direccion" >Dirección:</label><br>
                        <input id="direccion" placeholder="San Francisco" type="text" name="txtdireccion" >
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que se admiten letras, espacios, números, guiones y numeral."></i>
                        <small>¡Error!</small>
                    </div>
                    <div class="form-control">
                        <label for="contacto" >Número de contacto:</label><br>
                        <input id="contacto" placeholder="3194756222" type="number" name="txtnumerocontacto" >
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten números, entre 7 y 10 carácteres."></i>
                        <small>¡Error!</small>
                    </div>
                </div>
                <div class="d-flex parte2 form-control" style="height: 160px;">
                    <div class="form-control">
                        <label for="tipodoc">Tipo de documento:</label><br>
                        <select id="tipodoc" name="id_tipodocumento" >
                            <option value="0">-Seleccione una opción-</option>
                            <option value="12">Número de Identificación Tributario</option>
                        </select>
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Debe seleccionar un tipo de documento."></i>
                        <small>¡Error!</small>
                    </div>
                    <div class="form-control">
                        <label for="numerodoc">Número de documento:</label><br>
                        <input id="numerodoc" placeholder="1999729534" type="number" name="txtnumerodoc" >
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten números, entre 7 y 10 carácteres."></i>
                        <small>¡Error!</small>
                    </div>
                </div>
                <div class="form-control">
                    <input id="cancelar" class="btn btn-danger btn-lg" type="reset" value="Reiniciar">
                    <div>
                        <button id="btncrear" class="btn btn-primary btn-lg" onclick="return check();" type="submit" name="accion" value="Agregar"> Agregar</button>
                    </div>
                </div>
            </form>
        </div>
        <script src="Estilos/ValidacionCampos/ValidacionProveedor.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
        <script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
