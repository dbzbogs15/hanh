package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import model.DBConnect;
import model.Order;

public class ThongKeDAO {

    public ThongKeDAO() {

    }

    public Map<String, Order> thongKeTheoTuan(String tuan, String text) {
        ArrayList<String> list = danhSachKhoangNgayTheoTuan(tuan, text);
        return thongKeTheoKhoanNgay(list.get(0), list.get(1));
    }

    public ArrayList<String> danhSachKhoangNgayTheoTuan(String tuan, String text) {
        int week = Integer.parseInt(tuan);
        String year = text.substring(0, text.indexOf("-"));
        String month = text.substring(text.indexOf("-") + 1, text.length());
        ArrayList<String> list = new ArrayList<>();
        switch (week) {
            case 1:
                list.add(year + "-" + month + "-" + 1);
                list.add(year + "-" + month + "-" + 7);
                break;
            case 2:
                list.add(year + "-" + month + "-" + 8);
                list.add(year + "-" + month + "-" + 14);
                break;
            case 3:
                list.add(year + "-" + month + "-" + 15);
                list.add(year + "-" + month + "-" + 21);
                break;
            case 4:
                list.add(year + "-" + month + "-" + 22);
                list.add(year + "-" + month + "-" + 31);
                break;
            default:
                break;
        }
        return list;
    }

    public Map<String, Order> thongKeTheoKhoanNgay(String dateStart, String dateEnd) {
        Map<String, Order> map = new HashMap<>();
        try {
            Connection cons = DBConnect.getConnection();
            String sql = "select * from [dbo].[dathang] where ngayMua>='" + dateStart + "' and ngayMua<='" + dateEnd + "'";
            PreparedStatement ps = cons.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String orderid = rs.getString(1);
                String ordercus_name = rs.getString(2);
                String product_id = rs.getString(3);
                String count = rs.getString(4);
                String price = rs.getString(5);
                String phone_number = rs.getString(6);
                String ngayMua = rs.getString(7);
                map.put(orderid, new Order(orderid, ordercus_name, product_id, count, price, phone_number, ngayMua));
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Loi thong ke theo thang");
        }
        return map;

    }

    public Map<String, Order> thongKeTheoThang(String text) {
        String year = text.substring(0, text.indexOf("-"));
        String month = text.substring(text.indexOf("-") + 1, text.length());

        Map<String, Order> map = new HashMap<>();
        try {

            Connection cons = DBConnect.getConnection();
            String sql = "select * from [dbo].[dathang] where   month(ngayMua)='" + month + "'";
            PreparedStatement ps = cons.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String orderid = rs.getString(1);
                String ordercus_name = rs.getString(2);
                String product_id = rs.getString(3);
                String count = rs.getString(4);
                String price = rs.getString(5);
                String phone_number = rs.getString(6);
                String ngayMua = rs.getString(7);
                map.put(orderid, new Order(orderid, ordercus_name, product_id, count, price, phone_number, ngayMua));

            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Loi thong ke theo thang");
        }
        return map;
    }

    public Map<String, Order> thongKeTheoThangHeThong() {
        Date toDate = new Date(System.currentTimeMillis());
        SimpleDateFormat fomatTime = new SimpleDateFormat("yyyy-MM-dd");
        String date = fomatTime.format(toDate.getTime());

        String year = date.substring(0, date.indexOf("-"));
        String month = date.substring(date.indexOf("-") + 1, date.lastIndexOf("-"));

        Map<String, Order> map = new HashMap<>();
        try {
            Connection cons = DBConnect.getConnection();
            String sql = "select * from [dbo].[dathang] where year(ngayMua)='" + year + "' and month(ngayMua)='" + month + "'";
            PreparedStatement ps = cons.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String orderid = rs.getString(1);
                String ordercus_name = rs.getString(2);
                String product_id = rs.getString(3);
                String count = rs.getString(4);
                String price = rs.getString(5);
                String phone_number = rs.getString(6);
                String ngayMua = rs.getString(7);
                map.put(orderid, new Order(orderid, ordercus_name, product_id, count, price, phone_number, ngayMua));

            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Loi thong ke theo thang");
        }
        return map;
    }

    public Map<String, Order> thongKeTheoNgay(String date) {
        Map<String, Order> map = new HashMap<>();
        try {
            Connection cons = DBConnect.getConnection();
            String sql = "select * from [dbo].[dathang] where ngayMua= '" + date + "'";
            PreparedStatement ps = cons.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String orderid = rs.getString(1);
                String ordercus_name = rs.getString(2);
                String product_id = rs.getString(3);
                String count = rs.getString(4);
                String price = rs.getString(5);
                String phone_number = rs.getString(6);
                String ngayMua = rs.getString(7);
                map.put(orderid, new Order(orderid, ordercus_name, product_id, count, price, phone_number, ngayMua));

            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Loi thong ke theo ngay");
        }
        return map;
    }

    public Map<String, Order> thongKeTheoNgayHeThong() {
        Date toDate = new Date(System.currentTimeMillis());
        SimpleDateFormat fomatTime = new SimpleDateFormat("yyyy-MM-dd");
        String date = fomatTime.format(toDate.getTime());

        Map<String, Order> map = new HashMap<>();
        try {
            Connection cons = DBConnect.getConnection();
            String sql = "select * from [dbo].[dathang] where ngayMua='" + date + "'";
            PreparedStatement ps = cons.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String orderid = rs.getString(1);
                String ordercus_name = rs.getString(2);
                String product_id = rs.getString(3);
                String count = rs.getString(4);
                String price = rs.getString(5);
                String phone_number = rs.getString(6);
                String ngayMua = rs.getString(7);
                map.put(orderid, new Order(orderid, ordercus_name, product_id, count, price, phone_number, ngayMua));

            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Loi thong ke theo ngay");
        }
        return map;
    }
    // tinh tien de ve bieu do

    public int layDoanhThuTheoNgay(String date, String orderId) {
        int sum = 0;
        Map<String, Order> maps = new ThongKeDAO().thongKeTheoNgay(date);

        for (Order order : maps.values()) {
            if ((order.getDate().equals(date)) && (order.getOrderID().equals(orderId))) {
                sum += Integer.parseInt(order.getPrice());
            }
        }
        return sum;
    }

    public int layDoanhThuTheoThang(String text, String orderId) {
        int sum = 0;
        Map<String, Order> mapOrders = new ThongKeDAO().thongKeTheoThang(text);
        Map<String, Integer> listtien = new HashMap<>();
        for (Order order : mapOrders.values()) {
            // orderId=order.getOrderID();
            if ((order.getOrderID().equals(mapOrders.get(order.getOrderID()).getOrderID())) && (order.getOrderID().equals(orderId))) {
                sum += Integer.parseInt(order.getPrice());
                //  listtien.put(order, sum);

            }
        }
        return sum;
    }

    public int layDoanhThuTheoTuan(String tuan, String text, String orderId) {
        Map<String, Order> mapOrders = new ThongKeDAO().thongKeTheoTuan(tuan, text);
        int sum = 0;
        for (Order order : mapOrders.values()) {
            if (order.getOrderID().equals(mapOrders.get(order.getOrderID()).getOrderID()) && (order.getOrderID().equals(orderId))) {
                sum += Integer.parseInt(order.getPrice());
            }
        }
        return sum;
    }
//        public int layDoanhThuTheoKhoangNgay(String dateStart,String dateEnd){
//		Map<String, Order> mapOrders = new ThongKeDAO().thongKeTheoKhoanNgay(dateStart, dateEnd);
//		int sum =0;
//		for(Order order : mapOrders.values()){
//			if(order.getOrderID().equals(mapOrders.get(order.getOrderID()).getOrderID())){
//				sum+=Integer.parseInt(order.getPrice());
//			}
//		}
//		return sum;
//	}

    public int tongDoanhThu() {
        int sum = 0;
        Map<String, Order> mapOrders = (Map<String, Order>) new OrderDAO().getAllOrders();
        for (Order order : mapOrders.values()) {
            if (order.getOrderID().equals(mapOrders.get(order.getOrderID()).getOrderID())) {
                sum += Integer.parseInt(order.getPrice());
            }
        }
        return sum;
    }

    public static void main(String[] args) {
        String ngay = "2017-04-01";
        String tuan = "1";
        String thang = "2017-06";
        String ngay2 = "2017-05-28";
//		System.out.println(new ThongKeDAO().layDoanhThuTheoNgay("2017-05-23"));
//		System.out.println(mapTraSua.get("TS008"));
        //System.out.println(new ThongKeDAO().thongKeTheoNgay(ngay).toString());
//		System.out.println(new ThongKeDAO().thongKeTheoNgayHeThong());
//		Map<String,Order> map = new ThongKeDAO().thongKeTheoKhoanNgay(ngay,ngay2);
//
//		for(Order ts : map.values()){
//                    
//			System.out.println(ts.toString());
//		}
        //System.out.println(new ThongKeDAO().thongKeTheoThang(thang));
        //System.out.println(new ThongKeDAO().thongKeTheoThangHeThong());
        //	System.out.println(new ThongKeDAO().thongKeTheoTuan(tuan, thang));
        //System.out.println(new ThongKeDAO().layDoanhThuTheoKhoangNgay(ngay, ngay2,"32323"));
        System.out.println(new ThongKeDAO().layDoanhThuTheoThang(thang, "1539"));
        //System.out.println(new ThongKeDAO().layDoanhThuTheoTuan(tuan,thang,"785"));

    }
}
