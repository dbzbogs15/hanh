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
import model.DBConnect;
import model.User;

/**
 *
 * @author HongThai
 */
public class UserDAO implements ObjectDAO {

    @Override
    public void add(Object obj) {
        User user = (User) obj;
        Connection cons = DBConnect.getConnection();
        String sql = "insert into taikhoan values(?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = cons.prepareStatement(sql);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPhone());
            ps.setNString(5, user.getLname());
            ps.setNString(6, user.getFname());
            ps.setNString(7, user.getGioitinh());
            ps.executeUpdate();
            ps.close();
            cons.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void edit(Object obj, String str) {
        User user = (User) obj;
        Connection cons = DBConnect.getConnection();
        String sql = "update taikhoan set UserName = ?, Pass = ?, Email = ?, Phone = ?, LName = ?, FName = ?, Gioitinh = ? where UserName = '" + str + "'";
        try {
            PreparedStatement ps = cons.prepareStatement(sql);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPhone());
            ps.setNString(5, user.getLname());
            ps.setNString(6, user.getFname());
            ps.setNString(7, user.getGioitinh());
            ps.executeUpdate();
            ps.close();
            cons.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void del(String str) {
        Connection cons = DBConnect.getConnection();
        String sql = "delete taikhoan where UserName = ?";
        try {
            PreparedStatement ps = cons.prepareStatement(sql);
            ps.setString(1, str);
            ps.executeUpdate();
            ps.close();
            cons.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean check(String str) {
        Connection cons = DBConnect.getConnection();
        String sql = "select UserName from taikhoan where UserName = ?";
        try {
            PreparedStatement ps = cons.prepareStatement(sql);
            ps.setString(1, str);
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

    public ArrayList<User> getAlUser() {
        Connection cons = DBConnect.getConnection();
        String sql = "select * from taikhoan";
        ArrayList<User> arr = new ArrayList<>();
        try {
            PreparedStatement ps = cons.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUsername(rs.getString(1));
                user.setPassword(rs.getString(2));
                user.setEmail(rs.getString(3));
                user.setPhone(rs.getString(4));
                user.setLname(rs.getNString(5));
                user.setFname(rs.getNString(6));
                user.setGioitinh(rs.getNString(7));
                arr.add(user);
            }
            rs.close();
            ps.close();
            cons.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return arr;
    }

    public User getUser(String str) {
        Connection cons = DBConnect.getConnection();
        String sql = "select * from taikhoan where UserName = ?";
        User user = new User();
        try {
            PreparedStatement ps = cons.prepareStatement(sql);
            ps.setString(1, str);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                user.setUsername(rs.getString(1));
                user.setPassword(rs.getString(2));
                user.setEmail(rs.getString(3));
                user.setPhone(rs.getString(4));
                user.setLname(rs.getNString(5));
                user.setFname(rs.getNString(6));
                user.setGioitinh(rs.getNString(7));
            }
            rs.close();
            ps.close();
            cons.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public static void main(String[] args) {
        UserDAO aO = new UserDAO();
        System.out.println(aO.getUser("admin").toString());
    }

}
