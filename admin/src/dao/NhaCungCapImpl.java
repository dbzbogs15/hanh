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
import java.util.List;
import model.DBConnect;
import model.NhaCungCap;

/**
 *
 * @author HongThai
 */
public class NhaCungCapImpl {

    public void add(NhaCungCap nhaCungCap) {
        Connection cons = DBConnect.getConnection();
        String sql = "insert into nhacungcap values (?,?,?,?)";
        try {
            PreparedStatement ps = cons.prepareStatement(sql);
            ps.setString(1, nhaCungCap.getMancc());
            ps.setNString(2, nhaCungCap.getTenncc());
            ps.setNString(3, nhaCungCap.getDiachi());
            ps.setString(4, nhaCungCap.getSdt());
            ps.executeUpdate();
            ps.close();
            cons.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void edit(NhaCungCap nhaCungCap, String mancc) {
        Connection cons = DBConnect.getConnection();
        String sql = "update nhacungcap set mancc = ?, tenncc = ?, diachi = ?, sdt = ? where mancc = ?";
        try {
            PreparedStatement ps = cons.prepareStatement(sql);
            ps.setString(1, nhaCungCap.getMancc());
            ps.setNString(2, nhaCungCap.getTenncc());
            ps.setNString(3, nhaCungCap.getDiachi());
            ps.setString(4, nhaCungCap.getSdt());
            ps.setString(5, mancc);
            ps.executeUpdate();
            ps.close();
            cons.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void del(String mancc) {
        Connection cons = DBConnect.getConnection();
        String sql = "delete nhacungcap where mancc = ?";
        try {
            PreparedStatement ps = cons.prepareStatement(sql);
            ps.setString(1, mancc);
            ps.executeUpdate();
            ps.close();
            cons.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<NhaCungCap> getAllNhaCungCaps() {
        Connection cons = DBConnect.getConnection();
        String sql = "select * from nhacungcap";
        List<NhaCungCap> list = new ArrayList<>();
        try {
            PreparedStatement ps = cons.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                NhaCungCap nhaCungCap = new NhaCungCap();
                nhaCungCap.setMancc(rs.getString(1));
                nhaCungCap.setTenncc(rs.getNString(2));
                nhaCungCap.setDiachi(rs.getNString(3));
                nhaCungCap.setSdt(rs.getString(4));
                list.add(nhaCungCap);
            }
            rs.close();
            ps.close();
            cons.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public NhaCungCap getNhaCungCap(String mancc) {
        Connection cons = DBConnect.getConnection();
        String sql = "select * from nhacungcap where mancc = ?";
        NhaCungCap nhaCungCap = new NhaCungCap();
        try {
            PreparedStatement ps = cons.prepareStatement(sql);
            ps.setString(1, mancc);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                nhaCungCap.setMancc(rs.getString(1));
                nhaCungCap.setTenncc(rs.getNString(2));
                nhaCungCap.setDiachi(rs.getNString(3));
                nhaCungCap.setSdt(rs.getString(4));
            }
            rs.close();
            ps.close();
            cons.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nhaCungCap;
    }

    public boolean check(String mancc) {
        Connection cons = DBConnect.getConnection();
        String sql = "select mancc from nhacungcap where mancc = ?";
        try {
            PreparedStatement ps = cons.prepareStatement(sql);
            ps.setString(1, mancc);
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
        System.out.println(new NhaCungCapImpl().check("123"));
    }
}
