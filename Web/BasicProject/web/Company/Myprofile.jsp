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
        String seluser = "select * from tbl_company where company_id='" + session.getAttribute("companyid") + "'";
        ResultSet r= con.selectCommand(seluser);
        r.next();
        %>
        <form>
            <table border="1" align="center">
                <tr>
                    <td colspan="2" align="center"><img src="../Assets/Files/Company/Company Logo/<%=r.getString("company_logo")%>"></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><%=r.getString("company_name")%></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><%=r.getString("company_contact")%></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><%=r.getString("company_email")%></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><%=r.getString("company_address")%></td>
                </tr>
                 <tr>
                    <td colspan="2" align="center"><a href="Editprofile.jsp">Edit Profile</a>
                    <a href="Changepassword.jsp">Change Password</a></td>
                </tr>
            </table>
        </form>
    </body>
</html>
