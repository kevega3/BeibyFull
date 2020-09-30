package Controlador;

import Modelo.Novedad;
import Modelo.Producto;
import ModeloDAO.NovedadDAO;
import ModeloDAO.ProductoDAO;
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

@WebServlet(name = "ControladorNovedad", urlPatterns = {"/ControladorNovedad"})
public class ControladorNovedad extends HttpServlet {

    List<Novedad> lista = new ArrayList<>();

    String listar = "Formularios/Novedad/ListarNovedad.jsp";
    String add = "Formularios/Novedad/CrearNovedad.jsp";
    String list = "Formularios/Novedad/ListarDetalleNovedad.jsp";

    Novedad nov = new Novedad();
    NovedadDAO dao = new NovedadDAO();
    double cantidad;
    int codigo;
    Producto prod = new Producto();
    ProductoDAO dao2 = new ProductoDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorNovedad</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorNovedad at " + request.getContextPath() + "</h1>");
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
        if (action.equalsIgnoreCase("listar")) {

            acceso = listar;

        } else if (action.equalsIgnoreCase("BuscarP")) {

            String nserie = request.getParameter("txtcodigoproducto");

            prod = dao2.Buscar(nserie);
            request.setAttribute("pro", prod);
            acceso = add;

        } else if (action.equalsIgnoreCase("add")) {
            request.setAttribute("pro", prod);
            acceso = add;

        } else if (action.equalsIgnoreCase("listardnovedad")) {
            request.setAttribute("idnov", request.getParameter("id"));

            acceso = list;

        } else if (action.equalsIgnoreCase("Agregar")) {
            request.setAttribute("pro", prod);
            String descripcion = request.getParameter("txtdescripcion");
            String fecha = request.getParameter("txtfecha");
            String destino = request.getParameter("txtdestino");
            codigo = prod.getIdprod();
            cantidad = Double.parseDouble(request.getParameter("txtcantidad"));

            nov.setDescripcion(descripcion);
            nov.setFecha(fecha);
            nov.setDestino(destino);
            dao.guardarnovedad(nov);

            Novedad nove = new Novedad();
            int no = Integer.parseInt(dao.idnovedad());

            nove.setCantidad(cantidad);
            nove.setIdnovedad(no);
            nove.setIdproducto(codigo);
            dao.guardardetallenovedad(nove);

            prod = dao2.Buscarporid(codigo);
            double sac = prod.getCantiadad() - cantidad;
            dao2.actualizarstock(codigo, sac);

            acceso = listar;

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
