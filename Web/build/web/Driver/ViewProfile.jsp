<%-- 
    Document   : ViewProfile
    Created on : May 23, 2021, 6:35:18 PM
    Author     : Pro-TECH
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="Head.jsp" %>
    </head>
    <body>
        <div id="tab" align="center">
        <h1>Profile</h1>
        <table border="1">
            <%
                String selQry = "select * from tbl_driver where driver_id='"+session.getAttribute("did")+"'";
                ResultSet rs = con.selectCommand(selQry);
                if(rs.next())
                {
            %>
            <tr>
                <td>Name</td>
                <td><%=rs.getString("driver_name")%></td>
            </tr>
             <tr>
                <td>Primary Contact</td>
                <td><%=rs.getString("driver_primary_contact")%></td>
            </tr>
            <tr>
                <td>Secondary Contact</td>
                <td><%=rs.getString("driver_secondary_contact")%></td>
            </tr>
             <tr>
                <td>Email</td>
                <td><%=rs.getString("driver_email")%></td>
            </tr>
             <tr>
                <td>Address</td>
                <td><%=rs.getString("driver_address")%></td>
            </tr>
            <tr>
                <td><a href="EditProfile.jsp">Edit Profile</a></td>
                <td><a href="ChangePassword.jsp">Change Password</a></td>
            </tr>
            <%
                }
            %>
        </table>
        </div>
        <%@include file="Foot.jsp" %>
    </body>
</html>
