<%-- 
    Document   : Viewcompany
    Created on : 22 Jan, 2024, 2:13:30 PM
    Author     : sruth
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>view company</title>
    </head>
    <%


    %>
    <body align="center">
        <form method="post">
            <table align="center" border="1">
                <tr>
                    <th>State<select name="stid" onchange="getDistrict(this.value)">
                            <option>---Select---</option>
                            <%                                String selectstate = "select*from tbl_state";
                                ResultSet ra = con.selectCommand(selectstate);
                                while (ra.next()) {
                            %>
                            <option value="<%=ra.getString("state_id")%>"><%=ra.getString("state_name")%></option>
                            <%
                                }
                            %>
                        </select>
                    </th>
                    <th>District <select name="district" id="sel_district"  onchange="getLocation(this.value)">
                            <option>---Select---</option>
                        </select>
                    </th>
                    <th>Location <select name="location" id="sel_location">
                            <option>---Select---</option>
                        </select>
                    </th>
                </tr>
                <tr>
                    <td colspan="3" align="center">
                        <input type="submit" name="btnsave" value="Search">
                        <input type="reset" name="reset" value="Cancel">
                    </td>
                </tr>
            </table>
        </form>
        <%
            if (request.getParameter("btnsave") != null) {
                String location = request.getParameter("location");
                String SelQ = "SELECT * FROM  tbl_company where location_id='" + location + "'";
                ResultSet rs = con.selectCommand(SelQ);
                while (rs.next()) {
                    session.setAttribute("cid", rs.getString("company_id"));
        %>
        <form method="post">
            <table align="center" border="1">
                <tr>
                    <td colspan="2" align="center"><img src="../Assets/Files/Company/Company Logo/<%=rs.getString("company_logo")%>"></td>
                </tr>
                <tr>
                    <td ><%=rs.getString("company_name")%></td>
                </tr>
                <tr>
                    <td><%=rs.getString("company_contact")%></td>
                </tr>
                <tr>
                    <td><%=rs.getString("company_email")%></td>
                </tr>
                <tr>
                    <td><%=rs.getString("company_address")%></td>
                </tr>
                <tr>
                    <td colspan="3" align="center">
                        <a href="Requestcompany.jsp?cid=<%=rs.getString("company_id")%>">Request</a>
                    </td>
                </tr>
                <%
                        }
                    }
                %>
            </table>
        </form>
    </body>
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

                        function getLocation(diid)
                        {
                            $.ajax({
                                url: "../Assets/AjaxPages/AjaxLocation.jsp?diid=" + diid,
                                success: function(result) {
                                    $("#sel_location").html(result);

                                }
                            });
                        }
    </script>
</html>
