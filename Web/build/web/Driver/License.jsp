<%-- 
    Document   : License
    Created on : May 23, 2021, 6:40:37 PM
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
        <title>Go-Between</title>
    </head>
    <body>
        <div id="tab" align="center">

            <form method="post" enctype="multipart/form-data" action="../Assets/ActionPages/LicenseUploadAction.jsp"> 
                <h1>License Details</h1>
                <table border="1">
                    <tr>
                        <td>Number</td>
                        <td><input type="text" name="txt_number"></td>
                    </tr>
                     <tr>
                        <td>Front Photo</td>
                        <td><input type="file" name="file_front"></td>
                    </tr>
                    <tr>
                        <td>Back Photo</td>
                        <td><input type="file" name="file_back"></td>
                    </tr>
                    <tr>
                        <td>Class</td>
                        <td><input type="text" name="txt_class"></td>
                    </tr>
                    <tr>
                        <td>Issued Date</td>
                        <td><input type="date" name="date_issue"></td>
                    </tr>
                </table>
                <input type="submit" name="btn_submit" value="Submit">
            </form>
        </div>
         
    </body>
    <%@include file="Foot.jsp" %>
</html>
