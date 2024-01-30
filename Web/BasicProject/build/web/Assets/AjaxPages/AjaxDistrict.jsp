<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
  <option>Select District</option>
<%
    String disQry1 = "select * from tbl_district where state_id='"+request.getParameter("sid")+"'";
    ResultSet rs=con.selectCommand(disQry1);
    while(rs.next()) 
    {
%> 
<option  value ="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%></option>
<%
    }
%>