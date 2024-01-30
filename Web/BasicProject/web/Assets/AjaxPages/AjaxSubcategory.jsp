<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
  <option>Select Subcategory</option>
<%
    String disQry1 = "select * from tbl_subcategory where category_id='"+request.getParameter("catid")+"'";
    ResultSet rs=con.selectCommand(disQry1);
    while(rs.next()) 
    {
%> 
<option  value ="<%=rs.getString("subcategory_id")%>"><%=rs.getString("subcategory_name")%></option>
<%
    }
%>