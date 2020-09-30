package ModeloDAO;

import Config.Conexion;
import Modelo.Remision;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class RemisionDAO implements Interfaces.CRUDREMISION {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement statement;
    ResultSet rs;
    Remision remis = new Remision();

    public List listar() {
        ArrayList<Remision> list = new ArrayList<>();
        String sql = "SELECT * FROM remision";
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {
                Remision rem = new Remision();
                rem.setIdremision(rs.getInt("Id_Remision"));
                rem.setFecha(rs.getString("Fecha"));
                rem.setId_sede(rs.getString("fk_sede"));
                list.add(rem);
            }

        } catch (Exception e) {

        }
        return list;
    }

    public boolean add(Remision remision) {
        String sql = "INSERT INTO remision (Fecha, fk_sede) VALUES ('" + remision.getFecha() + "','" + remision.getId_sede() + "')";

        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            statement.executeUpdate();
        } catch (Exception e) {

        }

        return false;
    }

    public boolean guardardetalleremision(Remision remision) {

        String sql = "INSERT INTO detalle_detalleproductosede_remision (Cantidad, fk_idremision,fkidprod ) VALUES ('" + remision.getCantidad() + "','" + remision.getIdremision() + "','" + remision.getIdproducto() + "')";

        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            statement.executeUpdate();
        } catch (Exception e) {

        }

        return false;
    }

    public boolean edit(Remision remision) {

        return false;
    }

    public boolean delete(int id) {

        return false;
    }

    @Override
    public Remision list(int id) {

        return remis;

    }

    public ResultSet mostrarsede() {

        String sql = "SELECT Id_Sede, Nombre_Sede FROM sede ";
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
        } catch (Exception e) {
        }

        return rs;

    }

    public String idremision() {

        String idremision = "";
        String sql = "SELECT MAX(Id_DetalleProductoSede_Remision ) AS Id_DetalleProductoSede_Remision  FROM detalle_detalleproductosede_remision ";

        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {
                idremision = rs.getString("Id_DetalleProductoSede_Remision");
            }

        } catch (Exception e) {
        }

        return idremision;
    }

    public ResultSet listarremi() {
        String sql = "SELECT Id_Remision, Fecha, sede.Nombre_Sede FROM remision INNER JOIN sede on remision.fk_sede = sede.Id_Sede";
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
        } catch (Exception e) {
        }
        return rs;

    }

    public ResultSet listardetallerem(int id) {
        String sql = " SELECT Id_DetalleProductoSede_Remision, Cantidad, fk_idremision, producto.Nombre FROM detalle_detalleproductosede_remision INNER JOIN producto on detalle_detalleproductosede_remision.fkidprod=producto.codigo  WHERE fk_idremision ='" + id + "'";
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
        } catch (Exception e) {
        }
        return rs;

    }
}
