<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- <%
String name = (String)session.getAttribute("username");
int uid = (int)session.getAttribute("uid");
System.out.println("值是：：：：：：" + uid);
%> --%>

<%@ page import="java.util.Date,java.text.SimpleDateFormat"%>
<%
	SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd HH:mm:ss");
	String s = df.format(new Date());
%>
 


<html>
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link
	href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"
	integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ"
	crossorigin="anonymous">

<head>
<meta charset="UTF-8">
<title>User Account Page</title>
</head>


<body>

	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="main.jsp"><i class="fas fa-home"></i>
					Home </a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="account.jsp">Journey Planner</a></li>
					<li><a href="#about">About</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#contact">Contact<span
							class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="" target="iframe_a">Contact Information</a></li>
							<li><a href="feedback.jsp">FeedBack</a></li>
						</ul></li>
					<li><a href="community.jsp">Community</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">

					<%
						HttpSession sess = request.getSession();
						sess.setAttribute("disable", "1");
						String username = (String) sess.getAttribute("username");
						String admid = (String) sess.getAttribute("admid");
					%>


					<%
						if (username == null) {
					%>

					<li><a href="sign_up.jsp"> Signup &nbsp <i
							class="fa fa-user-plus"></i></a></li>
					<li><a href="login.jsp"> Login &nbsp <i class="fa fa-user"></i></a></li>


					<%
						}
					%>

					<%
						if (admid != null && admid.equals("1")) {
					%>

					<li><a href="admin.jsp"> <%=username%> &nbsp <i
							class="fas fa-user-tie"></i></a></li>
					<li><a href="./logoutServlet"> logout &nbsp <i
							class="fas fa-sign-out-alt"></i></a></li>


					<%
						}
					%>

					<%
						if (admid != null && !admid.equals("1")) {
					%>

					<li><a href="./QuerySingleUser"> <%=username%> &nbsp <i
							class="fas fa-user-tie"></i></a></li>
					<li><a href="./logoutServlet"> Logout &nbsp <i
							class="fas fa-sign-out-alt"></i></a></li>


					<%
						}
					%>

				</ul>
			</div>
		</div>



	</nav>




	<iframe id="mainframe" name="mainFrame" scrolling="no"
		src="http://localhost:8081/" frameborder="0"
		style="margin-top: 25px; width: 100%; height: 100%;"></iframe>





	<script type="text/javascript"
		src="https://code.jquery.com/jquery-2.1.4.js"></script>
	<script type="text/javascript"
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

</body>
</html>