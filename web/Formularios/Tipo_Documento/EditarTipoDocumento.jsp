<%@page import="Modelo.TipoDocumento"%>
<%@page import="ModeloDAO.TipoDocumentoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css">
        <link href="Estilos/ValidacionCampos/ValidacionStyles.css" rel="stylesheet" type="text/css"/>
        <link href="Estilos/CSS/EstiloTDocumento.css" rel="stylesheet" type="text/css"/>
    
    </head>

    <body>
        <%
            TipoDocumentoDAO dao = new TipoDocumentoDAO();
            int id = Integer.parseInt((String) request.getAttribute("idtipodoc"));
            TipoDocumento tipod = (TipoDocumento) dao.list(id);
        %>
        <div class="card-header" >
            <h2>Modificar Tipo Documento</h2>
        </div>
        <div class=" card " >
            <form id="editar" name="frmdatos" action="ControladorTipoDocumento" method="get" >
                <div class=" d-flex parte1 form-control " style="margin-top: 30px;">
                    <div class="form-control">
                        <label for="id">ID:</label><br>
                        <input id="id" type="text" name="txtid" value="<%= tipod.getId()%>" readonly="true" >
                        <i class="fas fa-check-circle"></i>
                    </div>
                </div>
                <div class=" d-flex parte2 form-control ">
                    <div class="form-control">
                        <label for="validate">Nombre de tipo de documento:</label><br>
                        <input id="validate"  type="text" name="txtnombre" value="<%= tipod.getNombre()%>" placeholder="Ej: Cedula de Ciudadania" >
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten letras, espacios, y acentos."></i>
                        <small>¡Error!</small>
                    </div>
                </div>
                <div class=" d-flex  form-control ">
                    <button id="btn_editar" class="btn btn-warning btn-lg " onclick="return check();" type="submit" name="accion" value="Actualizar">Actualizar</button>
                </div> 
            </form>
        </div>
        <script src="Estilos/ValidacionCampos/ValidacionTipoDocumento.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    </body>
</html>
