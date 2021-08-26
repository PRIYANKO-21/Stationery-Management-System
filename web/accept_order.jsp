<%-- 
    Document   : aceept_order
    Created on : 25 Apr, 2017, 10:18:18 AM
    Author     : SAMSUNG
--%>
<%@page import= "java.sql.*"%>
<%@page import="javax.mail.*"%>
 
<%@page import="javax.mail.internet.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@ page import="java.math.BigInteger"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="background-color:#FF9999;">
        <% 
 ResultSet rs2=null;
 PreparedStatement ps2=null;
  ResultSet rs=null;
  
   String q2="select * from cost";
    float pen_cost=0,pencil_cost=0,paper_cost=0,file_cost=0,notebook_cost=0,marker_cost=0,board_cost=0;
   //  int pen=0,pencil=0,paper=0,file=0,notebook=0,marker=0,board=0;
     try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sms","root","");
           
                  ps2=con.prepareStatement(q2);
               
                 rs2=ps2.executeQuery();
          
            }catch(Exception e)
            {
                out.println(e);
            }
            %>
              

                  
           <%           while (rs2.next()) { %>
                   
                       <%   pen_cost=rs2.getFloat("pen");
                           pencil_cost= rs2.getFloat("pencil");
                            paper_cost= rs2.getFloat("paper");
                             file_cost= rs2.getFloat("file");
                              notebook_cost= rs2.getFloat("notebook");
                             marker_cost= rs2.getFloat("marker");
                             board_cost= rs2.getFloat("board");
                           %>
                       
                                    
                     <% } %>
        <%   
          String email1= session.getAttribute("email1").toString();
        //   String q8="select * from orders where email='email' ";
        //out.println(email1);
      // String email1="ab@gmail.com";
                      PreparedStatement ps=null,ps1=null,ps3=null,ps4=null,ps5=null,ps6=null,ps7=null;
                     
                       
                         String q="UPDATE   stock  SET  qty = qty -(SELECT pen_qty  FROM orders WHERE email=?) WHERE item_name='pen' ";
                          String q1="UPDATE   stock  SET  qty = qty -(SELECT pencil_qty  FROM orders WHERE email=?) WHERE item_name='pencil'   ";
                          String q3="UPDATE   stock  SET  qty = qty -(SELECT paper_qty  FROM orders WHERE email=? ) WHERE item_name='paper'  ";
                            String q4="UPDATE   stock  SET  qty = qty -(SELECT file_qty  FROM orders WHERE email= ?) WHERE item_name='file'  ";
                             String q5="UPDATE   stock  SET  qty = qty -(SELECT notebook_qty  FROM orders WHERE email= ? ) WHERE item_name='notebook' ";
                              String q6="UPDATE   stock  SET  qty = qty -(SELECT marker_qty  FROM orders WHERE email= ?) WHERE item_name='marker'   ";
                               String q7="UPDATE   stock  SET  qty = qty -(SELECT board_qty  FROM orders WHERE email=?) WHERE item_name='board'   ";
               try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sms","root","");
                 ps=con.prepareStatement(q);
                 ps1=con.prepareStatement(q1);
                 ps3=con.prepareStatement(q3);
                 ps4=con.prepareStatement(q4);
                 ps5=con.prepareStatement(q5);
                 ps6=con.prepareStatement(q6);
                 ps7=con.prepareStatement(q7);
                 
                 ps.setString(1,email1);
                   ps1.setString(1,email1);
                     ps3.setString(1,email1);
                       ps4.setString(1,email1);
                         ps5.setString(1,email1);
                           ps6.setString(1,email1);
                             ps7.setString(1,email1);
                             
                 ps.executeUpdate();
                  ps1.executeUpdate();
                      ps3.executeUpdate();
                         ps4.executeUpdate();
                           ps5.executeUpdate();
                               ps6.executeUpdate();
                                  ps7.executeUpdate();
          
            } catch(Exception e)
            {
                out.println(e);
            }
                %>
                <%
    String host = "smtp.gmail.com";
 
    //host = smtp_server; //"smtp.gmail.com"; user = jsp_email; //"YourEmailId@gmail.com" // email id to send the emails
 
    //pass = jsp_email_pw; //Your gmail password
 
    String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
    String to_add = session.getAttribute("email1").toString();
    String tot=session.getAttribute("total").toString();
 
    String from = "stcet.sms@gmail.com", subject = "Order accepted", messageText = "Congrats. your order is accepted.Total amount to be paid is= "+tot + "Rs", password = "stcet123";
 
    boolean sessionDebug = true;
 
    Properties props = System.getProperties();
 
    props.put("mail.host", host);
    props.put("mail.smtp.debug", "true");
    props.put("mail.smtp.user", from);
 
    props.put("mail.transport.protocol.", "smtp");
 
    props.put("mail.smtp.auth", "true");
    
    props.put("mail.smtp.starttls.enable", "true");
 
    props.put("mail.smtp.", "true");
 
    props.put("mail.smtp.port", "587");
    props.put("mail.smtp.socketFactory.port", "587");
    
    //props.put("mail.smtp.port", "465");

    props.put("mail.smtp.socketFactory.fallback", "false");
 
    props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
 
    Session mailSession = Session.getDefaultInstance(props, null);
 
    mailSession.setDebug(sessionDebug);
 
    Message msg = new MimeMessage(mailSession);
 
    msg.setFrom(new InternetAddress(from));
 
    InternetAddress[] address = { new InternetAddress(to_add) };
 
    msg.setRecipients(Message.RecipientType.TO, address);
 
    msg.setSubject(subject);
 
    msg.setContent(messageText, "text/html"); // use setText if you want to send text
 
    Transport transport = mailSession.getTransport("smtp");
    System.setProperty("javax.net.ssl.trustStore", "conf/jssecacerts");
    System.setProperty("javax.net.ssl.trustStorePassword", "admin");
    transport.connect(host,587, "stcet.sms@gmail.com", "stcet123");
 
    try {
 
        transport.sendMessage(msg, msg.getAllRecipients());
        out.println("Email sent.");
        //WasEmailSent = true; // assume it was sent
 
    }
 
    catch (Exception err) {
 
        //WasEmailSent = false; // assume it's a fail
 
        out.println("Error" + err.getMessage());
         out.println(err);
 
    }
    transport.close();
%>
 <%
           // String uname=new String();
          //  ResultSet rs=null;
         //   int pen_qty,pencil_qty,paper_qty,notebook_qty,file_qty;
          //  String email1=session.getAttribute("email1").toString();
    String email2=session.getAttribute("email1").toString();
             String q8="delete from orders where email='"+email2+"'";
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sms","root","");
                Statement ps8=con.createStatement();
        

                 ps8.executeUpdate(q8);
               //  out.println("Order deleted successfully");
          
            }catch(Exception e)
            {
                out.println(e);
            }
                %>
                
                 
                     <br>
                     <br>
                     
                      <br>
                     <br>
                     <br>
                     <a href="admin_welcome.jsp">Go back to main page</a>
                       <br>
                     <br>
                     <br>
                     
                      <br>
                     <br>
                     <br>
                     <a href="display_1.jsp">Display updated stock</a>   <br>
                     <br>
                     
                      <br>
                     <br>
                     <br>
                     <a href="admin_welcome.jsp">Go back to main page</a>
    </body>
</html>
