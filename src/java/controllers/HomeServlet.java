package controllers;

import dao.ProductDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Product;
import models.User;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {
    private ProductDAO productDAO = new ProductDAO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Check if user is logged in
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
        
        try {
            // Get all products
            List<Product> products = productDAO.getAllProducts();
            request.setAttribute("products", products);
            
            // Get unique categories
            List<String> categories = productDAO.getAllCategories();
            request.setAttribute("categories", categories);
            
            request.getRequestDispatcher("/home.jsp").forward(request, response);
        } catch (SQLException e) {
            request.setAttribute("error", "Error loading products: " + e.getMessage());
            request.getRequestDispatcher("/home.jsp").forward(request, response);
        }
    }
}
