<%@include  file="connect.jsp" %>
<%
try {
            String uname=request.getParameter("username");
            String pass=request.getParameter("password");
            
          
          Statement st=connection.createStatement();
          ResultSet rt=st.executeQuery("select * from user_reg where username='"+uname+"'");
          if(rt.next()){
              String p=rt.getString("password");
              String activate=rt.getString("activate");
              String name=rt.getString("name");
              if(pass.equalsIgnoreCase(p)){
                  if(activate.equalsIgnoreCase("yes")){
                      HttpSession user=request.getSession(true);
                      user.setAttribute("name", name);
                      user.setAttribute("username", uname);
                      
                      HttpSession email=request.getSession(true);
                      user.setAttribute("name", name);
                      user.setAttribute("mail", email);
                      response.sendRedirect("doLogin.jsp");
                  }
                  else{
                        response.sendRedirect("user.jsp?activate=success");
                  }
              }
              else{
                 response.sendRedirect("user.jsp?status=success");
              }
          }
          else{
              response.sendRedirect("user.jsp?status=success");
          }
        }
        catch(Exception e){
            out.println(e);
        }
%>