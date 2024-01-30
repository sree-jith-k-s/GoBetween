<%-- 
    Document   : Vehiclelist
    Created on : 22 Jan, 2024, 12:22:27 PM
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
        <%
            String SelQ = "SELECT * FROM tbl_company_driver c INNER JOIN tbl_driver d on c.driver_id=d.driver_id where company_id='" + session.getAttribute("companyid") + "'";
                   ResultSet rs = con.selectCommand(SelQ);
        %>
        <h1 align="center">Company Driver</h1>
        <form method="post">
            <table align="center" border="1">
                <tr>
                    <td>SL.No</td>
                    <td>Driver Name</td>
                    <td>Accepted Date</td>
                </tr>
                <%  
                    int i = 0;
                    while (rs.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("driver_name")%></td>
                    <td><%=rs.getString("company_driver_date")%></td>
                </tr>
                <%
                    }
                %>
            </table>
        </form>
    </body>
</html>
