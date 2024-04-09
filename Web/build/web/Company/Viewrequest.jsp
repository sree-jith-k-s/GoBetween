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
            String SelQ = "SELECT * FROM tbl_driver_request r INNER JOIN tbl_driver d on r.driver_id=d.driver_id where company_id='" + session.getAttribute("companyid") + "' and request_status='" + 0 + "'";
            ResultSet rs = con.selectCommand(SelQ);

            if (request.getParameter("aid") != null) {
                String did = request.getParameter("did");
                String insQry = "insert into tbl_company_driver(driver_id,company_id,company_driver_date)values('" + did + "','" + session.getAttribute("companyid") + "',curdate())";
                if (con.executeCommand(insQry)) {
                    String upQry = "update tbl_driver_request set request_status='" + 1 + "' where request_id='" + request.getParameter("aid") + "'";
                    con.executeCommand(upQry);
                    response.sendRedirect("Viewrequest.jsp");
                }
            }
            if (request.getParameter("rid") != null) {

                String updQry = "update tbl_driver_request set request_status='" + 2 + "' where request_id='" + request.getParameter("rid") + "'";
                con.executeCommand(updQry);
                response.sendRedirect("Viewrequest.jsp");
            }
        %>
        <h1 align="center">View Request</h1>
        <form method="post">
            <table align="center" border="1">
                <tr>
                    <th>SL.No</th>
                    <th>Driver Name</th>
                    <th>Request Date</th>
                    <th>Action</th>
                </tr>
                <%
                    int i = 0;
                    while (rs.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("driver_name")%></td>
                    <td><%=rs.getString("request_date")%></td>
                    <td><a href="Viewrequest.jsp?aid=<%=rs.getString("request_id")%>&did=<%=rs.getString("driver_id")%>">Accept</a>
                        <a href="Viewrequest.jsp?rid=<%=rs.getString("request_id")%>">Reject</a></td>
                </tr>
                <%
                    }
                %>
            </table>
        </form>
    </body>
</html>
