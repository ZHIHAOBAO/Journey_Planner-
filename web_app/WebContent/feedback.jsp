<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Feedback</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style type="text/css">
body{

  background: #FEAC5E;  /* fallback for old browsers */
background: -webkit-linear-gradient(to right, #4BC0C8, #C779D0, #FEAC5E);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to right, #4BC0C8, #C779D0, #FEAC5E); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
 font-family: "Lato";
/* color: #00efff; */
}
  #btn{
    float: right ;
    margin-top : 10px;
    height: 25px;
    padding-top: 2px;
    
  }
 textarea {
    resize: none;
}

#firstBlock{

  background: red;
  width: 100%;
  position: relative;



}

#title{
  position: absolute;
  left:0%; 
  top:8%; 

}


</style>
</head>
<body>
 <form  onsubmit=" return checkText()" action="./feedbackServlet" method="POST" >
<div class="container">
  <h2 style="color:#00efff;">Feedback</h2>
 
   <div class="form-group" id='firstBlock'>
   <input type="text" name="title" id="title"  maxlength="35" placeholder= "   Title: " />
   </div>
  <br/>

<%
	HttpSession sess=request.getSession(); 
	//String name=(String)sess.getAttribute("username");
	//request.setAttribute("username", name);
	//request.getRequestDispatcher("./main.jsp").forward(request, response);
	String dis= (String) sess.getAttribute("disable");
	String able= (String) sess.getAttribute("able");
	System.out.print(" "+dis);
	System.out.print(" "+able);
	
	if(dis =="1"&&able==null){
		
%>		
			<jsp:forward page="login.jsp" /> 
<% 
	}
	
	else{
				
%>	
 
    <div class="form-group">
      <br/>
      <textarea class="form-control" rows="10" cols='10' id="comment" name="comment" placeholder="Write your comments here..." maxlength="300" oninput=checkTextNum()></textarea> 

      <!--<input id="thetime" name="thetime"  hidden=""> -->
       <!--<p id="time" name="time" ></p>-->
      
      <button type="button" class="btn1 btn-link"><a  href='main.jsp'><--back</a></button>

      <button type="submit" class="btn btn-primary" id="btn"  >Submit</button>
    </div>
   

</div>
  </form>
<% 	}%>
<script type="text/javascript" >

  function checkText(){

    var text= document.getElementById("comment").value;
  
   
    if(text==""){
        alert("you can't submit a empty form!!!!");
        return false;
        
    }
    return true;
  };

  function checkTextNum(){
    var text= document.getElementById("comment").value;
    //console.log(text.length);

    if(text.length ==298){
        alert("The character cannot over 300 ");

    }
  };

  
</script>

</body>
</html>