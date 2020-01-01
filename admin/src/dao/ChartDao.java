package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

import model.Category;
import model.DBConnect;
import model.Value;

public class ChartDao {

    public ArrayList<Value> getAll() {
        try {

            CategoryImpl categoryDAO = new CategoryImpl();
            SanPhamImpl sanphamDAO = new SanPhamImpl();
            ArrayList<Value> list = new ArrayList<Value>();
            for (Category category : categoryDAO.getAllCategorys()) {
                list.add(new Value(category.getName(),
                        sanphamDAO.getProductsByCond(category.getId()).size()));
            }
            return list;
        } catch (Exception ex) {
            Logger.getLogger(ChartDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int tongSoLuongKhachHang() {
        UserDAO dao = new UserDAO();
        int result = dao.getAlUser().size();
        return result;
    }

    public void print(ArrayList<Value> list) {
        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.get(i).toString());
        }
    }

    public int getSanPhamBanTrongNgay() {
        Connection cons = DBConnect.getConnection();
        String sql = "SELECT SUM(CONVERT(INT, price)) from dathang WHERE ngayMua = CONVERT(DATE,GETDATE())";
        int soSanPham = 0;
        try {
            PreparedStatement ps = cons.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                soSanPham = rs.getInt(1);
            }
            cons.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return soSanPham;
    }

    public int getSanPhamBanTrongTuan() {
        Connection cons = DBConnect.getConnection();
        String sql = "SELECT SUM(CONVERT(INT,[price])) from dathang\n"
                + "WHERE ngayMua BETWEEN CONVERT(DATE, DATEADD(DAY, -7, GETDATE())) AND CONVERT(DATE,GETDATE())";
        int soSanPham = 0;
        try {
            PreparedStatement ps = cons.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                soSanPham = rs.getInt(1);
            }
            cons.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return soSanPham;
    }

    public int getSanPhamBanTrongThang() {
        Connection cons = DBConnect.getConnection();
        String sql = "SELECT SUM(CONVERT(INT,[price])) from dathang\n"
                + "WHERE MONTH(ngayMua) = MONTH(GETDATE())";
        int soSanPham = 0;
        try {
            PreparedStatement ps = cons.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                soSanPham = rs.getInt(1);
            }
            cons.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return soSanPham;
    }

    public int getSanPhamBanTrongNam() {
        Connection cons = DBConnect.getConnection();
        String sql = "SELECT SUM(CONVERT(INT,[price])) from dathang\n"
                + "WHERE YEAR(ngayMua) = YEAR(GETDATE())";
        int soSanPham = 0;
        try {
            PreparedStatement ps = cons.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                soSanPham = rs.getInt(1);
            }
            cons.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return soSanPham;
    }

    public int getTongDoanhThu() {
        Connection cons = DBConnect.getConnection();
        String sql = "SELECT SUM(CONVERT(INT,price)) FROM dathang";
        int tongDoanThu = 0;
        try {
            PreparedStatement ps = cons.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                tongDoanThu = rs.getInt(1);
            }
            cons.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tongDoanThu;
    }
    public Map<Integer, Integer> doanhThuTheoThang(String year) {
        Connection cons = DBConnect.getConnection();
        String sql = "SELECT MONTH(ngayMua) as thang, SUM(CONVERT(INT, price)) as doanhthu from dathang\n"
                + "WHERE YEAR(ngayMua) = ?\n"
                + "GROUP BY MONTH(ngayMua)";
        Map<Integer, Integer> arr = new HashMap<Integer, Integer>();
        
        try {
            PreparedStatement ps = cons.prepareStatement(sql);
            ps.setString(1, year);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {                
                arr.put(rs.getInt(1), rs.getInt(2));
            }
            cons.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return arr;
    }

    public static void main(String[] args) {
        ChartDao dao = new ChartDao();
        for (int i = 0; i < 12; i++) {
            System.out.println(dao.doanhThuTheoThang("2017"));
            
        }
//        System.out.println(dao.doanhThuTheoThang("2017").size());
    }
}
