<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<table style="border-collapse: collapse; text-align: center">
    <tr>
        <%
            int i = 0;
            String did = request.getParameter("did");
        String selQry = "select * from tbl_company c inner join tbl_location l on l.location_id=c.location_id inner join tbl_district d on d.district_id=l.district_id where d.district_id = '"+did+"' and company_status='1'";
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