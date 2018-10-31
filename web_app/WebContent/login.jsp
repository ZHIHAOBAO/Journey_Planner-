<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>




<!DOCTYPE html>
<html>
<head>
<!-- Page title -->
<title>Welcome to login page.</title>
<!-- End of Page title -->
<!-- Libraries -->
<link type="text/css" href="css/login.css" rel="stylesheet" />
<link type="text/css" href="css/smoothness/jquery-ui-1.7.2.custom.html"
	rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/easyTooltip.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.7.2.custom.min.js"></script>
<!-- End of Libraries -->

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link
	href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">
</head>
<style>
body {
	padding-top: 5%;
	background: #FEAC5E; /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #4BC0C8, #C779D0, #FEAC5E);
	/* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #4BC0C8, #C779D0, #FEAC5E);
	/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	font-family: "Lato";
	/* color: #00efff; */
}

.form-control:focus {
	border-color: rgba(4, 0, 255, 0.904);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px
		rgba(17, 0, 255, 0.699);
}

.checkbox .badge {
	position: relative;
	margin-left: 55%;
}

#remember {
	float: left;
}

h1 {
	height: 50px;
	width: 400px;
	float: left;
	padding-left: 125px;
}

#the-first {
	position: relative;
	width: 100%;
	height: 380px;
	margin-top: 20px;
	/* background: red; */
}

#the-second {
	width: 100%;
	padding-left: 25%;
}

#the-third {
	width: 60%;
	position: absolute;
	background-clip: content-box;
	left: 30%;
	top: 20%;
	margin: -25px 0 0 -25px;
	height: 360px;
	width: 550px;
	border: 1.5px solid #00efff;
	padding-left: 120px;
}

.User {
	/* background: red; */
	text-align: center;
	margin-top: -25px;
}

.Administrator {
	margin-left: 30px;
}

#signin {
	
	margin-top: 15px;
	margin-left: 35px;
}

#back{
  margin-left: -120px;
  margin-top: 5px;
  position: absolute;
  /* background: red; */
  font-size: 16px ;
  color: #00efff;


}

</style>
<body>

<%  String id=" ";

  
  Cookie cookies[] = request.getCookies();
  if(cookies!=null){
	  for(Cookie cookie:cookies){
		  if(cookie.getName().equals("id")){
			  id=cookie.getValue();	
			 
			  
		  }
	  }
  }

%>

	<div class="container" id="the-first">
		<br>
		<form class="form-horizontal" action="dologin.jsp" method="post">
			<div class="container" id="the-second">


				<div class="form-group" id="the-third">
				<button type="button" class="btn btn-link" href="main.jsp"><a  href='main.jsp' id="back"><-- back</a></button>
					<div class="form-group">
						<h1>Log in</h1>
						<br /> <br /> <br /> <br /><br/>
						<label for="inputEmail3" class="col-sm-2 control-label"
							id="username">Username</label>
						<div class="col-sm-5">
							<input type="text" name="username" class="form-control"
								id="inputEmail" placeholder="Username" value=<%=id %>>
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">Password</label>
						<div class="col-sm-5">
							<input type="password" name="password" class="form-control"
								id="inputPassword3" placeholder="Password" >
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-5">
							<div class="checkbox">
								<label> 
								<input type="checkbox" id="remember" name="remember" value="isRight" > Remember me
								</label>
							</div>
						</div>
					</div>

					
					<div class="Administrator">
						<input type="radio" id="admin" name="role" value=1 /> <label
							for="admin">Administrator</label>
					</div>
					<div class="User">
						<input type="radio" id="user" name="role" value=0
							checked="checked" /> <label for="user">User</label>
					</div>



					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default" style="color:#34452c" id="signin">Sign In</button>
						</div>
					</div>
				</div>
			</div>
		</form>

	</div>
  <script src="sha256.js"></script>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-2.1.4.js"></script>
	<script type="text/javascript"
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

</body>
</html>