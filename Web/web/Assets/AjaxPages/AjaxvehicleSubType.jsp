<%-- 
    Document   : AjaxVehicleSubType
    Created on : May 25, 2021, 6:19:15 PM
    Author     : Pro-TECH
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <option value="">Select</option>
<%
    String selQry = "select * from tbl_vehiclesubtype where vehicletype_id='" + request.getParameter("tid") + "'";
    ResultSet rs = con.selectCommand(selQry);
    while (rs.next()) {
%>
<option value="<%=rs.getString("vehiclesubtype_id")%>"><%=rs.getString("vehiclesubtype_name")%></option>
<%
    }
%>
