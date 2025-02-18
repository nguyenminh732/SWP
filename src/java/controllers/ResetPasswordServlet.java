package controllers;

import dao.UserDAO;
import utils.PasswordHasher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/reset-password")
public class ResetPasswordServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String token = request.getParameter("token");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        
        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match");
            request.getRequestDispatcher("/reset-password.jsp").forward(request, response);
            return;
        }
        
        if (!PasswordHasher.validatePassword(password)) {
            request.setAttribute("error", "Password must contain at least 6 characters, including uppercase, lowercase, number, and special character");
            request.getRequestDispatcher("/reset-password.jsp").forward(request, response);
            return;
        }
        
        try {
            if (userDAO.resetPassword(token, password)) {
                response.sendRedirect("login.jsp?reset=true");
            } else {
                request.setAttribute("error", "Invalid or expired reset token");
                request.getRequestDispatcher("/reset-password.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("error", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("/reset-password.jsp").forward(request, response);
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String token = request.getParameter("token");
        if (token == null || token.isEmpty()) {
            response.sendRedirect("login.jsp");
            return;
        }
        request.setAttribute("token", token);
        request.getRequestDispatcher("/reset-password.jsp").forward(request, response);
    }
}
