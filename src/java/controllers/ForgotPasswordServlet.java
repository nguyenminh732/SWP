package controllers;

import dao.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/forgot-password")
public class ForgotPasswordServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        
        try {
            if (userDAO.initiatePasswordReset(email)) {
                // In a real application, you would send an email with the reset link
                // For this example, we'll just show a success message
                request.setAttribute("message", "If an account exists with that email, a password reset link has been sent.");
            } else {
                request.setAttribute("error", "Email not found");
            }
        } catch (Exception e) {
            request.setAttribute("error", "An error occurred: " + e.getMessage());
        }
        
        request.getRequestDispatcher("/forgot-password.jsp").forward(request, response);
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/forgot-password.jsp").forward(request, response);
    }
}
