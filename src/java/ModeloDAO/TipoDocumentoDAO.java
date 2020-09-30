package ModeloDAO;

import Config.Conexion;
import Modelo.TipoDocumento;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TipoDocumentoDAO implements Interfaces.CRUDTIPODOCUMENTO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement statement;
    ResultSet rs;
    TipoDocumento tipodocumento = new TipoDocumento();

    @Override
    public List listar() {
        ArrayList<TipoDocumento> list = new ArrayList<>();
        String sql = "SELECT * FROM tipo_documento";
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {
                TipoDocumento tipdoc = new TipoDocumento();
                tipdoc.setId(rs.getInt("Id_Tipo_Documento"));
                tipdoc.setNombre(rs.getString("Nombre_Tipo_Documento"));
                list.add(tipdoc);

            }
        } catch (Exception e) {
        }

        return list;
    }

    @Override
    public TipoDocumento list(int id) {

        String sql = "SELECT * FROM tipo_documento WHERE Id_Tipo_Documento =" + id;
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {
                tipodocumento.setId(rs.getInt("Id_Tipo_Documento"));
                tipodocumento.setNombre(rs.getString("Nombre_Tipo_Documento"));
            }
        } catch (Exception e) {
        }

        return tipodocumento;
    }

    @Override
    public boolean add(TipoDocumento tipodoc) {
        String sql = "INSERT INTO tipo_documento(Nombre_Tipo_Documento) VALUES ('" + tipodoc.getNombre() + "')";

        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            statement.executeUpdate();
        } catch (Exception e) {

        }

        return false;

    }

    @Override
    public boolean edit(TipoDocumento tipodoc) {
        String sql = "UPDATE tipo_documento set Nombre_Tipo_Documento = '" + tipodoc.getNombre() + "' WHERE Id_Tipo_Documento = " + tipodoc.getId();
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
        String sql = "Delete From tipo_documento WHERE Id_Tipo_Documento =" + id;
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            statement.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    public boolean duplicidad(String nombre) {
        TipoDocumento tp = new TipoDocumento();
        String sql = "SELECT * FROM  tipo_documento WHERE Nombre_Tipo_Documento ='" + nombre + "'  ";

        try {

            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {
                tp.setId(rs.getInt("Id_Tipo_Documento"));
                tp.setNombre(rs.getString("Nombre_Tipo_Documento"));

                return true;

            }

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return false;

    }

    public TipoDocumento buscar(String ndoc) {
        TipoDocumento ti = null;
        String sql = "SELECT * FROM  tipo_documento WHERE Nombre_Tipo_Documento ='" + ndoc + "'";
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {
                ti = new TipoDocumento();
                ti.setId(rs.getInt("Id_Tipo_Documento"));
                ti.setNombre(rs.getString("Nombre_Tipo_Documento"));

            }
        } catch (Exception e) {
        }
        return ti;
    }

    public ResultSet listartd() {
        String sql = "Select * From tipo_documento";
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
        } catch (Exception e) {
        }
        return rs;
    }
}
