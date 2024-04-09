<%-- 
    Document   : Homepage
    Created on : 13 Jan, 2024, 11:42:21 AM
    Author     : sruth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div align="center">
        <h1>Welcome <%=session.getAttribute("companyname")%></h1>
        <a href="Changepassword.jsp"><button>Change Password</button></a><br>
        <a href="Myprofile.jsp"><button>My profile</button></a><br>
        <a href="Vehicleregistration.jsp"><button>vehicle registration</button></a><br>
        <a href="Vehiclelist.jsp"><button>vehicle list</button></a><br>
        <a href="Viewrequest.jsp"><button>View Request</button></a><br>
        <a href="Companydriver.jsp"><button>Company Drivers</button></a><br>
        <a href="Userrequest.jsp"><button>User Request</button></a><br>
        </div>
    </body>
</html>
