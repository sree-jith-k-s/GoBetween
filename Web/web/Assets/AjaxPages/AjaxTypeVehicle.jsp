<%-- 
    Document   : AjaxTypeVehicle
    Created on : May 25, 2021, 10:07:25 PM
    Author     : Pro-TECH
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table style="border-collapse: collapse; text-align: center">
            <tr>

                <%
                    int i = 0;
                    String cid = request.getParameter("cid");
                    String tid = request.getParameter("tid");
                    String selQry = "select * from tbl_vehicle v inner join tbl_vehiclesubtype vs on vs.vehiclesubtype_id=v.vehiclesubtype_id inner join tbl_vehicletype vt on vt.vehicletype_id=vs.vehicletype_id where company_id = '" + cid + "' and vt.vehicletype_id= '" + tid + "'";
                    ResultSet rs = con.selectCommand(selQry);
                    while (rs.next()) {
                        i++;
                %>
                <td style="padding: 50px">
                    <%=rs.getString("vehicle_name")%><br>
                    <%=rs.getString("vehicletype_name")%><br>
                    <%=rs.getString("vehiclesubtype_name")%><br>
                    <a href="ViewMoreVehicle.jsp?id=<%=rs.getString("vehicle_id")%>">View More</a>
                </td>
                <%
                        if (i == 3) {
                            out.println("</tr><tr>");
                            i = 0;
                        }
                    }
                %>
            </tr>
        </table>
    </body>
</html>
