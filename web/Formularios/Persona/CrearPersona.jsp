<%@page import="Config.Email"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="ModeloDAO.PersonaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css">
        <link rel="stylesheet" href="Estilos/CSS/EstiloPersonal.css" type="text/css"/>
        <link rel="stylesheet" href="Estilos/CSS/scrollbarmostrar.css" rel="styles" type="text/css">
        <link rel="stylesheet" href="Estilos/ValidacionCampos/ValidacionStyles.css" type="text/css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
  
    </head>

    <body>
        <%
            if (request.getAttribute("correcto") != null) {

        %>
        <script>
            Swal.fire({

                title: '¡CORREO ENVIADO CON EXITO!'
            });
        </script>


        <%}%>

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
        <div class="card-header">
            <h2>Registrar personal</h2>
        </div>
        <div class="card" >


            <form id="registro" name="frmdatos" action="ControladorPersona" method="get"  >
                <div class="d-flex parte1 form-control" style="height: 160px;">
                    <div class="form-control">
                        <label for="validate">Nombres:</label><br>
                        <input id="validate" placeholder="Nombre" type="text" name="txtnombres">
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten letras, espacios y acentos."></i>
                        <small>¡Error!</small>
                    </div>
                    <div class="form-control">
                        <label for="apellido">Apellidos:</label><br>
                        <input id="apellido" placeholder="Apellido" type="text" name="txtapellidos">
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten letras, espacios y acentos."></i>
                        <small>¡Error!</small>
                    </div>
                </div>
                <div class="d-flex parte2 form-control">
                    <div class="form-control">
                        <label for="tipodoc">Tipo de documento:</label> <br>
                        <jsp:useBean id="cn2" class="ModeloDAO.PersonaDAO" scope="page"></jsp:useBean>
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
                        <input id="numerodoc" placeholder="1999729534" type="number" name="txtnombredoc">
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten números, entre 7 y 10 carácteres."></i>
                        <small>¡Error!</small>
                    </div>
                </div>
                <div class="d-flex parte3 form-control">
                    <div class="form-control">
                        <label for="email">Correo electrónico:</label><br>
                        <input id="email" placeholder="usuariox@gmail.com" type="text" name="txtcorreo">
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que el correo debe llevar un @ y un ( . ), precedido por un nombre de dominio."></i>
                        <small>¡Error!</small>
                    </div>

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
                <div class="d-flex parte4 form-control">
                    <div class="form-control">
                        <label for="contacto">Número de contacto:</label><br>
                        <input id="contacto" placeholder="3194756222" type="number" name="txttelefono">
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten números, entre 7 y 10 carácteres."></i>
                        <small>¡Error!</small>
                    </div>
                    <div class="form-control">
                        <label for="direc">Dirección:</label><br>
                        <input id="direc" placeholder="Diag 46 # 13 F-67 Sur" type="text" name="txtdireccion">
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle" title="Recuerde que se admiten letras, espacios, números, guiones y numeral."></i>
                        <small>¡Error!</small>
                    </div>
                </div>

                <div class="d-flex parte5 form-control">
                    <input id="cancelar" class="btn btn-danger btn-lg" type="reset" value="Reiniciar">

                    <div>
                        <button id="btncrear" class="btn btn-primary btn-lg" onclick="return check() " type="submit" name="accion" value="Agregar" >Agregar</button>

                    </div>

                </div>
                        <input id="clave" type="text" name="txtclave" style="display: none;" >

            </form>
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    </body>
</html>
