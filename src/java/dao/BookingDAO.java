package dao;

import models.Booking;
import utils.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO {
    
    public List<Booking> getBookingsByUserId(int userId) {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT b.*, t.table_number, t.capacity FROM Bookings b " +
                    "JOIN Tables t ON b.table_id = t.table_id " +
                    "WHERE b.user_id = ? ORDER BY b.booking_date, b.booking_time";
                    
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Booking booking = new Booking();
                booking.setBookingId(rs.getInt("booking_id"));
                booking.setUserId(rs.getInt("user_id"));
                booking.setTableId(rs.getInt("table_id"));
                booking.setBookingDate(rs.getDate("booking_date"));
                booking.setBookingTime(rs.getTime("booking_time"));
                booking.setNumberOfGuests(rs.getInt("number_of_guests"));
                booking.setStatus(rs.getString("status"));
                booking.setNotes(rs.getString("notes"));
                booking.setTableNumber(rs.getInt("table_number"));
                booking.setTableCapacity(rs.getInt("capacity"));
                bookings.add(booking);
            }
        } catch (SQLException e) {
            System.out.println("Error getting bookings: " + e.getMessage());
            e.printStackTrace();
        }
        return bookings;
    }
    
    public List<Integer> getAvailableTables(Date date, Time time, int numberOfGuests) {
        List<Integer> availableTables = new ArrayList<>();
        String sql = "SELECT t.table_id FROM Tables t " +
                    "WHERE t.capacity >= ? AND t.table_id NOT IN " +
                    "(SELECT b.table_id FROM Bookings b " +
                    "WHERE b.booking_date = ? AND b.booking_time = ? " +
                    "AND b.status != 'Cancelled')";
                    
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, numberOfGuests);
            ps.setDate(2, date);
            ps.setTime(3, time);
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                availableTables.add(rs.getInt("table_id"));
            }
        } catch (SQLException e) {
            System.out.println("Error getting available tables: " + e.getMessage());
            e.printStackTrace();
        }
        return availableTables;
    }
    
    public boolean createBooking(Booking booking) {
        String sql = "INSERT INTO Bookings (user_id, table_id, booking_date, booking_time, " +
                    "number_of_guests, status, notes) VALUES (?, ?, ?, ?, ?, 'Confirmed', ?)";
                    
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, booking.getUserId());
            ps.setInt(2, booking.getTableId());
            ps.setDate(3, booking.getBookingDate());
            ps.setTime(4, booking.getBookingTime());
            ps.setInt(5, booking.getNumberOfGuests());
            ps.setString(6, booking.getNotes());
            
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            System.out.println("Error creating booking: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean cancelBooking(int bookingId, int userId) {
        String sql = "UPDATE Bookings SET status = 'Cancelled' " +
                    "WHERE booking_id = ? AND user_id = ?";
                    
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, bookingId);
            ps.setInt(2, userId);
            
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            System.out.println("Error cancelling booking: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
}
