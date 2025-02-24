package controllers.user;

import dao.BookingDAO;
import models.Booking;
import models.User;
import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.time.LocalDate;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/booking")
public class BookingServlet extends HttpServlet {
    private BookingDAO bookingDAO = new BookingDAO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("BookingServlet doGet called");
        
        // Check if user is logged in
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            System.out.println("User not logged in");
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
        
        try {
            // Get user's bookings
            List<Booking> bookings = bookingDAO.getBookingsByUserId(user.getUserId());
            System.out.println("Found " + bookings.size() + " bookings for user " + user.getUserId());
            request.setAttribute("bookings", bookings);
            
            // Set today's date for the date input min attribute
            request.setAttribute("today", LocalDate.now().toString());
            
            // If it's an AJAX request, only return the bookings list partial
            if ("true".equals(request.getParameter("ajax"))) {
                System.out.println("AJAX request - returning partial view");
                request.getRequestDispatcher("/WEB-INF/partials/bookings-list.jsp").forward(request, response);
            } else {
                System.out.println("Regular request - returning full view");
                request.getRequestDispatcher("/user/booking.jsp").forward(request, response);
            }
        } catch (Exception e) {
            System.out.println("Error in doGet: " + e.getMessage());
            e.printStackTrace();
            if ("true".equals(request.getParameter("ajax"))) {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("Error loading bookings: " + e.getMessage());
            } else {
                request.setAttribute("error", "Error loading bookings: " + e.getMessage());
                request.getRequestDispatcher("/user/booking.jsp").forward(request, response);
            }
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("BookingServlet doPost called");
        
        // Check if user is logged in
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            System.out.println("User not logged in");
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.getWriter().write("{\"success\": false, \"message\": \"User not logged in\"}");
            return;
        }
        
        String action = request.getParameter("action");
        System.out.println("Action: " + action);
        String jsonResponse;
        
        try {
            if ("cancel".equals(action)) {
                // Cancel booking
                int bookingId = Integer.parseInt(request.getParameter("bookingId"));
                System.out.println("Cancelling booking " + bookingId);
                if (bookingDAO.cancelBooking(bookingId, user.getUserId())) {
                    jsonResponse = "{\"success\": true, \"message\": \"Booking cancelled successfully\"}";
                } else {
                    jsonResponse = "{\"success\": false, \"message\": \"Failed to cancel booking\"}";
                }
            } else {
                // Create new booking
                String bookingDateStr = request.getParameter("bookingDate");
                String bookingTimeStr = request.getParameter("bookingTime");
                String numberOfGuestsStr = request.getParameter("numberOfGuests");
                
                System.out.println("Creating booking with date: " + bookingDateStr + 
                                 ", time: " + bookingTimeStr + 
                                 ", guests: " + numberOfGuestsStr);
                
                Date bookingDate = Date.valueOf(bookingDateStr);
                Time bookingTime = Time.valueOf(bookingTimeStr + ":00");
                int numberOfGuests = Integer.parseInt(numberOfGuestsStr);
                
                // Find available table
                List<Integer> availableTables = bookingDAO.getAvailableTables(bookingDate, bookingTime, numberOfGuests);
                System.out.println("Found " + availableTables.size() + " available tables");
                
                if (!availableTables.isEmpty()) {
                    // Create booking with first available table
                    Booking booking = new Booking();
                    booking.setUserId(user.getUserId());
                    booking.setTableId(availableTables.get(0));
                    booking.setBookingDate(bookingDate);
                    booking.setBookingTime(bookingTime);
                    booking.setNumberOfGuests(numberOfGuests);
                    booking.setNotes(request.getParameter("notes"));
                    
                    System.out.println("Creating booking for table " + availableTables.get(0));
                    if (bookingDAO.createBooking(booking)) {
                        jsonResponse = "{\"success\": true, \"message\": \"Booking created successfully\"}";
                    } else {
                        jsonResponse = "{\"success\": false, \"message\": \"Failed to create booking\"}";
                    }
                } else {
                    jsonResponse = String.format(
                        "{\"success\": false, \"message\": \"No tables available for %d guests at the selected time\"}",
                        numberOfGuests
                    );
                }
            }
            
            System.out.println("Sending response: " + jsonResponse);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonResponse);
            
        } catch (Exception e) {
            System.out.println("Error in doPost: " + e.getMessage());
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(
                String.format("{\"success\": false, \"message\": \"Error processing booking: %s\"}", 
                    e.getMessage().replace("\"", "\\\""))
            );
        }
    }
}
