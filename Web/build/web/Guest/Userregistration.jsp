<%-- 
    Document   : Userregistration
    Created on : 19 Dec, 2023, 11:53:27 AM
    Author     : sruth
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 align="center">User Registration</h1>
        <form method="post" enctype="multipart/form-data" action="../Assets/ActionPages/UserActionPage.jsp">
            <table border="1" align="center">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txtname"></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><input type="text" name="txtcontact"></td>
                </tr>
                <tr>
                    <td>DOB</td>
                    <td><input type="date" name="txtdate"></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="txtemail"></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><textarea name="txtaddress"></textarea></td>
                </tr>
                <tr>
                    <td>State</td>
                    <td><select name="stid" onchange="getDistrict(this.value)">
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
                    </td>
                </tr>
                <tr>
                    <td>District</td>
                    <td><select name="district" id="sel_district"  onchange="getLocation(this.value)">
                            <option>---Select---</option>
                        </select>
                    </td>
                </tr>
                 <tr>
                    <td>Location</td>
                    <td><select name="location" id="sel_location">
                            <option>---Select---</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Photo</td>
                    <td><input type="file" name="txtphoto"></td>
                </tr>
                <tr>
                    <td>Aadhar Number</td>
                    <td><input type="text" name="txtaadhar"></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="txtpass"></td>
                </tr>
                <tr>
                    <td>Confirm Password</td>
                    <td><input type="password" name="txtcpass"></td>
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
    </body>
</html>
