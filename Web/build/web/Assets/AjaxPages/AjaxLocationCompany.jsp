<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<table style="border-collapse: collapse; text-align: center">
    <tr>
        <%
            int i = 0;
            String lid = request.getParameter("lid");
        String selQry = "select * from tbl_company c where c.location_id = '"+lid+"' and company_status='1'";
        ResultSet rs = con.selectCommand(selQry);
        while(rs.next())
        {
            i++;
            %>
            <td style="padding: 50px">
                <img src="../Assets/Files/CompanyLogo/<%=rs.getString("company_logo")%>" height="120" width="120"><br>
                <%=rs.getString("company_name")%><br>
                <%=rs.getString("company_contact")%><br>
                <a href="ViewMoreCompany.jsp?comid=<%=rs.getString("company_id")%>">View More</a>
            </td>
            <%
            if(i == 3)
            {
                out.println("</tr><tr>");
                i=0;
            }
        }
        %>
    </tr>
</table>