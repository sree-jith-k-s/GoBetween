<%-- 
    Document   : NewVehicleRegistraion
    Created on : May 23, 2021, 6:37:17 PM
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
        <title>Go-Between</title>
    </head>
    <%
        if (request.getParameter("btn_submit") != null) {
            
            String name = request.getParameter("txt_name");
            String chase = request.getParameter("txt_chase");
            String reg = request.getParameter("txt_reg");
            String date = request.getParameter("date_ins");
            String exp = request.getParameter("date_exp");
            String type = request.getParameter("sel_sub");
            String id = session.getAttribute("cid").toString();
            String details = request.getParameter("txt_deta");
            String amount = request.getParameter("txt_amount");

            String insQry = "	insert into tbl_vehicle (vehicle_name,vehicle_chase_no,vehicle_reg_no,vehicle_insurance_date,vehicle_insurance_exp,vehiclesubtype_id,company_id,vehicle_detailes,vehicle_amount)"
                    + "values('" + name + "','" + chase + "','" + reg + "','" + date + "','" + exp + "','" + type + "','" + id + "','" + details + "','" + amount + "')";
            con.executeCommand(insQry);
            response.sendRedirect("VehicleList.jsp");
        }


    %>
    <body>
        <div id="tab" align="center">

            <form method="post"> 
                <table border="1">
                    <tr>
                        <td>Name</td>
                        <td><input type="text" name="txt_name"></td>
                    </tr>
                    <tr>
                        <td>Chases No</td>
                        <td><input type="text" name="txt_chase"></td>
                    </tr>
                    <tr>
                        <td>Registration no</td>
                        <td><input type="text" name="txt_reg"></td>
                    </tr>
                    <tr>
                        <td>Insurance Date</td>
                        <td><input type="date" name="date_ins"></td>
                    </tr>
                    <tr>
                        <td>Insurance Expire</td>
                        <td><input type="date" name="date_exp"></td>
                    </tr>
                    <tr>
                        <td>Type</td>
                        <td>
                            <select id="sel_type" name="sel_type" onchange="getSub(this.value)">
                                <option value="">Select</option>
                                <%                                    String selQry = "select * from tbl_vehicletype";
                                    ResultSet rs = con.selectCommand(selQry);
                                    while (rs.next()) {
                                %>
                                <option value="<%=rs.getString("vehicletype_id")%>"><%=rs.getString("vehicletype_name")%></option>
                                <%
                                    }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Sub Type</td>
                        <td>
                            <select name="sel_sub" id="sel_sub" >
                                <option value="">Select</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Details</td>
                        <td><input type="text" name="txt_deta"></td>
                    </tr>
                     <tr>
                        <td>amount</td>
                        <td><input type="text" name="txt_amount"></td>
                    </tr>
                </table>
                <input type="submit" name="btn_submit" value="Submit">
            </form>
        </div>
                            <%@include file="Foot.jsp" %>
        <script src="../Assets/JQuery/jQuery.js"></script>
        <script>
                                function getSub(tid)
                                {

                                    $.ajax({
                                        type: "POST",
                                        data: {tid : tid},
                                        url: "../Assets/AjaxPages/AjaxVehicleSubType.jsp",
                                        success: function(result) {
                                            $("#sel_sub").html(result);
                                        }});
                                }
                                
        </script>
    </body>