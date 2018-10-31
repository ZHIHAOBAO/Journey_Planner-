package com.util;

import java.net.URI;
import java.sql.DriverManager;
import java.sql.SQLException;

import java.sql.Connection;
import com.mysql.jdbc.Driver;
import java.sql.*;

/*
 * 2018.4.10
 * 数据库连接的工具类
 */
public class DButil {

	private static Connection conn = null;
	static ResultSet rs = null;
	static PreparedStatement ps = null;

	public static void init() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/users?useSSL=FALSE&serverTimezone=GMT", "root", "04793223689Bao");
		} catch (Exception e) {
		
			e.printStackTrace();
		}
	}

	public static int addUpdDel(String sql) {
		int i = 0;
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			i = ps.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return i;
	}

	public static ResultSet selectSql(String sql) {
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery(sql);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return rs;
	}

	public static void closeConn() {
		try {
			conn.close();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}

	
	
	
	

	
	// 写一个静态块，这样执行的时候先加载它
	static {
		try {

			// 注册数据库驱动
			Class.forName("com.mysql.cj.jdbc.Driver");// 动态加载mysql驱动
			DriverManager.registerDriver(new Driver());

			// 获取数据库连接
			conn = (Connection) DriverManager.getConnection(
					"jdbc:mysql://localhost/users?useSSL=FALSE&serverTimezone=GMT", "root", "04793223689Bao");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

	public Connection getConnection() {
		return conn;
	}
	
}
