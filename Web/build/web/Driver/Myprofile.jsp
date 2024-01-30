<%-- 
    Document   : Myprofile
    Created on : 13 Jan, 2024, 10:38:43 AM
    Author     : sruth
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 align="center">My Profile</h1>
        <%
        String seldriver = "select * from tbl_driver where driver_id='" + session.getAttribute("driverid") + "'";
        ResultSet r= con.selectCommand(seldriver);
        r.next();
        %>
        <form>
            <table border="1" align="center">
                <tr>
                    <td colspan="2" align="center"><img src="../Assets/Files/Driver/Driver Photo/<%=r.getString("driver_photo")%>"></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><%=r.getString("driver_name")%></td>
                </tr>
                <tr>
                    <td>Primary Contact</td>
                    <td><%=r.getString("driver_primary_contact")%></td>
                </tr>
                  <tr>
                    <td>Secondary Contact</td>
                    <td><%=r.getString("driver_secondary_contact")%></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><%=r.getString("driver_email")%></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><%=r.getString("driver_address")%></td>
                </tr>
                 <tr>
                    <td colspan="2" align="center"><a href="Editprofile.jsp">Edit Profile</a></td>
                </tr>
            </table>
        </form>
    </body>
</html>
