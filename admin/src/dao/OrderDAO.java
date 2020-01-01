package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.DBConnect;
import model.DBConnect;
import model.Order;
import model.Order;
import org.eclipse.jdt.internal.compiler.batch.Main;

public class OrderDAO {

    public void add(Order order) {
        Connection conn = DBConnect.getConnection();
        String sql = "insert into dathang values(?,?,?,?,?,?, GETDATE())";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, order.getOrderID());
            ps.setNString(2, order.getCustomerUserName());
            ps.setString(3, order.getProductID());
            ps.setString(4, order.getCount());
            ps.setString(5, order.getPrice());
            ps.setString(6, order.getPhoneNumber());
            ps.executeUpdate();
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void edit(Order order, String id) {
        Connection conn = DBConnect.getConnection();
        String sql = "update dathang set order_ID = ?, userCustomer_Name= ?, product_ID = ?, count = ?, price= ?, phoneNumber= ? where order_ID = '" + id + "'";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, order.getOrderID());
            ps.setNString(2, order.getCustomerUserName());
            ps.setString(3, order.getProductID());
            ps.setString(4, order.getCount());
            ps.setString(5, order.getPrice());
            ps.setString(6, order.getPhoneNumber());
            ps.executeUpdate();
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void delete(String madh) {
        Connection conn = DBConnect.getConnection();
        String sql = "delete dathang where order_ID= ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, madh);
            ps.executeUpdate();
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Order> getAllOrders() {
        Connection conn = DBConnect.getConnection();
        String sql = "select * from dathang";
        ArrayList<Order> orders = new ArrayList<>();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrderID(rs.getString(1));
                order.setCustomerUserName(rs.getString(2));
                order.setProductID(rs.getString(3));
                order.setCount(rs.getString(4));
                order.setPrice(rs.getString(5));
                order.setPhoneNumber(rs.getString(6));
                order.setDate(rs.getString(7));
                orders.add(order);
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }

    public Order getOrder(String id) {
        Connection conn = DBConnect.getConnection();
        String sql = "select * from dathang where order_ID = ?";
        Order order = new Order();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                order.setOrderID(rs.getString(1));
                order.setCustomerUserName(rs.getString(2));
                order.setProductID(rs.getString(3));
                order.setCount(rs.getString(4));
                order.setPrice(rs.getString(5));
                order.setPhoneNumber(rs.getString(6));
                order.setDate(rs.getString(7));
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return order;
    }

    public Order getOrderByID(String id) {
        Connection conn = DBConnect.getConnection();
        String sql = "select * from dathang where order_ID = ?";
        Order order = new Order();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                order.setOrderID(rs.getString(1));
                order.setCustomerUserName(rs.getString(2));
                order.setProductID(rs.getString(3));
                order.setCount(rs.getString(4));
                order.setPrice(rs.getString(5));
                order.setPhoneNumber(rs.getString(6));
                order.setDate(rs.getString(7));
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return order;
    }

    public boolean check(String id) {
        Connection cons = DBConnect.getConnection();
        String sql = "select order_ID from dathang where order_ID = ?";
        try {
            PreparedStatement ps = cons.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();
        System.out.println(dao.check("21212d"));
//        dao.edit(new Order("982","adminlephong2","Burger 2 lớp bò, phô mai,Cappucino-Regular,","17","801704","01643081355"),"982");

    }
}
