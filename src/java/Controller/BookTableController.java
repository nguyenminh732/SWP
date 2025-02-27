/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.TableBookingsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

/**
 *
 * @author Admin
 */
public class BookTableController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String dateStr = request.getParameter("date");  // Dữ liệu kiểu dd/MM/yyyy
            String timeStr = request.getParameter("time");  // Dữ liệu kiểu hh:mm
            int people = Integer.parseInt(request.getParameter("people"));
            String message = request.getParameter("message");

// ✅ Chuyển đổi Date từ MM/dd/yyyy -> yyyy-MM-dd
            SimpleDateFormat inputFormat = new SimpleDateFormat("MM/dd/yyyy"); // Định dạng đầu vào đúng
            SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd"); // Định dạng đầu ra chuẩn
            Date date = inputFormat.parse(dateStr);
            String formattedDate = outputFormat.format(date);

            // ✅ Chuyển đổi Time từ hh:mm -> hh:mm:ss
            LocalTime time = LocalTime.parse(timeStr, DateTimeFormatter.ofPattern("HH:mm"));
            String formattedTime = time.toString();  // Tự động thêm giây (hh:mm:ss)

            // Gọi DAO để insert dữ liệu
            TableBookingsDAO tbdao = new TableBookingsDAO();
            tbdao.insertTableBookings(name, email, phone, formattedDate, formattedTime, people, message);
            
            response.sendRedirect("main");
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

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
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
