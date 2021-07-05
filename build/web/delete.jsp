<%-- 
    Document   : delete
    Created on : Jul 5, 2021, 11:16:10 AM
    Author     : ayaka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
 
 
<% 
        String id = request.getParameter("id");
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/schooll","root","");
        pst = con.prepareStatement("delete from perpustakaan where id = ?");
        pst.setString(1, id);
        pst.executeUpdate();  
        
        %>
        
        <html>
            <head>
                <title>tugas mandiri</title>
                <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
            </head>
            <body>
                <script>
            
                    alert("Data berhasil dihapus");

               </script>


                <div class="container">
                    <div class="alert alert-light" role="alert">
                     Silahkan kembali kehalaman <a href="index.jsp" class="alert-link">utama</a>.
                   </div>
                </div>
            </body>
        </html>
        