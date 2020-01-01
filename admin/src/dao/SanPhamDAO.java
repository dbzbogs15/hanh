/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import model.SanPham;

/**
 *
 * @author HongThai
 */
public interface SanPhamDAO {
    public void delSP(String masp);
    public void editSP(SanPham sanPham);
    public void add(SanPham sanPham);
    public SanPham getSanPham(String masp);
    public boolean checkMasp(String masp);
    
}
