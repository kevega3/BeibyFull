package Controlador;

import Modelo.Proveedor;
import ModeloDAO.ProveedorDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ControladorProveedor", urlPatterns = {"/ControladorProveedor"})
public class ControladorProveedor extends HttpServlet {
String listar = "Formularios/Proveedor/ListarProveedor.jsp";
    String add = "Formularios/Proveedor/CrearProveedor.jsp";
    String editar = "Formularios/Proveedor/EditarProveedor.jsp";
    Proveedor prov = new Proveedor();
    ProveedorDAO dao = new ProveedorDAO();
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
            out.println("<title>Servlet ControladorProveedor</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorProveedor at " + request.getContextPath() + "</h1>");
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
            String numerodocumento = request.getParameter("txtnumerodoc");
            String nombre = request.getParameter("txtnombre");
            String direccion = request.getParameter("txtdireccion");
            String numeroconetacto = request.getParameter("txtnumerocontacto");
            String fktipodocumento = request.getParameter("id_tipodocumento");
            
            prov.setNumerodocumento(numerodocumento);
            prov.setNombre(nombre);
            prov.setDireccion(direccion);
            prov.setNumerocontacto(numeroconetacto);
            prov.setFktipodoc(fktipodocumento);
             if (dao.duplicidad(numerodocumento, nombre, numeroconetacto, direccion)){
                String msj = "Error";
                request.setAttribute("duplicado", msj);
                acceso = add;
            } else {
                dao.add(prov);
            acceso = listar;
            }
              request.getRequestDispatcher("Formularios/Proveedor/CrearProveedor.jsp").forward(request, response);

            
            
            

        } else if (action.equalsIgnoreCase("editar")) {
            request.setAttribute("idprov", request.getParameter("id"));  
            System.out.println("Entro Actualizacion");
            acceso = editar;
        } else if (action.equalsIgnoreCase("Actualizar")) {

            int id = Integer.parseInt(request.getParameter("txtid"));
            String numerodocumento = request.getParameter("txtnumerodoc2");
            String nombre = request.getParameter("txtnombre2");
            String direccion = request.getParameter("txtdireccion2");
            String numeroconetacto = request.getParameter("txtnumerocontacto2");
            
            prov.setId(id);
            prov.setNumerodocumento(numerodocumento);
            prov.setNombre(nombre);
            prov.setDireccion(direccion);
            prov.setNumerocontacto(numeroconetacto);   
            
            
            dao.edit(prov);
            acceso = listar;

        } else if (action.equalsIgnoreCase("eliminar")) {
            int id = Integer.parseInt(request.getParameter("id"));
            prov.setId(id);
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
