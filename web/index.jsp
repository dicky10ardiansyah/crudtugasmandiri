<%-- 
    Document   : index
    Created on : Jul 2, 2021, 6:51:58 AM
    Author     : ayaka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<% 
 
    if(request.getParameter("submit")!=null)
    {
        String nama = request.getParameter("nama");
        String buku = request.getParameter("buku");
        String denda = request.getParameter("denda");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/schooll","root","");
        pst = con.prepareStatement("insert into perpustakaan(nama,buku,denda)values(?,?,?)");
        pst.setString(1, nama);
        pst.setString(2, buku);
        pst.setString(3, denda);
        pst.executeUpdate();  
        
        %> 
    <script>   
        alert("Data berhasil ditambahkan");     
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
        <h1>Data peminjaman buku menggunakan jsp</h1>
        </br>
        <div class="row">
            <div class="col-sm-4">
                <form  method="POST" action="#" > 
                    
                    <div alight="left">
                        <label class="form-label">Nama siswa</label>
                        <input type="text" class="form-control" name="nama" id="nama" required >
                     </div>
                         
                    <div alight="left">
                        <label class="form-label">Nama buku</label>
                        <input type="text" class="form-control" name="buku" id="buku" required >
                     </div>
                         
                     <div alight="left">
                        <label class="form-label">Denda</label>
                        <input type="text" class="form-control" name="denda" id="denda" required >
                     </div>
                         </br>
                         
                     <div alight="right">
                         <input type="submit" id="submit" value="submit" name="submit" class="btn btn-primary">
                         <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                     </div>  
                         
                </form>
            </div>
            
             <div class="col-sm-8">
                 <div class="panel-body">
                     <table id="tbl-student" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                         <thead>
                             <tr>
                                    <th>Nama siswa</th>
                                    <th>Nama buku</th>
                                    <th>Denda</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                             </tr>  
                             
                             <%   
 
                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
        
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/schooll","root","");
                                
                                  String query = "select * from perpustakaan";
                                  Statement st = con.createStatement();
                                  
                                    rs =  st.executeQuery(query);
                                    
                                        while(rs.next())
                                        {
                                            String id = rs.getString("id");
                                   %>
             
                             <tr>
                                 <td><%=rs.getString("nama") %></td>
                                 <td><%=rs.getString("buku") %></td>
                                 <td><%=rs.getString("denda") %></td>
                                 <td><a class="btn btn-info" href="update.jsp?id=<%=id%>">Edit</a></td>
                                 <td><a class="btn btn-danger" href="delete.jsp?id=<%=id%>">Delete</a></td>
                             </tr> 
                             
                             
                                <%
                                 
                                 }
                               %>
                             
                     </table>    
                 </div>
 
            </div>  
        </div>
 </div>
    </body>
</html>
