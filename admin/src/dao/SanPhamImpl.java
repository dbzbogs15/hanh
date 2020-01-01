/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.DBConnect;
import model.SanPham;

public class SanPhamImpl implements SanPhamDAO {

    @Override
    public void delSP(String msp) {
        Connection cons = DBConnect.getConnection();
        String sql = "Delete sanpham where masp = ?";
        try {
            PreparedStatement ps = cons.prepareStatement(sql);
            ps.setString(1, msp);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void edit(SanPham sanPham, String masp) {
        Connection cons = DBConnect.getConnection();
        String sql = "Update sanpham set id = ?, masp = ?, tensp = ?, anhsp = ?, giasp = ?, mota = ?, mancc = ? where masp = '" + masp + "'";
        try {
            PreparedStatement ps = cons.prepareStatement(sql);
            ps.setString(1, sanPham.getId());
            ps.setInt(2, sanPham.getMasp());
            ps.setNString(3, sanPham.getTensp());
            ps.setString(4, sanPham.getAnhsp());
            ps.setInt(5, sanPham.getGiasp());
            ps.setNString(6, sanPham.getMota());
            ps.setString(7, sanPham.getNcc());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void editSP(SanPham sanPham) {
        Connection cons = DBConnect.getConnection();
        String sql = "Update sanpham set id = ?, tensp = ?, anhsp = ?, giasp = ?, mota = ? where masp = ?";
        try {
            PreparedStatement ps = cons.prepareStatement(sql);
            ps.setString(1, sanPham.getId());
//            ps.setString(2, sanPham.getMasp());
            ps.setNString(2, sanPham.getTensp());
            ps.setString(3, sanPham.getAnhsp());
            ps.setInt(4, sanPham.getGiasp());
            ps.setNString(5, sanPham.getMota());
            ps.setInt(6, sanPham.getMasp());
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public void add(SanPham sanPham) {
        Connection cons = DBConnect.getConnection();
        String sql = "insert into sanpham values(?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = cons.prepareStatement(sql);
            ps.setString(1, sanPham.getId());
            ps.setNString(2, sanPham.getTensp());
            ps.setString(3, "");
            ps.setInt(4, sanPham.getGiasp());
            ps.setNString(5, sanPham.getMota());
            ps.setString(6, sanPham.getNcc());
            ps.setString(7, sanPham.getImage());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SanPhamImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public SanPham getSanPham(String masp) {
        Connection cons = DBConnect.getConnection();
        String sql = "SELECT id, masp, tensp, anhsp, giasp, mota, mancc, image FROM sanpham WHERE masp ='" + masp + "'";
        SanPham sanPham = new SanPham();
        try {
            PreparedStatement ps = cons.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                sanPham.setId(rs.getString(1));
                sanPham.setMasp(rs.getInt(2));
                sanPham.setTensp(rs.getNString(3));
                sanPham.setAnhsp(rs.getString(4));
                sanPham.setGiasp(rs.getInt(5));
                sanPham.setMota(rs.getNString(6));
                sanPham.setNcc(rs.getString(7));
                sanPham.setImage(rs.getString(8));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sanPham;
    }

    @Override
    public boolean checkMasp(String masp) {
        Connection cons = DBConnect.getConnection();
        String sql = "select masp from sanpham where masp = '" + masp + "'";
        try {
            PreparedStatement ps = cons.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<SanPham> getSanPhamByNCC(String ncc) {
        Connection cons = DBConnect.getConnection();
        String sql = "select id, masp, tensp, anhsp, giasp, mota, mancc, image from sanpham where mancc = '" + ncc + "'";
        List<SanPham> list = new ArrayList<>();
        try {
            PreparedStatement ps = cons.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SanPham sanPham = new SanPham();
                sanPham.setId(rs.getString(1));
                sanPham.setMasp(rs.getInt(2));
                sanPham.setTensp(rs.getNString(3));
                sanPham.setAnhsp(rs.getString(4));
                sanPham.setGiasp(rs.getInt(5));
                sanPham.setMota(rs.getNString(6));
                sanPham.setNcc(rs.getString(7));
                list.add(sanPham);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public ArrayList<SanPham> getProductsByCond(String cond) {// huong thuc nay dung de loc lay du lieu
        Connection cons = DBConnect.getConnection();
        ArrayList<SanPham> products = new ArrayList<>();
        try {
            Statement statement = cons.createStatement();
            ResultSet rs = statement.executeQuery("select id, masp, tensp, anhsp, giasp, mota, mancc, image from sanpham where id like '%" + cond + "' ");
            while (rs.next()) {
                SanPham sanPham = new SanPham();
                sanPham.setId(rs.getString(1));
                sanPham.setMasp(rs.getInt(2));
                sanPham.setTensp(rs.getNString(3));
                sanPham.setAnhsp(rs.getString(4));
                sanPham.setGiasp(rs.getInt(5));
                sanPham.setMota(rs.getNString(6));
                products.add(sanPham);

            }
            rs.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public static void main(String[] args) {
//        SanPhamImpl sanPhamImpl = new SanPhamImpl();
//        System.out.println(sanPhamImpl.getSanPham("2001").toString());
        SanPhamImpl sanPhamImpl = new SanPhamImpl();
        for (SanPham sanPham : sanPhamImpl.getSanPhamByNCC("BCD")) {
            System.out.println(sanPham.toString());
        }
//        sanPhamImpl.add(new SanPham("1001", "dahd", "dsjdsj", "dhad", 54754, "đậ", "BCD"));
//        sanPhamImpl.edit(new SanPham("1001", "ksjasjk", "dsjdjh", "dsdshj", 347347, "dsjdsjd", "1234"), "dahd");
//        sanPhamImpl.editSP(new SanPham("1001", "2007", "ssdsdsdsp1", "suadsdsdsds", 161656565, "suadfdfdf"));
//        System.out.println(sanPhamImpl.checkMasp("202"));
//          sanPhamImpl.add(new SanPham("1004", "2005", "moi", "moi", 123, "mota"));
//            sanPhamImpl.edit(new SanPham("1001", "ck10", "Một miếng gà truyền thống/giòn cay", "/image/thucan/chicken/chicken1.jpg", 34000, "Có thể chọn 1 miếng gà truyền thống, hoặc giòn cay"), "ck1");
    }
}
