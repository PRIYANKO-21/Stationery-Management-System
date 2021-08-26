<%-- 
    Document   : login
    Created on : 31 Mar, 2017, 10:01:27 AM
    Author     : STUDENT
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADMIN AUTHENTICATION</title>
    </head>
    <body>
        <h1></h1>
        <%
            
            String email = request.getParameter("email");
            String psd = request.getParameter("psd");
           // out.println(uname);
           // out.println(pass);
            %>
            <%
             try
             {
                 Class.forName("com.mysql.jdbc.Driver");
                 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sms","root","");
                 PreparedStatement ps = con.prepareStatement("select * from admin where email=? and psd=?");
                 ps.setString(1,email);
                 ps.setString(2,psd);
                 ResultSet rs = ps.executeQuery();
                 if(rs.next())
                 {
                      session.setAttribute("email",email);
                      session=request.getSession(true);
                    // response.sendRedirect("positive.jsp");
                    response.sendRedirect("admin_welcome.jsp");
                    // session=getSession();
                    
                 }
                 else
                 {
                     response.sendRedirect("negative.html");
                 }
             }
             catch(SQLException e)
             {
                 System.out.println(e);
             }
             
             
            
            %>
            
    </body>
</html>
