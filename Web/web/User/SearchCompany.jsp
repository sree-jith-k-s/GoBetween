<%-- 
    Document   : SearchCompany
    Created on : May 24, 2021, 9:17:02 PM
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
            <h1>Search Company</h1>
            <form method="post">
                <table border="1">
                    <tr>
                        <td>State
                            <select id="sel_state" name="sel_state" onchange="getDistrict(this.value)">
                                <option value="">Select</option>
                                <%
                                    String selQry = "select * from tbl_state";
                                    ResultSet rs = con.selectCommand(selQry);
                                    while (rs.next()) {
                                %>
                                <option value="<%=rs.getString("state_id")%>"><%=rs.getString("state_name")%></option>
                                <%
                                    }
                                %>
                            </select>
                        </td>
                        <td>District
                            <select id="sel_district" name="sel_district" onchange="getPlace(this.value)">
                                <option value="">Select</option>
                            </select>
                        </td>
                        <td>
                            Location
                            <select id="sel_location" name="sel_location" onchange="getPlaceCompany()">
                                <option value="">Select</option>
                            </select>
                        </td>
                    </tr>
                </table>    
            </form>
            <div id="search_result">

            </div>
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
                                            getStateCompany();
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
                                            getDistrictCompany();
                                        }});
                                }

                                function getStateCompany()
                                {
                                    var sid = document.getElementById("sel_state").value;
                                    $.ajax({url: "../Assets/AjaxPages/AjaxStateCompany.jsp?sid=" + sid,
                                        success: function(result) {
                                            document.getElementById("search_result").innerHTML = result;
                                        }});

                                }
                                function getDistrictCompany()
                                {
                                    var did = document.getElementById("sel_district").value;
                                    $.ajax({url: "../Assets/AjaxPages/AjaxDistrictCompany.jsp?did=" + did,
                                        success: function(result) {
                                            document.getElementById("search_result").innerHTML = result;
                                        }});
                                }
                                function getPlaceCompany()
                                {
                                    var lid = document.getElementById("sel_location").value;
                                    $.ajax({url: "../Assets/AjaxPages/AjaxLocationCompany.jsp?lid=" + lid,
                                        success: function(result) {
                                            document.getElementById("search_result").innerHTML = result;
                                        }});
                                }
        </script>
        <%@include file="Foot.jsp" %>
    </body>

</html>
