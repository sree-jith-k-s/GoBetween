<%-- 
    Document   : MyRequest
    Created on : May 25, 2021, 2:48:33 PM
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
    </head>

    <body>
        <div id="tab" align="center">
            <h1></h1>
            <form method="post">
              
                <table border="1">
                    <tr>
                        <th>Sl.no</th>
                        <th>Logo</th>
                        <th>Name</th>
                        <th>Contact</th>
                        <th>Email</th>
                        <th>State</th>
                        <th>District</th>
                        <th>Location</th>
                        <th>Status</th>
                    </tr>
                      <%
                          int i = 0;
                    String selQry = "select * from tbl_driver_request dr inner join tbl_company c on c.company_id=dr.company_id inner join tbl_location l on l.location_id=c.location_id inner join tbl_district d on d.district_id=l.district_id inner join tbl_state s on s.state_id=d.state_id where driver_id='" + session.getAttribute("did") + "'";
                    ResultSet rs = con.selectCommand(selQry);
                    while (rs.next()) {
                        i++;
                %>
                    <tr>
                        <td><%=i%></td>
                        <td><img src="../Assets/Files/CompanyLogo/<%=rs.getString("company_logo")%>" width="120" height="120"></td>
                        <td><%=rs.getString("company_name")%></td>
                        <td><%=rs.getString("company_contact")%></td>
                        <td><%=rs.getString("company_email")%></td>
                        <td><%=rs.getString("state_name")%></td>
                        <td><%=rs.getString("district_name")%></td>
                        <td><%=rs.getString("location_name")%></td>
                        <td><%=rs.getString("request_status")%></td>
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

