<%-- 
    Document   : AddLicense
    Created on : 15 Jan, 2024, 3:58:37 PM
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
         <h1 align="center">Add License</h1>
       <form method="post" enctype="multipart/form-data" action="../Assets/ActionPages/LicenseActionPage.jsp">
            <table border="1" align="center">
               <tr>
                    <td>License Front Photo</td>
                    <td><input type="file" name="txtlfphoto"></td>
                </tr>
                <tr>
                    <td>License Back Photo</td>
                   <td><input type="file" name="txtlbphoto"></td>
                </tr>
                <tr>
                    <td>License Issued Date</td>
                    <td><input type="date" name="txtissue"></td>
                </tr>
                <tr>
                    <td>License Expiration Date</td>
                   <td><input type="date" name="txtlexp"></td>
                </tr>
                <tr>
                    <td>Badge Expiration Date</td>
                    <td><input type="date" name="txtbexp"></td>
                </tr>
                <tr>
                    <td>License Class</td>
                            <td><select name="lclass">
                        <option>---select---</option>
                        <option>A</option>
                        </select></td>
                </tr>
                <tr>
                    <td>License Number</td>
                    <td><input type="text" name="txtlnumber"></td>
                </tr>
                 <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsave" value="UPDATE">
                    <input type="reset" name="btncancel" value="CANCEL"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
