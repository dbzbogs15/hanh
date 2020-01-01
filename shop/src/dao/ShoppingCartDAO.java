package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import model.DBConnect;
import model.Order;
import model.SanPham;

public class ShoppingCartDAO {

    public static Map<String, Order> mapOpenCart = new HashMap<String, Order>();

    public boolean addOrderToDTB(Order o) {
        Connection cons = DBConnect.getConnection();
        String sql = "insert into dathang values (?,?,?,?,?,?)";
        try {
            PreparedStatement ps = cons.prepareStatement(sql);
            ps.setString(1, o.getOrderID());
            ps.setString(2, o.getCustomerUserName());
            ps.setString(3, o.getProductID());
            ps.setString(4, o.getCount());
            ps.setString(5, o.getPrice());
            ps.setString(6, o.getPhoneNumber());
            ps.executeUpdate();
            cons.close();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean delete(String id) {
        mapOpenCart.remove(id);
        return true;
    }

    public int tinhGiaTienSanPhamTheoSoLuong(String count, SanPham sp) {
        return sp.getGiasp() * Integer.parseInt(count);
    }

    public SanPham getSanPhamMuHang(int id) {
        ArrayList<SanPham> dsSanPham = new CategoryImpl().getAllSanPham();
        SanPham sp = null;
        for (int i = 0; i < dsSanPham.size(); i++) {
            if (dsSanPham.get(i).getMasp() == (id)) {
                sp = dsSanPham.get(i);
                break;
            }
        }
        return sp;
    }

    public int randomOrderID(int limit) {
        Random rd = new Random();
        int s = rd.nextInt(limit);

        return s;

    }

    public String getTongSanPhamMuaHang() {
        String productName = "";
        for (Order o : mapOpenCart.values()) {
            productName += o.getProductID() + ",";
        }
        return productName;
    }

    public String getTongSoLuongSanPhamMuaHang() {
        int count = 0;
        for (Order o : mapOpenCart.values()) {
            count += Integer.parseInt(o.getCount());
        }
        return count + "";
    }

    public String getTongGiaTienDonHang() {
        int price = 0;
        for (Order o : mapOpenCart.values()) {
            price += Integer.parseInt(o.getPrice());
        }
        return price + "";
    }
    public static void main(String[] args) {
        System.out.println(new ShoppingCartDAO().addOrderToDTB(new Order("213s13", "32323", "32323", "3232", "23232", "364364364")));
    }
}
