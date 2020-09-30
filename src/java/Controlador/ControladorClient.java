package Controlador;

import Modelo.Cliente;
import ModeloDAO.ClienteDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ControladorClient", urlPatterns = {"/ControladorClient"})
public class ControladorClient extends HttpServlet {

    String listar = "Formularios/Cliente/ListarCliente.jsp";
    String add = "Formularios/Cliente/CrearCliente.jsp";
    String editar = "Formularios/Cliente/EditarCliente.jsp";
    Cliente client = new Cliente();
    ClienteDAO dao = new ClienteDAO();

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
            out.println("<title>Servlet ControladorClient</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorClient at " + request.getContextPath() + "</h1>");
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

            String documento = request.getParameter("txtnumerodocumento");
            String nom = request.getParameter("txtnombres");
            String apellido = request.getParameter("txtapellidos");
            String corre = request.getParameter("txtcorreoelectronico");
            String numer = request.getParameter("txttelefono");
            String direc = request.getParameter("txtdireccion");

            client.setNumerodocumento(documento);
            client.setNombres(nom);
            client.setApellidos(apellido);
            client.setCorreo(corre);
            client.setNumero(numer);
            client.setDireccion(direc);

            if (dao.duplicidad(documento, corre, numer)) {
                String msj = "Error ";
                request.setAttribute("duplicado", msj);
             

            } else {

                dao.add(client);
                acceso = listar;
            }
            request.getRequestDispatcher("Formularios/Cliente/CrearCliente.jsp").forward(request, response);

        } else if (action.equalsIgnoreCase("editar")) {
            request.setAttribute("idclien", request.getParameter("id"));
            acceso = editar;

        } else if (action.equalsIgnoreCase("Actualizar")) {
            int id = Integer.parseInt(request.getParameter("txtid"));
            String documento = request.getParameter("txtnumerodocumento2");
            String nom = request.getParameter("txtnombres2");
            String apellido = request.getParameter("txtapellidos2");
            String corre = request.getParameter("txtcorreoelectronico2");
            String numer = request.getParameter("txttelefono2");
            String direc = request.getParameter("txtdireccion2");
            client.setId(id);
            client.setNumerodocumento(documento);
            client.setNombres(nom);
            client.setApellidos(apellido);
            client.setCorreo(corre);
            client.setNumero(numer);
            client.setDireccion(direc);

            dao.edit(client);
            acceso = listar;

        } else if (action.equalsIgnoreCase("eliminar")) {
            int id = Integer.parseInt(request.getParameter("id"));
            client.setId(id);
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
