package ModeloDAO;

import Config.Conexion;
import Modelo.Estado;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

public class EstadoDAO implements Interfaces.CRUDESTADO {
    
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement statement;
    ResultSet rs;
    Estado est = new Estado();
    
    @Override
    public Estado list(int id) {
        String sql = "SELECT * FROM estado WHERE Id_Estado" + id;
        try {
            con = cn.getConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {
                est.setId_estado(rs.getInt("Id_Estado"));
                est.setEstado(rs.getString("Estado"));
            }
        } catch (Exception e) {
        }
        return est;
    }

    @Override
    public List listar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
