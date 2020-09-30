package ModeloDAO;

import Config.Conexion;
import Modelo.Novedad;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class NovedadDAO implements Interfaces.CRUDNOVEDAD {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement statement;
    ResultSet rs;
    Novedad noved = new Novedad();

    @Override
    public List listarnovedad() {
        ArrayList<Novedad> list = new ArrayList<>();
        String sql = "SELECT * FROM novedad";
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {
                Novedad nov = new Novedad();
                nov.setIdnovedad(rs.getInt("Id_Novedad"));
                nov.setDescripcion(rs.getString("Descripcion"));
                nov.setFecha(rs.getString("Fecha"));
                nov.setDestino(rs.getString("Destino"));
                list.add(nov);
            }
        } catch (Exception e) {

        }
        return list;
    }

    @Override
    public Novedad list(int id) {

        String sql = "SELECT * FROM novedad WHERE Id_Novedad = " + id;
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
            while (rs.next()) {
                noved.setIdnovedad(rs.getInt("Id_Novedad"));
                noved.setDescripcion(rs.getString("Descripcion"));
                noved.setFecha(rs.getString("Fecha"));
                noved.setDestino(rs.getString("Destino"));
            }
        } catch (Exception e) {
        }
        return noved;
    }

    @Override
    public boolean guardarnovedad(Novedad novedad) {

        String sql = "INSERT INTO novedad (Descripcion, Fecha, Destino) VALUES ('" + novedad.getDescripcion() + "','" + novedad.getFecha() + "','" + novedad.getDestino() + "')";
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            statement.executeUpdate();

        } catch (Exception e) {
        }

        return false;
    }

    @Override
    public boolean edit(Novedad novedad) {
        String sql = "UPDATE novedad SET Descripcion='" + novedad.getDescripcion() + "', Fecha='" + novedad.getFecha() + "', Destino='" + novedad.getDestino() + "' WHERE Id_Novedad = " + novedad.getIdnovedad();
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            statement.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        String sql = "DELETE FROM novedad WHERE Id_Novedad =" + id;
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            statement.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean guardardetallenovedad(Novedad novedad) {

        String sql = "INSERT INTO detalle_producto_novedad(Cantidad, fk_idnovedad, fk_producto) VALUES ('" + novedad.getCantidad() + "','" + novedad.getIdnovedad() + "','" + novedad.getIdproducto() + "')";
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            statement.executeUpdate();

        } catch (Exception e) {
        }

        return false;
    }

    @Override
    public String idnovedad() {

        String idnovedad = "";
        String sql = "SELECT MAX(Id_Novedad) AS Id_Novedad FROM novedad ";

        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {
                idnovedad = rs.getString("Id_Novedad");
            }

        } catch (Exception e) {
        }

        return idnovedad;
    }

    public ResultSet listarnovedades() {
        String sql = "Select * From novedad";
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
        } catch (Exception e) {
        }
        return rs;

    }

    public ResultSet listardetallenov(int id) {
        String sql = "SELECT Id_Detalle_Productosede_Novedad, Cantidad, fk_idnovedad, producto.Nombre FROM detalle_producto_novedad  INNER JOIN producto on  detalle_producto_novedad.fk_producto=producto.codigo WHERE fk_idnovedad ='" + id + "'";
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
        } catch (Exception e) {
        }
        return rs;
    }
}
