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

@WebServlet(name = "UpdateCart", urlPatterns = {"/UpdateCart"})
public class UpdateCart extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        
        if (cart != null) {
            String menuID = request.getParameter("menuID");
            String action = request.getParameter("action");
            
            for (CartItem item : cart) {
                if (item.getMenuID().equals(menuID)) {
                    if ("increase".equals(action)) {
                        item.setQuantity(item.getQuantity() + 1);
                        response.getWriter().write("{\"success\": true, \"message\": \"Đã tăng số lượng\"}");
                    } else if ("decrease".equals(action)) {
                        if (item.getQuantity() > 1) {
                            item.setQuantity(item.getQuantity() - 1);
                            response.getWriter().write("{\"success\": true, \"message\": \"Đã giảm số lượng\"}");
                        } else {
                            response.getWriter().write("{\"success\": false, \"message\": \"Số lượng không thể nhỏ hơn 1\"}");
                            return;
                        }
                    }
                    
                    // Update cart totals
                    updateCartTotals(session, cart);
                    return;
                }
            }
            
            response.getWriter().write("{\"success\": false, \"message\": \"Không tìm thấy món ăn trong giỏ hàng\"}");
        } else {
            response.getWriter().write("{\"success\": false, \"message\": \"Không tìm thấy giỏ hàng\"}");
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
        session.setAttribute("cart", cart);
    }
}
