<%-- 
    Document   : Myprofile
    Created on : 13 Jan, 2024, 10:38:43 AM
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
        <%
        String seldriver = "select * from tbl_driver where driver_id='" + session.getAttribute("driverid") + "'";
        ResultSet r= con.selectCommand(seldriver);
        r.next();
         if (request.getParameter("btnsave") != null) {
                String name = request.getParameter("txtname");
                String pcontact = request.getParameter("txtpcontact");
                String scontact = request.getParameter("txtscontact");
                String email = request.getParameter("txtemail");
                String Address = request.getParameter("txtaddress");
                String Up = "update tbl_driver set driver_name='" + name + "',driver_primary_contact='" + pcontact + "',driver_secondary_contact='" + scontact + "',driver_email='" + email + "',driver_address='" + Address + "' where driver_id='" + session.getAttribute("driverid") + "'";
                con.executeCommand(Up);
                response.sendRedirect("Myprofile.jsp");
            }
        %>
        <form>
            <table border="1" align="center">
               <tr>
                    <td>Name</td>
                    <td><input type="text" name="txtname" value="<%=r.getString("driver_name")%>"></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><input type="text" name="txtpcontact" value="<%=r.getString("driver_primary_contact")%>"></td>
                </tr>
                <tr>
                    <td>Secondary Contact</td>
                    <td><input type="text" name="txtscontact" value="<%=r.getString("driver_secondary_contact")%>"></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="text" name="txtemail" value="<%=r.getString("driver_email")%>"></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><textarea name="txtaddress"><%=r.getString("driver_address")%></textarea></td>
                </tr>
                 <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsave" value="UPDATE">
                    <input type="reset" name="btncancel" value="CANCEL"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
