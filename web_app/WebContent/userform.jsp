<%@ page language="Java" import="com.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%String path = request.getContextPath();String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base href="<%=basePath%>">


<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha256-3dkvEK0WLHRJ7/Csr0BZjAWxERc5WH7bdeUya2aXxdU= sha512-+L4yy6FRcDGbXJ9mPG8MT/3UCDzwR9gPeyFNMCtInsol++5m3bk2bXWKdZjvybmohrAsn3Ua5x8gfLnbE1YkOg==" crossorigin="anonymous">

</head>
<style type="text/css" media="screen">

#top{
	/* background: black; */
	height: 250px;
	width: 150%;

}

#table_one{
	
/* background: red; */
height: 70px;
width: 100%;
/* margin-left: -70px; */
float: left;


}

#head_top{

margin-top: 30px; 
font-weight: bolder ;


</style>

<body>
<div class="container" id="top">
 <table class="table table-bordered " id="table_one">
<tr>
			<th>User ID</th>
			<th>User Name</th>
			<th>Password</th>
			<th>First Name </th>
			<th>Last Name </th>
			<th>Age </th>
			<th>Sex </th>
			<th>Email </th>
			<th>Role ID </th>
			<th>Operation </th>
			
</tr>

	<legend id="head_top"  style="font-weight: bolder;">Users Account Management </legend>
		<a class="btn btn-primary" href="admin.jsp" role="button" style="margin-bottom:20px; margin-top:-5px;"><--back</a>
<c:forEach items="${key_list}" var="u" >
<form action="UpdateServlet" method="post">		
		<tr>
			
			<td><input type="text" value="${u.user_id}" name="id" readonly> </td>
   		
			<td><input type="text" value="${u.user_name}" name="user_name" readonly></td>
			
			<td><input type="text" value="${u.user_password} " name="user_password"> </td>
   		
   		 	
			
			<td><input type="text" value="${u.user_firstname} " name="user_firstname"> </td>
   		
			
			<td><input type="text" value="${u.user_lastname} " name="user_lastname"> </td>
   		
   		 	
			
			<td><input type="text" value="${u.user_age} " name="user_age"> </td>
   		
   		 	
			
			 <td><input type="text" value="${u.user_sex} " name="user_sex" readonly></td>
   		
   		 	
			
			 <td><input type="text" value="${u.user_email} " name="user_email"></td>
   		
   		 	
			
			 <td><input type="text" value="${u.role_id} " name="role_id" readonly></td>
   		
   		
   		 	

			 <td > <a class="btn btn-primary" href="DeleteServlet?id=${u.user_id}" role="button" style="float: left;">Delete</a>  <input style="float: right;"class="btn btn-primary" type="submit" value="Update"></td>
   		 </tr> 
   		 </form>
			
		</c:forEach>
	</table>
</div>


 <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.4.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>




<%-- 
 <table width="600" border="1" cellpadding="0">
		<tr>
			<th>User ID</th>
			<th>User Name</th>
			<th>Password</th>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Age</th>
			<th>Sex</th>
			<th>Email</th>
			<th>Role ID</th>
			<th>Operation</th>
			
		</tr>
		
		
		<c:forEach items="${key_list}" var="u" >
		<form action="UpdateServlet" method="post">
			<tr>
				<td><input type="text" value="${u.user_id}" name="id" readonly></td>
				<td><input type="text" value="${u.user_name}" name="user_name"></td>
				<td><input type="text" value="${u.user_password} " name="user_password"></td>
				<td><input type="text" value="${u.user_firstname} " name="user_firstname"></td>
				<td><input type="text" value="${u.user_lastname} " name="user_lastname"></td>
				<td><input type="text" value="${u.user_age} " name="user_age"></td>
				<td><input type="text" value="${u.user_sex} " name="user_sex"></td>
				<td><input type="text" value="${u.user_email} " name="user_email"></td>
				<td><input type="text" value="${u.role_id} " name="role_id"></td>
				<td><a href="DeleteServlet?id=${u.user_id}">Delete</a >  <input type="submit" value="Update" /></td>
			</tr>
	     </form>
			
		</c:forEach>
	</table> --%>
 
</body>
</html>