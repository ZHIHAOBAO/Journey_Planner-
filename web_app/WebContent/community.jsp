<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>

<%@page import="com.util.temRoleId"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
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

<style>
body, h1, h2, h3, h4, h5 {
	font-family: "Raleway", sans-serif
}

#btn-back {
	margin-left: 15px;
}

#btn {
	float: right;
	margin-right: 26px;
	border-color: rgb(0, 115, 198);
	color: black;
	background-color: white;
}

#row01 {
	/* background: black;  */
	width: 45%;
	height: 160px;
	position: absolute;
	margin-left: 800px;
	
	
	top: -150px;
}
#row02 {
	background: red;
	height: 190px;
	width: 300px;
	padding-left:20px;
	
  
}
#submit{
  float:right;
  margin-top:10px;
  margin-right:65px;
   

}
#first {
	padding-right: 09px;
	float: left;
	padding-left: 140px;
	padding-top: 10px;
}

#second {
	padding-top: 10px;
}

#pics {
	/* background: red;  */
	height: 60px;
	width: 100%;
	position: relative;
	/* text-align: center; */
}
</style>

</head>

<body class="w3-light-grey">


	<div class="w3-content" style="max-width: 1400px">

		<!-- Header -->

		<header class="w3-container w3-center w3-padding-32">
		<h1>
			<b>Community Page</b>
		</h1>
		</header>
		<button type="button" class="btn1 btn-link" id="btn-back">
			<a href='main.jsp'><--back</a>
		</button>
		<a href="feedback.jsp" class="btn btn-info" role="button" id='btn'>Write
			a Feedback</a>
		<!-- Grid -->

		<%
			try {
				/* HttpSession sess=request.getSession();  */
				/* String able= (String) sess.getAttribute("able"); */
				/* String roleid=(String) sess.getAttribute("roleid");
				String roleAdm=(String) sess.getAttribute("roleAdm"); */

				String roleid = "";
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection myconnect = DriverManager.getConnection(
						"jdbc:mysql://localhost/users?useSSL=FALSE&alowPublicKeyRetrieval=true&serverTimezone=GMT",
						"root", "04793223689Bao");
				String sql = "" + " select * from  feedback";
				PreparedStatement ptmt = (PreparedStatement) myconnect.prepareStatement(sql);
				ResultSet rs = ptmt.executeQuery();
				rs.afterLast(); //Moves the curser to the end of the ResultSet object
		%>


		<%
			while (rs.previous()) {
		%>
		<%
			String title = rs.getString("feedback_title");
					String content = rs.getString("feedback_comment");
					String name = rs.getString("feedback_author");
					String time = rs.getString("feedback_time");
					String idfeedback = rs.getString("idfeedback");
					String adm_comment = rs.getString("adm_comment");

					/* System.out.println("the role id is : "+roleid); */
		%>
		<div class="w3-row">

			<!-- Blog entries -->
			<div class="w3-col l8 s12">

				<!-- Blog entry -->

				<div class="w3-card-4 w3-margin w3-white">

					<div class="w3-container">
						<h3>
							<b>Title: <%=title%>
							</b>
						</h3>
						<h5>
							Author:
							<%=name%>
							<span class="w3-opacity" style="float: right;"> Time: <%=time%>
							</span>
						</h5>
					</div>

					<div class="w3-container" >
						<p>
							Content:
							<%=content%>
						</p>

						<p>
							Comments:
							<%=adm_comment%>
						<p>
						<div class="w3-row" id="pics">

							<%
								// vertify the role id :

										Cookie cookies[] = request.getCookies();
										if (cookies != null) {
											for (Cookie cookie : cookies) {
												if (cookie.getName().equals("roleid")) {
													roleid = cookie.getValue();
													System.out.print("id is :" + roleid);
												}
											}
										}

										if (roleid.equals("0")) {
							%>
							<div class="w3-col m4 w3-hide-small" id="row01" hidden="">
								<div class="w3-card-4 w3-margin w3-white">


									<div class="container">
										<h3>
											<p>
												@<%=name%></p>

										</h3>
										<h5>
											<span class="w3-opacity"> </span>
										</h5>
										<p>Adm comments</p>
										<form>
											<input id="adm_comment" value=" "> <a href="#"
												class="btn btn-info" role="button">Submit</a>
										</form>
									</div>

								</div>
							</div>

							<%
								}
							%>

							<%
								if (roleid.equals("1")) {
							%>
							<form action="./commentServlet" method="post">
								<div class="w3-col m4 w3-hide-small" id="row01">
									<div class="w3-card-4 w3-margin w3-white" id="row02">


										<div class="container">
											<h3>
												<p>
													@<%=name%></p>

											</h3>
											<h5>
												<span class="w3-opacity"> </span>
											</h5>
											<p>Adm comments</p>

											<!-- gain the feedback_id and comment value  -->
											<!-- <input type="text" id="adm_comment" name="adm_comment"> -->
											<textarea  id="adm_comment" name="adm_comment"  rows="2" cols="25"></textarea>
											<input hidden="" value=<%=idfeedback%> name="idfeedback"
												id="idfeedback">

											
										</div>
										<button type="submit" class="btn btn-info" id="submit">Submit</button>
									</div>
									</div>
							
							</form>
							
							 <form action="./deleteFeedbackServlet" method="post" id="delete_feedback"  style="margin-top:10px;" >
     <input hidden="" value=<%=idfeedback%> name="idfeedback" id="idfeedback">
      
	<button type="submit" class="btn btn-info" >Delete</button>
     </form>

						</div>

					</div>
				</div>


				<%
					}
				%>

			</div>
		</div>
	</div>
		</div>
		</div>
	</div>
	<%
		}

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	%>
<!-- 
	<footer class="w3-container w3-dark-grey w3-padding-32 w3-margin-top">
	<button
		class="w3-button w3-black w3-disabled w3-padding-large w3-margin-bottom">Previous</button>
	<button class="w3-button w3-black w3-padding-large w3-margin-bottom">Next
		»</button>

	</footer> -->
	<script type="text/javascript">
		var i = 1;
		var j = 1;

		function add() {

			document.getElementById("thumb-up").innerHTML = i++;

		}

		function reduce() {

			document.getElementById("thumb-down").innerHTML = j++;

		}
	</script>
</body>
</html>