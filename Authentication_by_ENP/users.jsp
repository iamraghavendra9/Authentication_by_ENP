<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@include file="connect.jsp"%> 
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
  
  <style>
    table,td,tr{
        border-collapse: collapse;
        border-style: solid;
    }
    table{
        width: 680px;
    }
    td{
        text-align: center;
    }
    tr{ 
        background-color: #D9D5CF;
        height: 25px;
    }
</style>
</head>

<body>
         <%
    if(request.getParameter("status")!=null){
        out.println("<script>alert('Account is Activated')</script>");
    }
      if(request.getParameter("error")!=null){
        out.println("<script>alert('Account is De-Activated')</script>");
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
     <li><a href="admin_View_Files.jsp">View Files</a></li>
<li><a href="admin_File_Requests.jsp">View File Requests</a></li>
<li><a href="users.jsp">View Users</a></li>
<li><a href="index.html">Logout</a></li>
        
        </ul>
      </nav>
    </header>
    <div id="site_content">

<%

 Statement st=connection.createStatement();
 ResultSet rs=st.executeQuery("select * from user_reg order by activate asc");


%>
      <div >
      
       <center>
               
                       <caption> <h2 style="color: coral"> <b>USER DETAILS</h2></caption>
                   <table width="610" border="1.5" cellpadding="0" cellspacing="0" align="center">
         <tr bgcolor="red">
          
             <td width="115" bgcolor="red"><div align="center" class="style12"><font color="red"><B>User Name  </div></td>
           <td width="97" bgcolor="#9eb8dd"><div align="center" class="style12"><font color="red"><B>Email</div></td>
               <td width="97" bgcolor="#9eb8dd"><div align="center" class="style12"><font color="red"><B>Phone No</div></td>
                   <td width="97" bgcolor="#9eb8dd"><div align="center" class="style12"><font color="red"><B>Generated Hash Password</div></td>
		   <td width="67" bgcolor="#9eb8dd"><div align="center" class="style12"><font color="red"><B>Status</div></td>
		 </tr>           
<%	  
			  
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=1,k=0;

 try 
	{		
      	                  
					   		while ( rs.next() ) 
			                {
				              
								s2=rs.getString(1);//name
								s4=rs.getString(4);//mail
								s5=rs.getString(5);//mob
								s6=rs.getString(9);//add
                                                                s7=rs.getString(7);//add
								
		
		
		%>
                    
                    <tr>
                     				  <td bgcolor="#00FFFF"><div align="center" class="style6 style11 style12 style5 style7 style9 style13 style14"><%=s2%></div></td>
                                                   <td bgcolor="#00FFFF"><div align="center" class="style6 style11 style12 style5 style7 style9 style13 style14"><%=s4%></div></td>
					  <td bgcolor="#00FFFF"><div align="center" class="style6 style11 style12 style5 style7 style9 style13 style14"><%=s5%></div></td>
					  <td bgcolor="#00FFFF"><div align="center" class="style6 style11 style12 style5 style7 style9 style13 style14"><%=s6%></div></td>
					 
					  <%
						if(s7.equalsIgnoreCase("no"))
						{
						
						%>
              <td bgcolor="#00FFFF"><div align="center" class="style6 style11 style12 style5 style7 style9 style13 style14">
              </div><a href="activate.jsp?<%=s2%>" >Activate</a></td>
              <%
						}
						else
						{
						%>
              <td bgcolor="#00FFFF"><div align="center" class="style6 style11 style12 style5 style7 style9 style13 style14">
                  
                </div><a href="deativate.jsp?<%=s2%>" >Deactivate</a></td>
              <%
						}
						%>
	      </tr>
					  
        <%
		
	}
           connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>
        </table>

            </center> 
       
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
