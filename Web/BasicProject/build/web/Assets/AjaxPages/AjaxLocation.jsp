<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
   <option>Select Location</option>
<%
    String disQry1 = "select * from tbl_location where district_id='"+request.getParameter("diid")+"'";
    ResultSet rs=con.selectCommand(disQry1);
    while(rs.next()) 
    {
%> 
<option  value ="<%=rs.getString("location_id")%>"><%=rs.getString("location_name")%></option>
<%
    }
%>