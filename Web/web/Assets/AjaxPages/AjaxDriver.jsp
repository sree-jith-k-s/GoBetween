<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <option value="">Select</option>
<%

    String selQry2 = "select * from tbl_company_driver cd inner join tbl_driver d on d.driver_id=cd.driver_id where company_id='" + session.getAttribute("cid") + "' and d.driver_id!='" + request.getParameter("id") + "'";
    System.out.println(selQry2);
    ResultSet rs1 = con.selectCommand(selQry2);
    while (rs1.next()) {
%>
<option value="<%=rs1.getString("driver_id")%>"><%=rs1.getString("driver_name")%></option>
<%
    }
%>
