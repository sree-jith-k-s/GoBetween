<%-- 
    Document   : AssignedTrip
    Created on : May 23, 2021, 6:43:22 PM
    Author     : Pro-TECH
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="Head.jsp" %>
    </head>
    <%
        if (request.getParameter("sid") != null) {
            String upQry = "update tbl_transport_shedule set transport_shedule_status='4' where transport_shedule_id='" + request.getParameter("sid") + "'";
            if (con.executeCommand(upQry)) {
    %> 
    <script type="text/javascript">
        alert("Started Successfully,Stay Online,When Delivered Click The Delivered Button");
        setTimeout(function() {
            window.location.href = 'AssignedTrip.jsp'
        }, 10);
    </script>
    <%
            }
        }
        if (request.getParameter("did") != null) {
            String upQry = "update tbl_transport_shedule set transport_shedule_status='5' where transport_shedule_id='" + request.getParameter("did") + "'";
            if (con.executeCommand(upQry)) {
    %> 
    <script type="text/javascript">
        alert("Delivered Successfully");
        setTimeout(function() {
            window.location.href = 'AssignedTrip.jsp'
        }, 10);
    </script>
    <%
            }
        }

    %>
    <body>
        <form>
            <div id="tab" align="center">
                <table border="1">
                    <tr>
                        <th>sl.no</th>
                        <th>Start Date</th>
                        <th>Location from</th>
                        <th>Location to</th>
                        <th>Vehicle</th>
                        <th>Type</th>
                        <th>Sub Type</th>
                        <th>Customer Name</th>
                        <th>Contact</th>
                        <th>Details</th>
                        <th>Action</th>
                    </tr>
                    <%                       int i = 0;
                        String selQry = "select * from tbl_transport_shedule ts inner join tbl_transport_request tr on ts.transport_request_id=tr.transport_request_id inner join tbl_vehicle v on v.vehicle_id=ts.vehicle_id inner join tbl_vehiclesubtype vst on vst.vehiclesubtype_id=v.vehiclesubtype_id join tbl_vehicletype vt on vt.vehicletype_id=vst.vehicletype_id inner join tbl_user u on u.user_id=tr.user_id where (ts.driver_id='" + session.getAttribute("did") + "' or ts.driver_id2='" + session.getAttribute("did") + "')";
                        System.out.println(selQry);
                        ResultSet rs = con.selectCommand(selQry);
                        while (rs.next()) {
                            i++;
                    %>
                    <tr>
                        <td><%=i%></td>
                        <td><%=rs.getString("transport_request_for_date")%></td>
                        <td>
                            <%
                                String qry = "select * from tbl_location l inner join tbl_district d on d.district_id=l.district_id inner join tbl_state s on d.state_id=s.state_id where location_id= '" + rs.getString("from_location_id") + "'";
                                ResultSet q = con.selectCommand(qry);
                                if (q.next()) {
                                    out.println(q.getString("location_name") + "," + q.getString("district_name") + "," + q.getString("state_name"));
                                }
                            %>
                        </td>
                        <td>
                            <%
                                String qry1 = "select * from tbl_location l inner join tbl_district d on d.district_id=l.district_id inner join tbl_state s on d.state_id=s.state_id where location_id= '" + rs.getString("to_location_id") + "'";
                                ResultSet q1 = con.selectCommand(qry1);
                                if (q1.next()) {
                                    out.println(q1.getString("location_name") + "," + q1.getString("district_name") + "," + q1.getString("state_name"));
                                }
                            %>
                        </td>
                        <td><%=rs.getString("vehicle_name")%></td>
                        <td><%=rs.getString("vehicletype_name")%></td>
                        <td><%=rs.getString("vehiclesubtype_name")%></td>
                        <td><%=rs.getString("user_name")%></td>
                        <td><%=rs.getString("user_contact")%></td>
                        <td><%=rs.getString("transport_request_description")%>
                            <input type="hidden" value="<%=rs.getString("transport_shedule_status")%>" id="status">
                            <input type="hidden" value="<%=rs.getString("transport_shedule_id")%>" id="hid">
                        </td>
                        <td>
                            <%
                                if (rs.getString("transport_shedule_status").equals("3")) {
                            %>
                            <a href="AssignedTrip.jsp?sid=<%=rs.getString("transport_shedule_id")%>">Start</a>
                            <%
                            } else if (rs.getString("transport_shedule_status").equals("4")) {
                            %>
                            <a href="AssignedTrip.jsp?did=<%=rs.getString("transport_shedule_id")%>">Delivered ?</a>
                            <%
                                } else  {
                                    out.println("Delivered..");
                                }

                            %>
                        </td>
                    </tr>
                    <%                        }
                    %>
                </table>
            </div>
        </form>
        <script src="../Assets/JQuery/jQuery.js"></script>
        <script>
        $(document).ready(function() {

            var Longitude, Latitude, Coords;
            var id = document.getElementById("hid");
            var status = document.getElementById("status").value;


            if ((status.trim()) === "4")
            {
                setInterval(function() {
                    var Longitude, Latitude;
                    var id = 1;
                    function showPosition(position) {


                        Latitude = position.coords.latitude;
                        Longitude = position.coords.longitude;

                        console.clear();

                        console.log("Latitude = " + Latitude);
                        console.log("Longitude = " + Longitude);

                        $.ajax({
                            type: "POST",
                            data: {id: id,
                                longitude: Longitude,
                                latitude: Latitude},
                            url: "../Assets/AjaxPages/AjaxUpdate.jsp?id=" + id + "&longitude=" + Longitude + "&latitude=" + Latitude,
                            success: function() {
                            }});

                    }
                    ;
                    function getLocation() {
                        if (navigator.geolocation) {
                            navigator.geolocation.getCurrentPosition(showPosition);
                        } else {
                            alert("Geolocation is not supported by this browser.");
                        }
                    }
                    getLocation();


                }, 5000);
            }


        });

        </script>
        <%@include file="Foot.jsp" %>
    </body>
</html>
