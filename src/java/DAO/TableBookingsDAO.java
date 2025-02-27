/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class TableBookingsDAO {

 public void insertTableBookings(String name, String email, String phone, String dateStr, String timeStr, int people, String message) {
    String query = "INSERT INTO TableBookings (CustomerName, Email, Phone, BookingDate, BookingTime, NumberOfPeople, Note) " +
                   "VALUES (?, ?, ?, ?, ?, ?, ?)";
    Connection conn = null;
    PreparedStatement ps = null;

    try {
        conn = new DBContext().getConnection(); // Mở kết nối đến DB
        ps = conn.prepareStatement(query);

        // Chuyển đổi date và time sang đúng kiểu
        java.sql.Date sqlDate = java.sql.Date.valueOf(dateStr); // yyyy-MM-dd
        java.sql.Time sqlTime = java.sql.Time.valueOf(timeStr + ":00"); // HH:mm:ss

        // Gán giá trị vào PreparedStatement
        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, phone);
        ps.setDate(4, sqlDate); // Định dạng yyyy-MM-dd
        ps.setTime(5, sqlTime); // Định dạng HH:mm:ss
        ps.setInt(6, people);
        ps.setString(7, message);

        ps.executeUpdate(); // Thực thi INSERT

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}

}
