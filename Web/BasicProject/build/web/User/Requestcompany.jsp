<%-- 
    Document   : Requestcompany
    Created on : 23 Jan, 2024, 12:37:31 PM
    Author     : sruth
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Request to company</title>
    </head>
    <body>
        <%
            if (request.getParameter("btnsave") != null) {
                String cid = request.getParameter("cid");
                String date = request.getParameter("txtdate");
                String subcat = request.getParameter("subcategory");
                String des = request.getParameter("txtdescription");
                String floc = request.getParameter("fromlocation");
                String tloc = request.getParameter("tolocation");
                String qty = request.getParameter("txtqty");
                String ddate = request.getParameter("txtddate");
                String dtime = request.getParameter("txtdtime");
                String insQry = "insert into tbl_transport_request(transport_request_for_date,transport_request_description,transport_request_qty,from_location_id,to_location_id,transport_request_date,user_id,company_id,subcategory_id,delivery_time,delivery_date)values('" + date + "','" + des + "','" + qty + "','" + floc + "','" + tloc + "',curdate(),'" + session.getAttribute("userid") + "','" + cid + "','" + subcat + "','" + dtime + "','" + ddate + "')";
                out.print(insQry);
                if (con.executeCommand(insQry))
                {
                    response.sendRedirect("Searchcompany.jsp");
                }
            }
        %>
        <h1 align="center">Request company</h1>
        <form method="post">
            <table align="center" border="1">
                <tr>
                    <td>Date</td>
                    <td><input type="date" name="txtdate"></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><textarea name="txtdescription"></textarea></td>
                </tr>
                <tr>
                    <td>From Location</td>
                    <td><select name="fromstate" onchange="getDistrict(this.value)">
                            <option>---Select---</option>
                            <%
                                String selectstate = "select*from tbl_state";
                                ResultSet ra = con.selectCommand(selectstate);
                                while (ra.next()) {
                            %>
                            <option value="<%=ra.getString("state_id")%>"><%=ra.getString("state_name")%></option>
                            <%
                                }
                            %>
                        </select>
                        <select name="fromdistrict" id="sel_district"  onchange="getLocation(this.value)">
                            <option>---Select---</option>
                        </select>
                        <select name="fromlocation" id="sel_location">
                            <option>---Select---</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>To Location</td>
                    <td><select name="tostate" onchange="getTodistrict(this.value)">
                            <option>---Select---</option>
                            <%
                                String selecttstate = "select*from tbl_state";
                                ResultSet rs = con.selectCommand(selecttstate);
                                while (rs.next()) {
                            %>
                            <option value="<%=rs.getString("state_id")%>"><%=rs.getString("state_name")%></option>
                            <%
                                }
                            %>
                        </select>
                        <select name="todistrict" id="sel_tdistrict"  onchange="getTolocation(this.value)">
                            <option>---Select---</option>
                        </select>
                        <select name="tolocation" id="sel_tlocation">
                            <option>---Select---</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Transport Quantity</td>
                    <td><input type="text" name="txtqty"></td>
                </tr>
                <tr>
                    <td>Category</td>
                    <td><select name="catid" onchange="getSubcategory(this.value)">
                            <option>---Select---</option>
                            <%
                                String selectsubcat = "select*from tbl_category";
                                ResultSet r = con.selectCommand(selectsubcat);
                                while (r.next()) {
                            %>
                            <option value="<%=r.getString("category_id")%>"><%=r.getString("category_name")%></option>
                            <%
                                }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Subcategory</td>
                    <td><select name="subcategory" id="sel_subcategory">
                            <option>---Select---</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Delivery Date</td>
                    <td><input type="date" name="txtddate"></td>
                </tr>
                <tr>
                    <td>Delivery Time</td>
                    <td><input type="time" name="txtdtime"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsave" value="Submit">
                        <input type="reset" name="reset" value="Cancel">
                    </td>
                </tr>
            </table>
        </form>
        <script src="../Assets/JQ/jQuery.js"></script>
        <script>
                        function getDistrict(sid)
                        {
                            $.ajax({
                                url: "../Assets/AjaxPages/AjaxDistrict.jsp?sid=" + sid,
                                success: function(result) {
                                    $("#sel_district").html(result);

                                }
                            });
                        }
                        function getTodistrict(sid)
                        {
                            $.ajax({
                                url: "../Assets/AjaxPages/AjaxDistrict.jsp?sid=" + sid,
                                success: function(result) {
                                    $("#sel_tdistrict").html(result);

                                }
                            });
                        }
                        function getLocation(diid)
                        {
                            $.ajax({
                                url: "../Assets/AjaxPages/AjaxLocation.jsp?diid=" + diid,
                                success: function(result) {
                                    $("#sel_location").html(result);

                                }
                            });
                        }
                        function getTolocation(diid)
                        {
                            $.ajax({
                                url: "../Assets/AjaxPages/AjaxLocation.jsp?diid=" + diid,
                                success: function(result) {
                                    $("#sel_tlocation").html(result);

                                }
                            });
                        }
                        function getSubcategory(catid)
                        {
                            $.ajax({
                                url: "../Assets/AjaxPages/AjaxSubcategory.jsp?catid=" + catid,
                                success: function(result) {
                                    $("#sel_subcategory").html(result);

                                }
                            });
                        }
        </script>
    </body>
</html>
