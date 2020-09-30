package Controlador;

import Modelo.TipoDocumento;
import ModeloDAO.TipoDocumentoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ControladorTipoDocumento", urlPatterns = {"/ControladorTipoDocumento"})
public class ControladorTipoDocumento extends HttpServlet {

    String listar = "Formularios/Tipo_Documento/ListarTipoDocumento.jsp";
    String add = "Formularios/Tipo_Documento/CrearTipoDocumento.jsp";
    String editar = "Formularios/Tipo_Documento/EditarTipoDocumento.jsp";
    TipoDocumento tipodocumento = new TipoDocumento();
    TipoDocumentoDAO dao = new TipoDocumentoDAO();

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
            out.println("<title>Servlet ControladorTipoDocumento</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorTipoDocumento at " + request.getContextPath() + "</h1>");
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
        } else if (action.equalsIgnoreCase("add")) {
            acceso = add;
        } else if (action.equalsIgnoreCase("Agregar")) {
            String nombre = request.getParameter("txtnombre");

            tipodocumento.setNombre(nombre);

            if (dao.duplicidad(nombre)) {
                String msj = "Error";
                request.setAttribute("duplicado", msj);
                acceso = add;
            } else {
                dao.add(tipodocumento);
                acceso = listar;
            }
        } else if (action.equalsIgnoreCase("editar")) {
            request.setAttribute("idtipodoc", request.getParameter("id"));
            acceso = editar;

        } else if (action.equalsIgnoreCase("Actualizar")) {
            int id = Integer.parseInt(request.getParameter("txtid"));
            String nombre = request.getParameter("txtnombre");
            tipodocumento.setId(id);
            tipodocumento.setNombre(nombre);
            dao.edit(tipodocumento);
            acceso = listar;

        } else if (action.equalsIgnoreCase("eliminar")) {
            int id = Integer.parseInt(request.getParameter("id"));
            tipodocumento.setId(id);
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
