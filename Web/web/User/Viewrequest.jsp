<%-- 
    Document   : Viewrequest
    Created on : 8 Feb, 2024, 6:16:16 PM
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
            String SelQ = "SELECT * FROM tbl_transport_request t INNER JOIN tbl_company c on t.company_id=c.company_id where user_id=" + session.getAttribute("userid");
                   ResultSet rs = con.selectCommand(SelQ);
          %>
         <h1 align="center">View Request</h1>
        <form method="post">
            <table align="center" border="1">
                <tr>
                    <th>SL.No</th>
                    <th>Logo</th>
                    <th>Company name</th>
                    <th>Request Date</th>
                     <th>Descriptione</th>
                    <th>Status</th>
                </tr>
                <%  
                    int i = 0;
                    while (rs.next()) {
                        i++;
                        String status=rs.getString("transport_request_status");
                %>
                <tr>
                    <td><%=i%></td>
                    <td><img src="../Assets/Files/Company/Company Logo/<%=rs.getString("company_logo")%>"></td>
                    <td><%=rs.getString("company_name")%></td>
                    <td><%=rs.getString("transport_request_date")%></td>
                    <td><%=rs.getString("transport_request_description")%></td>
                    <td> <%
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
                </tr>
                <%
                    }
                %>
            </table>
        </form>
    </body>
</html>
