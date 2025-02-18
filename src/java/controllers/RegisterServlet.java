package controllers;

import dao.UserDAO;
import models.User;
import utils.PasswordHasher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        
        // Validate input
        if (username == null || username.length() < 5) {
            request.setAttribute("error", "Username must be at least 5 characters long");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }
        
        if (!PasswordHasher.validatePassword(password)) {
            request.setAttribute("error", "Password must contain at least 6 characters, including uppercase, lowercase, number, and special character");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }
        
        try {
            // Check if username or email already exists
            if (userDAO.isUsernameExists(username)) {
                request.setAttribute("error", "Username already exists");
                request.getRequestDispatcher("/register.jsp").forward(request, response);
                return;
            }
            
            if (userDAO.isEmailExists(email)) {
                request.setAttribute("error", "Email already exists");
                request.getRequestDispatcher("/register.jsp").forward(request, response);
                return;
            }
            
            // Create new user
            User user = new User();
            user.setUsername(username);
            user.setPassword(password);
            user.setEmail(email);
            
            if (userDAO.registerUser(user)) {
                response.sendRedirect("login.jsp?registered=true");
            } else {
                request.setAttribute("error", "Registration failed");
                request.getRequestDispatcher("/register.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("error", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/register.jsp").forward(request, response);
    }
}
