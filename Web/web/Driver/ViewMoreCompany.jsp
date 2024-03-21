<%-- 
    Document   : ViewMoreCompany
    Created on : May 24, 2021, 9:17:13 PM
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
    <%
        if (request.getParameter("btn_req") != null) {

            String selcQry = "select * from tbl_driver_request where driver_id='" + session.getAttribute("did") + "' and (request_status='Accepted' or request_status='Pending')";
            System.out.println(selcQry);
            ResultSet dc = con.selectCommand(selcQry);
            if (dc.next()) {

                if (dc.getString("request_status").equals("Accepted")) {
    %> 
    <script type="text/javascript">
        alert("already company staff");
    </script>
    <%
    } else if (dc.getString("request_status").equals("Pending")) {
    %> 
    <script type="text/javascript">
        alert("Wait Response For already Sended Request");
    </script>
    <%
        }
    } else if (!dc.next()) {
        String insQry = "insert into tbl_driver_request (request_date,company_id,driver_id)"
                + " values(curdate(),'" + request.getParameter("hid") + "','" + session.getAttribute("did") + "')";
        if (con.executeCommand(insQry)) {
    %> 
    <script type="text/javascript">
        alert("Request Sended Successfully..");
        setTimeout(function() {
            window.location.href = 'index.jsp'
        }, 100);
    </script>
    <%
                }

            }

        }

    %>
    <body>
        <div id="tab" align="center">
            <h1></h1>
            <form method="post">
                <%                    String selQry = "select * from tbl_company c inner join tbl_location l on l.location_id=c.location_id inner join tbl_district d on d.district_id=l.district_id inner join tbl_state s on s.state_id=d.state_id where company_id='" + request.getParameter("comid") + "'";
                    ResultSet rs = con.selectCommand(selQry);
                    if (rs.next()) {
                %>
                <table border="1">
                    <tr>
                        <td colspan="2" align="center">
                            <img src="../Assets/Files/CompanyLogo/<%=rs.getString("company_logo")%>" width="120" height="120">
                        </td>
                    </tr>
                    <tr>
                        <td>Name</td>
                        <td><%=rs.getString("company_name")%></td>
                    </tr>
                    <tr>
                        <td>Contact</td>
                        <td><%=rs.getString("company_contact")%></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><%=rs.getString("company_email")%></td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td><textarea readonly=""><%=rs.getString("company_address")%></textarea></td>
                    </tr>
                    <tr>
                        <td>State</td>
                        <td><%=rs.getString("state_name")%></td>
                    </tr>
                    <tr>
                        <td>District</td>
                        <td><%=rs.getString("district_name")%></td>
                    </tr>
                    <tr>
                        <td>Location</td>
                        <td><%=rs.getString("location_name")%></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <input type="hidden" value="<%=request.getParameter("comid")%>" name="hid">
                            <input type="submit" value="Send Request" name="btn_req">
                        </td>
                    </tr>
                </table>    
                <%
                    }
                %>
            </form>
        </div>

    </body>
    <%@include file="Foot.jsp" %>
</html>
