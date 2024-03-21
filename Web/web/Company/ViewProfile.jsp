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
                String selQry = "select * from tbl_company where company_id='"+session.getAttribute("cid")+"'";
                ResultSet rs = con.selectCommand(selQry);
                if(rs.next())
                {
            %>
            <tr>
                <td>Name</td>
                <td><%=rs.getString("company_name")%></td>
            </tr>
             <tr>
                <td>Contact</td>
                <td><%=rs.getString("company_contact")%></td>
            </tr>
             <tr>
                <td>Email</td>
                <td><%=rs.getString("company_email")%></td>
            </tr>
             <tr>
                <td>Address</td>
                <td><%=rs.getString("company_address")%></td>
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
