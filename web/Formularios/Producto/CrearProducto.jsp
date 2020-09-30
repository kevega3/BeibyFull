<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
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
            <h2>Registrar Producto</h2>
        </div>
        <div class=" card " >
            <form id="registro" name="frmdatos" action="ControladorProducto" method="get" >
                <div class=" d-flex parte1 form-control ">
                    <div class="form-control">
                        <label for="nserie">Número de serie:</label><br>
                        <input id="nserie" placeholder="798022520" type="number" name="txtserie" >
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten números, entre 6 y 10 carácteres."></i>
                        <small>¡Error!</small>
                    </div>
                    <div class="form-control">
                        <label for="validate">Nombre:</label><br>
                        <input id="validate" placeholder="Nombre" type="text" name="txtnombre" >
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten números, letras y acentos."></i>
                        <small>¡Error!</small>
                    </div>
                </div>
                <div class=" d-flex parte2 form-control ">
                    <div class="form-control">
                        <label for="valor">Valor:</label><br>
                        <input id="valor" placeholder="Costo" type="number" name="txtvalor" >
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten números."></i>
                        <small>¡Error!</small>
                    </div>
                    <div class="form-control">
                        <label for="cexistencias">Cantidad en existencia:</label><br>
                        <input id="cexistencias" placeholder="Existencias" type="number" name="txtexistencia">
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten números, máximo 6 carácteres."></i>
                        <small>¡Error!</small>
                    </div>
                </div>
                <div class=" d-flex parte3 form-control ">
                    <div class="form-control">
                        <label for="tipoprod">Tipo de producto:</label> <br>
                        <jsp:useBean id="cn2" class="ModeloDAO.ProductoDAO" scope="page"></jsp:useBean>
                        <%
                            ResultSet res = cn2.mostrartipopdoducto();
                        %>
                        <select id="tipoprod" name="idtipoprod" >
                            <option>-Seleccione una opción-</option>
                            <%
                                while (res.next()) {
                            %>
                            <option value="<%=res.getInt("Id_Tipo_Producto")%>" > <%= res.getString("Nombre_Tipo_Producto")%></option>
                            <%
                                }
                            %>
                        </select>
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Debe seleccionar un tipo de producto."></i>
                        <small>¡Error!</small>
                    </div>
                    <div class="form-control">
                        <label for="marca">Marca:</label> <br>
                        <jsp:useBean id="cn" class="ModeloDAO.ProductoDAO" scope="page"></jsp:useBean>
                        <%
                            ResultSet rs = cn.mostrarmarca();
                        %>
                        <select id="marca" name="idmarca" >
                            <option>-Seleccione una opción-</option>
                            <%
                                while (rs.next()) {
                            %>
                            <option value="<%=rs.getInt("Id_Marca")%>"> <%= rs.getString("Nombre_Marca")%></option>
                            <%
                                }
                            %>
                        </select>
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Debe seleccionar una marca."></i>
                        <small>¡Error!</small>
                    </div>
                </div>
                <div class="form-control parte4">
                    <input id="cancelar" class="btn btn-danger btn-lg" type="reset" value="Reiniciar">

                    <div>
                        <button id="btncrear" class="btn btn-primary btn-lg" onclick="return check();" type="submit" name="accion" value="Agregar">Agregar</button>
                    </div>
                </div>
            </form>
        </div>
        <script src="Estilos/ValidacionCampos/ValidacionProducto.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    </body>
</html>
