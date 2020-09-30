package Controlador;

import Modelo.Sede;
import ModeloDAO.SedeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ControladorSede", urlPatterns = {"/ControladorSede"})
public class ControladorSede extends HttpServlet {

    String listar = "Formularios/Sede/ListarSede.jsp";
    String add = "Formularios/Sede/CrearSede.jsp";
    String editar = "Formularios/Sede/EditarSede.jsp";
    Sede sed = new Sede();
    SedeDAO dao = new SedeDAO();

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
            out.println("<title>Servlet ControladorSede</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorSede at " + request.getContextPath() + "</h1>");
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
        }  else if (action.equalsIgnoreCase("add")) {
            acceso = add;
        } else if (action.equalsIgnoreCase("Agregar")) {
            System.out.println("Entro Insercions");
            String nombre = request.getParameter("txtnombre");
            String direccion = request.getParameter("txtdireccion");
            String barrio = request.getParameter("txtbarrio");

            sed.setNombre_sede(nombre);
            sed.setDireccion_sede(direccion);
            sed.setBarrio_sede(barrio);

            if (dao.duplicidad(nombre, direccion)) {
                String msj = "Error";
                request.setAttribute("duplicado", msj);
                acceso = add;
            } else {
                dao.add(sed);
                acceso = listar;
            }

        } else if (action.equalsIgnoreCase("editar")) {
            request.setAttribute("idsed", request.getParameter("id"));
            System.out.println("Entro Actualizacion");
            acceso = editar;
        } else if (action.equalsIgnoreCase("Actualizar")) {

            int id = Integer.parseInt(request.getParameter("txtid2"));
            String nombre = request.getParameter("txtnombre2");
            String direccion = request.getParameter("txtdireccion2");
            String barrio = request.getParameter("txtbarrio2");

            sed.setId(id);
            sed.setNombre_sede(nombre);
            sed.setDireccion_sede(direccion);
            sed.setBarrio_sede(barrio);
            dao.edit(sed);
            acceso = listar;

        } else if (action.equalsIgnoreCase("eliminar")) {
            int id = Integer.parseInt(request.getParameter("id"));
            sed.setId(id);
            dao.delete(id);
            acceso = listar;
        }
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

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
