package model;
public class Order {
    String orderID;
    String customerUserName;
    String productID;
    String count;
    String price;
    String phoneNumber;
    String date;
    public Order(){
        
    }

    public Order(String orderID, String customerUserName, String productID, String count, String price, String phoneNumber, String date) {
        this.orderID = orderID;
        this.customerUserName = customerUserName;
        this.productID = productID;
        this.count = count;
        this.price = price;
        this.phoneNumber = phoneNumber;
        this.date = date;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getOrderID() {
        return orderID;
    }

    public String getCustomerUserName() {
        return customerUserName;
    }

    public String getProductID() {
        return productID;
    }

    public String getCount() {
        return count;
    }

    public String getPrice() {
        return price;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public void setCustomerUserName(String customerUserName) {
        this.customerUserName = customerUserName;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public void setCount(String count) {
        this.count = count;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }  
}
