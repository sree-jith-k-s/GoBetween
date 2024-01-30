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

            String SelQ = "SELECT * FROM `tbl_vehicle` v INNER JOIN tbl_vehiclesubtype s on v.vehiclesubtype_id=s.vehiclesubtype_id INNER join tbl_vehicletype t on s.vehicletype_id=t.vehicletype_id where company_id='" + session.getAttribute("companyid") + "'";
            ResultSet rs = con.selectCommand(SelQ);
             if(request.getParameter("did")!=null)
        {
            String delQry="delete from tbl_vehicle where vehicle_id='"+request.getParameter("did")+"'";
            con.executeCommand(delQry);
            response.sendRedirect("Vehiclelist.jsp");
            
        }
        %>
        <h1 align="center">Vehicle List</h1>
        <form method="post">
            <table align="center" border="1">
                <tr>
                    <td>SL.No</td>
                    <td>Vehicle Name</td>
                    <td>Vehicle Registration Number</td>
                    <td>Vehicle Chase Number</td>
                    <td>Insurance Date</td>
                    <td>Insurance Expiration Date</td>
                    <td>Vehicle Type</td>
                    <td>Vehicle Subtype</td>
                    <td>Vehicle Details</td>
                    <td>Vehicle Amount</td>
                    <td>Action</td>
                </tr>
                <%                    int i = 0;
                    while (rs.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("vehicle_name")%></td>
                    <td><%=rs.getString("vehicle_reg_no")%></td>
                    <td><%=rs.getString("vehicle_chase_no")%></td>
                    <td><%=rs.getString("vehicle_insurance_date")%></td>
                    <td><%=rs.getString("vehicle_insurance_exp")%></td>
                    <td><%=rs.getString("vehicletype_name")%></td>
                    <td><%=rs.getString("vehiclesubtype_name")%></td>
                    <td><%=rs.getString("vehicle_details")%></td>
                    <td><%=rs.getString("vehicle_amount")%></td>
                    <td><a href="Vehiclelist.jsp?did=<%=rs.getString("vehicle_id")%>">Delete</a></td>
                </tr>
                <%
                    }
                %>
            </table>
        </form>
    </body>
</html>
