package Controller;

import Context.DBContext;
import model.CartItem;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "AfterCheckout", urlPatterns = {"/AfterCheckout"})
public class AfterCheckout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();

        String customerName = (String) session.getAttribute("customerName");
        String phoneNumber = (String) session.getAttribute("phoneNumber");

        List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cart");

        double totalAmount = 0;
        for (CartItem item : cartItems) {
            totalAmount += item.getTotal();
        }

        try (Connection conn = new DBContext().getConnection()) {
            String orderQuery = "INSERT INTO Orders (OrderDate, TotalAmount, Customer, Phone, StatusID) "
                    + "VALUES (?, ?, ?, ?, ?)";
            PreparedStatement orderStmt = conn.prepareStatement(orderQuery, PreparedStatement.RETURN_GENERATED_KEYS);
            orderStmt.setTimestamp(1, new java.sql.Timestamp(System.currentTimeMillis()));
            orderStmt.setDouble(2, totalAmount);
            orderStmt.setString(3, customerName);
            orderStmt.setString(4, phoneNumber);
            orderStmt.setInt(5, 1);

            int affectedRows = orderStmt.executeUpdate();
            if (affectedRows > 0) {
                var generatedKeys = orderStmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int orderId = generatedKeys.getInt(1);

                    String orderDetailsQuery = "INSERT INTO OrderDetails (OrderID, MenuID, Quantity, UnitPrice) "
                            + "VALUES (?, ?, ?, ?)";
                    PreparedStatement orderDetailsStmt = conn.prepareStatement(orderDetailsQuery);

                    for (CartItem item : cartItems) {
                        orderDetailsStmt.setInt(1, orderId);
                        orderDetailsStmt.setInt(2, item.getMenuID());
                        orderDetailsStmt.setInt(3, item.getQuantity());
                        orderDetailsStmt.setDouble(4, item.getMenuPrice());
                        orderDetailsStmt.addBatch();
                    }
                    orderDetailsStmt.executeBatch();
                }
            }
            response.sendRedirect("success.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
