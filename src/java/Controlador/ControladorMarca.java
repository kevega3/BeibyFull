package Controlador;

import Modelo.Marca;
import ModeloDAO.MarcaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ControladorMarca", urlPatterns = {"/ControladorMarca"})
public class ControladorMarca extends HttpServlet {

    String listar = "Formularios/Marca/ListarMarca.jsp";
    String add = "Formularios/Marca/CrearMarca.jsp";
    String editar = "Formularios/Marca/EditarMarca.jsp";
    Marca marca = new Marca();
    MarcaDAO dao = new MarcaDAO();

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
            out.println("<title>Servlet ControladorMarca</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorMarca at " + request.getContextPath() + "</h1>");
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
            acceso =listar;
        } else if (action.equalsIgnoreCase("add")) {
            acceso = add;
        } else if (action.equalsIgnoreCase("Agregar")) {

            String nombres = request.getParameter("txtnombres");
            marca.setNombre(nombres);

            if (dao.duplicidad(nombres)) {
                String msj = "Error";
                request.setAttribute("duplicado", msj);
                acceso = add;
            } else {
                dao.add(marca);
                acceso = listar;
            }

        } else if (action.equalsIgnoreCase("editar")) {
            request.setAttribute("idmarca", request.getParameter("id"));
            System.out.println("Entro Actualizacion");
            acceso = editar;
        } else if (action.equalsIgnoreCase("Actualizar")) {

            int id = Integer.parseInt(request.getParameter("txtid"));
            String nombres = request.getParameter("txtnombres2");

            marca.setId(id);
            marca.setNombre(nombres);

            dao.edit(marca);
            acceso = listar;

        } else if (action.equalsIgnoreCase("eliminar")) {
            int id = Integer.parseInt(request.getParameter("id"));
            marca.setId(id);
            dao.delete(id);
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
