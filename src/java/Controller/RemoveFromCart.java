package Controller;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.CartItem;

@WebServlet(name = "RemoveFromCart", urlPatterns = {"/RemoveFromCart"})
public class RemoveFromCart extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        try {
            HttpSession session = request.getSession();
            List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
            
            if (cart != null) {
                String menuID = request.getParameter("menuID");
                cart.removeIf(item -> item.getMenuID().equals(menuID));
                
                // Update cart totals
                updateCartTotals(session, cart);
                
                // Send success response
                response.getWriter().write("{\"success\": true, \"message\": \"Đã xóa món ăn khỏi giỏ hàng\"}");
            } else {
                response.getWriter().write("{\"success\": false, \"message\": \"Không tìm thấy giỏ hàng\"}");
            }
        } catch (Exception e) {
            response.getWriter().write("{\"success\": false, \"message\": \"Có lỗi xảy ra: " + e.getMessage() + "\"}");
        }
    }
    
    private void updateCartTotals(HttpSession session, List<CartItem> cart) {
        int totalItems = 0;
        double totalPrice = 0;
        
        for (CartItem item : cart) {
            totalItems += item.getQuantity();
            totalPrice += item.getTotal();
        }
        
        session.setAttribute("cartTotalItems", totalItems);
        session.setAttribute("cartTotalPrice", totalPrice);
    }
}
