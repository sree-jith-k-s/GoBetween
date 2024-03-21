<%-- 
    Document   : Complaint
    Created on : May 23, 2021, 6:35:59 PM
    Author     : Pro-TECH
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complaint</title>
        <%@include file="Head.jsp" %>
    </head>
    <%        if (request.getParameter("btn_send") != null) {

            String insQry = "insert into tbl_complaint(complaint_content,complainttype_id,complaint_date,company_id)"
                    + "values('" + request.getParameter("content") + "','" + request.getParameter("sel_type") + "',curdate(),'" + session.getAttribute("cid") + "')";
            out.println(insQry);
            if (con.executeCommand(insQry)) {
    %> 
    <script type="text/javascript">
        setTimeout(function() {
            window.location.href = 'Complaint.jsp'
        }, 40);//40millisecend it go to next page
    </script>
    <%
            }

        }


    %>
    <body>
        <div id="tab" align="center">
            <h1>Complaint</h1>
            <form method="post">
                <table border="1">
                    <tr>
                        <td>Complaint Type</td>
                        <td>
                            <select name="sel_type">
                                <option value="">Select</option>
                                <%                                    String disQry = "select * from tbl_complainttype";
                                    ResultSet rsx = con.selectCommand(disQry);
                                    while (rsx.next()) {
                                %>
                                <option value="<%=rsx.getString("complainttype_id")%>"><%=rsx.getString("complainttype_name")%></option>
                                <%
                                    }

                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Complaint</td>
                        <td><textarea name="content"></textarea></td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2"><input type="submit" value="Send" name="btn_send"></td>
                    </tr>
                </table>
            </form>
            <%    String a = "0", b = "0";
                String one = "select count(complaint_status) as one from tbl_complaint where company_id='" + session.getAttribute("cid") + "' and complaint_status='0'";
                ResultSet ro = con.selectCommand(one);
                if (ro.next()) {
                    a = ro.getString("one");
                }
                String two = "select count(complaint_status) as two from tbl_complaint where company_id='" + session.getAttribute("cid") + "' and complaint_status='1'";
                ResultSet rt = con.selectCommand(two);
                if (rt.next()) {
                    b = rt.getString("two");
                }

                if (!a.equals("0")) {


            %>

            <table>
                <tr>

                    <th>sl.no</th>
                    <th>Type</th>
                    <th>Complaint</th>
                    <th>Date</th>
                    <th>Reply</th>

                </tr>
                <%           String selQry = "select * from tbl_complaint c inner join tbl_complainttype ct on ct.complainttype_id=c.complainttype_id where company_id='" + session.getAttribute("cid") + "' and complaint_status='0'";
                    int i = 0;
                    ResultSet rs = con.selectCommand(selQry);
                    while (rs.next()) {
                        i++;


                %>
                <tr>

                    <td><%=i%></td>
                    <td><%=rs.getString("complainttype_name")%></td>
                    <td><%=rs.getString("complaint_content")%></td>
                    <td><%=rs.getString("complaint_date")%></td>
                    <td><%=rs.getString("complaint_reply")%></td>

                </tr>

                <%                        }
                    }

                %>

            </table>
            <%                    if (!b.equals("0")) {
            %>
            <table>
                <tr>
                    <th>Type</th>
                    <th>Complaint</th>
                    <th>Date</th>
                    <th>Reply</th>
                    <th>Reply Date</th>

                </tr>

                <%                    String selQry1 = "select * from tbl_complaint c inner join tbl_complainttype ct on ct.complainttype_id=c.complainttype_id where company_id='" + session.getAttribute("cid") + "' and complaint_status='1'";

                    ResultSet rs1 = con.selectCommand(selQry1);
                    while (rs1.next()) {


                %>




                <tr>

                    <td><%=rs1.getString("complainttype_name")%></td>
                    <td><%=rs1.getString("complaint_content")%></td>
                    <td><%=rs1.getString("complaint_date")%></td>
                    <td><%=rs1.getString("complaint_reply")%></td>
                    <td><%=rs1.getString("complaint_reply_date")%></td>


                </tr>

                <%

                        }
                    }

                %>
            </table>



        </div>
    </body>
    <%@include file="Foot.jsp" %>
</html>
