package Config;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
       Connection con;

    public Conexion() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/pañalera?user=root&password=&useSSL=false");
        } catch (Exception e) {
        }
    }
    public Connection getConnection(){
    return con;
    }
}
