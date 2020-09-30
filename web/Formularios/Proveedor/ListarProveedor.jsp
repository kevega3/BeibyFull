<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Proveedor"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.ProveedorDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
       
        <!--datables CSS básico-->
        <link rel="stylesheet" type="text/css" href="Estilos/datatables/datatables.min.css"/>
        <!--datables estilo bootstrap 4 CSS-->  
        <link rel="stylesheet"  type="text/css" href="Estilos/datatables/DataTables-1.10.18/css/dataTables.bootstrap4.min.css">

        <!--font awesome con CDN-->  
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">  
        <link href="Estilos/CSS/EstiloTablas.css" rel="stylesheet" type="text/css"/>
        <link href="Estilos/main.css" rel="stylesheet" type="text/css"/>
        <link href="Estilos/CSS/scrollbarmostrar.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>                           
        <form action="ControladorProveedor">  
            <div class="card-header" >
                <h2>Listar Proveedor</h2>
            </div>
            <div  class="card d-flex">
            <div class="  form-control">
                    <div class="table-responsive">        
                        <table id="example" class="table "  width="100%">
                                <thead>
                                    <tr>
                                        <th class="text-center">Id</th>
                                        <th class="text-center">Número de documento</th>
                                        <th class="text-center">Nombre</th>
                                        <th class="text-center">Dirección</th>
                                        <th class="text-center">Número de contacto</th>                        
                                        <th class="text-center">Tipo de documento</th>
                                        <th class="text-center">Acciones</th>
                                    </tr>
                                </thead> <tbody id="">
                                    <jsp:useBean id="vdao" class="ModeloDAO.ProveedorDAO" scope="page"  ></jsp:useBean>
                                    <%
                                        ResultSet rs = vdao.listarprov();
                                        while (rs.next()) {
                                    %>
                                    <tr>
                                        <td class="text-center"><%=rs.getInt("Id_Proveedor")%></td>
                                        <td class="text-center"><%=rs.getString("numero_documento")%></td>
                                        <td class="text-center"><%=rs.getString("Nombre")%></td>
                                        <td class="text-center"><%=rs.getString("Direccion")%></td>
                                        <td class="text-center"><%=rs.getString("Numero_Contacto")%></td>
                                        <td class="text-center"><%=rs.getString("tipo_documento.Nombre_Tipo_Documento")%></td>
                                        <td>
                                            <a title="Editar"  class="btn btn-warning" href="ControladorProveedor?accion=editar&id=<%=rs.getInt("Id_Proveedor")%>"><i  class="fas fa-edit" title="Modificar registro"></i></a>
                                            <a title="Eliminar" class="btn btn-danger" href="ControladorProveedor?accion=eliminar&id=<%=rs.getInt("Id_Proveedor")%>"><i class="fas fa-trash" title="Eliminar registro"></i></a>
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
        </form>
        <script src="Estilos/jquery/jquery-3.3.1.min.js"></script>
        <script src="Estilos/popper/popper.min.js"></script>
        <script src="Estilos/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="Estilos/datatables/datatables.min.js"></script>    
        <script type="text/javascript" src="Estilos/main2.js"></script>
    </body>
</html>
