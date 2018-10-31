package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.model.User;
import java.sql.Connection;

import com.util.DButil;
import java.sql.Statement;
import java.sql.PreparedStatement;

/*
 * 2018.09.21
 * 用于数据的操作：增加数据和查询单条数据
 */
public class UsersDao {

	// 增加数据
	public void add(User u) throws SQLException {
		DButil db = new DButil();
		Connection coon = db.getConnection();

	
		int userid = u.getUserid();
		String name = u.getName();
		String password = u.getPassword();
		String firstname = u.getFirstname();
		String lastname = u.getLastname();
		int age = u.getAge();
		String sex = u.getSex();
		String email = u.getEmail();
		int roleid = u.getRoleid();

		
		String sql = "insert into userInfo (user_name,user_password,user_firstname,user_lastname,user_age,user_sex,user_email,role_id) values (?,?,?,?,?,?,?,?)";
		PreparedStatement prpe = (PreparedStatement) coon.prepareStatement(sql);
		prpe.setString(1, name);
		prpe.setString(2, password);
		prpe.setString(3, firstname);
		prpe.setString(4, lastname);
		prpe.setInt(5, age);
		prpe.setString(6, sex);
		prpe.setString(7, email);
		prpe.setInt(8, roleid);

		prpe.execute();
		System.out.println("add access！");
	}

	/*
	 * 
	 * get the data info , using name to search database and save the name and password 
	 * return the user object 
	 */
	public User get(String name) throws SQLException {

		User result = new User();
		DButil db = new DButil();
		Connection conn = db.getConnection();

		String sql = "" + " select * from  userInfo" + " where user_name=? ";
		PreparedStatement ptmt = (PreparedStatement) conn.prepareStatement(sql);
		ptmt.setString(1, name);
		ResultSet rs = ptmt.executeQuery();
		

		while (rs.next()) {
			String username = rs.getString("user_name");
			String password = "";
			int roleid = 0;
			int userid = 0;
			if (name.equals(username)) {
				password = rs.getString("user_password");
				roleid = rs.getInt("role_id");
				userid = rs.getInt("user_id");			
		

			}
			result.setName(name);
			result.setPassword(password);
			result.setRoleid(roleid);
			result.setUserid(userid);

		}
		return result;
	}

	// delete user method
	public boolean delete(int id) {
		boolean flag = false;
		DButil.init();
		String sql = "delete from userInfo where user_id=" + id;
		int i = DButil.addUpdDel(sql);
		if (i > 0) {
			flag = true;
		}
		DButil.closeConn();
		return flag;
	}

	// update user info method
	//userId, username, password, firstname, lastname, userAge, sex, email, roleId
	
	public boolean update(int id, String username, String password, String firstname, String lastname, int age, String sex, String email, int roleid ) {
		boolean flag = false;
		DButil.init();
		String sql = "update userInfo set user_name ='" + username
				+ "' , user_password ='" + password
				+ "' , user_firstname ='" + firstname
				+ "' , user_lastname ='" + lastname
				+ "' ,  user_age ='" + age
				+ "' ,  user_sex ='" + sex
				+ "' , user_email ='" + email
				+ "' , role_id ='" + roleid + "' where user_id = " + id;
		int i = DButil.addUpdDel(sql);
		if (i > 0) {
			flag = true;
		}
		//DButil.closeConn();
		return flag;
	}

}
