<%@page import="Config.operaciones"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="es">

    <head>
        <title>Recuperar Contraseña</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->	
        <link href="LOGIN/css/style_BTN.css" rel="stylesheet" type="text/css"/>
        <!--===============================================================================================-->	
        <link rel="icon" type="image/png" href="LOGIN/images/icons/favicon.ico"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="LOGIN/vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="LOGIN/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="LOGIN/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="LOGIN/vendor/animate/animate.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="LOGIN/vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="LOGIN/vendor/animsition/css/animsition.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="LOGIN/vendor/select2/select2.min.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="LOGIN/vendor/daterangepicker/daterangepicker.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="LOGIN/css/util.css">
        <link rel="stylesheet" type="text/css" href="LOGIN/css/main.css">
        <link rel="stylesheet" type="text/css" href="LOGIN/css/login.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

        <!--===============================================================================================-->
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
            if (request.getAttribute("vacio") != null) {

        %>
        <script>
            Swal.fire({

                title: '¡VERIFICA TUS DATOS!'
            });
        </script>


        <%}%>





        <div class="limiter">
            <div class="container-login100" style="background-image: url('LOGIN/images/baby.jpg');">
                <div class="wrap-login100 p-t-30 p-b-50">
                    <form class="login100-form validate-form p-b-33 p-t-5" style="padding: 10px" width="250px" action="ControladorPersona" method="post">
                        <a href="LOGIN/login.jsp"><small class=" btn btn-dark fas fa-arrow-left" title="Volver"></small> </a>

                        <center><img <a href="../MENU/index.jsp" src="LOGIN/images/babyfull-small.png" alt="150px" width="150px"></a></center>



                        <div class="wrap-input100 validate-input" data-validate="Ingrese Correo">
                            <input class="input100" type="text" name="txtcorreo" placeholder="Ingrese Correo">
                            <span class="focus-input100" data-placeholder="&#xe82a;"></span>
                        </div>


                        <div class="container-login100-form-btn m-t-32">
                            <button class="login100-form-btn" type="submit" type="submit" name="accion" value="cambiosclave" onclick="return generar();" >
                                Recuperar Contraseña    
                            </button>

                            <input id="clave" type="text" name="txtclave" style="display: none;" >



                        </div> <br>
                    </form>
                </div>
            </div>
        </div>
        <div id="dropDownSelect1"></div>

        <!--===============================================================================================-->
        <script src="Estilos/ClaveAleatoria.js" type="text/javascript"></script>
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
        <script src="js/main.js"></script>
    </body>
</html>
