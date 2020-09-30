package ModeloDAO;

import Config.Conexion;
import Modelo.Compra;
import Modelo.Venta;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CompraDAO {
    
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement statement;
    ResultSet rs;

    public String GenerarSerie() {
        String numerodeserie = "";

        String sql = "select max(numero_serie) as numero_serie from compra ";

        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {
                numerodeserie = rs.getString("numero_serie");
            }

        } catch (Exception e) {
        }

        return numerodeserie;

    }

    public String idcompras() {

        String idventas = "";
        String sql = "Select max(id_Compra) as id_Compra from  compra ";

        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {
                idventas = rs.getString("id_Compra");
            }
        } catch (Exception e) {
        }
        return idventas;
    }

    public boolean GuardarCompra(Compra compra) {

        String sql = "INSERT INTO compra (fk_Idsede, fk_idproveedor, numero_serie, fecha, monto) VALUES  ('" + compra.getIdsede()+ "','" + compra.getIdproveedor()+ "','" + compra.getNserie() + "','" + compra.getFecha() + "','" + compra.getMonto() + "')";

        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
           statement.executeUpdate();

        } catch (Exception e) {
        }

        return false;
    }

    public boolean GuardarDetalleCompra(Compra compra) {
       
        
        String sql = "INSERT INTO detalle_dproductosede_compra (fk_idCompra, fk_idproducto, Cantidad, precio) VALUES ('" + compra.getIdcompra()+ "','" + compra.getIdproducto() + "','" + compra.getCantidad()+ "','" + compra.getPrecio()+ "')";
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
             statement.executeUpdate();

        } catch (Exception e) {
        }

        return false;
    }
    
    public ResultSet listarcompra (){
  //   String sql ="Select * From compra";
String sql="SELECT id_Compra, sede.Nombre_Sede, proveedor.Nombre, numero_serie, fecha, monto FROM compra INNER JOIN sede on compra.fk_Idsede=sede.Id_Sede INNER JOIN proveedor on compra.fk_idproveedor=proveedor.Id_Proveedor";
     try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
        } catch (Exception e) {
        }
       return rs;
     
     }
       public ResultSet listardetallecompra (int id){
     String sql ="SELECT Id_Detalleproducto_Idcompra, compra.numero_serie , producto.Nombre , Cantidad, precio FROM detalle_dproductosede_compra INNER JOIN compra on detalle_dproductosede_compra.fk_idCompra=compra.id_Compra\n" +
"INNER JOIN producto on  detalle_dproductosede_compra.fk_idproducto=producto.codigo WHERE fk_idCompra ='"+id+"'";
       try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
        } catch (Exception e) {
        }
       return rs;
     
     }
}
