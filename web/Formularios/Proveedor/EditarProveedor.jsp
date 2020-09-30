<%@page import="Modelo.Proveedor"%>
<%@page import="ModeloDAO.ProveedorDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css">
        <link rel="stylesheet" href="Estilos/ValidacionCampos/ValidacionStyles.css" type="text/css">
        <link href="Estilos/CSS/EstiloProveedor.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <%
            ProveedorDAO dao = new ProveedorDAO();
            int id = Integer.parseInt((String) request.getAttribute("idprov"));
            Proveedor prov = (Proveedor) dao.list(id);
        %>
        <div class="card-header">
            <h2>Modificar Proveedor</h2>
        </div>       
        <div class="card">
            <form id="registroProveedor" name="frmdatos" action="ControladorProveedor" method="get"  >
                <div class="form-control col-6 idd" >
                    <label for="id">Id:</label><br>
                    <input id="id" value="<%=prov.getId()%>" readonly="true" type="text" name="txtid">
                    <i class="fas fa-check-circle"></i>
                </div>
                <div class="d-flex parte1 form-control" style="height: 160px;">
                    <div class="form-control">
                        <label for="validate">Nombres:</label><br>
                        <input id="validate"  placeholder="Proveedor" value="<%=prov.getNombre()%>" type="text" name="txtnombre2" >
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten letras, espacios y acentos."></i>
                        <small>¡Error!</small>
                    </div>
                    <div class="form-control">
                        <label for="direccion">Dirección:</label><br>
                        <input id="direccion" placeholder="San Francisco" value="<%=prov.getDireccion()%>" type="text" name="txtdireccion2" >
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que se admiten letras, espacios, números, guiones y numeral."></i>
                        <small>¡Error!</small>
                    </div>
                </div>
                <div class="d-flex parte2 form-control" style="height: 160px;">
                    <div class="form-control">
                        <label for="numerodoc">Número de documento:</label><br>
                        <input id="numerodoc" placeholder="1999729534" value="<%=prov.getNumerodocumento()%>" type="number" name="txtnumerodoc2" >
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten números, entre 7 y 10 carácteres."></i>
                        <small>¡Error!</small>
                    </div>
                    <div class="form-control">
                        <label for="contacto">Número de contacto:</label><br>
                        <input id="contacto" placeholder="3194756222" value="<%=prov.getNumerocontacto()%>" type="number" name="txtnumerocontacto2" >
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten números, entre 7 y 10 carácteres."></i>
                        <small>¡Error!</small>
                    </div>
                </div>
                <button id="modificarpro" class="btn btn-warning btn-lg " type="submit" onclick="return check();" name="accion" value="Actualizar">Actualizar</button>
            </form>
        </div>
        <script src="Estilos/ValidacionCampos/ValidacionProveedorEditar.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
