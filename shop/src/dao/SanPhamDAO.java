/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.ResultSet;
import java.util.Set;
import java.util.TreeSet;

import model.DBConnect;

public class SanPhamDAO{
    public static Set<String>dsSPByName = new TreeSet<>();
    public SanPhamDAO(){
        }
    
    
    public Set<String>getSPByName(){
        ResultSet rs;
        try {
            rs = new DBConnect().chonDuLieu("SELECT * FROM sanpham");
            while(rs.next()){
                dsSPByName.add(rs.getNString(3));
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
           
        }
        return dsSPByName;
        
    

        
    }
}
