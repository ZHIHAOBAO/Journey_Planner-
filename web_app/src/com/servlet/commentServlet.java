package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class commentServlet
 */
@WebServlet("/commentServlet")
public class commentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public commentServlet() {
       
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out = response.getWriter();
		
		
		//update the comment to the feedback 
		
		String idfeedback= request.getParameter("idfeedback");
		
		String adm_comment= request.getParameter("adm_comment");
	
		
		try {
		    
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection myconnect = DriverManager.getConnection("jdbc:mysql://localhost/users?useSSL=FALSE&alowPublicKeyRetrieval=true&serverTimezone=GMT","root","04793223689Bao");
				
			String sql = "update feedback set adm_comment ='" + adm_comment + "' where idfeedback = " + idfeedback;
			PreparedStatement prpe=(PreparedStatement) myconnect.prepareStatement(sql);		
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
