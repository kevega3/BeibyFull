package ModeloDAO;

import Config.Conexion;
import Modelo.Marca;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MarcaDAO implements Interfaces.CRUDMARCA {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement statement;
    ResultSet rs;
    Marca mar = new Marca();

    @Override
    public List listarmarca() {
        ArrayList<Marca> list = new ArrayList<>();
        String sql = "SELECT * FROM marca";
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
            while (rs.next()) {
                Marca marca = new Marca();
                marca.setId(rs.getInt("Id_Marca"));
                marca.setNombre(rs.getString("Nombre_Marca"));
                list.add(marca);
            }
        } catch (Exception e) {
        }
        return list;
    }

    @Override
    public Marca list(int id) {
        String sql = "SELECT * FROM marca WHERE Id_Marca =" + id;
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
            while (rs.next()) {
                mar.setId(rs.getInt("Id_Marca"));
                mar.setNombre(rs.getString("Nombre_Marca"));

            }
        } catch (Exception e) {
        }
        return mar;
    }

    @Override
    public boolean add(Marca marca) {
        String sql = "INSERT INTO marca(Nombre_Marca) VALUES ('" + marca.getNombre() + "')";
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            statement.executeUpdate();
        } catch (Exception e) {

        }
        return false;
    }

    @Override
    public boolean edit(Marca marca) {
        String sql = "UPDATE marca SET Nombre_Marca='" + marca.getNombre() + "' WHERE Id_Marca=" + marca.getId();
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
        String sql = "Delete From marca where Id_Marca=" + id;
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            statement.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    public boolean duplicidad(String nombre) {

        Marca marc = new Marca();
        String sql = "SELECT * FROM marca WHERE Nombre_Marca = '" + nombre + "'";

        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {
                marc.setNombre("Nombre_Marca");

                return true;
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return false;

    }

    public ResultSet listando() {
        String sql = "Select * From marca";
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
        } catch (Exception e) {
        }
        return rs;
    }
}
