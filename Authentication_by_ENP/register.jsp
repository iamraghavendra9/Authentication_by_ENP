<!DOCTYPE HTML>
<html>

<head>
<title>Authentication by Encrypted Negative Password</title>
  <meta name="description" content="website description" />
  <meta name="keywords" content="website keywords, website keywords" />
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
   <link rel="shortcut icon" type="image/x-icon" href="images/brainstorming_alternative.png"/>
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <!-- modernizr enables HTML5 elements and feature detects -->
  <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
  <script>
    function validation(){
        var uname=document.ureg.username.value;
        var pass=document.ureg.password.value;
        var cpass=document.ureg.cpassword.value;
        var mail=document.ureg.mail.value;
        var name=document.ureg.name.value;
        var ph=document.ureg.mobile.value;
        
        if(name==0){
            alert("Enter name");
            document.ureg.name.focus();
            return false;
        }
        if(uname==0){
            alert("Enter username");
            document.ureg.username.focus();
            return false;
        }
        if(pass==0){
            alert("Enter password");
            document.ureg.password.focus();
            return false;
        }
        if(cpass!=pass){
            alert("Incorrect password");
            document.ureg.cpassword.focus();
            return false;
        }
        
        
        if(mail==0){
            alert("Enter mailid");
            document.ureg.mail.focus();
            return false;
        }
        if(ph==0){
            alert("Enter your mobile no");
            document.ureg.mobile.focus();
            return false;
        }
         if(isNaN(ph)){
                 alert("Invalid phoneno");
                 document.ureg.mobile.focus();
                 return  false;
            }
    }
</script>
<style>
    input{
        width: 200px;
        height: 25px;
        background-color: #D5D5D5;
    }
    #but{
        width: 75px;
        height: 25px;
    }
</style>
</head>

<body>
        <%
       
        
    if(request.getParameter("error")!=null){
        out.println("<script>alert('The username already exists!')</script>");
    }
     if(request.getParameter("status")!=null){
        out.println("<script>alert('Registration success!')</script>");
    }
    
    %>
  <div id="main">
    <header>
      <div id="logo">
        <div id="logo_text">
          <!-- class="logo_colour", allows you to change the colour of the text -->
         <pre><h1><img src="images/cooltext345289362861870.png" width="900" height="100"></h1>
         
        </div>
      </div>
      <nav>
        <ul class="sf-menu" id="nav">
          <li class="selected"><a href="index.html">Home</a></li>
          <li><a href="admin.jsp">Admin</a></li>
       
        
          <li><a href="#">User</a>
            <ul>
                <li><a href="user.jsp">Login</a></li>
                <li><a href="register.jsp">Register</a></li>
             
            </ul>
          </li>
        
        </ul>
      </nav>
    </header>
    <div id="site_content">
      <div id="sidebar_container">
        <div class="gallery">
          <ul class="images">
            <li class="show"><img width="450" height="450" src="images/rphase.PNG" alt="photo_one" /></li>
            <li><img width="450" height="450" src="images/c2.jpg" alt="photo_two" /></li>
            <li><img width="450" height="450" src="images/c3.jpg" alt="photo_three" /></li>
            <li><img width="450" height="450" src="images/c4.jpg" alt="photo_four" /></li>
            <li><img width="450" height="450" src="images/c5.jpg" alt="photo_five" /></li>
          </ul>
        </div>
      </div>
      <div id="content">
          <fieldset style="background-color: #70D4E6;">
              <center>
			<h2 class="title"style="color: mediumvioletred;font-size: 30px;">Registration Phase  </h2>
              </center>
                        
                        <form action="doRegistration.jsp" name="ureg" style="position: relative;left: 110px;" method="post" onsubmit="return validation()"> 
<!--                  USERNAME:<br>-->

<B><font color="brown">Name :<BR>
<input type="text" name="name" placeholder="Enter your name" ><br></br>
<B><font color="brown">User Name :<BR>
<input type="text" name="username" placeholder="Enter username"><br></br>
<!--                  PASSWORD:<br>-->
<B><font color="brown">Password :<BR>
<input type="password" name="password" placeholder="Enter password"><br></br>
<B><font color="brown">Confirmed Password :<BR>
<input type="password" name="cpassword" placeholder="confirm your password"><br></br>
<B><font color="brown">Email-ID :<BR>
<input type="email" name="mail" placeholder="Enter your email"><br></br>
<B><font color="brown">Mobile :<BR>
<input type="text" name="mobile" placeholder="Enter your mobile no" maxlength="10"><br></br>
&nbsp;<input type="submit" id="but" value="Next"style="background-color: yellowgreen;color: #ffffff"/>
&nbsp;&nbsp;   <input type="reset"id="but" value="Reset" style="background-color: #AA3300;color: #ffffff"></input><br></br>
                                                         
                
            
		</form>
                       
                   
          </fieldset>
      </div>
    </div>
    <footer>
      <p>Copyright &copy;. All Rights Reserved.</p>
    </footer>
  </div>
  <p>&nbsp;</p>
  <!-- javascript at the bottom for fast page loading -->
  <script type="text/javascript" src="js/jquery.js"></script>
  <script type="text/javascript" src="js/jquery.easing-sooper.js"></script>
  <script type="text/javascript" src="js/jquery.sooperfish.js"></script>
  <script type="text/javascript" src="js/image_fade.js"></script>
  <script type="text/javascript">
    $(document).ready(function() {
      $('ul.sf-menu').sooperfish();
    });
  </script>
</body>
</html>
