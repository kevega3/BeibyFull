<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="ModeloDAO.ClienteDAO"%>
<%@page import="Modelo.Cliente"%>
<%@taglib prefix="cl" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css">
        <link href="Estilos/ValidacionCampos/ValidacionStyles.css" rel="stylesheet" type="text/css"/>
        <link href="Estilos/CSS/EstiloVenta.css" rel="stylesheet" type="text/css"/>
        <link href="Estilos/CSS/scrollbarmostrar.css" rel="stylesheet" type="text/css"/>

    </head>

    <body>
        <h4>Factura de Venta</h4>
        <p class="p1" >Pañalera Paola L.F</p>
        <p class="p2" >NIT : 901316249-2</p>
        <div class="card">
            <form action="ControladorVenta" method="get" >
                <div>
                    <div class="form-control cabecera">
                        <div class="parteserie">
                            <label class="l-serie" >Venta N°:</label>
                            <input class="i-serie" type="text" name="txtnumeroserie" readonly="true" value="<%= request.getAttribute("nserie")%>" >
                        </div>
                        <div class="partefecha" >
                            <label>Fecha:</label> <br>
                            <input class="i-fecha" readonly="true" name="txtfecha" type="date" id="fechaActual" value="" >
                        </div>
                    </div>
                    <div>

                        <!--Datos del empleado-->

                        <div class=" form-control d-flex  parte-empleado " >
                            <div class="partecedula form-control " >
                                <label class=" l-ccemple">Documento de empleado:</label>          
                                <input class=" emple" id="codempleado" type="number" name="txtidemple" value="${pers.getNumerodocumento()}"  placeholder="C.C">
                                <i class="fas fa-check-circle"></i>
                                <i class="fas fa-exclamation-circle" title="Recuerde que solo se permiten números, entre 7 y 10 carácteres."></i>
                                <small>¡Error!</small>
                            </div>
                            <div class=" nombreem form-control " >
                                <label class="l-nombree">Datos Empleado:</label>
                                <input class="i-nombree" readonly="true" type="text" value="${pers.getNombres()}" placeholder="Nombre" >
                                <input class="i-apellidos" readonly="true" type="text" value="${pers.getApellidos()}" placeholder="Apellido" >
                            </div>
                            <div class=" botoncl" >
                                <button class="botoncl btn btn-outline-info "  type="submit" name="accion" value="BuscarE"  ><span class="fas fa-search" ></span></button>
                            </div>
                        </div>

                        <!--Datos de cliente-->   

                        <div class="form-control d-flex parte-cliente " >
                            <div class="partecedulac form-control " >
                                <label class="l-cccliente" >Documento de cliente:</label>
                                <input class="i-cccliente" id="codcliente" type="text" name="txtcodigocliente" value="${c.getNumerodocumento()}"  placeholder="C.C">
                                <i class="fas fa-check-circle"></i>
                                <i class="fas fa-exclamation-circle" title="Recuerde que solo se permiten números, entre 7 y 10 carácteres."></i>
                                <small>¡Error!</small>
                            </div>
                            <div class="incliente form-control">
                                <label>Datos Cliente:</label>
                                <input placeholder="Nombre" class="txtnombrec" type="text" value="${c.getNombres()}" readonly="true">
                                <input placeholder="Apellido" class="txtapellidoc" type="text" value="${c.getApellidos()}" readonly="true">
                            </div>
                            <div class="botonbe" >
                                <button type="submit" name="accion" value="BuscarC" class="btn btn-outline-info botonbe "><span class="fas fa-search" ></span></button>
                            </div>
                        </div>  

                        <!-- Datos de producto-->

                        <div class="form-control d-flex parteprod  " >
                            <div class="form-control incliente col-4 "  >
                                <label class="lblcodpro">Código de producto:</label>
                                <input class="txtcodpro" id="codproducto" type="text" name="txtcodigoproducto" placeholder="Código Producto" value="${pro.getNserie()}">
                                <i class="fas fa-check-circle"></i>
                                <i class="fas fa-exclamation-circle" title="Recuerde que solo se permiten números, entre 6 y 10 carácteres."></i>
                                <small>¡Error!</small>
                            </div>
                            <div class="form-control incliente col-5 "  >
                                <label class="">Nombre de producto:</label>
                                

                                    <input class="txtnombreprod" readonly="true" placeholder="Nombre Producto" type="text" name="nombreproducto" value="${pro.getNombre()}" >

                               
                            </div>
                            <div class="btnprod col-2 ">
                                <button   type="submit" name="accion" value="BuscarP" class=" btn btn-outline-info btnprod" ><span class="fas fa-search" ></span></button>
                            </div>
                        </div>
                        <div class="form-control d-flex parteprod2">
                            <div class=" partemonto col-sm-2  ">
                                <label class="">Precio:</label>
                                <input value="${pro.getValor()}" readonly="true" type="text" name="txtmonto" placeholder="Precio" >
                            </div>
                            <div class="form-control partecantidad"> 
                                <label class="lblcantidad" >Cantidad:</label>
                                <input id="cantidad" type="number" name="txtcantidad" value="1" max="${pro.getCantiadad()}">
                                <i class="fas fa-check-circle"></i>
                                <i class="fas fa-exclamation-circle" title="Recuerde que solo se permiten números, máximo 4 carácteres."></i>
                                <small>¡Error!</small>
                            </div>
                            <div class="partestock  col-sm-3">
                                <label class="lblstock" >Existencias:</label>
                                <input readonly="true" type="text" name="Stock" placeholder="Stock" value=" ${pro.getCantiadad()}" >
                            </div>
                            <div class=" registro d-flex" >
                                <button id="registro" type="submit" name="accion" onclick="return check();" value="Agregar" class="btn btn-primary registro "  ><span class="fas fa-plus-circle" ></span>Agregar</button>
                            </div>
                        </div>

                        <!--Agregar nueva venta-->

                    </div>
                </div>
                <div class="tabla">
                    <table id="table" class="table table-hover table-bordered">
                        <thead class="table-active">
                            <tr>
                                <th>No.</th>
                                <th>Código</th>
                                <th>Descripción</th>
                                <th>Precio</th>
                                <th>Cantidad</th>
                                <th>Subtotal</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="list" items="${lista}" >
                            <tr>
                                <td class="table-secondary" >${list.getItem()}</td>
                                <td class="table-secondary" >${list.getIdproducto()}</td>
                                <td class="table-secondary" >${list.getDescripcion()}</td>
                                <td class="table-secondary" >${list.getPrecio()}</td>
                                <td class="table-secondary" >${list.getCantidad()}</td>
                                <td class="pt table-secondary" >${list.getSubtotal()}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="card-footer d-flex">
                    <div class="col-sm-6">
                        <a href="ControladorVenta?accion=GenerarVenta" onclick="return gvent();" class="btn btn-success btngenerar" ><span class="fas fa-plus-circle"></span>Generar venta</a>
                    </div>
                    <div  class="col-sm-4 ml-auto" >
                        <label class="lbltotal">Total:</label>
                        <input type="text" name="txrtotal" value=" $/. ${total}0" readonly="true" >
                    </div>
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
                    mes = '0' + mes; //agrega cero si el menor de 10
                document.getElementById('fechaActual').value = ano + "-" + mes + "-" + dia;
            };
        </script>
        <script src="Estilos/ValidacionCampos/ValidacionVenta.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    </body>
</html>
