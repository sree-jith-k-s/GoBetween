<%-- 
    Document   : EnquiryForm
    Created on : Jun 14, 2021, 12:45:22 PM
    Author     : Pro-TECH
--%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="Head.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <%
        DateFormat yearf = new SimpleDateFormat("YYYY");
        DateFormat monthf = new SimpleDateFormat("MM");
        DateFormat dayf = new SimpleDateFormat("dd");

        String year = yearf.format(new Date());
        String month = monthf.format(new Date());
        String day = dayf.format(new Date());

        int yearnew = Integer.parseInt(year) - 24;

        String Date = year + "-" + month + "-" + day;


    %>

    <%        if (request.getParameter("btn_send") != null) {
            String insQry = "insert into tbl_transport_request (delivery_time,delivery_date,transport_request_date,transport_request_time,transport_request_for_date,transport_request_description,transport_request_qty,from_location_id,to_location_id,company_id,category_id,user_id)"
                    + " values('" + request.getParameter("time_delivery") + "','" + request.getParameter("date_del") + "',curdate(),curtime(),'" + request.getParameter("date_for") + "','" + request.getParameter("txt_desc") + "','" + request.getParameter("txt_qty") + "','" + request.getParameter("sel_location") + "','" + request.getParameter("sel_location1") + "','" + request.getParameter("cid") + "','" + request.getParameter("sel_cat") + "','" + session.getAttribute("uid") + "')";
            if (con.executeCommand(insQry)) {
    %> 
    <script type="text/javascript">
        alert("Request Sended Succesfully Please Wait for Response");
        setTimeout(function() {
            window.location.href = 'MyRequest.jsp'
        }, 100);
    </script>
    <%
            } else {
                out.println("<script>alert('Something Wrong Please Try Again...!!')</script>");
                System.out.println(insQry);
            }

        }
    %>
    <body>
        <div id="tab" align="center">
            <h1></h1>
            <form method="post">
                <h1>Enquiry Form</h1>
                <table border="1">
                    <tr>
                        <td>Pick up Date</td>
                        <td><input type="date" min="<%=Date%>" name="date_for"></td>
                    </tr>
                    <tr>
                        <td>Delivery Date</td>
                        <td><input type="date" min="<%=Date%>" name="date_del"></td>
                    </tr>
                    <tr>
                        <td>Delivery Time</td>
                        <td><input type="time" name="time_delivery"></td>
                    </tr>
                    <tr>
                        <td>Category</td>
                        <td>
                            <select name="sel_cat">
                                <option value="">Select</option>
                                <%
                                    String selQryz = "select * from tbl_category";
                                    ResultSet rsz = con.selectCommand(selQryz);
                                    while (rsz.next()) {
                                %>
                                <option value="<%=rsz.getString("category_id")%>"><%=rsz.getString("category_name")%></option>
                                <%
                                    }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Description</td>
                        <td><textarea name="txt_desc"></textarea></td>
                    </tr>
                    <tr>
                        <td>Qty/ton</td>
                        <td><input type="text" name="txt_qty"></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            Location
                        </td>
                    </tr>
                    <tr>
                        <td>State</td>
                        <td>
                            <select name="sel_state" onchange="getDistrict(this.value)">
                                <option value="">Select</option>
                                <%
                                    String selQry1 = "select * from tbl_state";
                                    ResultSet rs1 = con.selectCommand(selQry1);
                                    while (rs1.next()) {
                                %>
                                <option value="<%=rs1.getString("state_id")%>"><%=rs1.getString("state_name")%></option>
                                <%
                                    }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>District</td>
                        <td>
                            <select name="sel_district" id="sel_district" onchange="getPlace(this.value)">
                                <option value="">Select</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Location</td>
                        <td>
                            <select id="sel_location" name="sel_location">
                                <option>Select</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            Destination
                        </td>
                    </tr>
                    <tr>
                        <td>State</td>
                        <td>
                            <select name="sel_state1" onchange="getDistrict1(this.value)">
                                <option value="">Select</option>
                                <%
                                    String selQry11 = "select * from tbl_state";
                                    ResultSet rs11 = con.selectCommand(selQry11);
                                    while (rs11.next()) {
                                %>
                                <option value="<%=rs11.getString("state_id")%>"><%=rs11.getString("state_name")%></option>
                                <%
                                    }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>District</td>
                        <td>
                            <select name="sel_district1" id="sel_district1" onchange="getPlace1(this.value)">
                                <option value="">Select</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Location</td>
                        <td>
                            <select id="sel_location1" name="sel_location1">
                                <option>Select</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <input type="hidden" value="<%=request.getParameter("cid")%>" name="id">
                            <input type="submit" value="Send" name="btn_send">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
        <script src="../Assets/JQuery/jQuery.js"></script>
        <script>
                                function getDistrict(sid)
                                {

                                    $.ajax({
                                        type: "POST",
                                        data: {sid: sid},
                                        url: "../Assets/AjaxPages/AjaxDistrict.jsp",
                                        success: function(result) {
                                            $("#sel_district").html(result);
                                        }});
                                }
                                function getPlace(did)
                                {

                                    $.ajax({
                                        type: "POST",
                                        data: {did: did},
                                        url: "../Assets/AjaxPages/AjaxLocation.jsp",
                                        success: function(result) {
                                            $("#sel_location").html(result);
                                        }});
                                }
                                function getDistrict1(sid)
                                {

                                    $.ajax({
                                        type: "POST",
                                        data: {sid: sid},
                                        url: "../Assets/AjaxPages/AjaxDistrict.jsp",
                                        success: function(result) {
                                            $("#sel_district1").html(result);
                                        }});
                                }
                                function getPlace1(did)
                                {
                                    var id = document.getElementById("sel_location").value;

                                    $.ajax({
                                        type: "POST",
                                        data: {did: did, id: id},
                                        url: "../Assets/AjaxPages/AjaxLocation2.jsp",
                                        success: function(result) {
                                            $("#sel_location1").html(result);
                                        }});
                                }
        </script>
        <%@include file="Foot.jsp" %>
    </body>

</html>

