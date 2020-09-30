package Controlador;

import Config.Generarserie;
import Modelo.Cliente;
import Modelo.Persona;
import Modelo.Producto;
import Modelo.Venta;
import ModeloDAO.ClienteDAO;
import ModeloDAO.PersonaDAO;
import ModeloDAO.ProductoDAO;
import ModeloDAO.VentaDAO;
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

@WebServlet(name = "ControladorVenta", urlPatterns = {"/ControladorVenta"})
public class ControladorVenta extends HttpServlet {

    String listar = "Formularios/Venta/CrearVenta.jsp";
    String listardetalle = "Formularios/Venta/ListarDetalleVenta.jsp";

    String consultar = "Formularios/Venta/ListarVenta.jsp";

    Persona per = new Persona();
    PersonaDAO pdao = new PersonaDAO();
    Cliente cl = new Cliente();
    ClienteDAO dao = new ClienteDAO();
    Producto prod = new Producto();
    ProductoDAO dao2 = new ProductoDAO();
    Venta ven = new Venta();
    List<Venta> lista = new ArrayList<>();
    int item;
    int codigo;
    String descripcion;
    String fecha;
    double precio;
    double cantidad;
    double subtotal;
    double total;
    String numeroserie;
    VentaDAO vdao = new VentaDAO();

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
            out.println("<title>Servlet ControladorVenta</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorVenta at " + request.getContextPath() + "</h1>");
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
            acceso = consultar;
        }
        if (action.equalsIgnoreCase("verdetalle")) {
            request.setAttribute("iddven", request.getParameter("id"));
            acceso = listardetalle;
        } else if (action.equalsIgnoreCase("Listar")) {
            acceso = listar;
            numeroserie = vdao.GenerarSerie();
            if (numeroserie == null) {
                numeroserie = "0000001";
                request.setAttribute("nserie", numeroserie);
            } else {
                int incrementar = Integer.parseInt(numeroserie);
                Generarserie gs = new Generarserie();
                numeroserie = gs.NumeroSerie(incrementar);
                request.setAttribute("nserie", numeroserie);
            }
            request.getRequestDispatcher("Formularios/Venta/CrearVenta.jsp").forward(request, response);

        } else if (action.equalsIgnoreCase("BuscarE")) {
            String numerodocumento = request.getParameter("txtidemple");

            per = pdao.buscar(numerodocumento);

            request.setAttribute("pers", per);
            request.setAttribute("nserie", numeroserie);
            acceso = listar;

        } else if (action.equalsIgnoreCase("BuscarC")) {

            request.setAttribute("nserie", numeroserie);
            request.setAttribute("pers", per);

            String numerodocumento = request.getParameter("txtcodigocliente");

            cl = dao.buscar(numerodocumento);

            request.setAttribute("c", cl);

            acceso = listar;

        } else if (action.equalsIgnoreCase("BuscarP")) {
            request.setAttribute("nserie", numeroserie);
            request.setAttribute("pers", per);

            String nserie = request.getParameter("txtcodigoproducto");

            prod = dao2.Buscar(nserie);
            request.setAttribute("pro", prod);
            request.setAttribute("c", cl);

            request.setAttribute("lista", lista);
            request.setAttribute("total", total);
            acceso = listar;

        } else if (action.equalsIgnoreCase("Agregar")) {
            request.setAttribute("pers", per);
            request.setAttribute("c", cl);
            request.setAttribute("nserie", numeroserie);
            total = 0.0;
            ven = new Venta();
            item = item + 1;

            codigo = prod.getIdprod();
            descripcion = request.getParameter("nombreproducto");
            precio = Double.parseDouble(request.getParameter("txtmonto"));
            cantidad = Double.parseDouble(request.getParameter("txtcantidad"));
            fecha = request.getParameter("txtfecha");

            subtotal = precio * cantidad;

            ven.setItem(item);
            ven.setIdproducto(codigo);
            ven.setDescripcion(descripcion);
            ven.setPrecio(precio);
            ven.setCantidad(cantidad);
            ven.setFecha(fecha);
            ven.setSubtotal(subtotal);
            lista.add(ven);

            for (int i = 0; i < lista.size(); i++) {
                total = total + lista.get(i).getSubtotal();
            }

            request.setAttribute("total", total);

            request.setAttribute("lista", lista);
            acceso = listar;
        } else if (action.equalsIgnoreCase("GenerarVenta")) {

            for (int i = 0; i < lista.size(); i++) {
                Producto produc = new Producto();
                double cantidad = lista.get(i).getCantidad();
                int idprodd = lista.get(i).getIdproducto();
                ProductoDAO pdao = new ProductoDAO();
                produc = pdao.Buscarporid(idprodd);
                double sac = produc.getCantiadad() - cantidad;
                pdao.actualizarstock(idprodd, sac);
            }

            request.setAttribute("nserie", numeroserie);

// Acá guardamos en la tabla venta
            ven.setIdcliente(cl.getId());
            ven.setIdempleado(per.getId());
            ven.setNserie(numeroserie);

            ven.setFecha(fecha);
            ven.setMonto(total);
            ven.setEstado("1");
            vdao.guardarventa(ven);

// acá guardamos el detalle 
            int idventa = Integer.parseInt(vdao.idventas());
            for (int i = 0; i < lista.size(); i++) {
                Venta vent = new Venta();
                vent.setId(idventa);
                vent.setIdproducto(lista.get(i).getIdproducto());
                vent.setCantidad(lista.get(i).getCantidad());
                vent.setPrecio(lista.get(i).getPrecio());
                vdao.guardardetalleventas(vent);
            }

            lista.clear();
            acceso=listar;

        }

        numeroserie = vdao.GenerarSerie();
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
