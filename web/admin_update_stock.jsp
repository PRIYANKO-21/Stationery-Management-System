<%-- 
    Document   : admin_update_stock
    Created on : 25 Apr, 2017, 3:46:14 PM
    Author     : SAMSUNG
--%>
<%@page import= "java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
         
         int pen=Integer.parseInt(request.getParameter("pen"));
           // String pencil1=request.getParameter("pencil");
            int pencil=Integer.parseInt(request.getParameter("pencil"));
          //  String paper1=request.getParameter("paper");
            int paper=Integer.parseInt(request.getParameter("paper"));
          //  String notebook1=request.getParameter("notebook");
            int notebook=Integer.parseInt(request.getParameter("notebook"));
        //    String file1=request.getParameter("file");
            int file=Integer.parseInt(request.getParameter("file"));
       //      String marker1=request.getParameter("marker");
             int marker=Integer.parseInt(request.getParameter("marker"));
         //     String board1=request.getParameter("board");
              int board=Integer.parseInt(request.getParameter("board"));
              String time_stamp=new java.util.Date().toString();
             String q1="UPDATE   stock  SET  qty = qty + '"+pen+"' WHERE item_name='pen' ";
                String q2="UPDATE   stock  SET  qty = qty + '"+pencil+"' WHERE item_name='pencil' ";
                  String q3="UPDATE   stock  SET  qty = qty +'"+paper+"' WHERE item_name='paper' ";
                    String q4="UPDATE   stock  SET  qty = qty +'"+notebook+"' WHERE item_name='notebook' ";
                      String q5="UPDATE   stock  SET  qty = qty +'"+file+"' WHERE item_name='file' ";
                        String q6="UPDATE   stock  SET  qty = qty +'"+marker+"' WHERE item_name='marker' ";
                          String q7="UPDATE   stock  SET  qty = qty +'"+board+"' WHERE item_name='board' ";
              
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sms","root","");
                Statement st=con.createStatement();
               
                st.executeUpdate(q1);
                 st.executeUpdate(q2);
                   st.executeUpdate(q3);
                     st.executeUpdate(q4);
                       st.executeUpdate(q5);
                         st.executeUpdate(q6);
                           st.executeUpdate(q7);
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
                <a href="display_1.jsp">See the updated stock</a>
    </body>
</html>
