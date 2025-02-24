package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import models.Product;
import utils.DBConnection;

public class ProductDAO {
    
    public List<Product> getAllProducts() throws SQLException {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM Products ORDER BY CreatedAt DESC";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getInt("ProductID"));
                product.setName(rs.getString("Name"));
                product.setDescription(rs.getString("Description"));
                product.setPrice(rs.getBigDecimal("Price"));
                product.setImageURL(rs.getString("ImageURL"));
                product.setCategory(rs.getString("Category"));
                product.setStock(rs.getInt("Stock"));
                product.setCreatedAt(rs.getTimestamp("CreatedAt"));
                product.setUpdatedAt(rs.getTimestamp("UpdatedAt"));
                products.add(product);
            }
        }
        return products;
    }
    
    public Product getProductById(int productId) throws SQLException {
        String sql = "SELECT * FROM Products WHERE ProductID = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, productId);
            
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Product product = new Product();
                    product.setProductId(rs.getInt("ProductID"));
                    product.setName(rs.getString("Name"));
                    product.setDescription(rs.getString("Description"));
                    product.setPrice(rs.getBigDecimal("Price"));
                    product.setImageURL(rs.getString("ImageURL"));
                    product.setCategory(rs.getString("Category"));
                    product.setStock(rs.getInt("Stock"));
                    product.setCreatedAt(rs.getTimestamp("CreatedAt"));
                    product.setUpdatedAt(rs.getTimestamp("UpdatedAt"));
                    return product;
                }
            }
        }
        return null;
    }
    
    public boolean addProduct(Product product) throws SQLException {
        String sql = "INSERT INTO Products (Name, Description, Price, ImageURL, Category, Stock) " +
                    "VALUES (?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, product.getName());
            stmt.setString(2, product.getDescription());
            stmt.setBigDecimal(3, product.getPrice());
            stmt.setString(4, product.getImageURL());
            stmt.setString(5, product.getCategory());
            stmt.setInt(6, product.getStock());
            
            return stmt.executeUpdate() > 0;
        }
    }
    
    public boolean updateProduct(Product product) throws SQLException {
        String sql = "UPDATE Products SET Name = ?, Description = ?, Price = ?, " +
                    "ImageURL = ?, Category = ?, Stock = ?, UpdatedAt = GETDATE() " +
                    "WHERE ProductID = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, product.getName());
            stmt.setString(2, product.getDescription());
            stmt.setBigDecimal(3, product.getPrice());
            stmt.setString(4, product.getImageURL());
            stmt.setString(5, product.getCategory());
            stmt.setInt(6, product.getStock());
            stmt.setInt(7, product.getProductId());
            
            return stmt.executeUpdate() > 0;
        }
    }
    
    public boolean deleteProduct(int productId) throws SQLException {
        String sql = "DELETE FROM Products WHERE ProductID = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, productId);
            
            return stmt.executeUpdate() > 0;
        }
    }
    
    public List<String> getAllCategories() throws SQLException {
        List<String> categories = new ArrayList<>();
        String sql = "SELECT DISTINCT Category FROM Products WHERE Category IS NOT NULL ORDER BY Category";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            while (rs.next()) {
                categories.add(rs.getString("Category"));
            }
        }
        return categories;
    }
}
