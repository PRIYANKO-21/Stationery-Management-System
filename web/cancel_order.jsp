<%-- 
    Document   : order_display
    Created on : 18 Apr, 2017, 3:54:41 PM
    Author     : STUDENT
--%>
<%-- 
    Document   : order
    Created on : 6 Apr, 2017, 3:49:49 PM
    Author     : STUDENT
--%>
<%@page import= "java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> </title>
    </head>
    <body style="background-color:#FF9999;">
         <%
           // String uname=new String();
          //  ResultSet rs=null;
         //   int pen_qty,pencil_qty,paper_qty,notebook_qty,file_qty;
            String email=session.getAttribute("email").toString();
    
             String q="delete from orders where email='"+email+"'";
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sms","root","");
                Statement ps=con.createStatement();
        

                 ps.executeUpdate(q);
                 out.println("Order deleted successfully");
          
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
                     <br>
                 <a href="order_form.jsp">Go back to main page</a>     
    </body>
</html>

