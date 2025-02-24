package controllers.admin;

import dao.ProductDAO;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Product;
import models.User;

@WebServlet("/admin/products")
public class ProductServlet extends HttpServlet {
    private ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Check if user is logged in and is admin
        User user = (User) request.getSession().getAttribute("user");
        if (user == null || !"Admin".equals(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        String action = request.getParameter("action");
        
        try {
            if ("get".equals(action)) {
                // Get single product for editing
                int productId = Integer.parseInt(request.getParameter("id"));
                Product product = productDAO.getProductById(productId);
                
                // Create JSON manually
                String json = String.format(
                    "{\"productId\":%d,\"name\":\"%s\",\"description\":\"%s\",\"price\":%s," +
                    "\"imageURL\":\"%s\",\"category\":\"%s\",\"stock\":%d}",
                    product.getProductId(),
                    escapeJsonString(product.getName()),
                    escapeJsonString(product.getDescription()),
                    product.getPrice().toString(),
                    escapeJsonString(product.getImageURL()),
                    escapeJsonString(product.getCategory()),
                    product.getStock()
                );
                
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                
            } else if ("delete".equals(action)) {
                // Delete product
                int productId = Integer.parseInt(request.getParameter("id"));
                if (productDAO.deleteProduct(productId)) {
                    request.getSession().setAttribute("message", "Product deleted successfully");
                } else {
                    request.getSession().setAttribute("error", "Failed to delete product");
                }
                response.sendRedirect(request.getContextPath() + "/admin/dashboard.jsp");
                
            } else {
                // List all products
                List<Product> products = productDAO.getAllProducts();
                request.setAttribute("products", products);
                request.getRequestDispatcher("/admin/dashboard.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            request.setAttribute("error", "Database error: " + e.getMessage());
            request.getRequestDispatcher("/admin/dashboard.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid product ID");
            request.getRequestDispatcher("/admin/dashboard.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Check if user is logged in and is admin
        User user = (User) request.getSession().getAttribute("user");
        if (user == null || !"Admin".equals(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        String action = request.getParameter("action");
        
        try {
            if ("update".equals(action)) {
                // Update existing product
                Product product = new Product();
                product.setProductId(Integer.parseInt(request.getParameter("productId")));
                product.setName(request.getParameter("name"));
                product.setDescription(request.getParameter("description"));
                product.setPrice(new BigDecimal(request.getParameter("price")));
                product.setImageURL(request.getParameter("imageURL"));
                product.setCategory(request.getParameter("category"));
                product.setStock(Integer.parseInt(request.getParameter("stock")));

                if (productDAO.updateProduct(product)) {
                    request.getSession().setAttribute("message", "Product updated successfully");
                } else {
                    request.getSession().setAttribute("error", "Failed to update product");
                }
            } else {
                // Add new product
                Product product = new Product();
                product.setName(request.getParameter("name"));
                product.setDescription(request.getParameter("description"));
                product.setPrice(new BigDecimal(request.getParameter("price")));
                product.setImageURL(request.getParameter("imageURL"));
                product.setCategory(request.getParameter("category"));
                product.setStock(Integer.parseInt(request.getParameter("stock")));

                if (productDAO.addProduct(product)) {
                    request.getSession().setAttribute("message", "Product added successfully");
                } else {
                    request.getSession().setAttribute("error", "Failed to add product");
                }
            }
        } catch (SQLException e) {
            request.getSession().setAttribute("error", "Database error: " + e.getMessage());
        } catch (NumberFormatException e) {
            request.getSession().setAttribute("error", "Invalid number format in form data");
        }
        
        response.sendRedirect(request.getContextPath() + "/admin/products");
    }
    
    private String escapeJsonString(String input) {
        if (input == null) {
            return "";
        }
        return input.replace("\\", "\\\\")
                   .replace("\"", "\\\"")
                   .replace("\n", "\\n")
                   .replace("\r", "\\r")
                   .replace("\t", "\\t");
    }
}
