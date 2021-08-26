<%-- 
    Document   : cost
    Created on : 20 Apr, 2017, 11:06:01 AM
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
    <body style="background-color:#ff550f;">
         <%
             String email1=new String();
             email1 = request.getParameter("email");
           //  session.setAttribute("email",email);
           //   String time_stamp=new String();
         //    time_stamp = request.getParameter("time_stamp");
             float total=0,pen_cost=0,pencil_cost=0,paper_cost=0,file_cost=0,notebook_cost=0,marker_cost=0,board_cost=0;
            ResultSet rs=null;
             ResultSet rs2=null;
             PreparedStatement ps=null;
             PreparedStatement ps2=null;
        //    int pen_qty,pencil_qty,paper_qty,notebook_qty,file_qty;
            
             String q="select * from orders where email=? ";
             String q2="select * from cost";
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sms","root","");
                 ps=con.prepareStatement(q);
                  ps2=con.prepareStatement(q2);
                 ps.setString(1,email1);
                 rs= ps.executeQuery();
                 rs2=ps2.executeQuery();
          
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
                        <td>Email</td>
                        <td>Times stamp</td>
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
                        <td><%=rs.getString("time_stamp") %></td>
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
                     <table border="1">
                         <tbody>
                
           <%           while (rs2.next()) { %>
                   
                       <%  pen_cost=rs2.getFloat("pen");
                           pencil_cost= rs2.getFloat("pencil");
                            paper_cost= rs2.getFloat("paper");
                             file_cost= rs2.getFloat("file");
                              notebook_cost= rs2.getFloat("notebook");
                             marker_cost= rs2.getFloat("marker");
                             board_cost= rs2.getFloat("board");
                           %>
                       
                                    
                     <% } %>
                  
                </tbody>
       </table>
                     <br>
                     <br>
                     <br>
                     
                      <br>
                     <br>
                     <br>
                     <%  rs= ps.executeQuery();
                    %>
                   <%    while (rs.next()) { %>
                  <%   total=(rs.getInt("pen_qty")*pen_cost)+(rs.getInt("pencil_qty")*pencil_cost)+(rs.getInt("paper_qty")*paper_cost)+(rs.getInt("file_qty")*file_cost)+(rs.getInt("notebook_qty")*notebook_cost)+(rs.getInt("marker_qty")*marker_cost)+(rs.getInt("board_qty")*board_cost)+total; %>
                <%   }  %>
                   <%  out.println("Total amount to be paid is:  ");
                     out.println(" " + total + " Rs "); 
                     session.setAttribute("total",total);
                     %> 
                     <form method="post" action="accept_order.jsp">
                        <% 
                                    session.setAttribute("email1",email1);
                            %>
                           <input type="submit"  value="accept order">
                     </form>
                 <br>
                     <br>
                     <br>
                    
                 <br>
                 <a href="reject_order.jsp">Reject order</a>
                  <br>
                     <br>
                     <br>
                    
                 <br>
                     <br>
                     <br>
                     
                      <br>
                     <br>
                     <br>
                     <a href="admin_welcome.jsp">Go back to main page</a>
       
    </body>
</html>
