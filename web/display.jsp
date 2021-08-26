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
    <body>
        <h1>Display stock</h1>
        <%!
            public class Actor
    {
    String URL="jdbc:mysql://localhost:3306/db";
    String USERNAME="root";
    String PASSWORD="";
    Connection con=null;
    Statement selectActors = null;
    ResultSet resultSet = null;
    String q="select item_id,item_name,qty from stock";

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
public ResultSet getActors(String item_id,String item_name,String qty)
{
    try
    {
        resultSet = selectActors.executeQuery(q);
    } catch(SQLException e)
    {
     e.printStackTrace();
    }return resultSet;
}
}
%>
<%
String id =new String();
String name=new String();
String qty=new String();
if(request.getParameter("id")!=null)
{
    id=request.getParameter("id");
}
if(request.getParameter("name")!=null)
{
    name=request.getParameter("name");
}
if(request.getParameter("qty")!=null)
{
    qty=request.getParameter("qty");
}
Actor actor=new Actor();
ResultSet actors=actor.getActors(id,name,qty);
    %>
<table border="1">
                <tbody>
                    <tr>
                        <td>Item Id</td>
                        <td>Item name</td>
                        <td>Quantity</td>
                    </tr>
                    <% while (actors.next()) {%>
                    <tr>
                        <td><%= actors.getInt("id") %></td>
                        <td><%= actors.getString("name") %></td>
                        <td><%= actors.getInt("qty") %></td>
                    </tr>
                    <%}%>
                   
                </tbody>
            </table>



    </body>
</html>
