/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Entity.Menu;
import Context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class MenuDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Menu> getMenuByCateID1() {
        List<Menu> list = new ArrayList<>();
        String query = "SELECT * FROM Menu WHERE CategoryID = 1";
        try {
            conn = new DBContext().getConnection(); // Mở kết nối với SQL
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Menu(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6)));
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
    public List<Menu> getMenuByCateID2() {
        List<Menu> list = new ArrayList<>();
        String query = "SELECT * FROM Menu WHERE CategoryID = 2";
        try {
            conn = new DBContext().getConnection(); // Mở kết nối với SQL
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Menu(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6)));
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
    public List<Menu> getMenuByCateID3() {
        List<Menu> list = new ArrayList<>();
        String query = "SELECT * FROM Menu WHERE CategoryID = 3";
        try {
            conn = new DBContext().getConnection(); // Mở kết nối với SQL
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Menu(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6)));
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
    public List<Menu> getMenuByCateID4() {
        List<Menu> list = new ArrayList<>();
        String query = "SELECT * FROM Menu WHERE CategoryID = 4";
        try {
            conn = new DBContext().getConnection(); // Mở kết nối với SQL
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Menu(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6)));
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
    public List<Menu> getMenuByCateID5() {
        List<Menu> list = new ArrayList<>();
        String query = "SELECT * FROM Menu WHERE CategoryID = 5";
        try {
            conn = new DBContext().getConnection(); // Mở kết nối với SQL
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Menu(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6)));
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
    public List<Menu> getMenuByCateID6() {
        List<Menu> list = new ArrayList<>();
        String query = "SELECT * FROM Menu WHERE CategoryID = 6";
        try {
            conn = new DBContext().getConnection(); // Mở kết nối với SQL
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Menu(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6)));
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
        MenuDAO dao = new MenuDAO();
        List<Menu> list = dao.getMenuByCateID6();
        for (Menu o : list) {
            System.out.println(o);
        }
    }
}
