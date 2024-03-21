<%-- 
    Document   : ViewDriverRequest
    Created on : May 23, 2021, 6:36:27 PM
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
                         <th>Date</th>
                        <th>Photo</th>
                        <th>Name</th>
                        <th>Contact</th>
                        <th>Email</th>
                        <th>State</th>
                        <th>District</th>
                        <th>Location</th>
                        <th>Action</th>
                    </tr>
                      <%
                          int i = 0;
                    String selQry = "select * from tbl_driver_request dr inner join tbl_driver c on c.driver_id=dr.driver_id inner join tbl_location l on l.location_id=c.location_id inner join tbl_district d on d.district_id=l.district_id inner join tbl_state s on s.state_id=d.state_id where company_id='" + session.getAttribute("cid") + "' and request_status='Pending'";
                    System.out.println(selQry);
                    ResultSet rs = con.selectCommand(selQry);
                    while (rs.next()) {
                        i++;
                %>
                    <tr>
                        <td><%=i%></td>
                        <td><%=rs.getString("request_date")%></td>
                        <td><img src="../Assets/Files/DriverPhoto/<%=rs.getString("driver_photo")%>" width="120" height="120"></td>
                        <td><%=rs.getString("driver_name")%></td>
                        <td><%=rs.getString("driver_primary_contact")%></td>
                        <td><%=rs.getString("driver_email")%></td>
                        <td><%=rs.getString("state_name")%></td>
                        <td><%=rs.getString("district_name")%></td>
                        <td><%=rs.getString("location_name")%></td>
                        <td><a href="ViewMoreDriver.jsp?drid=<%=rs.getString("driver_id")%>&id=<%=rs.getString("request_id")%>">View More</a></td>
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

