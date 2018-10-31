package com.servlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import com.model.*;
import com.mysql.jdbc.Driver;
import com.util.*;

public class ShowUser {
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private Connection conn;

	public void userDelete(String sql) {

		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			DriverManager.registerDriver(new Driver());

			conn = (Connection) DriverManager.getConnection(
					"jdbc:mysql://localhost/users?useSSL=FALSE&serverTimezone=GMT", "root", "04793223689Bao");

		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
			int rows = pstmt.executeUpdate(sql);
			if (rows >= 1) {
				System.out.println("--delete success--");
			} else {
				System.out.println("--delete fail--");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<User> getUserList(String sql) {
		ArrayList<User> list = new ArrayList<User>();

		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			DriverManager.registerDriver(new Driver());

			conn = (Connection) DriverManager.getConnection(
					"jdbc:mysql://localhost/users?useSSL=FALSE&serverTimezone=GMT", "root", "04793223689Bao");

		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int userid = rs.getInt(1);
				String username = rs.getString(2);
				String password = rs.getString(3);
				String firstname = rs.getString(4);
				String lastname = rs.getString(5);
				int age = rs.getInt(6);
				String sex = rs.getString(7);
				String useremail = rs.getString(7);
				int roleid = rs.getInt(7);

				User user = new User();
				user.setUserid(userid);
				user.setName(username);
				user.setPassword(password);
				user.setFirstname(firstname);
				user.setLastname(lastname);
				user.setAge(age);
				user.setSex(sex);
				user.setEmail(useremail);
				user.setRoleid(roleid);
				list.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
