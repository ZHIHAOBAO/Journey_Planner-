<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Journey Planner</title>
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<link href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
	
	
	<style>
	    body {
    background: url(https://images.unsplash.com/photo-1530721733923-e2df89901503?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=c3f972ef16cee20243cf57f1a18f89f0&auto=format&fit=crop&w=800&q=60);
    background-size: cover;
    background-position: center; 
}
body,
html {
    width: 100%;
    height: 100%;
    font-family: "Lato";
    color:cornsilk;
}
h1 {
	font-weight: 700;
    font-size: 5em;
   
}

.content{
	padding-top: 25%;
	text-align: center;
    text-shadow: 0px 4px 3px rgba(0,0,0,0.4),
                 0px 8px 13px rgba(0,0,0,0.1),
                 0px 18px 23px rgba(0,0,0,0.1);
}

hr {
    width: 400px;
    border-top: 1px solid #f8f8f8;
    border-bottom: 1px solid rgb(0,0,0,0.2);
}

.slideshow { 
  position: fixed;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  z-index: 0;
  list-style: none;
  margin: 0;
  padding: 0;
}
.slideshow li { 
  width: 100%;
  height: 100%;
  position: absolute;
  top: 0;
  left: 0;
  background-size: cover;
  background-position: 50% 50%;
  background-repeat: no-repeat;
  opacity: 0;
  z-index: 0;
  animation: imageAnimation 50s linear infinite; 
}
.slideshow li:nth-child(1) { 
  background-image: url(https://images.unsplash.com/photo-1465774124747-65ab0913fb9e?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=91c496301ea3a603946e7136c5344d5b&auto=format&fit=crop&w=1500&q=80) 
}
.slideshow li:nth-child(2) { 
  background-image: url(https://images.unsplash.com/photo-1484544808355-8ec84e534d75?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=fc1407c2a550b0ebf3def8b81fa7b4a2&auto=format&fit=crop&w=1532&q=80);
  animation-delay: 10s; 
}
.slideshow li:nth-child(3) { 
  background-image: url(https://images.unsplash.com/photo-1445882679958-91991ef6832f?ixlib=rb-0.3.5&s=e1c32adb2c3ad81e2dfc3cc10dfd59f7&auto=format&fit=crop&w=1500&q=80);
  animation-delay: 20s; 
}
.slideshow li:nth-child(4) { 
  background-image: url(https://images.unsplash.com/photo-1523476324532-18841ae4b297?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8a0251ade81e855554a9c0956cfe8c61&auto=format&fit=crop&w=1500&q=80);
  animation-delay: 30s; 
}
.slideshow li:nth-child(5) { 
  background-image: url(https://images.unsplash.com/photo-1524174491029-6388265feb4d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8d9245399e6a5fa4bf081ef37d3a9dc4&auto=format&fit=crop&w=1500&q=80);
  animation-delay: 40s; 
}
@keyframes imageAnimation { 
  0% { 
    opacity: 0; 
    animation-timing-function: ease-in;
  }
  10% {
    opacity: 1;
    animation-timing-function: ease-out;
  }
  20% {
    opacity: 1
  }
  30% {
    opacity: 0
  }
}
#landing-header {
  z-index: 1;
  position: relative;
  text-align: center;
  padding-top: 40vh;
}

	</style>	
	
</head>
<body>

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="main.jsp"  ><i class="fas fa-home"></i> Home </a>
    </div>
    <div id="navbar" class="collapse navbar-collapse">
      <ul class="nav navbar-nav">
        <li ><a href="account.jsp">Journey Planner</a></li>
        <li><a href="#about">About</a></li>
         <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="contact_info.jsp">Contact<span class="caret"></span></a>
              <ul class="dropdown-menu">
                 <li><a href="contact_info.jsp" target="iframe_a" >Contact Information</a></li>
                 <li><a href="feedback.jsp">FeedBack</a></li>
              </ul>
       </li>
        <li><a href="community.jsp">Community</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
          
          <%
          		
          	HttpSession sess=request.getSession(); 
          	sess.setAttribute("disable", "1"); 
            String name=(String)sess.getAttribute("username"); 
            String admid=(String)sess.getAttribute("admid");
            
          /* String name=request.getParameter("username"); */
          
          %>
          
           
           <% if(name==null){ %> 
        
            <li><a href="sign_up.jsp"> Signup &nbsp <i class="fa fa-user-plus"></i></a></li>
            <li><a href="login.jsp"> Login  &nbsp <i class="fa fa-user"></i></a></li>
           
           
           <% } %> 
       
      
            <% if(admid != null&&admid.equals("1")){ %>
            
             <li><a href="admin.jsp"> <%= name %>  &nbsp <i class="fas fa-user-tie"></i></a></li>
             <li><a href="./logoutServlet" > logout &nbsp <i class="fas fa-sign-out-alt"></i></a></li>
          
            
             <%} %>
             
              <% if(admid != null&&!admid.equals("1")) { %>
            	  
            	  <li><a href="./QuerySingleUser"> <%= name %>  &nbsp <i class="fas fa-user-tie"></i></a></li>
               <li><a href="./logoutServlet" > Logout &nbsp <i class="fas fa-sign-out-alt"></i></a></li>
            	  
            	  
             <%} %> 
             
             
          
       
        
      </ul>
    </div>
  </div>
 </nav>

 <div class="container">
 	<div class="row">
 		<div class="col-lg-12">
 			<div class="content" id="landing-header">
 				<h1>Journey Planner</h1>
 				<h3>A New Route For You--Melbourne</h3>
 				<hr>
 				<button class="btn btn-default btn-lg" ><i class="fas fa-map-marked-alt"></i><a class="link" href="account.jsp" >
 				    <font color="#000000">&nbsp Get Started</a> </button>
 			</div>
 			<ul class="slideshow">
              <li></li>
              <li></li>
              <li></li>
              <li></li>
              <li></li>
            </ul>
 		</div>
 	</div>
 </div>

 <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.4.js"></script>
 <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

</body>
</html>