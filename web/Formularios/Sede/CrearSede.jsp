<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css">
        <link rel="stylesheet" href="Estilos/ValidacionCampos/ValidacionStyles.css" type="text/css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
        <link href="Estilos/CSS/EstiloSede.css" rel="stylesheet" type="text/css"/>
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
            <h2>Registrar Sede</h2>
        </div>
        <div class=" card " >
            <form id="registro" name="frmdatos"  action="ControladorSede"   >
                <div class=" d-flex  form-control ">
                    <div class="form-control">
                        <label for="validate">Nombre:</label>
                        <input id="validate" placeholder="Nombre" type="text" name="txtnombre">
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten letras, espacios y acentos."></i>
                        <small>¡Error!</small>
                    </div>
                </div>
                <div class=" d-flex parte2 form-control ">
                    <div class="form-control">
                        <label for="direccion">Dirección:</label>
                        <input id="direccion" placeholder="Dirección" type="text" name="txtdireccion">
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten letras, espacios y acentos."></i>
                        <small>¡Error!</small>
                    </div>
                </div>
                <div class=" d-flex parte3 form-control ">
                    <div class="form-control">
                        <label for="barrio">Barrio:</label>
                        <input id="barrio" placeholder="Barrio" type="text" name="txtbarrio">
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten letras, números, espacios y acentos."></i>
                        <small>¡Error!</small>
                    </div>
                </div>
                <div class=" d-flex parte4 form-control ">
                    <input id="cancelar" class="btn btn-danger btn-lg " type="reset" value="Reiniciar">
                    <div>
                        <button id="btncrear" class="btn btn-primary btn-lg" onclick="return check();" type="submit" name="accion" value="Agregar">Agregar</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <script src="Estilos/ValidacionCampos/ValidacionSede.js" type="text/javascript"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
</body>
</html>
