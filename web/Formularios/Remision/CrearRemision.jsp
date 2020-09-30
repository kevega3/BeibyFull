<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
        <link rel="stylesheet" href="Estilos/ValidacionCampos/ValidacionStyles.css" type="text/css">
        <link href="Estilos/CSS/EstiloRemision.css" rel="stylesheet" type="text/css"/>
    </head>

    <body >
        <div class="card-header" >
            <h2>Registrar Remisión</h2>
        </div>
        <div class="card " >
            <form id="registro" name="frmdatos" action="ControladorRemision" method="get"> 
                <div class="form-control d-flex parte1" style="height: 160px;" >
                    <div class="form-control fecha">
                        <label for="fechaActual">Fecha:</label>
                        <input readonly="true" name="txtfecha" type="date" id="fechaActual">
                        <i class="fas fa-check-circle"></i>
                    </div>
                    <div class="form-control">
                        <label for="sede">Sede:</label>
                        <jsp:useBean id="cn" class="ModeloDAO.RemisionDAO" scope="page"></jsp:useBean>
                        <%
                            ResultSet rs = cn.mostrarsede();
                        %>
                        <select id="sede" name="id_sede" >
                            <option>-Seleccione una opción-</option>
                            <%
                                while (rs.next()) {
                            %>
                            <option value="<%= rs.getInt("Id_Sede")%>"><%= rs.getString("Nombre_Sede")%></option>
                            <%
                                }
                            %>
                        </select>
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Debe seleccionar una sede."></i>
                        <small>¡Error!</small>
                    </div>
                </div>
                <div class="form-control d-flex parte2" >
                    <div class="form-control " >
                        <label for="">Código producto:</label>
                        <input id="codigo" type="text" name="txtcodigoproducto" placeholder="Código" value="${pro.getNserie()}">
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten números, entre 6 y 12 carácteres."></i>
                        <small>¡Error!</small>
                    </div>
                    <div class="form-control col-5" >
                        <button type="submit" name="accion" value="BuscarP" class="btn btn-outline-info"><span class="fas  fa-search" ></span>Buscar</button>
                    </div> 
                </div>
                <div class="form-control d-flex parte3" >
                    <div class="form-control  " >
                        <label>Nombre de producto:</label>
                        <input id="nombre" type="text" name="nombreproducto" readonly="true" value="${pro.getNombre()}" >
                        <i class="fas fa-check-circle"></i>

                    </div>
                    <div class="form-control ">
                        <label>Cantidad:</label>
                        <input id="cantidad" type="number" placeholder="Cantidad" name="txtcantidad" value="1">
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten números, entre 1 y 4 carácteres."></i>
                        <small>¡Error!</small>
                    </div>
                    <div class="form-control ">
                        <label>Existencias:</label>
                        <input id="stock" readonly="true" type="text" name="Stock" placeholder="Stock" value=" ${pro.getCantiadad()}" >
                        <i class="fas fa-check-circle"></i>
                    </div>
                </div>
                <div class="form-control d-flex parte4" >
                    <button id="crearremision" class="btn btn-primary btn-lg" onclick="return check();" type="submit" name="accion" value="Agregar" > Agregar</button>
                </div>
            </form>        
        </div>
        <script>
            window.onload = function () {
                var fecha = new Date(); //Fecha actual
                var mes = fecha.getMonth() + 1; //obteniendo mes
                var dia = fecha.getDate(); //obteniendo dia
                var ano = fecha.getFullYear(); //obteniendo año
                if (dia < 10)
                    dia = '0' + dia; //agrega cero si el menor de 10
                if (mes < 10)
                    mes = '0' + mes //agrega cero si el menor de 10
                document.getElementById('fechaActual').value = ano + "-" + mes + "-" + dia;
            }
        </script>
        <script src="Estilos/ValidacionCampos/ValidacionRemision.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
