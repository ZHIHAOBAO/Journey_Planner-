<%@page import="com.model.User"%>
<%@page import="com.dao.UsersDao"%>
<%@page import="com.util.temRoleId"%>
<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("username");
	String password = request.getParameter("password");
	int roleid = new Integer(request.getParameter("role"));
	
	

	//get user name 
	UsersDao dao = new UsersDao();
	User u = dao.get(name);
	int roleid2 = u.getRoleid();
	int uid = u.getUserid();
	
	
	//same password and user name, can login success 
	if (password.equals(u.getPassword()) && roleid == roleid2 && roleid2 == 0) {
		log("login sccuess ！");
	
	//get the username from the session 
     request.getSession().setAttribute("username", name);
     request.getSession().setAttribute("uid", uid); 
   
     
	 HttpSession sess=request.getSession(); 
	 
     String roleId2=String.valueOf((roleid2));	
		
	 sess.setAttribute("admid", roleId2);
	
     //check the community page comments from the adm 
	 if(roleid2==0){
		 String roleId=String.valueOf((roleid2));	
		 Cookie cookie=null;
		 cookie= new Cookie("roleid",roleId);
		 cookie.setMaxAge(7*2*24*3600);
		 response.addCookie(cookie);
		
	 }
	 
     
     
  // remember me function: 
    String remember=request.getParameter("remember");
	 
	 boolean flag = remember != null;
	 if(flag) {
	  if(remember.equals("isRight")&&remember !=null) {
		 Cookie cookie= new Cookie("id",name);
		  cookie.setMaxAge(7*2*24*3600);
		  response.addCookie(cookie);
	  }
 }
	 
	
    
    // verfiy the feedback page: 
    	request.getSession().setAttribute("able","0");
    
%>

<html>

<head>
<script language="javascript">
	
	alert("Login Success！");
	window.location.href ="main.jsp";
</script>

</head>
</html>


<%
	}
	else if (password.equals(u.getPassword()) && roleid == roleid2 && roleid2 == 1) {
		
		
		HttpSession sess=request.getSession(); 
		
		String roleId2=String.valueOf((roleid2));	
		
		
		sess.setAttribute("admid", roleId2);
		
	 
		 
		if( roleid2 == 1){
			
			 String roleId=String.valueOf((roleid2));	
			 Cookie cookie= new Cookie("roleid",roleId);
			 cookie.setMaxAge(7*2*24*3600);
			 response.addCookie(cookie); 
		
		}
		
		

		  String remember=request.getParameter("remember");
			 
			 boolean flag = remember != null;
			 if(flag) {
			  if(remember.equals("isRight")&&remember !=null) {
				 Cookie cookie= new Cookie("id",name);
				  cookie.setMaxAge(7*2*24*3600);
				  response.addCookie(cookie);
			  }
			 }
		
		
	
//get the username
request.getSession().setAttribute("username", name);

%>

<html>

<head>
<script language="javascript">
//JavaScript脚本标注
alert("Login Success！");//在页面上弹出上联	
window.location.href ="admin.jsp";
</script>

</head>
</html>

<%
}
	//pageContext.forward("welcome.jsp");
	else {
		log("fail to login  ！！！");
%>
<html>

<head>
<script language="javascript">
	//JavaScript脚本标注
	alert("Login failed！Please check username or password,  try again.");
	window.location.href ="login.jsp";	
	//pageContext.forward("login.jsp");
	

</script>
</head>


</html>
<%
	
	}
%>
