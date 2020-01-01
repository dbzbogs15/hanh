package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.DBConnect;
import model.User;

public class UserDAOimpl implements UserDAO {

    @Override
    public boolean kiemTraTaiKhoan(String username) {
        Connection cons = DBConnect.getConnection();
        String sql = "select UserName from taikhoan where UserName = '" + username + "'";
        try {
            PreparedStatement ps = cons.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
            cons.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public void themTaiKhoan(User user) {
        Connection cons = DBConnect.getConnection();
        String sql = "insert into taikhoan values (?,?,?,?,?,?,?)";
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
            cons.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean kiemTraDangNhap(String username, String password) {
        Connection cons = DBConnect.getConnection();
        String sql = "select * from taikhoan where UserName = '" + username + "' and Pass = '" + password + "'";
        try {
            PreparedStatement ps = cons.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public User infoUser(String username) {
        Connection cons = DBConnect.getConnection();
        String sql = "select * from dbo.taikhoan where userName='" + username + "'";
        User user = new User();
        try {
            PreparedStatement ps = cons.prepareStatement(sql);
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
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public ArrayList<User> info() {
        Connection cons = DBConnect.getConnection();
        String sql = "select * from dbo.taikhoan ";
        ArrayList<User> users = new ArrayList<>();
        try {
            PreparedStatement ps = cons.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
//                    User user = new User(username, password, sql, sql, username, username)
                String UserN = rs.getString(1);
                String pass = rs.getString(2);
                String email = rs.getString(3);
                String phone = rs.getString(4);
                String lname = rs.getNString(5);
                String fname = rs.getNString(6);
                String gioitinh = rs.getNString(7);
                User user = new User(UserN, pass, email, phone, lname, fname, gioitinh);
                users.add(user);
            }
            return users;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void layLaiMatKhau(Object obj, String name) {
        User user = (User) obj;
        Connection cons = DBConnect.getConnection();
        String sql = "update taikhoan set UserName = ?, Pass = ? where UserName = '" + name + "'";

        try {
            PreparedStatement ps = cons.prepareStatement(sql);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            // ps.setString(3, user.getEmail());
//            ps.setString(4, user.getPhone());
//            ps.setNString(5, user.getLname());
//            ps.setNString(6, user.getFname());
//            ps.setNString(7, user.getGioitinh());

            ps.executeUpdate();
            ps.close();
            cons.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
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

    public static void main(String[] args) {
        UserDAOimpl userDAOimpl = new UserDAOimpl();
//		System.out.println(userDAOimpl.kiemTraTaiKhoan("admin"));
//                User user = new User("nguoi", "ta", "lap", "123", "qua", "troi");
//                userDAOimpl.themTaiKhoan(user);
//                   System.out.println(userDAOimpl.info("admin", "123").toString());
//                for(User user : userDAOimpl.info()) {
//                    System.out.println(user.toString());
//                }
        System.out.println(userDAOimpl.infoUser("admin").toString());
    }

}
