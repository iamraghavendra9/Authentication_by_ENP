
 <%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@ page language="java" %>
 
 <%-- /*/we have called this function in doRegistration1.jsp page/*/ --%>
  
<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>

<%@ page import = "javax.servlet.ServletException.*"%>
<%@ page import = "javax.servlet.http.HttpServlet.*"%>
<%@ page import = "javax.servlet.http.HttpServletRequest.*"%>
<%@ page import = "javax.servlet.http.HttpServletResponse.*"%>
<%@ page import = "javax.mail.Message.*"%>
<%@ page import = "javax.mail.MessagingException.*"%>
<%@ page import = "javax.mail.PasswordAuthentication.*"%>
<%@ page import = "javax.mail.Session.*"%>
<%@ page import = "javax.mail.Transport.*"%>
<%@ page import = "javax.mail.internet.InternetAddress.*"%>
<%@ page import = "javax.mail.internet.MimeMessage.*"%>

  <%-- /*/mail sending function start /*/--%>
<%!    
      public boolean secretMail(String msg, String uname, String email, String pwd, String Hcp) {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");

        Session session = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication("nationalinstitutenip@gmail.com", "ketthan4962645");
                        }
                });
        
        String text = msg+" USER NAME: "+uname+", PASSWORD: "+pwd+", HASH PASSWORD: "+Hcp;  

        System.out.println("Message: " + text);
        
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(uname));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(email));
                    message.setText(text);
                    //message.setText("PWD:"+pwd);

            Transport.send(message);

            System.out.println("mail sent Done");
            return true;

        } catch (MessagingException e) {
            System.out.println(e);
            e.printStackTrace();
            return false;
            // throw new RuntimeException(e);
        }
    }
%>
  <%--/*/mail sending function END /*/--%>
    
