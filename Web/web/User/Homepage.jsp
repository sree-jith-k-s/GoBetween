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
        <h1>Welcome <%=session.getAttribute("username")%></h1>
        <a href="Changepassword.jsp"><button>Change Password</button></a>
        <a href="Myprofile.jsp"><button>My profile</button></a>
         <a href="Searchcompany.jsp"><button>Search Company</button></a>
         <a href="Viewrequest.jsp"><button>My Request</button></a>
        </div>
    </body>
</html>
