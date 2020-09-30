<%@page import="Modelo.Sede"%>
<%@page import="ModeloDAO.SedeDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css">
        <link rel="stylesheet" href="Estilos/ValidacionCampos/ValidacionStyles.css" type="text/css">
        <link href="Estilos/CSS/EstiloSede.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <%
            SedeDAO dao = new SedeDAO();
            int id = Integer.parseInt((String) request.getAttribute("idsed"));
            Sede sed = (Sede) dao.list(id);
        %>
        <div class="card-header" >
            <h2>Modificar Sede</h2>
        </div>
        <div class=" card " >
            <form id="registro" name="frmdatos"  action="ControladorSede"  method="get"  >
                <div class="form-control">
                    <label>ID Sede:</label>
                    <input id="id" value="<%=sed.getId()%>" type="text" name="txtid2"><br>
                    <i class="fas fa-check-circle"></i>
                    <small>¡Error!</small>
                </div>
                <div class=" d-flex parte1 form-control ">
                    <div class="form-control">
                        <label for="validate">Nombre:</label>
                        <input id="validate" value="<%=sed.getNombre_sede()%>" placeholder="Nombre" type="text" name="txtnombre2"><br>
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten letras, espacios y acentos."></i>
                        <small>¡Error!</small>
                    </div>
                </div>
                <div class=" d-flex parte2 form-control ">
                    <div class="form-control">
                        <label for="direccion">Dirección:</label>
                        <input id="direccion" value="<%=sed.getDireccion_sede()%>" placeholder="Dirección" type="text" name="txtdireccion2"><br>
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten letras, espacios y acentos."></i>
                        <small>¡Error!</small>
                    </div>
                </div>
                <div class=" d-flex parte3 form-control ">
                    <div class="form-control">
                        <label for="barrio">Barrio:</label>
                        <input id="barrio" value="<%=sed.getBarrio_sede()%>" placeholder="Barrio" type="text" name="txtbarrio2"><br>
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten letras, números, espacios y acentos."></i>
                        <small>¡Error!</small>
                    </div>
                </div>
                <div class=" d-flex partebtn form-control ">
                    <button id="btneditarsede" class="btn btn-warning btn-lg " type="submit" onclick="return check();" name="accion" value="Actualizar" >Actualizar</button>
                </div>
            </form>      
        </div>
    </div>
    <script src="Estilos/ValidacionCampos/ValidacionSede.js" type="text/javascript"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
</body>
</html>
