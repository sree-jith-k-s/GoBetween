<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
    String selQry = "select * from tbl_vehicle where vehicle_id='" + request.getParameter("id") + "'";
    ResultSet rs = con.selectCommand(selQry);
    if (rs.next()) {

        int amount = Integer.parseInt(rs.getString("vehicle_amount"));
        int km = Integer.parseInt(request.getParameter("km"));
        
        if( km <= 100)
        {
            out.println(amount);
        }
        else if(km > 100)
        {
            int bal = km - 100;
            int add = bal * 50 ;
            int total = add + amount ;
            
            out.println(total);
        }
        
        
        
    }
%>
