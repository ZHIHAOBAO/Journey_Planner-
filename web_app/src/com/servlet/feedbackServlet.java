package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class feedbackServlet
 */
@WebServlet("/feedbackServlet")
public class feedbackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public feedbackServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();

		HttpSession sess = request.getSession();
		String name = (String) sess.getAttribute("username");

		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection myconnect = DriverManager.getConnection(
					"jdbc:mysql://localhost/users?useSSL=FALSE&alowPublicKeyRetrieval=true&serverTimezone=GMT", "root",
					"04793223689Bao");

			String title = request.getParameter("title");
			String comment = request.getParameter("comment");

			String time = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy ").format(Calendar.getInstance().getTime());
			String adm_comment = "No " + " any comment " + " yet ";
			

			
			String sql = "insert into feedback (feedback_title,feedback_comment,feedback_author,feedback_time,adm_comment) values (?,?,?,?,?)";
			PreparedStatement prpe = (PreparedStatement) myconnect.prepareStatement(sql);
			prpe.setString(1, title);
			prpe.setString(2, comment);
			prpe.setString(3, name);
			prpe.setString(4, time);
			prpe.setString(5, adm_comment);

			prpe.execute();
			myconnect.close();

			response.sendRedirect("./community.jsp");

			

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
