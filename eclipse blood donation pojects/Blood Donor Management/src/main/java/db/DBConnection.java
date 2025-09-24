package db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    public static Connection getCon() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/bloodbank", // ✅ DB name
                "root",                                 // ✅ your DB username
                "Example@2022#"                         // ✅ your DB password
            );
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }
}
