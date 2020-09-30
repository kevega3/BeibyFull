<%@page import="java.sql.ResultSet"%>
<%@page import="Modelo.Persona"%>
<%@page import="ModeloDAO.PersonaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css">
        <link rel="stylesheet" href="Estilos/ValidacionCampos/ValidacionStyles.css" type="text/css">
        <link type="text/css" href="Estilos/CSS/EstiloPersonal.css" rel="stylesheet">
        <link href="Estilos/CSS/scrollbarmostrar.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <%
            PersonaDAO dao = new PersonaDAO();
            int id = Integer.parseInt((String) request.getAttribute("idpers"));
            Persona per = (Persona) dao.list(id);
        %>
        <div class="card-header">
            <h2>Modificar personal</h2>
        </div>
        <div class="card" >
            <form id="editar" name="frmdatos"  action="ControladorPersona" method="get" >
                <div class="form-control col-5">
                    <label for="id">Id</label><br>
                    <input id="id" readonly="true" type="text" value="<%= per.getId()%>" name="txtid" >
                </div>
                <div class="d-flex parte1 form-control" style="height: 160px;">
                    <div class="form-control">
                        <label for="validate">Nombres:</label><br>
                        <input id="validate" placeholder="Nombre" type="text" value="<%= per.getNombres()%>" name="txtnombres" >
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten letras, espacios y acentos."></i>
                        <small>¡Error!</small>
                    </div>
                    <div class="form-control">
                        <label for="apellido">Apellidos:</label><br>
                        <input id="apellido" placeholder="Apellido" type="text" value="<%= per.getApellidos()%>" name="txtapellidos" >
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten letras, espacios y acentos."></i>
                        <small>¡Error!</small>
                    </div>
                </div>
                <div class="d-flex parte2 form-control" >
                    <div class="form-control">
                        <label for="tipodoc">Tipo Documento</label> <br>
                        <jsp:useBean id="cn2" class="ModeloDAO.PersonaDAO" scope="page"  ></jsp:useBean>
                        <%
                            ResultSet res = cn2.mostrartipodoc();
                        %>
                        <select id="tipodoc" name="id_tipodocumento" >
                            <option>-Seleccione una opción-</option>
                            <%
                                while (res.next()) {
                            %>
                            <option value="<%=res.getInt("Id_Tipo_Documento")%>" > <%= res.getString("Nombre_Tipo_Documento")%></option>
                            <%
                                }
                            %>
                        </select>
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Debe seleccionar un tipo de documento."></i>
                        <small>¡Error!</small>
                    </div>
                    <div class="form-control">
                        <label for="numerodoc">Número de documento:</label><br>
                        <input id="numerodoc" placeholder="1999729534" value="<%= per.getNumerodocumento()%>" type="number" name="txtnombredoc" >
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten números, entre 7 y 10 carácteres."></i>
                        <small>¡Error!</small>
                    </div>
                </div>
                <div class="d-flex parte3 form-control" >
                    <div class="form-control">
                        <label for="email">Correo electrónico:</label><br>
                        <input id="email" placeholder="usuariox@gmail.com" value="<%= per.getCorreo()%>" type="text" name="txtcorreo" >
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que el correo debe llevar un @ y un ( . ), precedido por un nombre de dominio."></i>
                        <small>¡Error!</small>
                    </div>


                    <input id="clave" placeholder="********" value="<%= per.getClave()%>" type="password" name="txtclave" style="display: none">

                    <div class="form-control">
                        <label for="rol">Rol:</label> <br>
                        <jsp:useBean id="cn" class="ModeloDAO.PersonaDAO" scope="page"></jsp:useBean>
                        <%
                            ResultSet rs3 = cn.mostrarrol();
                        %>
                        <select id="rol" name="id_rol" >
                            <option>-Seleccione una opción-</option>
                            <%
                                while (rs3.next()) {
                            %>
                            <option value="<%=rs3.getInt("Id_Rol")%>" > <%= rs3.getString("Nombre_Rol")%></option>
                            <%
                                }
                            %>
                        </select>
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Debe seleccionar un rol."></i>
                        <small>¡Error!</small>
                    </div>
                </div>
                <div class="d-flex parte4 form-control" >
                    <div class="form-control">
                        <label for="contacto">Número de contacto:</label><br>
                        <input id="contacto" placeholder="3194756222" value="<%= per.getTelefono()%>" type="number" name="txttelefono" >
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten números, entre 7 y 10 carácteres."></i>
                        <small>¡Error!</small>
                    </div>   
                    <div class="form-control">
                        <label for="direc">Dirección:</label><br>
                        <input id="direc" placeholder="Diag 46 # 13 F-67 Sur" value="<%= per.getDireccion()%>" type="text" name="txtdireccion" >
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que se admiten letras, espacios, números, guiones y numeral."></i>
                        <small>¡Error!</small>
                    </div>
                </div>
                <div class="d-flex parte5 form-control">
                    <button id="actualizarpersona2" class="btn btn-warning btnmodificar " onclick="return check();" type="submit" name="accion" value="Actualizar">Actualizar</button>
                </div> 
            </form>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
        <script src="Estilos/ValidacionCampos/ValidacionPersona.js"></script>
    </body>
</html>
