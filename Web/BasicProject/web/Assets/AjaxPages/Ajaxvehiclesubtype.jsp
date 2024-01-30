<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <option value="">Select Subtype</option> 
<%
    String disQry1 = "select * from tbl_vehiclesubtype where vehicletype_id='"+request.getParameter("vid")+"'";
    ResultSet rs=con.selectCommand(disQry1);
    while(rs.next()) 
    {
%> 
<option  value ="<%=rs.getString("vehiclesubtype_id")%>"><%=rs.getString("vehiclesubtype_name")%></option>
<%
    }
%>