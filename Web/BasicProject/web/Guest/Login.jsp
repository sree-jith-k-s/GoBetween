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
        <title>LOGIN</title>
    </head>
    <%
    if(request.getParameter("btnsave")!=null)
        {
            String email=request.getParameter("txtemail");
            String password=request.getParameter("txtpassword");
            String seladmin="select * from tbl_admin where admin_email='"+email+"' and admin_password='"+password+"'";
            ResultSet admin=con.selectCommand(seladmin);
            String seluser="select * from tbl_user where user_email='"+email+"' and user_password='"+password+"'";
            ResultSet user=con.selectCommand(seluser);
            String selcompany="select * from tbl_company where company_email='"+email+"' and owner_password='"+password+"'";
            ResultSet company=con.selectCommand(selcompany);
            String seldriver="select * from tbl_driver where driver_email='"+email+"' and driver_password='"+password+"'";
            ResultSet driver=con.selectCommand(seldriver);
            if(admin.next())
            {
                session.setAttribute("adminid", admin.getString("admin_id"));
                session.setAttribute("adminname", admin.getString("admin_name"));
                response.sendRedirect("../Admin/Homepage.jsp");
            }
            else if(user.next())
            {
                session.setAttribute("userid", user.getString("user_id"));
                session.setAttribute("username", user.getString("user_name"));
                response.sendRedirect("../User/Homepage.jsp");
            }
            else if(company.next())
            {
                session.setAttribute("companyid", company.getString("company_id"));
                session.setAttribute("companyname", company.getString("company_name"));
                response.sendRedirect("../Company/Homepage.jsp");
            }
            else if(driver.next())
            {
                session.setAttribute("driverid", driver.getString("driver_id"));
                session.setAttribute("drivername", driver.getString("driver_name"));
                response.sendRedirect("../Driver/Homepage.jsp");
            }
            else
            {
                out.print("invalid email or password");
            }
            
        }
    %>
    
    <body>
        <h1 align="center">LOGIN</h1>
        <form method="post">
            <table align="center" border="1">
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="txtemail"></td>
                </tr>
                <tr>
                     <td>Password</td>
                    <td><input type="password" name="txtpassword"></td>
                </tr>
                 <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsave" value="LOGIN"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
