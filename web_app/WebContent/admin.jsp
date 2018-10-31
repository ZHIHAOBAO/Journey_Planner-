<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.dao.*"%>
<%@page import="com.model.*"%>

<%
	String name = (String) session.getAttribute("username");
%>

<%@ page import="java.util.Date,java.text.SimpleDateFormat"%>
<%
	SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd HH:mm:ss");
	String s = df.format(new Date());
%>
 


<%
	//java脚本
	//写java的代码
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>Administrator page.</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha256-3dkvEK0WLHRJ7/Csr0BZjAWxERc5WH7bdeUya2aXxdU= sha512-+L4yy6FRcDGbXJ9mPG8MT/3UCDzwR9gPeyFNMCtInsol++5m3bk2bXWKdZjvybmohrAsn3Ua5x8gfLnbE1YkOg==" crossorigin="anonymous">
<style type="text/css">

body{

	background: #ECE9E6;  /* fallback for old browsers */
background: -webkit-linear-gradient(to right, #FFFFFF, #ECE9E6);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to right, #FFFFFF, #ECE9E6); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
}
#head_top{

margin-top: 30px; 

font-weight: bolder ;

}
#top{
	/* background: pink; */
	height: 600px;
		width: 100%;
    margin-left: 20px;
}
#mess{
		/* background: black; */
		height: 100px;
		width: 100px;

}
#message{
	/* background: red; */
	height: 400px;
	width: 100px;
	margin-left: 2000px;
}


	
</style>


</head>

<body>
	<div class="container"
		style="text-align: center; margin-left: 10%; margin-top: 20px; position: relative">
		<legend id="head_top" style="text-align: center; font-weight: bolder">Administrator
			Account </legend>


		<div class="form-group"
			style="text-align: center; margin-left: -20px;">
			<label class="col-md-4 control-label"></label>
			<div class="col-md-4" id="top">

				<h4 style="margin-left: 20px">
					Hi!
					<%=name%></h4>


				<div class="container" id="mess"
					style="margin: 0 auto; margin-top: 30px; height: 80px; width: 600px;">

					<p class="card-text" id="message" style="margin: 0 auto;">
						${message}</p>
				</div>


				<form action="QueryUser"
					style="height: 100px; margin: 0 auto; line-height: 40px; width: 600px; text-align: center;">
					<!-- <input type="submit" value="Manage User Account" style='width:250px;height:180px; font-size:80px'/> -->

					<a class="btn btn-primary" href="main.jsp" role="button"
						style="float: left;"><--back</a> <input class="btn btn-primary"
						type="submit" value="Check User Account "
						style="float: right; margin-top: -2px;">

				</form>

			</div>




		</div>







	</div>



	<script type="text/javascript"
		src="https://code.jquery.com/jquery-2.1.4.js"></script>
	<script type="text/javascript"
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>











	<%-- 
	<div style="font-size: 60px; color: #ED2124">
	Welcome,<%=name%>！！！
	<BR /> ${message}

    
		<form action="QueryUser">
			 <input type="submit" value="Manage User Account" style='width:250px;height:180px; font-size:80px'/>
		</form>
	
	     <a  href='main.jsp'><--back</a> --%>

</body>
</html>
