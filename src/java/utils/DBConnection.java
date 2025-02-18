package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static final String URL = "jdbc:sqlserver://LAPTOPMINHTUAN\\SQLEXPRESS;databaseName=XShop;encrypt=true;trustServerCertificate=true";
    private static final String USER = "sa";
    private static final String PASSWORD = "123";
    
    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new SQLException("SQL Server JDBC Driver not found.", e);
        } catch (SQLException e) {
            System.out.println("Connection Error. Details:");
            System.out.println("Error Message: " + e.getMessage());
            System.out.println("Error Code: " + e.getErrorCode());
            System.out.println("SQL State: " + e.getSQLState());
            throw e;
        }
    }

    public static void main(String[] args) {
        try {
            Connection conn = getConnection();
            System.out.println("Kết nối thành công đến database!");
            conn.close();
        } catch (SQLException e) {
            System.out.println("Lỗi kết nối đến database:");
            e.printStackTrace();
        }
    }
}
