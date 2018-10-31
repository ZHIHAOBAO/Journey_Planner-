package com.servlet;

import java.sql.Connection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.User;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class QuerySingleUser
 */
@WebServlet("/QuerySingleUser")
public class QuerySingleUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public QuerySingleUser() {
		super();
		// TODO Auto-generated constructor stub
	}

	private static Connection conn;
	public static Statement st;

	protected void service(HttpServletRequest request, HttpServletResponse response) //
			throws ServletException, IOException {

		List<Map> list = new ArrayList<Map>();

		// get the session of user id:
		HttpSession sess = request.getSession();
		String usrid = sess.getAttribute("uid").toString();

		// String usrid = request.getParameter("userid").trim();
		int uid = Integer.parseInt(usrid);

		System.out.println(uid);

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/users?useSSL=FALSE&serverTimezone=GMT", "root",
					"04793223689Bao");

			st = conn.createStatement();

			String sql = "SELECT user_id, user_name,user_password, user_firstname,user_lastname,user_age,user_sex,user_email,role_id FROM userInfo WHERE user_id="
					+ uid;

			ResultSet rs = st.executeQuery(sql);

			while (rs.next()) {

				int userid = rs.getInt("user_id");

				String username = rs.getString("user_name");

				String password = rs.getString("user_password");

				String firstname = rs.getString("user_firstname");

				String lastname = rs.getString("user_lastname");

				int age = rs.getInt("user_age");

				String sex = rs.getString("user_sex");

				String useremail = rs.getString("user_email");

				int roleid = rs.getInt("role_id");

				Map map = new HashMap();

				map.put("user_id", userid);
				map.put("user_name", username);
				map.put("user_password", password);
				map.put("user_firstname", firstname);
				map.put("user_lastname", lastname);
				map.put("user_age", age);
				map.put("user_sex", sex);
				map.put("user_email", useremail);
				map.put("role_id", roleid);

				list.add(map);

				for (Map map_1 : list) {

				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		request.setAttribute("key_list", list);

		request.getRequestDispatcher("/userinfo.jsp").forward(request, response);
		
	}
}
