<%-- 
    Document   : VehicleList
    Created on : May 25, 2021, 6:13:54 PM
    Author     : Pro-TECH
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="Head.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>

    <body>
        <div id="tab" align="center">
            <h1></h1>
            <form method="post">

                <table border="1">
                    <tr>
                        <th>Sl.no</th>
                        <th>Name</th>
                        <th>Reg No</th>
                        <th>Chases No</th>
                        <th>Ins date</th>
                        <th>Exp Date</th>
                        <th>Type</th>
                        <th>Sub Type</th>
                        <th>Details</th>
                    </tr>
                    <%
                        int i = 0;
                        String selQry = "select * from tbl_vehicle v inner join tbl_vehiclesubtype vst on vst.vehiclesubtype_id=v.vehiclesubtype_id inner join tbl_vehicletype vt on vt.vehicletype_id=vst.vehicletype_id where company_id='" + session.getAttribute("cid") + "'";
                        ResultSet rs = con.selectCommand(selQry);
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
                        <td><%=rs.getString("vehicle_detailes")%></td>

                    </tr>
                    <%
                        }
                    %>
                </table>    

            </form>
        </div>
<%@include file="Foot.jsp" %>
    </body>

</html>

