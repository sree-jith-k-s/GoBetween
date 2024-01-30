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
             if(request.getParameter("did")!=null)
        {
            String delQry="delete from tbl_driver_request where request_id='"+request.getParameter("did")+"'";
            con.executeCommand(delQry);
            response.sendRedirect("Myrequest.jsp");
        }
        %>
        <h1 align="center">My Request</h1>
        <form method="post">
            <table align="center" border="1">
                <tr>
                    <td>SL.No</td>
                    <td>Company Name</td>
                    <td>Request Date</td>
                    <td>Request Status</td>
                    <td>Action</td>
                </tr>
                <%  
                   String SelQ = "SELECT * FROM tbl_driver_request d INNER JOIN tbl_company c on d.company_id=c.company_id where driver_id='" + session.getAttribute("driverid") + "'";
                   ResultSet rs = con.selectCommand(SelQ);
                   
                   
                    int i = 0;
                    while (rs.next()) {
                        i++;
                        String status=rs.getString("request_status");
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("company_name")%></td>
                    <td><%=rs.getString("request_date")%></td>
                    <td>
                        <%
                        if(status.equals("0"))
                        {
                          out.print("Pending");  
                        }
                        else if(status.equals("1"))
                        {
                            out.print("Accepted");  
                        }
                        else
                        {
                             out.print("Rejected"); 
                        }
                    %></td>
                    <td><a href="Myrequest.jsp?did=<%=rs.getString("request_id")%>">Cancel Request</a></td>
                </tr>
                <%
                    }
                %>
            </table>
        </form>
    </body>
</html>
