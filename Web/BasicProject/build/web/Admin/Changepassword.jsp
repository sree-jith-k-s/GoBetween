<%-- 
    Document   : Login
    Created on : 13 Jan, 2024, 10:26:34 AM
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
    <%
        if (request.getParameter("btnsave") != null)
        {
            String cur = request.getParameter("curpass");            
            String pass = request.getParameter("newpass");
            String re = request.getParameter("repass");
            String seladmin = "select * from tbl_admin where admin_id='" + session.getAttribute("adminid") + "'";
            ResultSet admin = con.selectCommand(seladmin);
            admin.next();
            String oldpass = admin.getString("admin_password");
            if (oldpass.equals(cur)) {
                if (cur.equals(pass)) {
                    out.print("Passwords are same");
                } else {
                    if (pass.equals(re)) {
                        String Up = "update tbl_admin set admin_password='" + pass + "' where admin_id='" + session.getAttribute("adminid") + "'";
                        con.executeCommand(Up);
                        response.sendRedirect("Homepage.jsp"); 
                    } else {
                        out.print("Passwords doesn't match");
                    }
                }
            } else {
                out.print("Wrong Password");
            }
        }
    %>
    <body>
        <form method="post">
            <table align="center" border="1">
                <tr>
                    <td>Current Password</td>
                    <td><input type="password" name="curpass"></td>
                </tr>
                <tr>
                    <td>New Password</td>
                    <td><input type="password" name="newpass"></td>
                </tr>
                <tr>
                    <td>Re-Password</td>
                    <td><input type="password" name="repass"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsave" value="UPDATE">
                        <input type="reset" name="btncancel" value="CANCEL"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
