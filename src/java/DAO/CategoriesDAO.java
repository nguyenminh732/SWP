/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;
import Entity.Categories;
import Context.DBContext;
import Entity.Menu;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author Admin
 */
public class CategoriesDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
            public List<Categories> getAllCate() {
        List<Categories> list = new ArrayList<>();
        String query = "Select * FROM Categories";
        try {
            conn = new DBContext().getConnection(); // Mở kết nối với SQL
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Categories(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3)));
            }
        } catch (Exception e) {
            e.printStackTrace(); // In lỗi ra console để dễ debug
        } finally {
            // Đóng kết nối, PreparedStatement và ResultSet nếu có
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return list;
    }
        public static void main(String[] args) {
        CategoriesDAO dao = new CategoriesDAO();
        List<Categories> list = dao.getAllCate();
        for (Categories o : list) {
            System.out.println(o);
        }
    }
}
