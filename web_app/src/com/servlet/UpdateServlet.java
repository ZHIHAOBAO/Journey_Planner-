package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.*;
import com.model.*;

public class UpdateServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("id").trim();
		int userId = Integer.parseInt(id);

		String username = request.getParameter("user_name").trim();
		String password = request.getParameter("user_password").trim();
		String firstname = request.getParameter("user_firstname").trim();
		String lastname = request.getParameter("user_lastname").trim();

		String age = request.getParameter("user_age").trim();
		int userAge = Integer.parseInt(age);

		String sex = request.getParameter("user_sex").trim();
		String email = request.getParameter("user_email").trim();
		// get the roleid, adm id

		HttpSession sess = request.getSession();

		String admid = ((String) sess.getAttribute("admid")).trim();

		int admId = Integer.parseInt(admid);

		String roleid = request.getParameter("role_id").trim();
		int roleId = Integer.parseInt(roleid);

		UsersDao ud = new UsersDao();

		if (ud.update(userId, username, password, firstname, lastname, userAge, sex, email, roleId)) {

			if (admId == 1) {
				request.setAttribute("message", "System message: Update success!");

				request.getRequestDispatcher("/admin.jsp").forward(request, response);
			} else {
				sess.removeAttribute("username");
				sess.removeAttribute("admid");
				request.getRequestDispatcher("/main.jsp").forward(request, response);
			}

		} else {
			response.sendRedirect("/main.jsp");
		}
	}
}