<%-- 
    Document   : ViewLicence
    Created on : Jun 15, 2021, 12:47:21 PM
    Author     : PSST
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
    <body>
        <div id="tab" align="center">
        <h1>License</h1>
        <table border="1">
            <%
                String selQry = "select * from tbl_driver_license where driver_id='"+session.getAttribute("did")+"'";
                ResultSet rs = con.selectCommand(selQry);
                if(rs.next())
                {
            %>
            <tr>
                <td colspan="2" align="center"><img src="../Assets/Files/LicenseFront/<%=rs.getString("driver_license_front_photo")%>" alt="<%=rs.getString("driver_license_front_photo")%>" width="100dp" hight="100dp"></td>
            </tr>
             <tr>
                 <td colspan="2" align="center"><img src="../Assets/Files/LicenseBack/<%=rs.getString("driver_license_back_photo")%>" alt="<%=rs.getString("driver_license_back_photo")%>" width="100dp" hight="100dp"></td>
            </tr>
            <tr>
                <td>Date of Issued</td>
                <td><%=rs.getString("driver_license_date")%></td>
            </tr>
             <tr>
                <td>Exp License</td>
                <td><%=rs.getString("driver_license_exp_date")%></td>
            </tr>
             <tr>
                <td>Exp Badge</td>
                <td><%=rs.getString("driver_license_badge_exp_date")%></td>
            </tr>
            <tr>
                <td>Class</td>
                <td><%=rs.getString("driver_license_class")%></td>
            </tr>
            <tr>
                <td>Number</td>
                <td><%=rs.getString("driver_license_number")%></td>
            </tr>
            
            <tr>
                <td colspan="2" align="center"><a href="License.jsp">Update</a></td>
            </tr>
            <%
                }
            %>
        </table>
        </div>
        <%@include file="Foot.jsp" %>
    </body>
</html>
