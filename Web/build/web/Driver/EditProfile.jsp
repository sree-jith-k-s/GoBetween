<%-- 
    Document   : EditProfile
    Created on : May 23, 2021, 6:35:27 PM
    Author     : Pro-TECH
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="Head.jsp" %>
    <%
        if (request.getParameter("btn_update") != null) {

            String upQry = "update tbl_driver set "
                    + "driver_name='" + request.getParameter("txt_name") + "', "
                    + "driver_primary_contact='" + request.getParameter("txt_pnumber") + "',"
                    + "driver_secondary_contact='" + request.getParameter("txt_snumber") + "',"
                    + "driver_email='" + request.getParameter("txt_email") + "'"
                    + "where driver_id='" + session.getAttribute("did") + "'";
            con.executeCommand(upQry);
            response.sendRedirect("ViewProfile.jsp");

        }


    %>
    <body>
        <div id="tab" align="center">
            <h1>Edit Profile</h1>
            <form method="post">
                <table border="1">
                    <%               String selQry = "select * from tbl_driver where driver_id='"+session.getAttribute("did")+"'";
                        ResultSet rs = con.selectCommand(selQry);
                            if (rs.next()) {
                    %>
                    
                                <tr>
                                    <td>Name</td>
                                    <td><input type="text" name="txt_name" value="<%=rs.getString("driver_name")%>"></td>
                                </tr>
                                 <tr>
                                    <td>Primary Contact</td>
                                    <td><input type="text" name="txt_pnumber" value="<%=rs.getString("driver_primary_contact")%>"></td>
                                </tr>
                                <tr>
                                    <td>Secondary Contact</td>
                                    <td><input type="text" name="txt_snumber" value="<%=rs.getString("driver_secondary_contact")%>"></td>
                                </tr>
                                 <tr>
                                    <td>Email</td>
                                    <td><input type="email" name="txt_email" value="<%=rs.getString("driver_email")%>"></td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center"><input type="submit" value="Update" name="btn_update"></td>
                                </tr>
                    <%
        }
%>
                </table>
            </form>
        </div>
        
    </body>
    <%@include file="Foot.jsp" %>
</html>
