package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class logoutServlet
 */
@WebServlet("/logoutServlet")
public class logoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public logoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession sess=request.getSession(); 
		sess.removeAttribute("username");
		sess.removeAttribute("able");
		sess.removeAttribute("admid");
		
		Cookie cookies[] = request.getCookies();
		  if(cookies!=null){
			  for(Cookie cookie:cookies){
				  if(cookie.getName().equals("roleid")){
					    cookie= new Cookie("roleid","0");
						
						 response.addCookie(cookie); 
						
				  }
//				  if(cookie.getName().equals("id")||cookie.getName().equals("password_cookie")){
//					    cookie= new Cookie("id",null);
//					    cookie= new Cookie("password_cookie",null);
//						 response.addCookie(cookie); 
//						
//				  }
			  }
		  }

		
		response.sendRedirect("./main.jsp");	
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
