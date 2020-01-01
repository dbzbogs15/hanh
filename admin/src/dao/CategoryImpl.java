/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.Category;
import model.DBConnect;
import model.SanPham;

/**
 *
 * @author HongThai
 */
public class CategoryImpl implements CategoryDAO {

    @Override
    public ArrayList<Category> getAllCategorys() {
        Connection cons = DBConnect.getConnection();
        String sql = "SELECT * FROM category";
        ArrayList<Category> arr = new ArrayList<>();
        try {
            PreparedStatement ps = cons.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setId(rs.getString(1));
                category.setName(rs.getNString(2));
                arr.add(category);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return arr;
    }

    @Override
    public ArrayList<SanPham> getSanPham(String id) {
        Connection cons = DBConnect.getConnection();
        String sql = "SELECT name, masp, tensp, anhsp, giasp, mota, mancc  FROM category INNER JOIN sanpham on category.id = sanpham.id WHERE sanpham.id = '" + id + "'";
        ArrayList<SanPham> arr = new ArrayList<>();
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
                arr.add(sanPham);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return arr;
    }

    @Override
    public ArrayList<SanPham> getAllSanPham() {
        Connection cons = DBConnect.getConnection();
        String sql = "SELECT name, masp, tensp, anhsp, giasp, mota, mancc, image FROM category INNER JOIN sanpham on category.id = sanpham.id";
        ArrayList<SanPham> arr = new ArrayList<>();
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
                sanPham.setImage(rs.getString(8));
                arr.add(sanPham);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return arr;
    }
    @Override
    public void add(Category category) {
        Connection cons = DBConnect.getConnection();
        String sql = "insert into category values (?, ?)";
        try {
            PreparedStatement ps = cons.prepareStatement(sql);
            ps.setString(1, category.getId());
            ps.setString(2, category.getName());
            ps.executeUpdate();
            ps.close();
            cons.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void edit(Category category, String id) {
        Connection cons = DBConnect.getConnection();
        String sql = "update category set id = ?, name = ? where id ='" + id + "'";
        try {
            PreparedStatement ps = cons.prepareStatement(sql);
            ps.setString(1, category.getId());
            ps.setNString(2, category.getName());
            ps.executeUpdate();
            ps.close();
            cons.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void del(String id) {
        Connection cons = DBConnect.getConnection();
        String sql = "delete category where id = ?";
        try {
            PreparedStatement ps = cons.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();
            ps.close();
            cons.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean check(String id) {
        Connection cons = DBConnect.getConnection();
        String sql = "select id from sanpham where id = ?";
        try {
            PreparedStatement ps = cons.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
            rs.close();
            ps.close();
            cons.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Category getCategoryByID(String id) {
        Connection cons = DBConnect.getConnection();
        String sql = "select * from category where id = ?";
        Category c = new Category();
        try {
            PreparedStatement ps = cons.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                c.setId(rs.getString(1));
                c.setName(rs.getNString(2));
            }
            rs.close();
            ps.close();
            cons.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return c;
    }

    public static void main(String[] args) {
        CategoryImpl impl = new CategoryImpl();
//        System.out.println(impl.getAllCategorys().size());
//        System.out.println(impl.getSanPham("1003").size());
//        System.out.println(impl.getAllSanPham().toString());
//        int i = 1;
//        for (SanPham sanPham : impl.getAllSanPham()) {
//            System.out.println(i++ + sanPham.toString());
//        }
        System.out.println(impl.getCategoryByID("1002").toString());
    }

}
