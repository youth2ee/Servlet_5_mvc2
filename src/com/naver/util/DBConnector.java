package com.naver.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnector {
	
	public static Connection getConnection() throws Exception {
		
	 	String user = "user14";
	 	String password = "user14";
	 	String url = "jdbc:oracle:thin:@211.238.142.32:1521:xe";
	 	String driver = "oracle.jdbc.driver.OracleDriver";
	 	
		Class.forName(driver);
		Connection con = DriverManager.getConnection(url, user, password);
		
		return con;
	}

}
