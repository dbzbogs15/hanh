package model;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	public static Connection getConnection() {
		Connection cons = null;
                String sql = "jdbc:sqlserver://2017-nhom015.database.windows.net:1433;database=2017-nhom015;user=nhthai@2017-nhom015;password=Zalo0986421803;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;";
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                        cons = DriverManager.getConnection(sql);
//			cons = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;"
//					+ "database=User;user=sa;password=123;");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return cons;
	}
	public static void main(String[] args) {
		System.out.println(getConnection());
	}
}
