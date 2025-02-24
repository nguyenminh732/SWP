package dao;

import java.sql.*;
import java.util.UUID;
import models.User;
import utils.DBConnection;
import utils.PasswordHasher;

public class UserDAO {
    public boolean registerUser(User user) throws SQLException {
        // Check if this is the first user being registered
        boolean isFirstUser = isFirstUser();
        
        String sql = "INSERT INTO Users (Username, PasswordHash, Email, RoleID) VALUES (?, ?, ?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, user.getUsername());
            stmt.setString(2, PasswordHasher.hashPassword(user.getPassword()));
            stmt.setString(3, user.getEmail());
            // If first user, set as Admin (RoleID = 1), otherwise User (RoleID = 2)
            stmt.setInt(4, isFirstUser ? 1 : 2);
            
            boolean success = stmt.executeUpdate() > 0;
            if (success) {
                // Update the user object's role
                user.setRole(isFirstUser ? "Admin" : "User");
            }
            return success;
        }
    }
    
    private boolean isFirstUser() throws SQLException {
        String sql = "SELECT COUNT(*) FROM Users";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            if (rs.next()) {
                return rs.getInt(1) == 0;
            }
            return true;
        }
    }
    
    public User login(String username, String password) throws SQLException {
        String sql = "SELECT u.*, r.RoleName FROM Users u " +
                    "JOIN roles r ON u.RoleID = r.RoleID " +
                    "WHERE u.Username = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, username);
            
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    String storedHash = rs.getString("PasswordHash");
                    if (PasswordHasher.verifyPassword(password, storedHash)) {
                        User user = new User();
                        user.setUserId(rs.getInt("UserID"));
                        user.setUsername(rs.getString("Username"));
                        user.setEmail(rs.getString("Email"));
                        user.setRole(rs.getString("RoleName"));
                        user.setCreatedAt(rs.getTimestamp("CreatedAt"));
                        return user;
                    }
                }
            }
        }
        return null;
    }
    
    public boolean isUsernameExists(String username) throws SQLException {
        String sql = "SELECT COUNT(*) FROM Users WHERE Username = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, username);
            
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }
        return false;
    }
    
    public boolean isEmailExists(String email) throws SQLException {
        String sql = "SELECT COUNT(*) FROM Users WHERE Email = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, email);
            
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }
        return false;
    }
    
    public boolean initiatePasswordReset(String email) throws SQLException {
        String token = UUID.randomUUID().toString();
        Timestamp expiry = new Timestamp(System.currentTimeMillis() + 3600000); // 1 hour
        
        String sql = "UPDATE Users SET reset_token = ?, reset_token_expiry = ? WHERE Email = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, token);
            stmt.setTimestamp(2, expiry);
            stmt.setString(3, email);
            
            return stmt.executeUpdate() > 0;
        }
    }
    
    public boolean resetPassword(String token, String newPassword) throws SQLException {
        String sql = "UPDATE Users SET PasswordHash = ?, reset_token = NULL, reset_token_expiry = NULL " +
                    "WHERE reset_token = ? AND reset_token_expiry > CURRENT_TIMESTAMP";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, PasswordHasher.hashPassword(newPassword));
            stmt.setString(2, token);
            
            return stmt.executeUpdate() > 0;
        }
    }
    
    public String getResetToken(String email) throws SQLException {
        String sql = "SELECT reset_token FROM Users WHERE Email = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, email);
            
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("reset_token");
                }
            }
        }
        return null;
    }
}
