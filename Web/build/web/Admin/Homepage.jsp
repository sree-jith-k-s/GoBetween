<%-- 
    Document   : Homepage
    Created on : 13 Jan, 2024, 11:42:21 AM
    Author     : sruth
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Home page</title>
    </head>
    <body>
        <div align="center">
            <h1>Welcome <%=session.getAttribute("adminname")%></h1>
            <a href="District.jsp"><button>ADD District</button></a><br><br>
            <a href="State.jsp"><button>ADD State</button></a><br><br>
            <a href="Category.jsp"><button>ADD Category</button></a><br><br>
            <a href="Subcategory.jsp"><button>ADD Sub-Category</button></a><br><br>
            <a href="Vehicletype.jsp"><button>ADD Vehicle Type</button></a><br><br>
            <a href="Vehiclesubtype.jsp"><button>ADD Vehicle Sub-Type</button></a><br><br>
            <a href="Complaint.jsp"><button>ADD Complaint Type</button></a><br><br>
            <a href="Changepassword.jsp"><button>Change Password</button></a><br><br>
            <a href="Location.jsp"><button>ADD Location</button></a><br><br>
        </div>
    </body>
</html>
