
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css">
        <link href="Estilos/ValidacionCampos/ValidacionStyles.css" rel="stylesheet" type="text/css"/>
        <link href="Estilos/CSS/EstiloCompras.css" rel="stylesheet" type="text/css"/>
        <link href="Estilos/CSS/scrollbarmostrar.css" rel="stylesheet" type="text/css"/>
               
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

    </head>
    <body >
        <h4 style="margin-top:  29px;">Factura de Compra</h4>
        <p class="p1">Pañalera Paola L.F</p>
        <p class="p2">NIT : 901316249-2</p>
        <div class="card" >
            <form action="ControladorCompra" method="get" >
                <div>
                    <div class="form-control cabecera">
                        <div class=" numerodeserie2">
                            <label class="lblncompra">Compra N°:</label>
                            <input class="txtnserie" readonly="true" type="text" name="txtnumeroserie" readonly="true" value="<%= request.getAttribute("nserie")%>" >
                        </div>
                        <div class="partefecha2">
                            <label>Fecha:</label> <br>
                            <input class="i-fecha"  readonly="true" class="form-control" name="txtfecha" type="date" id="fechaActual" value="" >
                        </div>
                    </div>

                    <!-- Datos empleado-->

                    <div class="form-control d-flex parte-proveedor " >
                        <div class="partecedulaprov" >
                            <label>Identificación proveedor:</label>
                            <input id="codproveedor" type="number" name="txtidproveeedor" value="${prov.getNumerodocumento()}"  placeholder="1018020222">
                            <i class="fas fa-check-circle"></i>
                            <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten números, entre 7 y 10 carácteres."></i>
                            <small>¡Error!</small>
                        </div>
                        <div class="col-sm-6 nombreprovprov" >
                            <label>Datos proveedor:</label>
                            <input readonly="true" type="text" value="${prov.getNombre()}" class="" >
                        </div>
                        <div class="btnbprov" >
                            <button title="Buscar Proveedor"   type="submit" name="accion" value="BuscarProveedor" class="btn btn-outline-info btnbprov" ><span class="fas fa-search" ></span></button>
                        </div>
                    </div> 

                    <!-- Acá ejecutamos la parte donde se traerán los datos de nuestra sede-->  

                    <div class="form-control parte-sede d-flex parte12 " >
                        <div class=" partecedulasede" >
                            <label>Id sede:</label>
                            <input id="codsede" type="number" id="datos2"  name="txtidsede" value="${sedd.getId()}"  placeholder="Código" >
                            <i class="fas fa-check-circle"></i>
                            <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten números, un solo carácter."></i>
                            <small>¡Error!</small>
                        </div>
                        <div class="col-sm-6 nombresede" >
                            <label>Nombre sede:</label>
                            <input readonly="true" type="text" value="${sedd.getNombre_sede()}" class="" >

                        </div>
                        <div class="btnsede" >
                            <button title="Buscar Sede"  type="submit" name="accion" value="BuscarSede" class="btn btn-outline-info btnsede" ><span class="fas fa-search" ></span></button>
                        </div>
                    </div>  



                    <!-- En esta parte ejecutaremos la parte en donde traeremos los datos de nuestro producto-->

                    <div class="form-control d-flex parte-prod " >
                        <div class=" form-control partenombre  col-5 " >
                            <label class="lblcodpro">Código producto:</label>
                            <input class="txtcodpro" id="codproducto" type="text" name="txtcodigoproducto" placeholder="Código Producto" value="${pro.getNserie()}">
                            <i class="fas fa-check-circle"></i>
                            <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten números, entre 6 y 10 carácteres."></i>
                            <small>¡Error!</small>
                        </div>
                        <div class=" form-control partenombre col-4  ">
                            <label class="lblnombreprod">Nombre producto:</label>
                            <input class="txtnombreprod" readonly="true" placeholder="Nombre Producto" type="text" name="nombreproducto" value="${pro.getNombre()}" >
                        </div>
                        <div class="btnprod col-2">
                            <button title="Buscar Producto" type="submit" name="accion" value="Buscarproducto" class="btn btn-outline-info btnprod" ><span class="fas fa-search" ></span></button>
                        </div>
                    </div>
                    <div class="form-control d-flex parteprod2">
                        <div class=" partemonto col-sm-2  ">
                            <label class="">Precio:</label>
                            <input  value="${pro.getValor()}"  readonly="true"  type="text" name="txtmonto" placeholder="$" >
                        </div>
                        <div class=" form-control  partecantidad    "> 
                            <label class="lblcantidad">Cantidad:</label>
                            <input id="cantidad" type="number" name="txtcantidad" value="1">
                            <i class="fas fa-check-circle"></i>
                            <i class="fas fa-exclamation-circle" title="Recuerde que solo se admiten números, máximo 5 carácteres"></i>
                            <small>¡Error!</small>
                        </div>
                        <div class=" partestock  col-sm-3    ">
                            <label class="lblstock">Existencias:</label>
                            <input readonly="true" type="text" name="Stock" placeholder="Stock" value=" ${pro.getCantiadad()}" >
                        </div>
                        <div class="form-group registro d-flex" >
                            <button id="registro" type="submit" name="accion" onclick="return check();" value="Agregar" class="btn btn-primary registro">Agregar</button>
                        </div>
                    </div>
                    <div class="tabla form-control" >
                        <div class="">
                            <br>
                            <table id="table" class="table table-hover table-bordered ">
                                <thead class="table-active " >
                                    <tr>
                                        <th>No.</th>
                                        <th>Código</th>
                                        <th>Descripción</th>
                                        <th>Precio</th>
                                        <th>Cantidad</th>
                                        <th>Subtotal</th>
                                    </tr>
                                </thead>
                                <tbody >
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
                        <div class="card-footer d-flex ">
                            <div class="col-sm-6">
                                <a id="generar" href="ControladorCompra?accion=GenerarCompra" onclick="return gcomp();" class="btn btn-success btngenerar" ><span class="fas fa-plus-circle" ></span>Generar compra</a>
                            </div>
                            <div  class="col-sm-4 ml-auto" >
                                <label class="lbltotal">Total:</label>
                                <input  class="txttotal" type="text" name="txrtotal" value=" $/. ${total}0" readonly="true" >
                            </div>
                        </div>
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
        <script src="Estilos/ValidacionCampos/ValidacionCompra.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    </body>
</html>
