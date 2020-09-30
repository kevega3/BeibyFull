package Controlador;

import Config.Email;
import Modelo.Persona;
import ModeloDAO.PersonaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javafx.scene.control.Alert;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ControladorPersona", urlPatterns = {"/ControladorPersona"})
public class ControladorPersona extends HttpServlet {

    String listar = "Formularios/Persona/ListarPersona.jsp";
    String add = "Formularios/Persona/CrearPersona.jsp";
    String editar = "Formularios/Persona/EditarPersona.jsp";
    String clavess = "LOGIN/CambiarClave.jsp";
    String login = "LOGIN/login.jsp";

    Persona pers = new Persona();
    PersonaDAO dao = new PersonaDAO();
    Email email = new Email();

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
            out.println("<title>Servlet ControladorPersona</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorPersona at " + request.getContextPath() + "</h1>");
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

            System.out.println("Entro Insercions");
            String nombres = request.getParameter("txtnombres");
            String apellidos = request.getParameter("txtapellidos");
            String tipodocumento = request.getParameter("id_tipodocumento");
            String numerodocumento = request.getParameter("txtnombredoc");
            String correo = request.getParameter("txtcorreo");
            String clave = request.getParameter("txtclave");
            String telefono = request.getParameter("txttelefono");
            String direccion = request.getParameter("txtdireccion");
            String estadp = "1";
            String rol = request.getParameter("id_rol");

            pers.setNombres(nombres);
            pers.setApellidos(apellidos);
            pers.setId_tipodocumento(tipodocumento);
            pers.setNumerodocumento(numerodocumento);
            pers.setCorreo(correo);
            pers.setClave(clave);
            pers.setTelefono(telefono);
            pers.setDireccion(direccion);
            pers.setId_estado(estadp);
            pers.setId_rol(rol);

            if (dao.duplicidad(correo, numerodocumento)) {
                String msj = "Error";

                request.setAttribute("duplicado", msj);
                acceso = add;
            } else {

                String msj = "correcto";

                request.setAttribute("correcto", msj);

                dao.add(pers);
                email.enviarCorreo(correo, clave);
                acceso = listar;
            }

            request.getRequestDispatcher("Formularios/Persona/CrearPersona.jsp").forward(request, response);

        } else if (action.equalsIgnoreCase("editar")) {
            request.setAttribute("idpers", request.getParameter("id"));
            System.out.println("Entro Actualizacion");
            acceso = editar;
        } else if (action.equalsIgnoreCase("Actualizar")) {

            int id = Integer.parseInt(request.getParameter("txtid"));
            String nombres = request.getParameter("txtnombres");
            String apellidos = request.getParameter("txtapellidos");
            String tipodocumento = request.getParameter("id_tipodocumento");
            String numerodocumento = request.getParameter("txtnombredoc");
            String correo = request.getParameter("txtcorreo");
            String clave = request.getParameter("txtclave");
            String telefono = request.getParameter("txttelefono");
            String direccion = request.getParameter("txtdireccion");
            String estadp = "1";
            String rol = request.getParameter("id_rol");

            pers.setId(id);
            pers.setNombres(nombres);
            pers.setApellidos(apellidos);
            pers.setId_tipodocumento(tipodocumento);
            pers.setNumerodocumento(numerodocumento);
            pers.setCorreo(correo);
            pers.setClave(clave);
            pers.setTelefono(telefono);
            pers.setDireccion(direccion);
            pers.setId_estado(estadp);
            pers.setId_rol(rol);

            dao.edit(pers);
            acceso = listar;

        } else if (action.equalsIgnoreCase("eliminar")) {
            int id = Integer.parseInt(request.getParameter("id"));
            pers.setId(id);
            dao.delete(id);
            acceso = listar;
        } else if (action.equalsIgnoreCase("cla")) {

            acceso = clavess;
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
        String acceso = "";
        String action = request.getParameter("accion");

        if (action.equalsIgnoreCase("cambiosclave")) {
            String correo = request.getParameter("txtcorreo");
            String clave = request.getParameter("txtclave");
            pers.setClave(clave);
            pers.setCorreo(correo);

            if (dao.clave(correo)) {
                String msj = "ok";

                request.setAttribute("correcto", msj);
                dao.cambiarclave(pers);
                email.Recuperarcontra(correo, clave);

                acceso = clavess;

            } else {
                String msj = "Error";

                request.setAttribute("vacio", msj);
                acceso = clavess;
            }

        }

        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
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
