<%-- 
    Document   : display
    Created on : 17 Mar, 2017, 10:12:28 AM
    Author     : STUDENT
--%>
<%@ page import="java.sql.*"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="background-color:#4488f3;">
    <center>  <h1>Display stock</h1>     </center>    
 
        <%!
            public class Actor
    {
    String URL="jdbc:mysql://localhost:3306/sms";
    String USERNAME="root";
    String PASSWORD="";
   Connection con=null;
    PreparedStatement selectActors = null;
    ResultSet resultSet = null;
 
    String q="select * from stock ";

    public Actor()
    {

    try
    {
        con = DriverManager.getConnection(URL,USERNAME,PASSWORD);
        selectActors = con.prepareStatement(q);
       
    }
        catch(SQLException e)
    {
        e.printStackTrace();
    }
   }
public ResultSet getActors()
{
    try
    {
        resultSet = selectActors.executeQuery();
    } catch(SQLException e)
    {
     e.printStackTrace();
    }
return resultSet;
}
}
%>
<%
Actor actor=new Actor();
ResultSet actors=actor.getActors();
    %>
    <center>
<table border="1">
                <tbody>
                    <tr>
                        <td>Item Id</td>
                        <td>Item name</td>
                        <td>Quantity</td>
                        <td>Price /unit</td>
                    </tr>
                    <% while (actors.next()) {%>
                    <tr>
                        <td><%= actors.getInt("item_id") %></td>
                        <td><%= actors.getString("item_name") %></td>
                        <td><%= actors.getInt("qty") %></td>
                        <td><%= actors.getFloat("ppu") %></td>
                    </tr>
                    <%}%>
                   
                </tbody>
            </table>

    </center>

    </body>
</html>
