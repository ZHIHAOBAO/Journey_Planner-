<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%-- <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> --%>
<!DOCTYPE html>
<html>
<head>
<!-- Page title -->
  <title>Register</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
  <script type="text/javascript" src="js/easyTooltip.js"></script>
  <script type="text/javascript" src="js/jquery-ui-1.7.2.custom.min.js"></script>
  <!-- End of Libraries -->
</head>

<style>
body {

 background: #FEAC5E;  /* fallback for old browsers */
background: -webkit-linear-gradient(to right, #4BC0C8, #C779D0, #FEAC5E);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to right, #4BC0C8, #C779D0, #FEAC5E); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
 font-family: "Lato";
/* color: #00efff; */

}

 .form-group{
   width: 100%;
   height: 30px;
 }
#link{
  float: left;
}

#bt02{
  
  float: right;
  height: 30px;
  padding-top: 5px;
    
  }

 .selectpicker{

  height: 70%;
  width: 100%;
  padding-top:10px;
  padding-bottom: 0.5%;
  margin-top:3px;
 
 }
</style>
<body>

<div class="container">
  <form  action="add.jsp" method="post" >
 <div class="container">
    <h1>Register</h1>
    <br/>
    <p>Please fill in this form to create an account.</p>
   
    <div class="input-group">
       <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
        <input id="username" type="text" class="form-control" name="username" placeholder="UserName" oninput=init('username') required>
    </div>
    <p id="user"  name="user" style="color: red;" >&nbsp</p>


    <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
      <input id="password" type="password" class="form-control" name="password" placeholder="Password" oninput=check()  required>
    </div>

    <p id="passcode"  name="passcode" style="color: red;">&nbsp</p>

     <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
      <input id="rePassword" type="Password" class="form-control" name="rePassword" placeholder="Repeat Password" oninput=doubleCheck() required>
    </div>

     <p id="repasscode"  name="repasscode" style="color: red;" >&nbsp</p>

    <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      <input id="firstname" type="text" class="form-control" name="firstname" placeholder="FirstName" oninput=init('firstname') required>
    </div>

    <p id="Fname"  name="Fname" style="color: red;" >&nbsp</p>

    <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      <input id="lastname" type="text" class="form-control" name="lastname" placeholder="LastName" oninput=init('lastname')   required>
    </div>
    <p id="Lname"  name="Lname" style="color: red;"  >&nbsp</p>

    <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      <input id="age" type="text" class="form-control" name="age" placeholder="Age" oninput=ageFunction() required >
    </div>

    <p id="Mage"  name="Mage" style="color: red;" >&nbsp</p>

    <div class="input-group" id="choose">
      <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
        <select class="selectpicker" size="1.9" id="sex"  name="sex">  
          	<!-- <option value=" " disabled selected="">&nbsp&nbsp&nbspchoose your gender</option> -->
          	 <option value="female" id="female" name="female">&nbsp&nbsp&nbspFemale</option>
          	 <option value="male" selected="" id="male" name="male">&nbsp&nbsp&nbspMale</option>  
       </select>
    </div>

    <br/>

    <div class="input-group">
      <span class="input-group-addon"><i class="fas fa-envelope"></i></span>
      <input id="email" type="email" class="form-control" name="email" placeholder="Email" required>

    </div>
     <br/>

    <div class="form-group">

      <button type="button" class="btn1 btn-link" id="link"><a  href='main.jsp'><--back</a></button>
      <button type="submit" class="btn btn-primary" id="bt02">Register</button>

    </div>

  </form>
</div>

<script>

    
    function init(n){

        var username=document.getElementById('username').value;
        var user=document.getElementById('user').value;
        var firstname=document.getElementById('firstname').value;
        var lastname=document.getElementById('lastname').value;

        switch(n){

          case 'username':

                if(!myAccount(username)){

                    document.getElementById('user').innerHTML="*Username is incorrect,please write your name  with the  letter!";
                  }

                  if(username==''||myAccount(username)){
              
                   wronguser('user');

                }

              break;

          case 'firstname':

                  if(!myAccount(firstname)){
                  
                    document.getElementById('Fname').innerHTML="*firstname is incorrect,please write the name  with the letter!"; 
                  
                  }

                  if(firstname==''||myAccount(firstname)){
                     wronguser('Fname');
                 }
              break;


          case 'lastname':

            if(!myAccount(lastname)){
              
                    document.getElementById('Lname').innerHTML="*lastname is incorrect,please write the name with the letter!"; 
                  
                  }

            if(lastname==''||myAccount(lastname)){

                     wronguser('Lname');
                
                 }

              break;
        }
      
    }

   
    //check if the  iuputted password right or wrong 

    function check(){

       var password=document.getElementById('password').value;
       var passcode=document.getElementById('password').value;
       var n=0;
        
       if(!Checkpassword(password)){

              document.getElementById('passcode').innerHTML='* Please enter number and at least one  uppercase and one lowercase letter';
        

         
       }    
      if(passcode==''||Checkpassword(passcode)){
            wronguser('passcode');


      }   
}
    


// check the repeated password


    function doubleCheck(){

        var password=document.getElementById('password').value;
        var rePassword=document.getElementById('rePassword').value;
        var repasscode=document.getElementById('repasscode').value;
       

         if(password!==rePassword){
            document.getElementById('repasscode').innerHTML='* Please enter the same password! ';
            console.log("right "+password+rePassword);
          
          }

         if(repasscode==''||password==rePassword){
            
            wronguser('repasscode');

         }

    }

    //check the age inputted 

      function ageFunction(){

        var age=document.getElementById('age').value;
        var num=parseInt(age);
        var right=0;
         
        if(num<=0||num>=150||!mynumber(age)){

              document.getElementById('Mage').innerHTML="*Please input a vaild number! ";  

              right=1;      

        }
        if(right==0||age==''){
           wronguser('Mage');
        }

      }

    function wronguser(value){

       return  document.getElementById(value).innerHTML='&nbsp';
    }


    function Checkpassword(value) {


       return /^[A-Za-z0-9\d=!\-@._*]*$/.test(value) // allowed characters
         && /[a-z]/.test(value) // contains lowercase
         && /[A-Z]/.test(value) // contains UPPERCASE
         && /[0-9]/.test(value) // contains Number
    }

   function myAccount(value){

      return /^[A-Za-z\-]*$/.test(value)
     
        
   }

    function mynumber(value){
      return /^[0-9]*$/.test(value) // allowed characters
       
   }

  </script>

 <script src="sha256.js"></script>
 <script type="text/javascript">
		function hash() {
			var password = document.getElementById('password').value;
			var repassword = document.getElementById('rePassword').value;
			var hash = SHA256.hash(password);	
			
			document.getElementById("password").value = hash;
			document.getElementById("rePassword").value = hash;
		}

		</script>
</body>
</html>