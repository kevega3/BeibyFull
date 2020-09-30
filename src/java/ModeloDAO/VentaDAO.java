package ModeloDAO;

import Config.Conexion;
import Modelo.Venta;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class VentaDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement statement;
    ResultSet rs;
    Venta ven = new Venta();

    public String GenerarSerie() {
        String numerodeserie = "";

        String sql = "select max(numero_serie) as numero_serie from  ventas ";

        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {
                numerodeserie = rs.getString("numero_serie");
            }

        } catch (Exception e) {
        }

        return numerodeserie;

    }

    public String idventas() {

        String idventas = "";
        String sql = "Select max(id) as id from  ventas ";

        try {

            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {
                idventas = rs.getString("id");

            }

        } catch (Exception e) {
        }

        return idventas;

    }

    public boolean guardarventa(Venta venta) {

        String sql = "INSERT INTO ventas (FK_IdCliente, fk_persona, numero_serie, Fecha, Monto, Estado) VALUES ('" + venta.getIdcliente() + "','" + venta.getIdempleado() + "','" + venta.getNserie() + "','" + venta.getFecha() + "','" + venta.getMonto() + "','" + venta.getEstado() + "')";

        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            statement.executeUpdate();

        } catch (Exception e) {
        }

        return false;
    }

    public boolean guardardetalleventas(Venta venta) {
        String sql = "INSERT INTO detalle_venta (fk_idventa,fk_idproducto,Cantidad,precio) VALUES ('" + venta.getId() + "','" + venta.getIdproducto() + "','" + venta.getCantidad() + "','" + venta.getPrecio() + "')";
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            statement.executeUpdate();

        } catch (Exception e) {
        }

        return false;
    }

    public boolean editarventa(Venta venta) {

        String sql = "Update sede ventas set FK_IdCliente ='" + venta.getIdcliente() + "',fk_persona='" + venta.getIdempleado() + "',  Fecha='" + venta.getFecha() + "', Monto = '" + venta.getMonto() + "' , Estado='" + venta.getEstado() + "' WHERE numero_serie ='" + venta.getNserie() + "'  ";

        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            statement.executeUpdate();

        } catch (Exception e) {

        }

        return false;
    }

    public List listar() {

        List<Venta> lista = new ArrayList<>();
        //String sql = "SELECT id, cliente.Nombres,persona.Nombres, numero_serie, Fecha, Monto,Estado FROM ventas INNER JOIN  cliente on ventas.FK_IdCliente=cliente.Id_Cliente INNER JOIN persona on  ventas.fk_persona=persona.Id_Persona  ";
        // String sql = "SELECT id, cliente.Nombres,persona.Nombre, numero_serie, Fecha, Monto,Estado FROM ventas INNER JOIN  cliente on ventas.FK_IdCliente=cliente.Id_Cliente INNER JOIN persona on  ventas.fk_persona=persona.Id_Persona";

        String sql = "Select * From ventas";
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {
                ven = new Venta();
                ven.setId(rs.getInt("id"));
                ven.setIdcliente(rs.getInt("FK_IdCliente"));
                ven.setIdempleado(rs.getInt("fk_persona"));
                ven.setNserie(rs.getString("numero_serie"));
                ven.setFecha(rs.getString("Fecha"));
                ven.setMonto(rs.getDouble("Monto"));
                ven.setEstado(rs.getString("Estado"));
                lista.add(ven);

            }
        } catch (Exception e) {
        }

        return lista;
    }

    public ResultSet listarventa() {
        String sql = "SELECT id, cliente.Nombres,persona.Nombre, numero_serie, Fecha, Monto FROM ventas INNER JOIN  cliente on ventas.FK_IdCliente=cliente.Id_Cliente INNER JOIN persona on  ventas.fk_persona=persona.Id_Persona";
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
        } catch (Exception e) {
        }
        return rs;
    }

    public ResultSet listardetallerv(int id) {
        String sql = "SELECT id_detalle_venta, ventas.numero_serie, producto.Nombre, Cantidad, precio FROM detalle_venta \n INNER JOIN ventas on detalle_venta.fk_idventa=ventas.id INNER JOIN producto on detalle_venta.fk_idproducto=producto.codigo WHERE fk_idventa ='" + id + "'";
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
        } catch (Exception e) {
        }
        return rs;
    }
}
