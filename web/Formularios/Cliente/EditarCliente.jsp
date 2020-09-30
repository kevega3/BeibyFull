<%@page import="Modelo.Cliente"%>
<%@page import="ModeloDAO.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css">
        <link href="Estilos/ValidacionCampos/ValidacionStyles.css" rel="stylesheet" type="text/css"/>
        <link href="Estilos/CSS/scrollbarmostrar.css" rel="stylesheet" type="text/css"/>
        <link href="Estilos/CSS/EstiloCliente.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <!-- ------------------------------------------------------------------------------------------------------------- -->
        <div class="card-header" >
            <h2>Modificar Cliente</h2>
        </div>
        <div class=" card clientes" >
            <%
                ClienteDAO dao = new ClienteDAO();
                int id = Integer.parseInt((String) request.getAttribute("idclien"));
                Cliente client = (Cliente) dao.list(id);
            %>
            <form id="editar" name="frmdatos" action="ControladorClient" method="get">
                <div class=" d-flex parte1 form-control ">
                    <div class="form-control">
                        <label for="id">ID:</label><br>
                        <input id="id" type="text" name="txtid" value="<%=client.getId()%>" readonly="true">
                        <i class="fas fa-check-circle"></i>
                    </div>
                    <div class="form-control">
                        <label for="documento">Número de documento:</label><br>
                        <input id="documento" type="number" name="txtnumerodocumento2"  value="<%= client.getNumerodocumento()%>" placeholder="1000834521">
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten números, entre 7 y 10 carácteres."></i>
                        <small>¡Error!</small>
                    </div>
                </div>
                <div class="d-flex parte2 form-control">
                    <div class="form-control">
                        <label for="nombre">Nombres:</label><br>
                        <input id="nombre" type="text" name="txtnombres2" value="<%= client.getNombres()%>" placeholder="John Doe">
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten letras, espacios y acentos."></i>
                        <small>¡Error!</small>
                    </div>
                    <div class="form-control">
                        <label for="apellido">Apellidos:</label><br>
                        <input id="apellido" type="text" name="txtapellidos2" value="<%= client.getApellidos()%>" placeholder="Ramírez">
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten letras, espacios y acentos."></i>
                        <small>¡Error!</small>
                    </div>
                </div>
                <div class="d-flex parte2 form-control">
                    <div class="form-control"> 
                        <label for="correo">Correo electrónico:</label><br>
                        <input id="correo" type="text" name="txtcorreoelectronico2" value="<%= client.getCorreo()%>" placeholder="example@organization.com">
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que el correo debe llevar un @ y un ( . ), precedido por un nombre de dominio."></i>
                        <small>¡Error!</small>
                    </div>
                    <div class="form-control">
                        <label for="telefono">Teléfono:</label><br>
                        <input id="telefono" type="number" name="txttelefono2" value="<%= client.getNumero()%>" placeholder="3133215760 - 3024227">
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten números, entre 7 y 13 digitos."></i>
                        <small>¡Error!</small>
                    </div>
                    <div class="form-control">
                        <label for="direccion">Dirección:</label><br>
                        <input id="direccion" type="text" name="txtdireccion2"value="<%= client.getDireccion()%>" placeholder="San Martin Calle 109 a # 109 - 46 ">
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que se admiten letras, espacios, números, guiones y numeral."></i>
                        <small>¡Error!</small>
                    </div>
                </div>
                <div class="form-control parte4">
                    <button style="border-radius: 35px;margin-left: 76%;width: 200px;height: 40px; color: white" id="btn_editar" class="btn btn-warning " onclick="return check();" type="submit" name="accion" value="Actualizar">Actualizar</button>
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
