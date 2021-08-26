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
    <body style="background-color:#4488f3;">
         <%
           // String uname=new String();
            ResultSet rs=null;
         //   int pen_qty,pencil_qty,paper_qty,notebook_qty,file_qty;
            String email=session.getAttribute("email").toString();
    
             String q="select * from orders where email='"+email+"'";
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sms","root","");
                PreparedStatement ps=con.prepareStatement(q);
        

                 rs= ps.executeQuery();
          
            }catch(Exception e)
            {
                out.println(e);
            }
                %>
               
    <center>  
        <br>
                     <br>
                     <br>
                     <br>
                     <br>
                     <br>
<table border="1">
                <tbody>
                    <tr>
                        <td>UNAME</td>
                        <td>pen_qty</td>
                        <td>pencil_qty</td>
                        <td>paper_qty</td>
                        <td>file_qty</td>
                        <td>notebook_qty</td>
                         <td>marker_qty</td>
                          <td>board_qty</td>
                    </tr>
           <%           while (rs.next()) { %>
                    <tr>
                        <td><%=rs.getString("email") %></td>
                        <td><%=rs.getInt("pen_qty") %></td>
                        <td><%=rs.getInt("pencil_qty") %></td>
                        <td><%=rs.getInt("paper_qty") %></td>
                        <td><%=rs.getInt("file_qty") %></td>
                        <td><%=rs.getInt("notebook_qty") %></td>
                        <td><%=rs.getInt("marker_qty") %></td>
                        <td><%=rs.getInt("board_qty") %></td>
                    </tr>
                    
                     <%}%>
                   
                </tbody>
       </table>
                     
                     <br>
                     <br>
                     <br>
                     <br>
                     <br>
                     <br>
                 <a href="order_form.jsp">Go back to main page</a>     
    </body>
</html>

