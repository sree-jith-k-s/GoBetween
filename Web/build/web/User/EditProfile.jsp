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

            String upQry = "update tbl_user set "
                    + "user_name='" + request.getParameter("txt_name") + "', "
                    + "user_contact='" + request.getParameter("txt_number") + "',"
                    + "user_email='" + request.getParameter("txt_email") + "'"
                    + "where user_id='" + session.getAttribute("uid") + "'";
            con.executeCommand(upQry);
            response.sendRedirect("ViewProfile.jsp");

        }


    %>
    <body>
        <div id="tab" align="center">
            <h1>Edit Profile</h1>
            <form method="post">
                <table border="1">
                    <%               String selQry = "select * from tbl_user where user_id='"+session.getAttribute("uid")+"'";
                        ResultSet rs = con.selectCommand(selQry);
                            if (rs.next()) {
                    %>
                    
                                <tr>
                                    <td>Name</td>
                                    <td><input type="text" name="txt_name" value="<%=rs.getString("user_name")%>"></td>
                                </tr>
                                 <tr>
                                    <td>Contact</td>
                                    <td><input type="text" name="txt_number" value="<%=rs.getString("user_contact")%>"></td>
                                </tr>
                                 <tr>
                                    <td>Email</td>
                                    <td><input type="email" name="txt_email" value="<%=rs.getString("user_email")%>"></td>
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
        <%@include file="Foot.jsp" %>
    </body>
</html>
