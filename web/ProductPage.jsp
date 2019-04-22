<%-- 
    Document   : ProductPage
    Created on : 22-Apr-2019, 18:45:27
    Author     : kimwong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
        String id = request.getParameter("id");
        int productid = 0;
        String productname = "";
        String categories = "";
        double price = 0.00;
        int quantities = 0;
        String shopname = "";
        Blob blob = null;
        
        
        Connection conn = null;
        Statement stmt = null;
          
        Class.forName("com.mysql.jdbc.Driver").newInstance();  
        conn = DriverManager.getConnection("jdbc:mysql:///ast20201db?user=root&password=root");
        stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("select * from products where productid = '"+id+"'");
        if(rs.next()){
            productid = rs.getInt("productid");
            productname = rs.getString("productname");
            categories = rs.getString("categories");
            price = rs.getDouble("price");
            quantities = rs.getInt("quantity");
            shopname = rs.getString("shopname");
        }


        %>
        
        <img src="image.jsp?id=<%=id%>" width="400px"/>
        <table>
         
            <tr>
                <td>
                    Product id:<% out.println(" " + productid);%>
                </td>
            </tr>
            <tr>
                <td>
                    Product name:<% out.println(" " + productname); %>
                </td>
            </tr>
            <tr>
                <td>
                    Categories:<% out.println(" " + categories); %>
                </td>
            </tr>
            <tr>
                <td>
                    Price:<% out.println(" " + price); %>
                </td>
            </tr>
            <tr>
                <td>
                    Quantities:<% out.println(" " + quantities); %>
                </td>
            </tr>
            <tr>
                <td>
                    Shop name:<% out.println(" " + shopname); %>
                </td>
            </tr>
            
            
        </table>
    </body>
</html>
