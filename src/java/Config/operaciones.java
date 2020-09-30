package Config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class operaciones {

    String driver;
    String url;
    String uss;
    String contra;

    public operaciones() {

        driver = "com.mysql.jdbc.Driver";
        url = "jdbc:mysql://localhost:3306/pañalera";
        uss = "root";
        contra = "";
    }

    public int loguear(String us, String pass) {
        Connection conn;
        PreparedStatement pst;
        ResultSet rs;
        int cont = 0;
        int nivel = 0;
        String sql = "select FKRol from persona where Correo_Electronico= '" + us + "'  and Clave = '" + pass + "'";
        try {
            Class.forName(this.driver);
            conn = DriverManager.getConnection(this.url, this.uss, this.contra);
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                nivel = rs.getInt(1);
            }
            conn.close();

        } catch (ClassNotFoundException | SQLException e) {
        }
        return nivel;
    }
}
