<%-- 
    Document   : ViewMoreDriver
    Created on : May 25, 2021, 3:44:41 PM
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
        if (request.getParameter("btn_acc") != null) {

            String upQry = "update tbl_driver_request set request_status = 'Accepted' where request_id='" + request.getParameter("hid") + "'";
            String insQry = "insert into tbl_company_driver (company_id,driver_id,company_driver_date) values('"+session.getAttribute("cid")+"','" + request.getParameter("did") + "',curdate())";
            if (con.executeCommand(insQry) && con.executeCommand(upQry)) {
    %> 
    <script type="text/javascript">
        alert("Accepted Successfully..");
        setTimeout(function() {
            window.location.href = 'ViewDriverRequest.jsp'
        }, 100);
    </script>
    <%
            }
        }
        if (request.getParameter("btn_rej") != null) {

            String insQry = "update tbl_driver_request set request_status = 'Rejected' where request_id='" + request.getParameter("hid") + "'";
            if (con.executeCommand(insQry)) {
    %> 
    <script type="text/javascript">
        alert("Rejected Successfully..");
        setTimeout(function() {
            window.location.href = 'ViewDriverRequest.jsp'
        }, 100);
    </script>
    <%
            }
        }

    %>
    <body>
        <div id="tab" align="center">
            <h1></h1>
            <form method="post">
                <%                    String selQry = "select * from tbl_driver c inner join tbl_location l on l.location_id=c.location_id inner join tbl_district d on d.district_id=l.district_id inner join tbl_state s on s.state_id=d.state_id where driver_id='" + request.getParameter("drid") + "'";
                    ResultSet rs = con.selectCommand(selQry);
                    if (rs.next()) {
                %>
                <table border="1">
                    <tr>
                        <td colspan="2" align="center">
                            <img src="../Assets/Files/DriverPhoto/<%=rs.getString("driver_photo")%>" width="120" height="120">
                        </td>
                    </tr>
                    <tr>
                        <td>Name</td>
                        <td><%=rs.getString("driver_name")%></td>
                    </tr>
                    <tr>
                        <td>Primary Contact</td>
                        <td><%=rs.getString("driver_primary_contact")%></td>
                    </tr>
                    <tr>
                        <td>Secondary Contact</td>
                        <td><%=rs.getString("driver_secondary_contact")%></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><%=rs.getString("driver_email")%></td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td><textarea readonly=""><%=rs.getString("driver_address")%></textarea></td>
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
                            <input type="hidden" value="<%=request.getParameter("id")%>" name="hid">
                            <input type="hidden" value="<%=request.getParameter("drid")%>" name="did">
                            <input type="submit" value="Accept" name="btn_acc">
                            <input type="submit" value="Reject" name="btn_rej">
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

