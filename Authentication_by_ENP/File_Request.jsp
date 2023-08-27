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
         String qrya="select * from rights where filename='"+request.getQueryString()+"' and username='"+name+"'";
Statement staa = connection.createStatement();			
         ResultSet rsa =staa.executeQuery(qrya);
	if(rsa.next())
	{ 
                    
                 //JOptionPane.showMessageDialog(null, "Request is Alerady Done");
                       response.sendRedirect("viewfiles.jsp?mes=success");            
                  
                }else{
    
    
    
    
    
    String qrya1="select * from files where idfiles='"+request.getQueryString()+"'";
Statement staa1 = connection.createStatement();			
         ResultSet rsa1 =staa1.executeQuery(qrya1);
	if(rsa1.next())
	{ 


psmt1=connection.prepareStatement("insert into rights(username,filename,udate,status,sk,owner_name) values(?,?,?,'no','no','"+rsa1.getString("owner_name")+"')");
psmt1.setString(1,name);
psmt1.setString(2,request.getQueryString());
psmt1.setString(3,strDateNew1);


psmt1.executeUpdate();
    response.sendRedirect("viewfiles.jsp?mess=success");            
                  

}}}
catch(Exception ex)
{

out.println("Error in connection : "+ex);

}

%>

</body>
</html>