<%-- 
    Document   : TrasportRequest
    Created on : May 23, 2021, 6:44:16 PM
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
    <%
        if (request.getParameter("btn_driv") != null) {
            String upW = "update tbl_transport_shedule set driver_id='" + request.getParameter("sel_driver") + "',driver_id2='" + request.getParameter("sel2_driver") + "',transport_shedule_status='3' where transport_shedule_id='" + request.getParameter("did") + "'";
            if (con.executeCommand(upW)) {
    %> 
    <script type="text/javascript">
        alert("Vehicle Assigned Succesfully");
        setTimeout(function() {
            window.location.href = 'TransportRequest.jsp'
        }, 100);
    </script>
    <%
            } else {
                System.out.println(upW);
            }
        }

        if (request.getParameter("aid") != null) {
            String upQry = "update tbl_transport_request set transport_request_status='1' , transport_request_reply='Please Contact With us' where transport_request_id='" + request.getParameter("aid") + "'";
            if (con.executeCommand(upQry)) {
    %> 
    <script type="text/javascript">
        alert("Accepted Succesfully Assign a Vehicle");
    </script>
    <%
            }
        }
        if (request.getParameter("btn_send") != null) {
            String upQry = "update tbl_transport_request set transport_request_status='2' , transport_request_reply='Rejected <br>" + request.getParameter("txt_reply") + "' where transport_request_id='" + request.getParameter("hid") + "'";
            //out.println(upQry);
            if (con.executeCommand(upQry)) {
    %> 
    <script type="text/javascript">
        alert("Rejected Succesfully");
        setTimeout(function() {
            window.location.href = 'TransportRequest.jsp'
        }, 100);
    </script>
    <%
            }
        }
        if (request.getParameter("btn_assign") != null) {

            if (!request.getParameter("sel1_vehicle").equals("") && !request.getParameter("sel_vehicle").equals("")) {
    %> 
    <script type="text/javascript">
        alert("Select One Vehicle");
        setTimeout(function() {
            window.location.href = 'TransportRequest.jsp'
        }, 100);
    </script>
    <%
    } else if (!request.getParameter("sel1_vehicle").equals("")) {

        String insQry = "insert into tbl_transport_shedule (transport_shedule_date,transport_request_id,vehicle_id,transport_amount)"
                + "values(curdate(),'" + request.getParameter("aid") + "','" + request.getParameter("sel1_vehicle") + "','" + request.getParameter("txt_amount") + "')";
        if (con.executeCommand(insQry)) {
            String upQry = "update tbl_transport_request set transport_request_status='3' where transport_request_id='" + request.getParameter("aid") + "'";
            if (con.executeCommand(upQry)) {
    %> 
    <script type="text/javascript">
        alert("Assigned Successfully..");
        setTimeout(function() {
            window.location.href = 'TransportRequest.jsp'
        }, 100);
    </script>
    <%
            }
        }

    } else if (!request.getParameter("sel_vehicle").equals("")) {
        String insQry = "insert into tbl_transport_shedule (transport_shedule_date,transport_request_id,vehicle_id,transport_amount)"
                + "values(curdate(),'" + request.getParameter("aid") + "','" + request.getParameter("sel_vehicle") + "','" + request.getParameter("txt_amount") + "')";
        System.out.println(insQry);
        if (con.executeCommand(insQry)) {
            String upQry = "update tbl_transport_request set transport_request_status='3' where transport_request_id='" + request.getParameter("aid") + "'";
            if (con.executeCommand(upQry)) {
    %> 
    <script type="text/javascript">
        alert("Assigned Successfully..");
        setTimeout(function() {
            window.location.href = 'TransportRequest.jsp'
        }, 100);
    </script>
    <%
                    }
                }
            }
        }


    %>
    <body>
        <div id="tab" align="center">
            <form>
                <%                    if (request.getParameter("aid") != null) {
                %>

                <table border="1">
                    <tr>
                        <td>Km</td>
                        <td><input type="number" id="txt_km" onkeyup="getD(this.value)" onchange="getD(this.value)" name="txt_km"></td>
                    </tr>
                    <tr>
                        <td>Free Vehicle</td>
                        <td>
                            <input type="hidden" name="aid" value="<%=request.getParameter("aid")%>">
                            <select name="sel_vehicle" id="sel_vehicle" onchange="getData(this.value)">
                                <option value="">Select</option>
                                <%

                                    String selQry1 = "select * from tbl_vehicle where company_id='" + session.getAttribute("cid") + "'";
                                    ResultSet rs1 = con.selectCommand(selQry1);
                                    while (rs1.next()) {

                                        String subSel = "select * from tbl_transport_shedule where vehicle_id='" + rs1.getString("vehicle_id") + "' and transport_shedule_status < 5";
                                        ResultSet rd = con.selectCommand(subSel);
                                        if (!rd.next()) {
                                %>
                                <option value="<%=rs1.getString("vehicle_id")%>"><%=rs1.getString("vehicle_name")%></option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>On Going Vehicle</td>
                        <td>
                            <select name="sel1_vehicle" id="sel1_vehicle" onchange="getData(this.value)">
                                <option value="">Select</option>
                                <%
                                    String selQry12 = "select * from tbl_vehicle where company_id='" + session.getAttribute("cid") + "'";
                                    ResultSet rs12 = con.selectCommand(selQry12);
                                    while (rs12.next()) {

                                        String subSel2 = "select * from tbl_transport_shedule where vehicle_id='" + rs12.getString("vehicle_id") + "' and transport_shedule_status < 5";
                                        ResultSet rd2 = con.selectCommand(subSel2);
                                        if (rd2.next()) {
                                %>
                                <option value="<%=rs12.getString("vehicle_id")%>"><%=rs12.getString("vehicle_name")%></option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Amount</td>
                        <td><input type="text" id="txt_amount" name="txt_amount" readonly=""></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <input type="submit" value="Assign" name="btn_assign">
                        </td>
                    </tr>
                </table>
                <%                    }
                    if (request.getParameter("did") != null) {


                %>
                <table>
                    <tr>
                        <td>Driver One</td>
                        <td>
                            <input type="hidden" name="did" value="<%=request.getParameter("did")%>">
                            <select name="sel_driver" onchange="getDriver(this.value)">
                                <option value="">Select</option>
                                <<%

                                    String selQry2 = "select * from tbl_company_driver cd inner join tbl_driver d on d.driver_id=cd.driver_id where company_id='" + session.getAttribute("cid") + "'";
                                    ResultSet rs1 = con.selectCommand(selQry2);
                                    while (rs1.next()) {
                                %>
                                <option value="<%=rs1.getString("driver_id")%>"><%=rs1.getString("driver_name")%></option>
                                <%
                                    }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Driver two</td>
                        <td>
                            <select name="sel2_driver" id="sel2_driver">
                                <option value="">Select</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center"><input type="submit" value="Assign" name="btn_driv"></td>
                    </tr>
                </table>
                <%                        }


                %>
                <%               if (request.getParameter("rid") != null) {
                %>

                <table border="1">
                    <tr>
                        <td>
                            <input type="hidden" name="hid" value="<%=request.getParameter("rid")%>">
                            Reason<textarea name="txt_reply"></textarea>
                        </td>
                        <td>
                            <input type="submit" value="Send" name="btn_send">
                        </td>
                    </tr>
                </table>
                <%
                    }


                %>
                <table border="1">
                    <tr>

                        <th>sl.no</th>
                        <th>Category</th>
                        <th>Item</th>
                        <th>From</th>
                        <th>To</th>
                        <th>Pick up</th>
                        <th>Delivery</th>
                        <th>Time</th>
                        <th>User</th>
                        <th>Contact</th>
                        <th>Action</th>

                    </tr>
                    <%           String selQry = "select tr.delivery_date,tr.transport_request_for_date,tr.transport_request_id,tr.transport_request_status,u.user_contact,tr.transport_request_description as iteam,tr.transport_request_for_date as pick,tr.delivery_date as del ,tr.delivery_time as deltime,cat.category_name,u.user_name,l1.location_name as loc1,d1.district_name as dis1 ,s1.state_name as st1,l2.location_name as loc2,d2.district_name as dis2 ,s2.state_name as st2 from tbl_transport_request tr inner join tbl_location l1 on l1.location_id=tr.from_location_id inner join tbl_district d1 on d1.district_id=l1.district_id inner join tbl_state s1 on s1.state_id=d1.state_id inner join tbl_location l2 on l2.location_id=tr.to_location_id inner join tbl_district d2 on d2.district_id=l2.district_id inner join tbl_state s2 on s2.state_id=d2.state_id inner join tbl_category cat on cat.category_id=tr.category_id inner join tbl_user u on u.user_id=tr.user_id inner join tbl_company c on tr.company_id=c.company_id where tr.company_id='" + session.getAttribute("cid") + "'";
                        int i = 0;
                        System.out.println(selQry);
                        ResultSet rs = con.selectCommand(selQry);
                        while (rs.next()) {
                            i++;


                    %>
                    <tr>

                        <td><%=i%></td>
                        <td><%=rs.getString("category_name")%></td>
                        <td><%=rs.getString("iteam")%></td>
                        <td><%=rs.getString("loc1")%>,<br><%=rs.getString("dis1")%>,<br><%=rs.getString("st1")%></td>
                        <td><%=rs.getString("loc2")%>,<br><%=rs.getString("dis2")%>,<br><%=rs.getString("st2")%></td>
                        <td><%=rs.getString("pick")%></td>
                        <td><%=rs.getString("del")%></td>
                        <td><%=rs.getString("deltime")%></td>
                        <td><%=rs.getString("user_name")%></td>

                        <td><a href="tel:<%=rs.getString("user_contact")%>"><%=rs.getString("user_contact")%></a></td>
                        <td>
                            <%
                                String sel = "select * from tbl_transport_shedule where transport_request_id='" + rs.getString("transport_request_id") + "'";
                                ResultSet d = con.selectCommand(sel);
                                if (d.next()) {
                                    if (d.getString("transport_shedule_status").equals("2")) {

                            %>
                            25% Payed <a href="TransportRequest.jsp?did=<%=d.getString("transport_shedule_id")%>">Assign Driver</a>
                            <%
                            } else if (d.getString("transport_shedule_status").equals("3")) {
                            %>
                            Assigned Driver
                            <%
                            } else if (d.getString("transport_shedule_status").equals("4")) {
                            %>
                            On Going....
                            <%
                            } else if (d.getString("transport_shedule_status").equals("5")) {
                            %>
                            Delivered
                            <%
                            } else if (d.getString("transport_shedule_status").equals("6")) {
                            %>
                            Payment Completed
                            <%
                            } else if (rs.getString("transport_request_status").equals("3")) {

                            %>
                            Vehicle Assigned
                            <%                            }

                            } else if (rs.getString("transport_request_status").equals("1")) {
                            %>
                            <a href="TransportRequest.jsp?aid=<%=rs.getString("transport_request_id")%>">Assign Vehicle</a>
                            <%
                            } else if (rs.getString("transport_request_status").equals("2")) {
                            %>
                            Rejected
                            <%
                            } else if (rs.getString("transport_request_status").equals("0")) {
                            %>
                            <a href="TransportRequest.jsp?aid=<%=rs.getString("transport_request_id")%>&d2=<%=rs.getString("delivery_date")%>&d1=<%=rs.getString("transport_request_for_date")%>">Accept</a>
                            <a href="TransportRequest.jsp?rid=<%=rs.getString("transport_request_id")%>">Reject</a>
                            <%
                                }
                            %>
                        </td>

                    </tr>

                    <%
                        }


                    %>
                </table>
            </form>
        </div>
        <script src="../Assets/JQuery/jQuery.js"></script>
        <script>

                                function getDriver(id)
                                {

                                    $.ajax({
                                        type: "POST",
                                        data: {id: id},
                                        url: "../Assets/AjaxPages/AjaxDriver.jsp",
                                        success: function(result) {
                                            $("#sel2_driver").html(result);
                                        }});

                                }


                                function getData(id)
                                {

                                    var km = document.getElementById("txt_km").value;
                                    $.ajax({
                                        type: "POST",
                                        data: {id: id, km: km},
                                        url: "../Assets/AjaxPages/AjaxAmount.jsp",
                                        success: function(result) {
                                            document.getElementById("txt_amount").value = result

                                        }});
                                }

                                function getD(d)
                                {
                                    var km = d;
                                    var id1 = document.getElementById("sel_vehicle").value;
                                    var id2 = document.getElementById("sel1_vehicle").value;
                                    
                                    if (id1 === "" && id2==="")
                                    {
                                      
                                    }
                                    else if (km == "")
                                    {
                                      
                                    }
                                    else if (id1 === "")
                                    {
                                        $.ajax({
                                            type: "POST",
                                            data: {id: id2, km: km},
                                            url: "../Assets/AjaxPages/AjaxAmount.jsp",
                                            success: function(result) {
                                                document.getElementById("txt_amount").value = result

                                            }});
                                    }
                                    else if (id2 === "")
                                    {
                                        $.ajax({
                                            type: "POST",
                                            data: {id: id1, km: km},
                                            url: "../Assets/AjaxPages/AjaxAmount.jsp",
                                            success: function(result) {
                                                document.getElementById("txt_amount").value = result

                                            }});
                                    }
                                }

        </script>
        <%@include file="Foot.jsp" %>
    </body>
</html>
