package ModeloDAO;

import Config.Conexion;
import Modelo.Cliente;
import Modelo.Persona;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PersonaDAO implements Interfaces.CRUDPERSONA {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement statement;
    ResultSet rs;
    Persona perso = new Persona();

    @Override
    public List listar() {
        ArrayList<Persona> list = new ArrayList<>();
        String sql = "SELECT Id_Persona, Nombre, Apellidos, tipo_documento.Nombre_Tipo_Documento, Numero_Documento, Correo_Electronico, Clave, Numero_Contacto, Direccion, estado.Estado, rol.Nombre_Rol FROM `persona` INNER JOIN rol ON persona.FKRol = rol.Id_Rol INNER JOIN tipo_documento on persona.FKTipo_Documento = tipo_documento.Id_Tipo_Documento INNER JOIN estado on persona.FKEstado = estado.Id_Estado";
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {
                Persona per = new Persona();
                per.setId(rs.getInt("Id_Persona"));
                per.setNombres(rs.getString("Nombre"));
                per.setApellidos(rs.getString("Apellidos"));
                per.setId_tipodocumento(rs.getString("tipo_documento.Nombre_Tipo_Documento"));
                per.setNumerodocumento(rs.getString("Numero_Documento"));
                per.setCorreo(rs.getString("Correo_Electronico"));
                per.setClave(rs.getString("Clave"));
                per.setTelefono(rs.getString("Numero_Contacto"));
                per.setDireccion(rs.getString("Direccion"));
                per.setId_estado(rs.getString("estado.Estado"));
                per.setId_rol(rs.getString("rol.Nombre_Rol"));
                list.add(per);
            }
        } catch (Exception e) {

        }
        return list;

    }

    @Override
    public Persona list(int id) {
        String sql = "SELECT * FROM persona WHERE Id_Persona=" + id;
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
            while (rs.next()) {

                perso.setId(rs.getInt("Id_Persona"));
                perso.setNombres(rs.getString("Nombre"));
                perso.setApellidos(rs.getString("Apellidos"));
                perso.setId_tipodocumento(rs.getString("FKTipo_Documento"));
                perso.setNumerodocumento(rs.getString("Numero_Documento"));
                perso.setCorreo(rs.getString("Correo_Electronico"));
                perso.setClave(rs.getString("Clave"));
                perso.setTelefono(rs.getString("Numero_Contacto"));
                perso.setDireccion(rs.getString("Direccion"));
                perso.setId_estado(rs.getString("FKEstado"));
                perso.setId_rol(rs.getString("FKRol"));

            }
        } catch (Exception e) {
        }

        return perso;

    }

    @Override
    public boolean add(Persona persona) {
        String sql = "INSERT INTO persona (Nombre, Apellidos, FKTipo_Documento, Numero_Documento, Correo_Electronico, Clave, Numero_Contacto, Direccion, FKEstado, FKRol) VALUES ('" + persona.getNombres() + "','" + persona.getApellidos() + "','" + persona.getId_tipodocumento() + "','" + persona.getNumerodocumento() + "','" + persona.getCorreo() + "',MD5('" + persona.getClave() + "'),'" + persona.getTelefono() + "','" + persona.getDireccion() + "','" + persona.getId_estado() + "','" + persona.getId_rol() + "')";

        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            statement.executeUpdate();
        } catch (Exception e) {

        }

        return false;
    }

    @Override
    public boolean edit(Persona persona) {
        String sql = "Update persona set Nombre='" + persona.getNombres() + "', Apellidos='" + persona.getApellidos() + "', FKTipo_Documento='" + persona.getId_tipodocumento() + "' ,Numero_Documento='" + persona.getNumerodocumento() + "', Correo_Electronico='" + persona.getCorreo() + "', Clave=MD5('" + persona.getClave() + "'), Numero_Contacto='" + persona.getTelefono() + "', Direccion='" + persona.getDireccion() + "', FKEstado='" + persona.getId_estado() + "',  FKRol='" + persona.getId_rol() + "'  WHERE Id_Persona=" + persona.getId();

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
        String sql = "Delete From persona where Id_Persona =" + id;
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            statement.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    public Persona buscar(String numerodocumento) {
        Persona per = null;
        String sql = "Select * from Persona Where Numero_Documento=" + numerodocumento;
        try {

            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {
                per = new Persona();
                per.setId(rs.getInt("Id_Persona"));
                per.setNombres(rs.getString("Nombre"));
                per.setApellidos(rs.getString("Apellidos"));
                per.setId_tipodocumento(rs.getString("FKTipo_Documento"));
                per.setNumerodocumento(rs.getString("Numero_Documento"));
                per.setCorreo(rs.getString("Correo_Electronico"));
                per.setClave(rs.getString("Clave"));
                per.setTelefono(rs.getString("Numero_Contacto"));
                per.setDireccion(rs.getString("Direccion"));
                per.setId_estado(rs.getString("FKEstado"));
                per.setId_rol(rs.getString("FKRol"));

            }

        } catch (Exception e) {
        }
        return per;
    }

    //ejecución de prueba para la duplicidad de datos
    public boolean duplicidad(String correo, String numerodocumento) {

        Persona persos = new Persona();
        String sql = "select * from Persona where Numero_Documento='" + numerodocumento + "' or Correo_Electronico ='" + correo + "'";

        try {

            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {
                persos.setId(rs.getInt("Id_Persona"));
                persos.setNombres(rs.getString("Nombre"));
                persos.setApellidos(rs.getString("Apellidos"));
                persos.setId_tipodocumento(rs.getString("FKTipo_Documento"));
                persos.setNumerodocumento(rs.getString("Numero_Documento"));
                persos.setCorreo(rs.getString("Correo_Electronico"));
                persos.setClave(rs.getString("Clave"));
                persos.setTelefono(rs.getString("Numero_Contacto"));
                persos.setDireccion(rs.getString("Direccion"));
                persos.setId_estado(rs.getString("FKEstado"));
                persos.setId_rol(rs.getString("FKRol"));
                return true;

            }

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return false;
    }

    public ResultSet mostrarestado() {
        String sql = "Select Id_Estado, Estado FROM estado";

        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
        } catch (Exception e) {
        }

        return rs;
    }

    public ResultSet mostrartipodoc() {

        String sql = "SELECT Id_Tipo_Documento, Nombre_Tipo_Documento   FROM tipo_documento ";
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
        } catch (Exception e) {
        }

        return rs;

    }

    public ResultSet mostrarrol() {

        String sql = "SELECT Id_Rol, Nombre_Rol FROM rol  ";
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
        } catch (Exception e) {
        }

        return rs;

    }

    public ResultSet listarpersona() {
        String sql = "SELECT Id_Persona, Nombre, Apellidos, tipo_documento.Nombre_Tipo_Documento , Numero_Documento, Correo_Electronico, Clave, Numero_Contacto, Direccion, rol.Nombre_Rol FROM persona INNER JOIN tipo_documento on persona.FKTipo_Documento= tipo_documento.Id_Tipo_Documento INNER JOIN rol on persona.FKRol=rol.Id_Rol";
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
        } catch (Exception e) {
        }
        return rs;
    }
    
     public boolean clave(String correo) {

        Persona persos = new Persona();
        String sql = "select * from Persona where  Correo_Electronico ='" + correo + "'";

        try {

            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {
                persos.setId(rs.getInt("Id_Persona"));
                persos.setNombres(rs.getString("Nombre"));
                persos.setApellidos(rs.getString("Apellidos"));
                persos.setId_tipodocumento(rs.getString("FKTipo_Documento"));
                persos.setNumerodocumento(rs.getString("Numero_Documento"));
                persos.setCorreo(rs.getString("Correo_Electronico"));
                persos.setClave(rs.getString("Clave"));
                persos.setTelefono(rs.getString("Numero_Contacto"));
                persos.setDireccion(rs.getString("Direccion"));
                persos.setId_estado(rs.getString("FKEstado"));
                persos.setId_rol(rs.getString("FKRol"));
                return true;

            }

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return false;
    }

    
     public boolean cambiarclave(Persona persona) {
        String sql = "Update persona set  Clave=MD5('" + persona.getClave() + "')  WHERE  Correo_Electronico=  '"+ persona.getCorreo()+"'"  ;

        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            statement.executeUpdate();
        } catch (Exception e) {

        }

        return false;
    }
}
