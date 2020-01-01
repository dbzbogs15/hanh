/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author
 */
public class User {
    String username;
    String password;
    String email;
    String phone;
    String lname;
    String fname;
    String gioitinh;

    public User() {
    }

    public User(String username, String password, String email, String phone, String lname, String fname, String gioitinh) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.phone = phone;
        this.lname = lname;
        this.fname = fname;
        this.gioitinh = gioitinh;
    }

    @Override
    public String toString() {
        return "User{" + "username=" + username + ", password=" + password + ", email=" + email + ", phone=" + phone + ", lname=" + lname + ", fname=" + fname + ", gioitinh=" + gioitinh + '}';
    }

    public String getGioitinh() {
        return gioitinh;
    }

    public void setGioitinh(String gioitinh) {
        this.gioitinh = gioitinh;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }
    
}
