<%@include  file="connect.jsp" %>
<%
try {
            String uname=request.getParameter("username");
            String pass=request.getParameter("password");
            
         
         if(uname.equalsIgnoreCase("admin")&&pass.equalsIgnoreCase("admin")){
              // out.println("success... ");
                  response.sendRedirect("admin_page.jsp");
           }
           else{
                 response.sendRedirect("admin.jsp?status=success");
           }
        }
        catch(Exception e){
            out.println(e);
        }
%>