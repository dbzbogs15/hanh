/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import model.Category;
import model.SanPham;

/**
 *
 * @author HongThai
 */
public interface CategoryDAO {
    public ArrayList<Category> getAllCategorys();
    public ArrayList<SanPham> getSanPham(String id);
    public ArrayList<SanPham> getAllSanPham();
    public void add(Category category);
    public void edit(Category category, String id);
    public void del(String id);
    public boolean check(String id);
    public Category getCategoryByID(String id);
}
