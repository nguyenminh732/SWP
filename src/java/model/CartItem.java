package model;

public class CartItem {
    private String menuID;
    private String menuName;
    private double menuPrice;
    private int quantity;
    
    public CartItem() {
    }
    
    public CartItem(String menuID, String menuName, double menuPrice, int quantity) {
        this.menuID = menuID;
        this.menuName = menuName;
        this.menuPrice = menuPrice;
        this.quantity = quantity;
    }

    public String getMenuID() {
        return menuID;
    }

    public void setMenuID(String menuID) {
        this.menuID = menuID;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public double getMenuPrice() {
        return menuPrice;
    }

    public void setMenuPrice(double menuPrice) {
        this.menuPrice = menuPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    public double getTotal() {
        return menuPrice * quantity;
    }
}
