/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAO.CategoriesDAO;
import DAO.ChefDAO;
import DAO.MenuDAO;
import Entity.Categories;
import Entity.Chef;
import Entity.Menu;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Admin
 */
public class MainController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
               MenuDAO menudao = new MenuDAO();
               CategoriesDAO catedao = new CategoriesDAO();
               ChefDAO chefdao = new ChefDAO();
               
               List<Menu> listMenuByCateID1 = menudao.getMenuByCateID1();
               List<Menu> listMenuByCateID2 = menudao.getMenuByCateID2();
               List<Menu> listMenuByCateID3 = menudao.getMenuByCateID3();
               List<Menu> listMenuByCateID4 = menudao.getMenuByCateID4();
               List<Menu> listMenuByCateID5 = menudao.getMenuByCateID5();
               List<Menu> listMenuByCateID6 = menudao.getMenuByCateID6();
               List<Categories> listCate = catedao.getAllCate();
               List<Chef> listchef = chefdao.getAllChef();
               
                       
               request.setAttribute("listMenuByCateID1", listMenuByCateID1);
               request.setAttribute("listMenuByCateID2", listMenuByCateID2);
               request.setAttribute("listMenuByCateID3", listMenuByCateID3);
               request.setAttribute("listMenuByCateID4", listMenuByCateID4);
               request.setAttribute("listMenuByCateID5", listMenuByCateID5);
               request.setAttribute("listMenuByCateID6", listMenuByCateID6);
               request.setAttribute("listchef", listchef);
               request.setAttribute("listcate", listCate);
               request.getRequestDispatcher("main.jsp").forward(request, response);
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
