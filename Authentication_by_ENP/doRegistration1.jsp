
<%@ page language="java" %>
<%@include  file="mail.jsp"%>
<%@include  file="connect.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
try {

String uname=(String)session.getAttribute("uname");
String pwd=(String)session.getAttribute("pwd");
String mail=(String)session.getAttribute("mail");

String hash=request.getParameter("hpassword");
String npwd=request.getParameter("npassword");
 String enpwd=request.getParameter("epassword");  

 System.out.println("user name is: " +uname);
 System.out.println("password is: " +pwd);
 System.out.println("Hash Password is: " +hash);
 System.out.println("email ID is: " +mail);
 
 //System.out.println("Negative Password is " +npwd);
 
 //System.out.println("Encrypted Negative Password (ENP) is " +enpwd);
 
 
            
          Statement st=connection.createStatement();
           int i=st.executeUpdate("update user_reg set hashcode='"+hash+"',npassword='"+npwd+"',enpassword='"+enpwd+"' where username='"+uname+"'");

           if(i==1){
        	   
        	   // mail sending function calling               
          	  this.secretMail("Hi Thanks for registration!  ", uname, mail, pwd, hash);
          			  
              response.sendRedirect("register.jsp?status=registered");
          }}
        
        catch(Exception e){
       e.printStackTrace();
        }
%>