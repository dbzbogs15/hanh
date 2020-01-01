/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author NguyenLe
 */
public class Order {
    String orderID;
    String customerUserName;
    String productID;

    @Override
    public String toString() {
        return "Order{" + "orderID=" + orderID + ", customerUserName=" + customerUserName + ", productID=" + productID + ", count=" + count + ", price=" + price + ", phoneNumber=" + phoneNumber + '}';
    }
    String count;
    String price;
    String phoneNumber;

    public Order(String orderID, String customerUserName, String productID, String count, String price, String phoneNumber) {
        this.orderID = orderID;
        this.customerUserName = customerUserName;
        this.productID = productID;
        this.count = count;
        this.price = price;
        this.phoneNumber = phoneNumber;
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
