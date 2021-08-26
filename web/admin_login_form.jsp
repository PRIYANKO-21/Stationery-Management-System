<%-- 
    Document   : login_form
    Created on : 31 Mar, 2017, 10:33:25 AM
    Author     : STUDENT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login page</title>
    </head>
    <body style="background-color:#4488f3;">
        <% 
            session=request.getSession(false);
            session.invalidate();
        %> <center>
                <br>
                <br><br>
                <br>
        <form method="post" action="admin_login.jsp">
        <table>
            <tr>
                <td>EMAIL ID:</td>
                <td> <input type="text" name="email"></td>
            </tr>
             <tr>
                <td>PASSWORD:</td>
                <td> <input type="password" name="psd"></td>
            </tr>
        </table><br>
                <br><br>
                <br>
        <input type="submit" name="submit">
    </form><br>
                <br><br>
                <br>
         <a href="index.jsp">Home</a>
    </body>
</html>
