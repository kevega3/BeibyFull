package Controlador;

import Modelo.Producto;
import Modelo.Remision;
import ModeloDAO.ProductoDAO;
import ModeloDAO.RemisionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ControladorRemision", urlPatterns = {"/ControladorRemision"})
public class ControladorRemision extends HttpServlet {

    String listar = "Formularios/Remision/ListarRemision.jsp";
    String add = "Formularios/Remision/CrearRemision.jsp";
    String list = "Formularios/Remision/ListarDetalleRemision.jsp";
    Remision remi = new Remision();
    RemisionDAO dao = new RemisionDAO();
    double cantidad;
    int codigo;
    Producto prod = new Producto();
    ProductoDAO dao2 = new ProductoDAO();

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
            out.println("<title>Servlet ControladorRemision</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorRemision at " + request.getContextPath() + "</h1>");
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
        } else if (action.equalsIgnoreCase("mostrardetallerem")) {
            request.setAttribute("idrem", request.getParameter("id"));
            acceso = list;
        } else if (action.equalsIgnoreCase("BuscarP")) {
            String nserie = request.getParameter("txtcodigoproducto");
            prod = dao2.Buscar(nserie);
            request.setAttribute("pro", prod);
            acceso = add;
        } else if (action.equalsIgnoreCase("add")) {
            acceso = add;
        } else if (action.equalsIgnoreCase("Agregar")) {
            System.out.println("Entro Insercions");
            String fecha = request.getParameter("txtfecha");
            String sede = request.getParameter("id_sede");
            codigo = prod.getIdprod();
            cantidad = Double.parseDouble(request.getParameter("txtcantidad"));

            remi.setFecha(fecha);
            remi.setId_sede(sede);
            dao.add(remi);

            Remision remis = new Remision();
            int idremi = Integer.parseInt(dao.idremision());

            remis.setCantidad(cantidad);
            remis.setIdremision(idremi);
            remis.setIdproducto(codigo);
            dao.guardardetalleremision(remis);

            prod = dao2.Buscarporid(codigo);
            double sac = prod.getCantiadad() - cantidad;
            dao2.actualizarstock(codigo, sac);

            acceso = add;

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
