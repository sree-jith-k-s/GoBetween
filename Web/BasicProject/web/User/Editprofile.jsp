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
            String seluser = "select * from tbl_user where user_id='" + session.getAttribute("userid") + "'";
            ResultSet r = con.selectCommand(seluser);
            r.next();
            if (request.getParameter("btnsave") != null) {
                String name = request.getParameter("txtname");
                String contact = request.getParameter("txtcontact");
                String email = request.getParameter("txtemail");
                String Address = request.getParameter("txtaddress");
                String Up = "update tbl_user set user_name='" + name + "',user_contact='" + contact + "',user_email='" + email + "',user_address='" + Address + "' where user_id='" + session.getAttribute("userid") + "'";
                con.executeCommand(Up);
                response.sendRedirect("Myprofile.jsp");
            }
        %>
        <form>
            <table border="1" align="center">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txtname" value="<%=r.getString("user_name")%>"></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><input type="text" name="txtcontact" value="<%=r.getString("user_contact")%>"></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="text" name="txtemail" value="<%=r.getString("user_email")%>"></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><textarea name="txtaddress"><%=r.getString("user_address")%></textarea></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsave" value="UPDATE">
                        <input type="reset" name="btncancel" value="CANCEL"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
