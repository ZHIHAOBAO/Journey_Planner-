package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.*;
import com.util.*;
import com.model.*;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DeleteServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("id");
		int userId = Integer.parseInt(id);
		
		System.out.print(userId);

		UsersDao ud = new UsersDao();
		
		if (ud.delete(userId)) {
			request.setAttribute("message", "System Message: Delete user success!");
			request.getRequestDispatcher("/admin.jsp").forward(request, response);
		} else {
			response.sendRedirect("/LoginDemo/userform.jsp");
		}


	}

}