<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
    String id = request.getParameter("id");
    String longitude = request.getParameter("longitude");
    String latitude = request.getParameter("latitude");

    String selQry = "select * from tbl_location where location_longitude = '" + longitude + "' and location_latitude='" + latitude + "'";
    ResultSet rs = con.selectCommand(selQry);
    if (rs.next()) {
        String sel = "select * from tbl_transport_update where transport_update_location='" + rs.getString("location_id") + "' and transport_shedule_id='" + id + "'";
        ResultSet z = con.selectCommand(sel);
        if (!z.next()) {
            String insQry = "insert into tbl_transport_update (transport_update_datetime,transport_update_location,transport_shedule_id)"
                    + "values(DATE_FORMAT(sysdate(), '%M %d %Y, %h:%i %p'),'" + rs.getString("location_id") + "','" + id + "')";
            if(con.executeCommand(insQry))
            {
                out.println("Inserted");
                out.println(insQry);
            }
            else{
                out.println(insQry);
            }
           
        }
    

    } 
%>
