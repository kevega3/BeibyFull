package Controlador;

import Config.Generarserie;
import Modelo.Compra;
import Modelo.Producto;
import Modelo.Proveedor;
import Modelo.Sede;
import ModeloDAO.CompraDAO;
import ModeloDAO.ProductoDAO;
import ModeloDAO.ProveedorDAO;
import ModeloDAO.SedeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ControladorCompra", urlPatterns = {"/ControladorCompra"})
public class ControladorCompra extends HttpServlet {

    int item;
    int codigo;
    String descripcion;
    String fecha;
    double precio;
    double cantidad;
    double subtotal;
    double total;
    String numeroserie;
    List<Compra> lista = new ArrayList<>();

    String listar = "Formularios/Compras/CrearCompra.jsp";
    String listando = "Formularios/Compras/ListarCompra.jsp";
    String detalle = "Formularios/Compras/ListarDetalleCompra.jsp";

    ProveedorDAO provedao = new ProveedorDAO();
    Proveedor prove = new Proveedor();
    Compra com = new Compra();
    Sede sed = new Sede();
    SedeDAO sedao = new SedeDAO();

    Producto prod = new Producto();
    ProductoDAO producdao = new ProductoDAO();
    CompraDAO comdap = new CompraDAO();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorCompra</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorCompra at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";
        String action = request.getParameter("accion");

        if (action.equalsIgnoreCase("consulta")) {
            acceso = listando ;

        } else if (action.equalsIgnoreCase("listardetalle")) {

            request.setAttribute("idcom", request.getParameter("id"));

            acceso = detalle;

        } else if (action.equalsIgnoreCase("Listar")) {
            numeroserie = comdap.GenerarSerie();
            if (numeroserie == null) {
                numeroserie = "0000001";
                request.setAttribute("nserie", numeroserie);
            } else {

                int incrementar = Integer.parseInt(numeroserie);
                Generarserie gs = new Generarserie();
                numeroserie = gs.NumeroSerie(incrementar);
                request.setAttribute("nserie", numeroserie);
            }

            acceso = listar;

            request.getRequestDispatcher("Formularios/Compras/CrearCompra.jsp").forward(request, response);

        } else if (action.equalsIgnoreCase("BuscarProveedor")) {

            request.setAttribute("nserie", numeroserie);
            String documento = request.getParameter("txtidproveeedor");
            prove.setNumerodocumento(documento);
            prove = provedao.buscarprov(documento);
            request.setAttribute("prov", prove);

            acceso = listar;

        } else if (action.equalsIgnoreCase("BuscarSede")) {
            request.setAttribute("prov", prove);
            request.setAttribute("nserie", numeroserie);
            int idsede = Integer.parseInt(request.getParameter("txtidsede"));
            sed.setId(idsede);
            sed = sedao.buscarsede(idsede);
            request.setAttribute("sedd", sed);

            acceso = listar;

        } else if (action.equalsIgnoreCase("Buscarproducto")) {
            request.setAttribute("sedd", sed);
            request.setAttribute("nserie", numeroserie);
            request.setAttribute("lista", lista);
            request.setAttribute("total", total);
            String nserie = request.getParameter("txtcodigoproducto");
            prod.setNserie(nserie);
            prod = producdao.Buscar(nserie);
            request.setAttribute("pro", prod);
            request.setAttribute("prov", prove);
            request.setAttribute("total", total);
            acceso = listar;

        } else if (action.equalsIgnoreCase("Agregar")) {
            request.setAttribute("nserie", numeroserie);
            request.setAttribute("prov", prove);
            request.setAttribute("sedd", sed);
            total = 0.0;
            com = new Compra();
            item = item + 1;
            codigo = prod.getIdprod();
            descripcion = request.getParameter("nombreproducto");
            precio = Double.parseDouble(request.getParameter("txtmonto"));
            cantidad = Double.parseDouble(request.getParameter("txtcantidad"));
            fecha = request.getParameter("txtfecha");
            subtotal = precio * cantidad;
            com.setItem(item);
            com.setIdproducto(codigo);
            com.setDescripcion(descripcion);
            com.setPrecio(precio);
            com.setCantidad(cantidad);
            com.setFecha(fecha);
            com.setSubtotal(subtotal);
            lista.add(com);
            for (int i = 0; i < lista.size(); i++) {
                total = total + lista.get(i).getSubtotal();
            }

            request.setAttribute("total", total);
            request.setAttribute("lista", lista);
            acceso = listar;

        } else if (action.equalsIgnoreCase("GenerarCompra")) {
            request.setAttribute("nserie", numeroserie);
            //actualizar stock
            for (int i = 0; i < lista.size(); i++) {
                Producto produc = new Producto();
                double cantidad = lista.get(i).getCantidad();
                int idprodd = lista.get(i).getIdproducto();
                ProductoDAO pdao = new ProductoDAO();
                produc = pdao.Buscarporid(idprodd);
                double sac = produc.getCantiadad() + cantidad;
                pdao.actualizarstock(idprodd, sac);
                //sac es stock actualizado
                produc = pdao.Buscarporid(idprodd);

                pdao.actualizarprecio(idprodd, precio);

            }

            // Guardar compra
            com.setIdsede(sed.getId());
            com.setIdproveedor(prove.getId());
            com.setNserie(numeroserie);
            com.setFecha(fecha);
            com.setMonto(total);
            comdap.GuardarCompra(com);
            //guarda detalle compra

            // para el detalle usaremos un for para que recorra la lista 
            //con la variable idventas ttomamos el ultimo valor de la clase compra para quer se agregue nuestro detalle recordemos primero crear el metodo idcompras en este caso
            int idcompra = Integer.parseInt(comdap.idcompras());

            for (int i = 0; i < lista.size(); i++) {

                Compra com = new Compra();

                com.setIdcompra(idcompra);
                //el id producto lo recibimos desde la propia lista
                com.setIdproducto(lista.get(i).getIdproducto());
                com.setCantidad(lista.get(i).getCantidad());
                com.setPrecio(lista.get(i).getPrecio());
                //aca vamoa a agregar los datos existentes en nuestra lista
                comdap.GuardarDetalleCompra(com);

            }

            lista.clear();
            acceso = listar;

        }
        numeroserie = comdap.GenerarSerie();
        if (numeroserie == null) {
            numeroserie = "0000001";
            request.setAttribute("nserie", numeroserie);
        } else {

            int incrementar = Integer.parseInt(numeroserie);
            Generarserie gs = new Generarserie();
            numeroserie = gs.NumeroSerie(incrementar);
            request.setAttribute("nserie", numeroserie);
        }

        RequestDispatcher vista = request.getRequestDispatcher(acceso);

        vista.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
