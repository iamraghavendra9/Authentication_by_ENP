<!DOCTYPE HTML>
<html>
<%@include  file="connect.jsp" %>
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
    if(request.getParameter("mess")!=null){
        out.println("<script>alert('Request is Forwarded...')</script>");
    }
     if(request.getParameter("mes")!=null){
        out.println("<script>alert('Request is already Existed...')</script>");
    }
      if(request.getParameter("messg")!=null){
        out.println("<script>alert('Response sent...')</script>");
    }
    %>
  <div id="main">
    <header>
      <div id="logo">
        <div id="logo_text">
          <!-- class="logo_colour", allows you to change the colour of the text -->
         <pre>      <h2 style="font-size: 42px"><img src="images/cooltext345289362861870.png" width="900" height="100"></h2>
          
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
<h1> <font style="color: blue"> <B>View Files/ File Requests</font></h1>

<table width="810" border="1.5" cellpadding="0" cellspacing="0" style="margin-left:50px;">
         <tr bgcolor="red">
          
             <td width="115" bgcolor="red"><div align="center" class="style12"><font color="red"><B>File Name  </div></td>
           <td width="97" bgcolor="#9eb8dd"><div align="center" class="style12"><font color="red"><B>Owner Name</div></td>
               <td width="97" bgcolor="#9eb8dd"><div align="center" class="style12"><font color="red"><B>Upload Date</div></td>
                   <td width="97" bgcolor="#9eb8dd"><div align="center" class="style12"><font color="red"><B>Size</div></td>
		   <td width="67" bgcolor="#9eb8dd"><div align="center" class="style12"><font color="red"><B>Status</div></td>
		 </tr>           
<%	  
			  
	String s1="",s2="",s3="",s4="",s5="",s6="";
	int i=0,j=1,k=0;

 try 
	{		 Statement st=connection.createStatement();
 ResultSet rs=st.executeQuery("select * from files");
      	                  
					   		while ( rs.next() ) 
			                {
				              
								s2=rs.getString(2);
								s4=rs.getString(4);
								s5=rs.getString(5);
								s6=rs.getString(6);
                                                        
								
		
		
		%>
                    
                    <tr>
                     				  <td bgcolor="#00FFFF"><div align="center" class="style6 style11 style12 style5 style7 style9 style13 style14"><%=s2%></div></td>
                                                   <td bgcolor="#00FFFF"><div align="center" class="style6 style11 style12 style5 style7 style9 style13 style14"><%=s4%></div></td>
					  <td bgcolor="#00FFFF"><div align="center" class="style6 style11 style12 style5 style7 style9 style13 style14"><%=s5%></div></td>
					  <td bgcolor="#00FFFF"><div align="center" class="style6 style11 style12 style5 style7 style9 style13 style14"><%=s6%></div></td>
					 
					
              <td bgcolor="#00FFFF"><div align="center" class="style6 style11 style12 style5 style7 style9 style13 style14">
              </div><a href="File_Request.jsp?<%=rs.getString(1)%>">File Request</a></td>  </tr>
              <%
						
	    }
					  
     
		
	rs.close();
     
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>
        </table>
        <BR>
        <h1> <font style="color: blue"> <B>File Responses</font></h1>

<table width="810" border="1.5" cellpadding="0" cellspacing="0" style="margin-left:50px;">
         <tr bgcolor="red">
          
             <td width="115" bgcolor="red"><div align="center" class="style12"><font color="red"><B>File ID </div></td>
           <td width="97" bgcolor="#9eb8dd"><div align="center" class="style12"><font color="red"><B>Request From</div></td>
               <td width="97" bgcolor="#9eb8dd"><div align="center" class="style12"><font color="red"><B>Upload Date</div></td>
            
		   <td width="67" bgcolor="#9eb8dd"><div align="center" class="style12"><font color="red"><B>Secrete Key</div></td>
		 </tr>           
<%	  
			  
	String s7="",s8,s9="",s10,s11,s12,s13;
	

 try 
	{		 Statement st1=connection.createStatement();
 ResultSet rs1=st1.executeQuery("select * from rights where owner_name='"+uname+"' or username='"+uname+"'");
      	                  
					   		while ( rs1.next() ) 
			                {
				              
								s2=rs1.getString(3);
								s4=rs1.getString(2);
								s5=rs1.getString(4);
                                                                s6=rs1.getString(6);
								
                                                        
								
		
		
		%>
                    
                    <tr>
                     				  <td bgcolor="#00FFFF"><div align="center" class="style6 style11 style12 style5 style7 style9 style13 style14"><%=s2%></div></td>
                                                   <td bgcolor="#00FFFF"><div align="center" class="style6 style11 style12 style5 style7 style9 style13 style14"><%=s4%></div></td>
					  <td bgcolor="#00FFFF"><div align="center" class="style6 style11 style12 style5 style7 style9 style13 style14"><%=s5%></div></td>
		<%
                if(s6.equals("no")){
                %>		 
					
              <td bgcolor="#00FFFF" ><div align="center" class="style6 style11 style12 style5 style7 style9 style13 style14">
              </div><a href="File_Key.jsp?<%=s2%>">Send Key</a></td>  </tr>
              <%
	}else{%>
               
              <td bgcolor="#00FFFF"><div align="center" class="style6 style11 style12 style5 style7 style9 style13 style14"><%=s6%></div></td></tr>
            
                    
                    <%}					
	    }
					  
     
		
	
           connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>
        </table>


       
      </div>
    </div>
    <footer>
      <p>Copyright &copy; All Rights Reserved.</p>
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
