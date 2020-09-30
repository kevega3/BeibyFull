package ModeloDAO;

import Config.Conexion;
import Modelo.Proveedor;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProveedorDAO implements Interfaces.CRUDPROVEEDOR {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement statement;
    ResultSet rs;
    Proveedor prov = new Proveedor();

    @Override
    public List listar() {
        ArrayList<Proveedor> list = new ArrayList<>();
        String sql = "SELECT `Id_Proveedor`, `numero_documento`, `Nombre`, `Direccion`, `Numero_Contacto`, tipo_documento.Nombre_Tipo_Documento FROM `proveedor` INNER JOIN   tipo_documento ON proveedor.fk_tipodoc= tipo_documento.Id_Tipo_Documento ";
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {
                Proveedor prv = new Proveedor();

                prv.setId(rs.getInt("Id_Proveedor"));
                prv.setNumerodocumento(rs.getString("numero_documento"));
                prv.setNombre(rs.getString("Nombre"));
                prv.setDireccion(rs.getString("Direccion"));
                prv.setNumerocontacto(rs.getString("Numero_Contacto"));
                prv.setFktipodoc(rs.getString("tipo_documento.Nombre_Tipo_Documento"));

                list.add(prv);
            }
        } catch (Exception e) {

        }
        return list;
    }

    @Override
    public Proveedor list(int id) {

        String sql = "select * from proveedor where Id_Proveedor =" + id;
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {

                prov.setId(rs.getInt("Id_Proveedor"));
                prov.setNumerodocumento(rs.getString("numero_documento"));
                prov.setNombre(rs.getString("Nombre"));
                prov.setDireccion(rs.getString("Direccion"));
                prov.setNumerocontacto(rs.getString("Numero_Contacto"));

            }
        } catch (Exception e) {

        }
        return prov;

    }

    @Override
    public boolean add(Proveedor proveedor) {

        String sql = "INSERT INTO proveedor( numero_documento, Nombre, Direccion, Numero_Contacto, fk_tipodoc ) VALUES ('" + proveedor.getNumerodocumento() + "','" + proveedor.getNombre() + "','" + proveedor.getDireccion() + "','" + proveedor.getNumerocontacto() + "','" + proveedor.getFktipodoc() + "')";
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            statement.executeUpdate();
        } catch (Exception e) {

        }

        return false;
    }

    @Override
    public boolean edit(Proveedor proveedor) {
        String sql = " UPDATE proveedor SET numero_documento='" + proveedor.getNumerodocumento() + "', Nombre='" + proveedor.getNombre() + "', Direccion='" + proveedor.getDireccion() + "', Numero_Contacto='" + proveedor.getNumerocontacto() + "'  WHERE  Id_Proveedor=" + proveedor.getId();
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
        String sql = "Delete From proveedor where Id_Proveedor =" + id;
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            statement.executeUpdate();
        } catch (Exception e) {
        }
        return false;

    }

    public Proveedor buscarprov(String numerodocumento) {
        Proveedor prove = null;
        String sql = "Select * from proveedor Where numero_documento=" + numerodocumento;
        try {

            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {
                prove = new Proveedor();
                prove.setId(rs.getInt("Id_Proveedor"));
                prove.setNumerodocumento(rs.getString("numero_documento"));
                prove.setNombre(rs.getString("Nombre"));
                prove.setDireccion(rs.getString("Direccion"));
                prove.setNumerocontacto(rs.getString("Numero_Contacto"));
                prove.setFktipodoc(rs.getString("fk_tipodoc"));

            }

        } catch (Exception e) {
        }
        return prove;
    }

    public boolean duplicidad(String ndocumento, String nombre, String ncontacto, String direccion) {

        Proveedor prov = new Proveedor();
        String sql = "SELECT * FROM proveedor where numero_documento ='" + ndocumento + "' or Nombre ='" + nombre + "' or Direccion ='" + direccion + "' or Numero_Contacto='" + ncontacto + "' ";

        try {

            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {
                prov.setId(rs.getInt("Id_Proveedor"));
                prov.setNumerodocumento(rs.getString("numero_documento"));
                prov.setNombre(rs.getString("Nombre"));
                prov.setDireccion(rs.getString("Direccion"));
                prov.setNumerocontacto(rs.getString("Numero_Contacto"));
                return true;

            }

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return false;
    }

    public ResultSet listarprov() {
        String sql = "SELECT Id_Proveedor, numero_documento, Nombre, Direccion, Numero_Contacto, tipo_documento.Nombre_Tipo_Documento FROM proveedor INNER JOIN tipo_documento on proveedor.fk_tipodoc = tipo_documento.Id_Tipo_Documento";
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
        } catch (Exception e) {
        }
        return rs;
    }
}
