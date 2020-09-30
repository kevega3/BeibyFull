package ModeloDAO;

import Config.Conexion;
import Modelo.Cliente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ClienteDAO implements Interfaces.CRUDCLIENTE {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement statement;
    ResultSet rs;
    Cliente emple = new Cliente();

    @Override
    public List listar() {
        ArrayList<Cliente> list = new ArrayList<>();
        String sql = "SELECT * FROM cliente";
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
            while (rs.next()) {
                Cliente emples = new Cliente();
                emples.setId(rs.getInt("Id_Cliente"));
                emples.setNumerodocumento(rs.getString("Numero_Documento"));
                emples.setNombres(rs.getString("Nombres"));
                emples.setApellidos(rs.getString("Apellidos"));
                emples.setCorreo(rs.getString("Correo_Electronico"));
                emples.setNumero(rs.getString("Número_Contacto"));
                emples.setDireccion(rs.getString("Direccion"));
                list.add(emples);

            }
        } catch (Exception e) {
        }

        return list;
    }

    @Override
    public Cliente list(int id) {

        String sql = "SELECT *  FROM cliente where Id_Cliente =" + id;
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
            while (rs.next()) {
                emple.setId(rs.getInt("Id_Cliente"));
                emple.setNumerodocumento(rs.getString("Numero_Documento"));
                emple.setNombres(rs.getString("Nombres"));
                emple.setApellidos(rs.getString("Apellidos"));
                emple.setCorreo(rs.getString("Correo_Electronico"));
                emple.setNumero(rs.getString("Número_Contacto"));
                emple.setDireccion(rs.getString("Direccion"));

            }
        } catch (Exception e) {
        }

        return emple;
    }

    @Override
    public boolean add(Cliente cliente) {
        String sql = "INSERT INTO cliente(Numero_Documento, Nombres, Apellidos, Correo_Electronico, Número_Contacto, Direccion) VALUES ('" + cliente.getNumerodocumento() + "', '" + cliente.getNombres() + "','" + cliente.getApellidos() + "','" + cliente.getCorreo() + "','" + cliente.getNumero() + "','" + cliente.getDireccion() + "')";

        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            statement.executeUpdate();
        } catch (Exception e) {

        }

        return false;

    }

    @Override
    public boolean edit(Cliente cliente) {
        String sql = "Update cliente set Numero_Documento='" + cliente.getNumerodocumento() + "', Nombres='" + cliente.getNombres() + "', Apellidos='" + cliente.getApellidos() + "', Correo_Electronico='" + cliente.getCorreo() + "', Número_Contacto='" + cliente.getNumero() + "', Direccion='" + cliente.getDireccion() + "' WHERE Id_Cliente=" + cliente.getId();
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
        String sql = "Delete From cliente where Id_Cliente =" + id;
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            statement.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    public Cliente buscar(String numerodocumento) {
        Cliente cl = null;
        String sql = "Select * from cliente Where Numero_Documento=" + numerodocumento;
        try {

            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {
                cl = new Cliente();
                cl.setId(rs.getInt("Id_Cliente"));
                cl.setNumerodocumento(rs.getString("Numero_Documento"));
                cl.setNombres(rs.getString("Nombres"));
                cl.setApellidos(rs.getString("Apellidos"));
                cl.setCorreo(rs.getString("Correo_Electronico"));
                cl.setNumero(rs.getString("Número_Contacto"));
                cl.setDireccion(rs.getString("Direccion"));

            }

        } catch (Exception e) {
        }
        return cl;
    }

    public boolean duplicidad(String numerodoc, String correo, String telefono) {
        Cliente clien = new Cliente();
        String sql = "SELECT * From cliente WHERE  Numero_Documento = '" + numerodoc + "' or Correo_Electronico = '" + correo + "' or  Número_Contacto ='" + telefono + "'  ";

        try {

            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {
                clien.setId(rs.getInt("Id_Cliente"));
                clien.setNumerodocumento(rs.getString("Numero_Documento"));
                clien.setNombres(rs.getString("Nombres"));
                clien.setApellidos(rs.getString("Apellidos"));
                clien.setCorreo(rs.getString("Correo_Electronico"));
                clien.setNumero(rs.getString("Número_Contacto"));
                clien.setDireccion(rs.getString("Direccion"));
                return true;

            }

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return false;
    }

    public ResultSet listarcliente() {
        String sql = "Select * From cliente";
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
        } catch (Exception e) {
        }
        return rs;
    }
}
