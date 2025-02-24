/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.CartItem;

/**
 *
 * @author Asus
 */
@WebServlet(name = "AddToCart", urlPatterns = {"/AddToCart"})
public class AddToCart extends HttpServlet {

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        try {
            HttpSession session = request.getSession();
            
            // Get cart from session or create new one
            List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
            if (cart == null) {
                cart = new ArrayList<>();
            }
            
            // Get parameters
            String menuID = request.getParameter("menuID");
            String menuName = request.getParameter("menuName");
            double menuPrice = Double.parseDouble(request.getParameter("menuPrice"));
            
            // Check if item exists in cart
            boolean found = false;
            int totalItems = 0;
            for (CartItem item : cart) {
                if (item.getMenuID().equals(menuID)) {
                    item.setQuantity(item.getQuantity() + 1);
                    found = true;
                }
                totalItems += item.getQuantity();
            }
            
            // If item not found, add new item
            if (!found) {
                CartItem item = new CartItem(menuID, menuName, menuPrice, 1);
                cart.add(item);
                totalItems++;
            }
            
            // Save cart back to session
            session.setAttribute("cart", cart);
            session.setAttribute("cartTotalItems", totalItems);
            
            // Calculate totals
            updateCartTotals(session, cart);
            
            // Send success response
            String jsonResponse = "{\"success\": true, \"message\": \"Quý khách đã thêm vào giỏ hàng thành công\", \"totalItems\": " + totalItems + "}";
            response.getWriter().write(jsonResponse);
            
        } catch (Exception e) {
            String jsonResponse = "{\"success\": false, \"message\": \"Có lỗi xảy ra: " + e.getMessage() + "\"}";
            response.getWriter().write(jsonResponse);
        }
    }
    
    private void updateCartTotals(HttpSession session, List<CartItem> cart) {
        double totalPrice = 0;
        
        for (CartItem item : cart) {
            totalPrice += item.getTotal();
        }
        
        session.setAttribute("cartTotalPrice", totalPrice);
    }
}
