<%-- 
    Document   : image
    Created on : 22-Apr-2019, 20:01:13
    Author     : kimwong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.io.OutputStream"%>
<%
    String id = request.getParameter("id");
    Blob blob = null;
        
    Connection conn = null;
    Statement stmt = null;
          
    Class.forName("com.mysql.jdbc.Driver").newInstance();  
    conn = DriverManager.getConnection("jdbc:mysql:///projectdb?user=root&password=root");
    stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("select * from products where productid = '"+id+"'");
    if(rs.next()){ 
        blob = rs.getBlob("productimage");
        byte byteArray[] = blob.getBytes(1, (int) blob.length());
        response.setContentType("image/gif");
        OutputStream os = response.getOutputStream();
        os.write(byteArray);
        os.flush();
        os.close();
    }    


%>
