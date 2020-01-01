package dao;

import java.util.ArrayList;
import model.User;

public interface UserDAO {
	public boolean kiemTraTaiKhoan(String username);
        public void themTaiKhoan(User user);
        public boolean kiemTraDangNhap(String username, String password);
        public ArrayList<User> info();
}
