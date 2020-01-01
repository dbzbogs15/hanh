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
import java.util.ArrayList;
import java.util.List;

import model.Category;
import model.DBConnect;
import model.SanPham;

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
		String sql = "SELECT id, masp, tensp, anhsp, giasp, mota, image FROM sanpham WHERE id = '" + id + "'";
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
				sanPham.setImage(rs.getString(7));
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
		String sql = "select id, masp, tensp, anhsp, giasp, mota, mancc, image FROM sanpham order by masp desc";
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
				sanPham.setImage(rs.getString(8));
				arr.add(sanPham);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return arr;
	}

	public ArrayList<SanPham> getSanPhamPage(String id, int start, int end) {
		Connection cons = DBConnect.getConnection();
		String sql = "select id, masp, tensp, anhsp, giasp, mota, mancc, image from sanpham order by id OFFSET 0 ROWS FETCH NEXT 2 ROWS ONLY;";
		ArrayList<SanPham> arr = new ArrayList<>();
		try {
			PreparedStatement ps = cons.prepareStatement(sql);
//            ps.setString(1, id);
//            ps.setInt(1, start);
//            ps.setInt(2, end);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				SanPham sanPham = new SanPham();
				sanPham.setId(rs.getString(1));
				sanPham.setMasp(rs.getInt(2));
				sanPham.setTensp(rs.getNString(3));
				sanPham.setAnhsp(rs.getString(4));
				sanPham.setGiasp(rs.getInt(5));
				sanPham.setMota(rs.getNString(6));
				sanPham.setImage(rs.getString(7));
				arr.add(sanPham);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return arr;
	}

	public SanPham getSanPhamByMaSP(int masp) {
		SanPham sanPham = new SanPham();
		Connection cons = DBConnect.getConnection();
		String sql = "select id, masp, tensp, anhsp, giasp, mota, mancc, image from sanpham where masp = '" + masp
				+ "'";
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
				sanPham.setImage(rs.getString(8));
			}
			cons.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sanPham;
	}

	public List<SanPham> getSanPhamByTenSP(String tensp) {
		Connection cons = DBConnect.getConnection();
		String sql = "select id, masp, tensp, anhsp, giasp, mota, mancc, image FROM sanpham where tensp like '%" + tensp + "%'";
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
				sanPham.setImage(rs.getString(8));
				arr.add(sanPham);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return arr;
	}

//    public ArrayList<SanPham> getListsanPhamByPages(String id, int firstResult, int maxResult) throws SQLException {
//        Connection connection = DBConnect.getConnection();
//        String sql = "SELECT TOP 2 4 * FROM sanpham WHERE id = '" + id + "'";
//        PreparedStatement ps = connection.prepareCall(sql);
////        ps.setInt(1, firstResult);
////        ps.setInt(2, maxResult);
//        ResultSet rs = ps.executeQuery();
//        ArrayList<SanPham> list = new ArrayList<>();
//        while (rs.next()) {
//            SanPham sanPham = new SanPham();
//            sanPham.setId(rs.getString(1));
//            sanPham.setMasp(rs.getString(2));
//            sanPham.setTensp(rs.getNString(3));
//            sanPham.setAnhsp(rs.getString(4));
//            sanPham.setGiasp(rs.getInt(5));
//            sanPham.setMota(rs.getNString(6));
//            list.add(sanPham);
//        }
//        return list;
//    }
	public static void main(String[] args) throws SQLException {
		CategoryImpl impl = new CategoryImpl();
//        System.out.println(impl.getAllCategorys().size());
//        System.out.println(impl.getSanPham("1003").size());
//        System.out.println(impl.getAllSanPham().toString());
//        System.out.println(impl.getSanPhamPage("1001", 2, 3).toString());
//        System.out.println(impl.getListsanPhamByPages("1001", 3, 5));
//		System.out.println(impl.getSanPhamByMaSP("bg4").toString());
	}

}
