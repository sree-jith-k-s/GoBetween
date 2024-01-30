<%-- 
    Document   : Complaint
    Created on : 12 Dec, 2023, 2:35:44 PM
    Author     : sruth
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if (request.getParameter("btnsave") != null) {
                String complaint = request.getParameter("txttype");
                if (request.getParameter("hid") == "") {
                    String insQry = "insert into tbl_complaint(complaint_type)value('" + complaint + "')";
                    con.executeCommand(insQry);
                    response.sendRedirect("Complainttype.jsp");
                } else {
                    String upQry = "update tbl_complaint set complaint_type='" + complaint + "' where complaint_id='" + request.getParameter("hid") + "'";
                    con.executeCommand(upQry);
                    response.sendRedirect("Complainttype.jsp");
                }
            }
            if (request.getParameter("cid") != null) {
                String delQry = "delete from tbl_complaint where complaint_id='" + request.getParameter("cid") + "'";
                con.executeCommand(delQry);
                response.sendRedirect("Complainttype.jsp");

            }
            String comid = "", ctype = "";
            if (request.getParameter("eid") != null) {
                String SelQ = "select * from tbl_complaint where complaint_id='" + request.getParameter("eid") + "'";
                ResultSet rs1 = con.selectCommand(SelQ);
                rs1.next();
                comid = rs1.getString("complaint_id");
                ctype = rs1.getString("complaint_type");
            }
        %>
        <form method="post">
            <table>
                <tr>
                    <td>Type</td>
                    <td><input type="text" name="txttype" value="<%=ctype%>">
                        <input type="hidden" name="hid" value="<%=comid%>"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsave" value="Save">
                        <input type="reset" name="reset" value="Cancel">
                    </td>
                </tr>
            </table>
        </form>
        <form method="post">
            <table>
                <tr>
                    <th>slno</th>
                    <th>Type</th>
                    <th>Action</th>
                </tr>
                <%
                    int i = 0;
                    String selQry = "select * from tbl_complaint";
                    ResultSet r = con.selectCommand(selQry);
                    while (r.next()) {
                        i++;
                %> 
                <tr>
                    <td><%=i%></td>
                    <td><%=r.getString("complaint_type")%></td>
                    <td><a href="Complainttype.jsp?cid=<%=r.getString("complaint_id")%>">Delete</a>
                        <a href="Complainttype.jsp?eid=<%=r.getString("complaint_id")%>">Edit</a></td>
                </tr>
                <%
                    }
                %>
            </table>
        </form>
    </body>
</html>
