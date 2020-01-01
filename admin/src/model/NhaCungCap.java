/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author HongThai
 */
public class NhaCungCap {
    String mancc;
    String tenncc;
    String diachi;
    String sdt;

    public NhaCungCap(String mancc, String tenncc, String diachi, String sdt) {
        this.mancc = mancc;
        this.tenncc = tenncc;
        this.diachi = diachi;
        this.sdt = sdt;
    }

    public String getMancc() {
        return mancc;
    }

    public void setMancc(String mancc) {
        this.mancc = mancc;
    }

    public String getTenncc() {
        return tenncc;
    }

    public void setTenncc(String tenncc) {
        this.tenncc = tenncc;
    }

    public String getDiachi() {
        return diachi;
    }

    public void setDiachi(String diachi) {
        this.diachi = diachi;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public NhaCungCap() {
    }

    @Override
    public String toString() {
        return "NhaCungCap{" + "mancc=" + mancc + ", tenncc=" + tenncc + ", diachi=" + diachi + ", sdt=" + sdt + '}';
    }
    
    
}
