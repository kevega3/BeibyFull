package ModeloDAO;

import Config.Conexion;
import Modelo.TipoProducto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TipoProductoDAO implements Interfaces.CRUDTIPOPRODUCTO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement statement;
    ResultSet rs;
    TipoProducto tproducto = new TipoProducto();

    @Override
    public List listar() {
        ArrayList<TipoProducto> list = new ArrayList<>();
        String sql = "SELECT * FROM tipo_producto";
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
            while (rs.next()) {
                TipoProducto tip = new TipoProducto();
                tip.setId(rs.getInt("Id_TIpo_Producto"));
                tip.setTipoproducto(rs.getString("Nombre_Tipo_Producto"));
                list.add(tip);
            }
        } catch (Exception e) {
        }
        return list;
    }

    @Override
    public TipoProducto list(int id) {

        String sql = "SELECT *  FROM tipo_producto where Id_Tipo_Producto =" + id;
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
            while (rs.next()) {
                tproducto.setId(rs.getInt("Id_Tipo_Producto"));
                tproducto.setTipoproducto(rs.getString("Nombre_Tipo_Producto"));
            }
        } catch (Exception e) {
        }
        return tproducto;
    }

    public boolean add(TipoProducto tipoproducto) {
        String sql = " INSERT INTO tipo_producto ( Nombre_Tipo_Producto) VALUES ('" + tipoproducto.getTipoproducto() + "')";

        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            statement.executeUpdate();
        } catch (Exception e) {

        }
        return false;

    }

    public boolean edit(TipoProducto tipoproducto) {
        String sql = "Update tipo_producto set Nombre_Tipo_Producto='" + tipoproducto.getTipoproducto() + "' WHERE Id_Tipo_Producto=" + tipoproducto.getId();
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
        String sql = "DELETE FROM tipo_producto WHERE  Id_Tipo_Producto=" + id;
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            statement.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    public boolean duplicidad(String nombre) {

        TipoProducto tp = new TipoProducto();
        String sql = "SELECT * FROM  tipo_producto WHERE Nombre_Tipo_Producto ='" + nombre + "'  ";

        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {
                tp.setId(rs.getInt("Id_Tipo_Producto"));
                tp.setTipoproducto(rs.getString("Nombre_Tipo_Producto"));

                return true;
            }

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return false;
    }

    public TipoProducto buscar(String nombre) {
        TipoProducto tp = null;
        String sql = "SELECT * FROM  tipo_producto WHERE Nombre_Tipo_Producto ='" + nombre + "'  ";
        try {

            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {
                tp = new TipoProducto();
                tp.setId(rs.getInt("Id_Tipo_Producto"));
                tp.setTipoproducto(rs.getString("Nombre_Tipo_Producto"));
            }

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return tp;
    }

    public ResultSet listartp() {
        String sql = "Select * From tipo_producto";
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
        } catch (Exception e) {
        }
        return rs;
    }
}
