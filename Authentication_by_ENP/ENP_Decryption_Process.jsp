
<%@include  file="connect.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
try {
           
            String uname=request.getParameter("username");
            String pass=request.getParameter("password");
            String npass=request.getParameter("npassword");
           
            
       
						 Statement st=connection.createStatement();
          ResultSet rt=st.executeQuery("select * from user_reg where username='"+uname+"'");
          if(rt.next()){
              String p=rt.getString("hashcode");String q=rt.getString("npassword");
              String activate=rt.getString("activate");
              String name=rt.getString("name");
              if(pass.equalsIgnoreCase(p) && npass.equalsIgnoreCase(q)){
                  if(activate.equalsIgnoreCase("yes")){
                      HttpSession user=request.getSession(true);
                      user.setAttribute("name", name);
                      user.setAttribute("username", uname);
                      
                      response.sendRedirect("user_page.jsp?status='success'");
                  }
                  else{
                     response.sendRedirect("user.jsp?activate='success'");
                  }
              }
              else{
                 response.sendRedirect("user.jsp?status1='success'");
              }
          }
          else{
              out.println("Incorrect username");
          }
        } 
        catch(Exception e){
       e.printStackTrace();
        }
%>