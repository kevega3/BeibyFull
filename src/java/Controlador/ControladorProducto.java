package Controlador;

import Modelo.Producto;
import ModeloDAO.ProductoDAO;
import java.util.ArrayList;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ControladorProducto", urlPatterns = {"/ControladorProducto"})
public class ControladorProducto extends HttpServlet {

    String listar = "Formularios/Producto/ListarProducto.jsp";
    String add = "Formularios/Producto/CrearProducto.jsp";
    String editar = "Formularios/Producto/EditarProducto.jsp";
    Producto prod = new Producto();
    ProductoDAO dao = new ProductoDAO();

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
            out.println("<title>Servlet ControladorProducto</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorProducto at " + request.getContextPath() + "</h1>");
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
          

            String nserie = request.getParameter("txtserie");
            String nombre = request.getParameter("txtnombre");
            double valor = Double.parseDouble(request.getParameter("txtvalor"));
            double existencias = Double.parseDouble(request.getParameter("txtexistencia"));
            String tipoProducto = request.getParameter("idtipoprod");
            String tipoMarca = request.getParameter("idmarca");
            String estado = "1";
            prod.setNserie(nserie);
            prod.setNombre(nombre);
            prod.setValor(valor);
            prod.setCantiadad(existencias);
            prod.setFkproducto(tipoProducto);
            prod.setFkmarca(tipoMarca);
            prod.setFkestado(estado);

            if (dao.duplicidad(nserie)) {
                String msj = "Error";
                request.setAttribute("duplicado", msj);
                acceso = add;
            } else {
                dao.add(prod);
                acceso = listar;
            }
            
              request.getRequestDispatcher("Formularios/Producto/CrearProducto.jsp").forward(request, response);

            //  request.getRequestDispatcher("Formularios/Producto/ListarProducto.jsp").forward(request, response);
        } else if (action.equalsIgnoreCase("editar")) {
            request.setAttribute("idpro", request.getParameter("codigo"));
            System.out.println("Entro Actualizacion");
            acceso = editar;

        } else if (action.equalsIgnoreCase("Actualizar")) {

            int id = Integer.parseInt(request.getParameter("txtcodigo2"));
            String nserie = request.getParameter("txtserie2");
            String nombre = request.getParameter("txtnombre2");
            double valor = Double.parseDouble(request.getParameter("txtvalor2"));
            double existencias = Double.parseDouble(request.getParameter("txtcantidad2"));
            String estado = "1";

            prod.setIdprod(id);
            prod.setNserie(nserie);
            prod.setNombre(nombre);
            prod.setValor(valor);
            prod.setCantiadad(existencias);

            prod.setFkestado(estado);
            dao.edit(prod);
            acceso = listar;

        } else if (action.equalsIgnoreCase("eliminar")) {
            int id = Integer.parseInt(request.getParameter("id"));
            prod.setIdprod(id);
            dao.delete(id);
            acceso = listar;

        }

        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> methovcd.
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
