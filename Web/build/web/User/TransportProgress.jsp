<%-- 
    Document   : TransportProgress
    Created on : May 28, 2021, 9:24:01 PM
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
        <title>JSP Page</title>
    </head>
    <body>
        <div id="tab" align="center">
            <table border="1">
                <tr>

                    <th>sl.no</th>
                    <th>Company</th>
                    <th>Vehicle</th>
                    <th>Contact</th>
                    <th>Date & time</th>
                    <th>State</th>
                    <th>District</th>
                    <th>location</th>

                </tr>
                <%           String selQry = "select * from tbl_transport_update tu inner join tbl_location l on l.location_id=tu.transport_update_location inner join tbl_district d on d.district_id=l.district_id inner join tbl_state s on d.state_id=s.state_id inner join tbl_transport_shedule tsd on tu.transport_shedule_id=tsd.transport_shedule_id inner join  tbl_transport_request tr on tr.transport_request_id=tsd.transport_request_id inner join tbl_vehicle v on tsd.vehicle_id=v.vehicle_id inner join tbl_vehiclesubtype vs on vs.vehiclesubtype_id=v.vehiclesubtype_id inner join tbl_vehicletype vt on vt.vehicletype_id=vs.vehicletype_id inner join tbl_company c on v.company_id=c.company_id where tu.transport_shedule_id='" + request.getParameter("id") + "'";
                    int i = 0;
                    System.out.println(selQry);
                    ResultSet rs = con.selectCommand(selQry);
                    while (rs.next()) {
                        i++;


                %>
                <tr>

                    <td><%=i%></td>
                    <td><%=rs.getString("company_name")%></td>
                    <td><%=rs.getString("vehicle_name")%></td>
                    <td><a href="tel:<%=rs.getString("company_contact")%>"><%=rs.getString("company_contact")%></a></td>
                    <td><%=rs.getString("transport_update_datetime")%></td>
                    <td><%=rs.getString("state_name")%></td>
                    <td><%=rs.getString("district_name")%></td>
                    <td><%=rs.getString("location_name")%></td>


                </tr>

                <%                        }


                %>
            </table>
        </div>
        <%@include file="Foot.jsp" %>
    </body>
</html>
