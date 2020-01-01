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
public class SanPham {
    String id;
    int masp;
    String tensp;
    String anhsp;
    int giasp;
    String mota;
    String image;
    
    public SanPham() {
        super();
    }
    
    public SanPham(String id, int masp, String tensp, String anhsp, int giasp, String mota, String image) {
        this.id = id;
        this.masp = masp;
        this.tensp = tensp;
        this.anhsp = anhsp;
        this.giasp = giasp;
        this.mota = mota;
        this.image = image;
    }

    public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getMasp() {
        return masp;
    }

    public void setMasp(int masp) {
        this.masp = masp;
    }

    public String getTensp() {
        return tensp;
    }

    public void setTensp(String tensp) {
        this.tensp = tensp;
    }

    public String getAnhsp() {
        return anhsp;
    }

    public void setAnhsp(String anhsp) {
        this.anhsp = anhsp;
    }

    public int getGiasp() {
        return giasp;
    }

    public void setGiasp(int giasp) {
        this.giasp = giasp;
    }

    public String getMota() {
        return mota;
    }

    public void setMota(String mota) {
        this.mota = mota;
    }

    @Override
    public String toString() {
        return "SanPham{" + "id=" + id + ", masp=" + masp + ", tensp=" + tensp + ", anhsp=" + anhsp + ", giasp=" + giasp + ", mota=" + mota + '}';
    }
    
    
}
