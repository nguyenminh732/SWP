/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

/**
 *
 * @author Admin
 */
public class Menu {
    private int menuId;
    private String menuName;
    private int menuPrice;
    private String menuImg;
    private String menuDesc;
    private int menuCateId;

    public Menu() {
    }

    public Menu(int menuId, String menuName, int menuPrice, String menuImg, String menuDesc, int menuCateId) {
        this.menuId = menuId;
        this.menuName = menuName;
        this.menuPrice = menuPrice;
        this.menuImg = menuImg;
        this.menuDesc = menuDesc;
        this.menuCateId = menuCateId;
    }

    public int getMenuId() {
        return menuId;
    }

    public void setMenuId(int menuId) {
        this.menuId = menuId;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public int getMenuPrice() {
        return menuPrice;
    }

    public void setMenuPrice(int menuPrice) {
        this.menuPrice = menuPrice;
    }

    public String getMenuImg() {
        return menuImg;
    }

    public void setMenuImg(String menuImg) {
        this.menuImg = menuImg;
    }

    public String getMenuDesc() {
        return menuDesc;
    }

    public void setMenuDesc(String menuDesc) {
        this.menuDesc = menuDesc;
    }

    public int getMenuCateId() {
        return menuCateId;
    }

    public void setMenuCateId(int menuCateId) {
        this.menuCateId = menuCateId;
    }
    
    
}


