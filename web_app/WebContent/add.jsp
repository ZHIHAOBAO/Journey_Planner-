<%@page import="com.dao.UsersDao"%>
<%@page import="com.model.*"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>

</head>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- 获取表单注册信息的内容，往数据库中添加一条数据 -->
<%  
    request.setCharacterEncoding("utf-8"); 
	UsersDao dao=new UsersDao();

    String name = request.getParameter("username");  
    String password = request.getParameter("password");
    
    String firstname = request.getParameter("firstname");
    String lastname = request.getParameter("lastname");
    String age = request.getParameter("age");
    int age1 = Integer.parseInt(age);
    String sex = request.getParameter("sex");
    String email = request.getParameter("email");
   
   

    //save name and password to the userInfo database
    User u=new User();  
    u.setName(name);
    u.setPassword(password);
    u.setFirstname(firstname);
    u.setLastname(lastname);
    u.setAge(age1);
    u.setSex(sex);
    u.setEmail(email);
    u.setRoleid(0);
    
    
    // loop the exits user first, checking the valid user name 
    	
    	if(dao.get(u.getName()).getName()==(u.getName())){
    		
    	
    		%>
    		
    		<input id="fail" hidden="" value="1">
    		
    		<%     	
    		
    	}
    	else{
    		 //将user对象添加到数据库中
    	/* 	 System.out.println("current user:"+u.getName());
    		 System.out.println("database user:"+dao.get(name).getName()); */
    		   
    	    try {
    	     dao.add(u);
    	     } catch (SQLException e) {
    				// TODO Auto-generated catch block
    				e.printStackTrace();
    			}
    	    log("Register success！");	
    	    %>
    	    <script language="javascript">
         alert("Register Success！");
        window.location.href ="main.jsp";
        </script>
    <%    
    	}  
    %>
       
    <script language="javascript">
    	//JavaScript脚本标注
    	
    	var fail=document.getElementById('fail').value;
    	if(fail==1){
    		alert("the username is already exist, please try again ！");//在页面上弹出上联	
    	 	window.location.href ="sign_up.jsp";
    	}
    </script>
    
    



    
    </html>
    
    
   
    


