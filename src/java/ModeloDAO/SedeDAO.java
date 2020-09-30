package ModeloDAO;

import Config.Conexion;
import Modelo.Sede;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SedeDAO implements Interfaces.CRUDSEDE {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement statement;
    ResultSet rs;
    Sede sedee = new Sede();

    public List listar() {
        ArrayList<Sede> list = new ArrayList<>();
        String sql = "SELECT * FROM sede";
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {
                Sede sed = new Sede();
                sed.setId(rs.getInt("Id_Sede"));
                sed.setNombre_sede(rs.getString("Nombre_Sede"));
                sed.setDireccion_sede(rs.getString("Direccion_Sede"));
                sed.setBarrio_sede(rs.getString("Barrio_Sede"));
                list.add(sed);
            }

        } catch (Exception e) {

        }
        return list;
    }

    public boolean add(Sede sede) {
        String sql = "INSERT INTO sede (Nombre_Sede, Direccion_Sede, Barrio_Sede) VALUES ('" + sede.getNombre_sede() + "','" + sede.getDireccion_sede() + "','" + sede.getBarrio_sede() + "')";

        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            statement.executeUpdate();
        } catch (Exception e) {

        }

        return false;
    }

    public boolean edit(Sede sede) {
        String sql = "Update sede set Nombre_Sede='" + sede.getNombre_sede() + "', Direccion_Sede='" + sede.getDireccion_sede() + "', Barrio_Sede='" + sede.getBarrio_sede() + "' WHERE Id_Sede=" + sede.getId();

        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            statement.executeUpdate();

        } catch (Exception e) {

        }

        return false;
    }

    public boolean delete(int id) {
        String sql = "Delete From sede where Id_Sede =" + id;
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            statement.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public Sede list(int id) {
        String sql = "SELECT * FROM sede WHERE Id_Sede=" + id;
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {

                sedee.setId(rs.getInt("Id_Sede"));
                sedee.setNombre_sede(rs.getString("Nombre_Sede"));
                sedee.setDireccion_sede(rs.getString("Direccion_Sede"));
                sedee.setBarrio_sede(rs.getString("Barrio_Sede"));

            }

        } catch (Exception e) {

        }
        return sedee;

    }

    public Sede buscarsede(int idsede) {
        Sede sede = new Sede();
        String sql = "Select * from sede Where Id_Sede=" + idsede;
        try {

            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {

                sede.setId(rs.getInt("Id_Sede"));
                sede.setNombre_sede(rs.getString("Nombre_Sede"));
                sede.setDireccion_sede(rs.getString("Direccion_Sede"));
                sede.setBarrio_sede(rs.getString("Barrio_Sede"));

            }

        } catch (Exception e) {
        }
        return sede;
    }

    public boolean duplicidad(String nombre, String direccion) {

        Sede se = new Sede();
        String sql = "SELECT * FROM sede WHERE Nombre_Sede = '" + nombre + "' or Direccion_Sede ='" + direccion + "'  ";

        try {

            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {
                se.setId(rs.getInt("Id_Sede"));
                se.setNombre_sede(rs.getString("Nombre_Sede"));
                se.setDireccion_sede(rs.getString("Direccion_Sede"));
                se.setBarrio_sede(rs.getString("Barrio_Sede"));

                return true;

            }

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return false;
    }

    public Sede buscarsede2(String nombresede) {
        Sede see = null;
        String sql = "Select * from sede Where Nombre_Sede='" + nombresede + "'";
        try {

            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {
                see = new Sede();
                see.setId(rs.getInt("Id_Sede"));
                see.setNombre_sede(rs.getString("Nombre_Sede"));
                see.setDireccion_sede(rs.getString("Direccion_Sede"));
                see.setBarrio_sede(rs.getString("Direccion_Sede"));

            }

        } catch (Exception e) {
        }
        return see;
    }

    public ResultSet listarsede() {
        String sql = "Select * From sede";
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
        } catch (Exception e) {
        }
        return rs;
    }
}
