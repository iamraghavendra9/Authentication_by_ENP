<%@include  file="connect.jsp" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>


<%
java.util.Date now = new java.util.Date();
	 String DATE_FORMAT1 = "dd/MM/yyyy";
	 SimpleDateFormat sdf1 = new SimpleDateFormat(DATE_FORMAT1);
     String strDateNew1 = sdf1.format(now);






PreparedStatement psmt1=null;

FileInputStream fis;

try{
    

	
	HttpSession user=request.getSession();
String uname=user.getAttribute("username").toString();   
String name=user.getAttribute("name").toString();  
     
    
    String qrya1="select * from files where idfiles='"+request.getQueryString()+"'";
Statement staa1 = connection.createStatement();			
         ResultSet rsa1 =staa1.executeQuery(qrya1);
	if(rsa1.next())
	{ 


psmt1=connection.prepareStatement("update rights set sk='"+rsa1.getString("file_key")+"',status='yes' where filename='"+request.getQueryString()+"'");

psmt1.executeUpdate();
    response.sendRedirect("viewfiles.jsp?messg=success");            
                  

}}
catch(Exception ex)
{

out.println("Error in connection : "+ex);

}

%>

</body>
</html>