<%@page import="Modelo.Marca"%>
<%@page import="ModeloDAO.MarcaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css">
        <link href="Estilos/ValidacionCampos/ValidacionStyles.css" rel="stylesheet" type="text/css"/>
        <link href="Estilos/CSS/EstiloMarca.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <%
            MarcaDAO dao = new MarcaDAO();
            int id = Integer.parseInt((String) request.getAttribute("idmarca"));
            Marca marc = (Marca) dao.list(id);
        %>
        <div class="card-header" >
            <h2>Modificar Marca</h2>
        </div>
        <div class=" card " >
            <form id="actualizarMarca" name="frmdatos"  action="ControladorMarca"  method="get"  >
                <div class=" d-flex parte1 form-control " style="margin-top: 30px;">
                    <div class="form-control">
                        <label for="id">ID:</label><br>
                        <input value="<%=marc.getId()%>" id="id" type="text" name="txtid" readonly="">
                        <i class="fas fa-check-circle"></i>
                    </div>
                </div>
                <div class=" d-flex parte2 form-control ">
                    <div class="form-control">
                        <label for="nombre">Nombre:</label><br>
                        <input value="<%=marc.getNombre()%>" id="nombre" type="text" name="txtnombres2" placeholder="Ej: Pequeñin"><br>
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten letras, espacios y acentos."></i>
                        <small>¡Error!</small>
                    </div>
                </div>
                <div class=" d-flex parte2 form-control ">
                    <button id="btneditar" class="btn btn-warning " onclick="return check();" type="submit" name="accion" value="Actualizar">Actualizar</button>
                </div>                
            </form>
        </div>
    </div>
    <script src="Estilos/ValidacionCampos/ValidacionMarca.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
</body>
</html>
