

<%@include  file="connect.jsp" %>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@page import="java.util.Random"%>
<%
try{
            String uname=request.getQueryString();
            Random r=new Random();
            int n=r.nextInt();
            String key=n+"";
            
            
          
          
          Statement st1=connection.createStatement();
        
          

        
          int i=st1.executeUpdate("update user_reg set activate='no' where username='"+uname+"' ");
            if(i!=0){
             
             response.sendRedirect("users.jsp?error='activate'");
          }
          else{
              out.println("error while entering data");
          }
       
        } 
        catch(Exception e){
            out.println(e);
        }
%>