<%-- 
    Document   : update
    Created on : Jul 5, 2021, 10:52:34 AM
    Author     : ayaka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
 
<% 
    if(request.getParameter("submit")!=null)
    {
        String id = request.getParameter("id");
        String nama = request.getParameter("nama");
        String buku = request.getParameter("buku");
        String denda = request.getParameter("denda");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/schooll","root","");
        pst = con.prepareStatement("update perpustakaan set nama = ?,buku =?,denda= ? where id = ?");
        pst.setString(1, nama);
        pst.setString(2, buku);
        pst.setString(3, denda);
         pst.setString(4, id);
        pst.executeUpdate();  
        
        %>
        
        <script>   
            alert("data berhasil diubah");           
       </script>
    <%             
    }
 
%>
 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>tugas mandiri</title> 
        
         <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        
        
        
    </head>
    <body>
        <div class="container">
        <h1>Ubah data peminjaman buku</h1>
        
        
        <div class="row">
            <div class="col-sm-4">
                <form  method="POST" action="#" >
                    
                    <%    
                         Connection con;
                        PreparedStatement pst;
                        ResultSet rs;
        
                         Class.forName("com.mysql.jdbc.Driver");
                          con = DriverManager.getConnection("jdbc:mysql://localhost/schooll","root","");
                           
                          String id = request.getParameter("id");
                          
                        pst = con.prepareStatement("select * from perpustakaan where id = ?");
                        pst.setString(1, id);
                        rs = pst.executeQuery();
                        
                         while(rs.next())
                         {
                    
                    %>
                    <div alight="left">
                        <label class="form-label">Nama siswa</label>
                        <input type="text" class="form-control" value="<%= rs.getString("nama")%>" name="nama" id="nama" required >
                     </div>
                         
                    <div alight="left">
                        <label class="form-label">Buku yang dipinjam</label>
                        <input type="text" class="form-control" name="buku" value="<%= rs.getString("buku")%>" id="buku" required >
                     </div>
                         
                     <div alight="left">
                        <label class="form-label">Denda</label>
                        <input type="text" class="form-control" name="denda" id="denda" value="<%= rs.getString("denda")%>" required >
                     </div>
                    
                    <% }  %>
                    
                    
                    
                         </br>
                         
                     <div alight="right">
                         <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                         <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                     </div>  
                         
                         <div align="right">
                             
                             <p><a href="index.jsp" class="btn btn-success">Kembali</a></p>
                             
                             
                         </div>
  
                </form>
            </div>          
        </div>
  </div>
    </body>
</html>
