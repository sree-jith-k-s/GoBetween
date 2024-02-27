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
            String SelQ = "SELECT * FROM tbl_transport_request t INNER JOIN tbl_user u on t.user_id=u.user_id where company_id='" + session.getAttribute("companyid") + "' and transport_request_status='" + 0 + "'";
            ResultSet rs = con.selectCommand(SelQ);

            if (request.getParameter("aid") != null) {
                String upQry = "update tbl_transport_request set transport_request_status='" + 1 + "' where transport_request_id='" + request.getParameter("aid") + "'";
                con.executeCommand(upQry);
                response.sendRedirect("Userrequest.jsp");
            }

            if (request.getParameter("rid") != null) {

                String updQry = "update tbl_transport_request set transport_request_status='" + 2 + "' where transport_request_id='" + request.getParameter("rid") + "'";
                con.executeCommand(updQry);
                response.sendRedirect("Userrequest.jsp");
            }
        %>
        <h1 align="center">View Request</h1>
        <form method="post">
            <table align="center" border="1">
                <tr>
                    <th>SL.No</th>
                    <th>User Name</th>
                    <th>Request Date</th>
                    <th>Descriptione</th>
                    <th>Action</th>
                </tr>
                <%
                    int i = 0;
                    while (rs.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("user_name")%></td>
                    <td><%=rs.getString("transport_request_date")%></td>
                    <td><%=rs.getString("transport_request_description")%></td>
                    <td><a href="Userrequest.jsp?aid=<%=rs.getString("transport_request_id")%>&did=<%=rs.getString("user_id")%>">Accept</a>
                        <a href="Userrequest.jsp?rid=<%=rs.getString("transport_request_id")%>">Reject</a></td>
                </tr>
                <%
                    }
                %>
            </table>
        </form>
    </body>
</html>
