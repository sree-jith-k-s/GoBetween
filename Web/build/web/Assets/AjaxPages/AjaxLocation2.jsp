<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <option value="">Select</option>
<%
    String selQry = "select * from tbl_location where district_id='" + request.getParameter("did") + "' and location_id!='"+request.getParameter("id")+"'";
    ResultSet rs = con.selectCommand(selQry);
    while (rs.next()) {
%>
<option value="<%=rs.getString("location_id")%>"><%=rs.getString("location_name")%></option>
<%
    }
%>
