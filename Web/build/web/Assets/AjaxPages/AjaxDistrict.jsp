<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <option value="">Select</option>
<%
    String selQry = "select * from tbl_district where state_id='" + request.getParameter("sid") + "'";
    ResultSet rs = con.selectCommand(selQry);
    while (rs.next()) {
%>
<option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%></option>
<%
    }
%>
