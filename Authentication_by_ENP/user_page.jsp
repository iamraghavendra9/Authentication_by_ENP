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
          if(document.name.token.value==0){
              alert('Enter your token');
              document.name.token.focus();
              return false;
          }
      }
  </script>
  
  <style>
      form,h1{
          position: relative;
          left: 350px;
          
      }
      
    #id{
        width: 200px;
        height: 25px;
        background-color: #D5D5D5;
    }
    #but{
        width: 60px;
        height: 25px;
    }
</style>
</head>

<body>
        <%
if(request.getParameter("no")!=null){
    out.println("<script>alert('your not having permission to do this...')</script>");
}    
if(request.getParameter("status")!=null){
    out.println("<script>alert('Authentication success')</script>");
}

%>
  <div id="main">
    <header>
      <div id="logo">
        <div id="logo_text">
          <!-- class="logo_colour", allows you to change the colour of the text -->
         <pre> 
          <h2 style="font-size: 42px"><img src="images/cooltext345289362861870.png" width="900" height="100"></h2>
         </pre>
        </div>
      </div>
      <nav>
        <ul class="sf-menu" id="nav">
           
            <li ><a href="profile.jsp">View Profile</a></li>
            <li><a href="upload.jsp">Upload File</a></li>
            <li><a href="download.jsp">Download File</a></li>
              <li><a href="viewfiles.jsp">View Files</a></li>
              <li><a href="index.html">Logout</a></li>
          
         
        </ul>
      </nav>
    </header>
    <div id="site_content">

      <div id="content">
          <%
HttpSession user=request.getSession();
String uname=user.getAttribute("username").toString();   
String name=user.getAttribute("name").toString();      
%>
<h1>Welcome ! <font style="color: tomato"> <%=name%></font></h1>
<div style="position: relative;left: 200px;">
    <img src="images/usermain.PNG" width="500" height="400" ></img>
</div>

       
      </div>
    </div>
    <footer>
      <p>Copyright &copy;  All Rights Reserved.</p>
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
