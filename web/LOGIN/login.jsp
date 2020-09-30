<%@page import="Config.operaciones"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="es">

    <head>
        <title>BabyFull</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->	
        <link href="css/style_BTN.css" rel="stylesheet" type="text/css"/>
        <!--===============================================================================================-->	
        <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <link rel="stylesheet" type="text/css" href="css/login.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css">

        <!--===============================================================================================-->
    </head>

    <body>
        <div class="limiter">
            <div class="container-login100" style="background-image: url('images/baby.jpg');">
                <div class="wrap-login100 p-t-30 p-b-50">
                    <form class="login100-form validate-form p-b-33 p-t-5" style="padding: 10px" width="250px" method="post">
                        <center><img <a href="../MENU/index.jsp" src="images/babyfull-small.png" alt="150px" width="150px"></a></center>
                        <div class="wrap-input100 validate-input" data-validate="Ingrese Correo">
                            <input class="input100" type="text" name="txtUsuario" placeholder="Ingrese Correo">
                            <span class="focus-input100" data-placeholder="&#xe82a;"></span>
                        </div>
                        <%

                            operaciones op = new operaciones();
                            if (request.getParameter("btnIngresar") != null) {
                                String nombre = request.getParameter("txtUsuario");
                                String contra = request.getParameter("passencript");
                                HttpSession sesion = request.getSession();
                                switch (op.loguear(nombre, contra)) {
                                    case 1:
                                        sesion.setAttribute("user", nombre);
                                        sesion.setAttribute("FKRol", "1");
                                        response.sendRedirect("../ADMI/AdministradorPrincipal.jsp");
                                        break;

                                    case 2:
                                        sesion.setAttribute("user", nombre);
                                        sesion.setAttribute("FKRol", "2");
                                        response.sendRedirect("../EMPLE/EmpleadoPrincipal.jsp");
                                        break;

                                    case 3:
                                        sesion.setAttribute("user", nombre);
                                        sesion.setAttribute("FKRol", "3");
                                        response.sendRedirect("../BODEGUE/BodegueroPrincipal.jsp");
                                        break;

                                    default:
                                        out.write("<center>(Usuario no existe</center><br>");
                                        out.write("<center>o contraseña inválida)</center>");
                                }
                            }
                            if (request.getParameter("cerrar") != null) {

                                session.invalidate();
                            }
                        %>
                        <div class="wrap-input100 validate-input" data-validate="Ingrese Contraseña">
                            <i id="eye" class="fa fa-eye" ></i>
                            <input id="clave" class="input100" type="password" name="txtContra" placeholder="Ingrese Contraseña" onkeyup="this.form.passencript.value=md5(this.form.txtContra.value)">
                            <input type="hidden" name="passencript" >
                            <span class="focus-input100" data-placeholder="&#xe80f;"></span>
                        </div>
                        <a href="../ControladorPersona?accion=cla" class="recuperarclave">¿Olvidaste tu contraseña?</a>
                        <div class="container-login100-form-btn m-t-32">
                            <button class="login100-form-btn" type="submit" name="btnIngresar" value="Ingresar">Ingresar</button>
                        </div> <br>
                    </form>
                </div>
            </div>
        </div>
        <div id="dropDownSelect1"></div>

        <!--===============================================================================================-->
        <script src="../Estilos/verclave.js" type="text/javascript"></script>
        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/animsition/js/animsition.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/bootstrap/js/popper.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/select2/select2.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/daterangepicker/moment.min.js"></script>
        <script src="vendor/daterangepicker/daterangepicker.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/countdowntime/countdowntime.js"></script>
        <!--===============================================================================================-->
        <script src="js/main.js" type="text/javascript"></script>
        <script src="js/md5.js" type="text/javascript"></script>
    </body>
</html>
