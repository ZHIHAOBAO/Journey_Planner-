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
body{
background: #ECE9E6;  /* fallback for old browsers */
background: -webkit-linear-gradient(to right, #FFFFFF, #ECE9E6);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to right, #FFFFFF, #ECE9E6); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

}
#top{

	position: relative;
	
	height: 800px;
	width: 50%;
	
}




#form{

	height: 800px;
	width: 100%;
	position: relative;
}

#head_top{

margin-top: 30px; 
margin-left: 13px;
font-weight: bolder ;

 

}
.form-group{
	/* background: red; */
	height: 60px;
    width: 700px; 
	/* position: relative; */
}



	
</style>
<body>

<c:forEach items="${key_list}" var="u" >
 <form action="UpdateServlet" method="post" id="form">

<div class="container" id="top">
	
	<legend id="head_top" >User Profile</legend>

<!--  user id:  -->


	<div class="form-group" id="uid">
     <label class="col-md-4 control-label" for="Name (Full name)">User ID: </label>  
    <div class="col-md-4">
    <div class="input-group">
       <div class="input-group-addon">
        <i class="fa fa-user">
        </i>
       </div>
       <input   value="${u.user_id}" name="id" name="id" type="text"  class="form-control input-md" readonly>
      </div>
  </div>

</div>

<!-- user name:  -->

<div class="form-group" id="name">
  <label class="col-md-4 control-label" for="Name (Full name)">Name </label>  
  <div class="col-md-4">
 <div class="input-group">
       <div class="input-group-addon">
        <i class="fa fa-user">
        </i>
       </div>
       <input  name="user_name" type="text"  value="${u.user_name}" class="form-control input-md" readonly>
      </div>
  </div>
  
</div>

 <!-- Firstname  -->
<div class="form-group">
  <label class="col-md-4 control-label" for="Name (Full name)">First Name </label>  
  <div class="col-md-4">
 <div class="input-group">
       <div class="input-group-addon">
        <i class="fa fa-user">
        </i>
       </div>
       <input value="${u.user_firstname} " name="user_firstname"  type="text" class="form-control input-md" >
      </div>
  </div>
  
</div>



 <!-- last name  -->

<div class="form-group">
  <label class="col-md-4 control-label" for="Name (Full name)">Last Name  </label>  
  <div class="col-md-4">
 <div class="input-group">
       <div class="input-group-addon">
        <i class="fa fa-user">
        </i>
       </div>
       <input  value="${u.user_lastname}" name="user_lastname" type="text"  class="form-control input-md">
      </div>
  </div>
  
</div>
<!-- password  -->

<div class="form-group">
  <label class="col-md-4 control-label" for="Date Of Birth">Password</label>  
  <div class="col-md-4">

  <div class="input-group">
       <div class="input-group-addon">
     <i class="fas fa-key"></i>
        
       </div>
       <input name="user_password" value="${u.user_password}" type="text"  class="form-control input-md">
      </div>
  
 
  </div>
</div>

<!-- age  -->

<div class="form-group">
  <label class="col-md-4 control-label" for="Date Of Birth">Age</label>  
  <div class="col-md-4">

  <div class="input-group">
       <div class="input-group-addon">
     <i class="fa fa-birthday-cake"></i>
        
       </div>
       <input  value="${u.user_age}" name="user_age"  type="text"  class="form-control input-md">
      </div>
  
  </div>
</div>

<!-- sex  -->
<div class="form-group">
  <label class="col-md-4 control-label" for="Name (Full name)">Sex </label>  
  <div class="col-md-4">
 <div class="input-group">
       <div class="input-group-addon">
        <i class="fa fa-user">
        </i>
       </div>
       <input  value="${u.user_sex}" name="user_sex"   type="text" class="form-control input-md" readonly>
      </div>
  </div>
  
</div>

<!-- email -->

<div class="form-group">
  <label class="col-md-4 control-label" for="Email Address">Email Address</label>  
  <div class="col-md-4">
  <div class="input-group">
       <div class="input-group-addon">
     <i class="fa fa-envelope-o"></i>
        
       </div>
    <input value="${u.user_email} " name="user_email" type="text" class="form-control input-md">
    
      </div>
  
  </div>
</div>

<!-- role_id -->

<div class="form-group">
  <label class="col-md-4 control-label" for="Name (Full name)">Role Id  </label>  
  <div class="col-md-4">
 <div class="input-group">
       <div class="input-group-addon">
        <i class="fa fa-user">
        </i>
       </div>
       <input   value="${u.role_id} " name="role_id"   type="text" class="form-control input-md" readonly>
      </div>
  </div>
  
</div>

<!-- back -->

<div class="form-group">
  <label class="col-md-4 control-label" ></label>  
  <div class="col-md-4">
  <a class="btn btn-primary" href="main.jsp" role="button" style="float: left; margin-left: -10px"><--back</a>
   <input class="btn btn-primary" type="submit" value="Update" style="float: right;">
    
  </div>
</div>

</div>
</form>
</c:forEach>







<%--  <table width="600" border="1" cellpadding="0">
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
				<td><input type="text" value="${u.user_name}" name="user_name" readonly></td>
				<td><input type="text" value="${u.user_password} " name="user_password"></td>
				<td><input type="text" value="${u.user_firstname} " name="user_firstname"></td>
				<td><input type="text" value="${u.user_lastname} " name="user_lastname"></td>
				<td><input type="text" value="${u.user_age} " name="user_age"></td>
				<td><input type="text" value="${u.user_sex} " name="user_sex" readonly></td>
				<td><input type="text" value="${u.user_email} " name="user_email"></td>
				<td><input type="text" value="${u.role_id} " name="role_id" readonly></td>
				<td><input type="submit" value="Update" /></td>
			</tr>
	     </form>
			
		</c:forEach>
	</table> --%>
  <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.4.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>