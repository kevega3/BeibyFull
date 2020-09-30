package ModeloDAO;

import Config.Conexion;
import Modelo.Producto;
import java.sql.Connection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductoDAO implements Interfaces.CRUDPRODUCTO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement statement;
    ResultSet rs;
    Producto prod = new Producto();

    @Override
    public List listar() {
        ArrayList<Producto> list = new ArrayList<>();
        String sql = "SELECT  codigo,  numero_serie,  Nombre, Valor, Cantidad_en_Existencia, tipo_producto.Nombre_Tipo_Producto , marca.Nombre_Marca, estado.Estado FROM `producto` INNER JOIN tipo_producto on producto.fk_idtipoprod= tipo_producto.Id_TIpo_Producto INNER JOIN marca on producto.fk_idMarca=marca.Id_Marca INNER JOIN estado on producto.fk_idestado = estado.Id_Estado";
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {
                Producto prod = new Producto();

                prod.setIdprod(rs.getInt("codigo"));
                prod.setNserie(rs.getString("numero_serie"));
                prod.setNombre(rs.getString("Nombre"));
                prod.setValor(rs.getLong("Valor"));
                prod.setCantiadad(rs.getDouble("Cantidad_en_Existencia"));
                prod.setFkproducto(rs.getString("tipo_producto.Nombre_Tipo_Producto"));
                //  prod.setFkproducto(rs.getString("fk_idtipoprod"));
                prod.setFkmarca(rs.getString("marca.Nombre_Marca"));
                // prod.setFkmarca(rs.getString("fk_idMarca"));
                prod.setFkestado(rs.getString("estado.Estado"));
                //  prod.setFkestado(rs.getString("Estado"));

                list.add(prod);
            }
        } catch (Exception e) {

        }
        return list;
    }

    @Override
    public Producto list(int id) {
        String sql = "select * from producto where codigo=" + id;
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {

                prod.setIdprod(rs.getInt("codigo"));
                prod.setNserie(rs.getString("numero_serie"));
                prod.setNombre(rs.getString("Nombre"));
                prod.setValor(rs.getLong("Valor"));
                prod.setCantiadad(rs.getDouble("Cantidad_en_Existencia"));
                prod.setFkproducto(rs.getString("fk_idtipoprod"));
                prod.setFkmarca(rs.getString("fk_idMarca"));
                prod.setFkestado(rs.getString("fk_idestado"));

            }
        } catch (Exception e) {

        }
        return prod;

    }

    @Override
    public boolean add(Producto producto) {

        String sql = "INSERT INTO producto(numero_serie, Nombre, Valor, Cantidad_en_Existencia, fk_idtipoprod, fk_idMarca, fk_idestado )  VALUES ('" + producto.getNserie() + "','" + producto.getNombre() + "','" + producto.getValor() + "','" + producto.getCantiadad() + "','" + producto.getFkproducto() + "','" + producto.getFkmarca() + "','" + producto.getFkestado() + "')";
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            statement.executeUpdate();
        } catch (Exception e) {

        }

        return false;
    }

    @Override
    public boolean edit(Producto producto) {

        String sql = "UPDATE producto SET numero_serie='" + producto.getNserie() + "', Nombre='" + producto.getNombre() + "', Valor='" + producto.getValor() + "', Cantidad_en_Existencia= '" + producto.getCantiadad() + "',fk_idestado='" + producto.getFkestado() + "'  WHERE  codigo=" + producto.getIdprod();
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
        String sql = "Delete From producto where codigo =" + id;
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            statement.executeUpdate();
        } catch (Exception e) {
        }
        return false;

    }

    public ResultSet mostrarmarca() {
        String sql = "SELECT Id_Marca, Nombre_Marca FROM marca";
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
        } catch (Exception e) {
        }

        return rs;

    }

    public ResultSet mostrartipopdoducto() {

        String sql = "SELECT Id_Tipo_Producto, Nombre_Tipo_Producto   FROM tipo_producto ";
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
        } catch (Exception e) {
        }

        return rs;

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

    public Producto Buscar(String numeroserie) {

        Producto produ = null;
        String sql = "select * from producto where numero_serie=" + numeroserie;
        try {

            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {
                produ = new Producto();
                produ.setIdprod(rs.getInt("codigo"));
                produ.setNserie(rs.getString("numero_serie"));
                produ.setNombre(rs.getString("Nombre"));
                produ.setValor(rs.getDouble("Valor"));
                produ.setCantiadad(rs.getDouble("Cantidad_en_Existencia"));
                produ.setFkproducto(rs.getString("fk_idtipoprod"));
                produ.setFkmarca(rs.getString("fk_idMarca"));
                produ.setFkestado(rs.getString("fk_idestado"));

            }

        } catch (Exception e) {
        }
        return produ;
    }

    public boolean actualizarstock(int id, double stock) {
        String sql = "Update producto set Cantidad_en_Existencia=? Where codigo=?";

        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            statement.setDouble(1, stock);
            statement.setInt(2, id);
            statement.executeUpdate();
        } catch (Exception e) {
        }
        return false;

    }

    public Producto Buscarporid(int idprod) {

        Producto produ = new Producto();
        String sql = "select * from producto where codigo=" + idprod;
        try {

            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {
                produ.setIdprod(rs.getInt("codigo"));
                produ.setNserie(rs.getString("numero_serie"));
                produ.setNombre(rs.getString("Nombre"));
                produ.setValor(rs.getDouble("Valor"));
                produ.setCantiadad(rs.getDouble("Cantidad_en_Existencia"));
                produ.setFkproducto(rs.getString("fk_idtipoprod"));
                produ.setFkmarca(rs.getString("fk_idMarca"));
                produ.setFkestado(rs.getString("fk_idestado"));

            }

        } catch (Exception e) {
        }
        return produ;
    }

    public boolean actualizarprecio(int id, double valor) {
        String sql = "Update producto set Valor=? Where codigo=?";

        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            statement.setDouble(1, valor);
            statement.setInt(2, id);
            statement.executeUpdate();
        } catch (Exception e) {
        }
        return false;

    }

    public boolean duplicidad(String numeroserie) {

        Producto pro = new Producto();
        String sql = "SELECT * FROM producto WHERE numero_serie='" + numeroserie + "'";

        try {

            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {
                pro.setIdprod(rs.getInt("codigo"));
                pro.setNserie(rs.getString("numero_serie"));
                pro.setNombre(rs.getString("Nombre"));
                pro.setValor(rs.getDouble("Valor"));
                pro.setCantiadad(rs.getDouble("Cantidad_en_Existencia"));
                pro.setFkproducto(rs.getString("fk_idtipoprod"));
                pro.setFkmarca(rs.getString("fk_idMarca"));
                pro.setFkestado(rs.getString("fk_idestado"));
                return true;

            }

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return false;

    }

    public int existencias(Producto producto) {
        String sql = "Select * From Producto where";

        return 0;
    }

    public ResultSet listarproducto() {
        String sql = "SELECT codigo, numero_serie,Nombre, Valor, Cantidad_en_Existencia, tipo_producto.Nombre_Tipo_Producto, marca.Nombre_Marca FROM producto  INNER JOIN tipo_producto on producto.fk_idtipoprod = tipo_producto.Id_TIpo_Producto INNER JOIN marca on  producto.fk_idMarca = marca.Id_Marca";
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
        } catch (Exception e) {
        }
        return rs;
    }
}
