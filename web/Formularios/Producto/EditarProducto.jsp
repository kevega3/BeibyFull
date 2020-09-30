<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Producto"%>
<%@page import="ModeloDAO.ProductoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>  
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css">
        <link rel="stylesheet" href="Estilos/ValidacionCampos/ValidacionStyles.css" type="text/css">
        <link href="Estilos/CSS/EstiloProducto.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <%
            ProductoDAO dao = new ProductoDAO();
            int id = Integer.parseInt((String) request.getAttribute("idpro"));
            Producto prod = (Producto) dao.list(id);
        %>
        <div class="card-header" >
            <h2>Modificar Producto</h2>
        </div>
        <div class=" card " >
            <form id="editar" name="frmdatos" action="ControladorProducto" method="get">
                <div class="form-control col-6">
                    <label for="id">Id</label><br>
                    <input id="id" readonly="true" type="text" name="txtcodigo2" value="<%= prod.getIdprod()%>">
                </div>
                <div class=" d-flex parte1 form-control ">
                    <div class="form-control">
                        <label for="nserie">Número de serie:</label><br>
                        <input id="nserie" placeholder="798022520" type="text" name="txtserie2" value="<%= prod.getNserie()%>">
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten números, entre 6 y 10 carácteres."></i>
                        <small>¡Error!</small>
                    </div>
                    <div class="form-control">
                        <label for="validate">Nombre:</label><br>
                        <input id="validate" placeholder="Example" type="text" name="txtnombre2" value="<%= prod.getNombre()%>">
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten números, letras y acentos."></i>
                        <small>¡Error!</small>
                    </div>
                </div>
                <div class=" d-flex parte2 form-control ">
                    <div class="form-control">
                        <label for="valor">Valor:</label><br>
                        <input id="valor" placeholder="180000" type="number" name="txtvalor2" value="<%= prod.getValor()%>">
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten números, máximo 6 carácteres."></i>
                        <small>¡Error!</small>
                    </div>
                    <div class="form-control">
                        <label for="cexistencias">Cantidad en existencia:</label><br>
                        <input id="cexistencias" placeholder="10" type="number" name="txtcantidad2"value="<%= prod.getCantiadad()%>">
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten números."></i>
                        <small>¡Error!</small>
                    </div>
                </div>
                <div class="form-control parte4">
                    <button id="btnactualizarprod" class="btn btn-warning" onclick="return check();" type="submit" name="accion" value="Actualizar">Actualizar</button>
                </div>   
            </form>
        </div>
    </div>
    <script src="Estilos/ValidacionCampos/ValidacionProductoEditar.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>      
</body>
</html>
