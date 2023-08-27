<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="connect.jsp" %>
<%@ page language="java" %>
<%@include  file="mail.jsp"%>


<%

try {
           String name=request.getParameter("name");
            String uname=request.getParameter("username");
            String pass=request.getParameter("cpassword");
            String mail=request.getParameter("mail");
            String ph=request.getParameter("mobile");
            
       
						Statement st1=connection.createStatement();
						ResultSet rs1=st1.executeQuery("select * from user_reg  where username='"+uname+"'");
						
							
					if ( rs1.next() )
					   {
                                               response.sendRedirect("register.jsp?error=registered");
					   }
					   else
					   {
            session.setAttribute("uname", uname);
            session.setAttribute("pwd", pass);
            session.setAttribute("mail", mail);
            
           // mail sending function calling
           
     	  // this.secretMail("Hello thanks for regis", uname, mail, pass);
     			   
          Statement st=connection.createStatement();
           int i=st.executeUpdate("insert into user_reg (username,name,password,mail,phoneno,activate)values('"+uname+"','"+name+"','"+pass+"','"+mail+"','"+ph+"','no')");

           if(i==1){
        	   
        	   
        			   
              response.sendRedirect("CryptographicHashFunction.jsp?status=registered");
        			   
          }}
        } 
        catch(Exception e){
       e.printStackTrace();
        }
%>