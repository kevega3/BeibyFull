<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >

        <!--datables CSS básico-->
        <link rel="stylesheet" type="text/css" href="Estilos/datatables/datatables.min.css"/>
        <!--datables estilo bootstrap 4 CSS-->  
        <link rel="stylesheet"  type="text/css" href="Estilos/datatables/DataTables-1.10.18/css/dataTables.bootstrap4.min.css">

        <!--font awesome con CDN-->  
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">  
        <link href="Estilos/main.css" rel="stylesheet" type="text/css"/>
        <link href="Estilos/CSS/EstiloTablas.css" rel="stylesheet" type="text/css"/>
        <link href="Estilos/CSS/scrollbarmostrar.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <form action="ControladorCompra">   
            <div class="card-header" >
                <h2>Consultar Compras</h2>
            </div>
            <div  class="card d-flex">
                <div class="  form-control">

                    <div class="table-responsive">        
                        <table id="example" class="table "  width="100%">
                            <thead>
                                <tr>
                                    <th class="text-center">Id</th>
                                    <th class="text-center">Sede</th>
                                    <th class="text-center">Proveedor</th>
                                    <th class="text-center">Número de serie</th>
                                    <th class="text-center">Fecha</th>
                                    <th class="text-center">Precio</th>
                                    <th class="text-center">Detalles </th>
                                </tr>
                            </thead>
                            <tbody id="">
                                <jsp:useBean id="vdao" class="ModeloDAO.CompraDAO" scope="page"  ></jsp:useBean>
                                <%
                                    ResultSet rs = vdao.listarcompra();
                                    while (rs.next()) {
                                %>
                                <tr>
                                    <td class="text-center"><%=rs.getInt("id_Compra")%></td>
                                    <td class="text-center"><%=rs.getString("sede.Nombre_Sede")%></td>
                                    <td class="text-center"><%=rs.getString("proveedor.Nombre")%></td>
                                    <td class="text-center"><%=rs.getString("numero_serie")%></td>
                                    <td class="text-center"><%=rs.getString("fecha")%></td>
                                    <td class="text-center"><%=rs.getDouble("monto")%></td>
                                    <td class="text-center">
                                        <a title="Ver Detalle" class="btn btn-info" href="ControladorCompra?accion=listardetalle&id=<%=rs.getInt("id_Compra")%>"><i class="fas fa-folder-open" title="Ver detalles de compra"></i></a>
                                    </td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="Estilos/jquery/jquery-3.3.1.min.js"></script>
    <script src="Estilos/popper/popper.min.js"></script>
    <script src="Estilos/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="Estilos/datatables/datatables.min.js"></script>    
    <script src="Estilos/main.js" type="text/javascript"></script>
</body>
</html>
