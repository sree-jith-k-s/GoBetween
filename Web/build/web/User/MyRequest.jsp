<%-- 
    Document   : MyRequest
    Created on : May 26, 2021, 8:47:44 PM
    Author     : Pro-TECH
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="Head.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="tab" align="center">
            <%
                String selc = "select * from tbl_transport_request where  user_id='" + session.getAttribute("uid") + "' and transport_request_status < 3";
                System.out.println(selc);
                ResultSet rd = con.selectCommand(selc);
                if (rd.next()) {


            %>
            <table border="1">
                <tr>

                    <th>sl.no</th>
                    <th>Company</th>
                    <th>Contact</th>
                    <th>Reply</th>

                </tr>
                <%                    String selQry = "select * from tbl_transport_request tr  inner join tbl_company c on tr.company_id=c.company_id where user_id='" + session.getAttribute("uid") + "' and transport_request_status < 3";
                    //System.out.println(selQry);
                    int i = 0;
                    ResultSet rs = con.selectCommand(selQry);
                    while (rs.next()) {
                        i++;


                %>
                <tr>

                    <td><%=i%></td>
                    <td><%=rs.getString("company_name")%></td>
                    <td><a href="tel:<%=rs.getString("company_contact")%>"><%=rs.getString("company_contact")%></a></td>

                    <td>
                        <%

                            if (rs.getString("transport_request_status").equals("0")) {
                                out.println("Pending.....");
                            } else if (rs.getString("transport_request_status").equals("1")) {
                                out.println("Accepted");
                            }
                           // out.println(rs.getString("transport_request_status"));

                        %>
                    </td>

                </tr>

                <%                        }

                %>
            </table>
            <%            } 
                
                if(!rd.next()) {
            %>
            <table border="1">
                <tr>

                    <th>sl.no</th>
                    <th>Company</th>
                    <th>Contact</th>
                    <th>Vehicle</th>
                    <th>Vehicle Details</th>
                    <th>Amount</th>
                    <th>Action</th>

                </tr>
                <%                    String selQry = "select * from tbl_transport_request tr  inner join tbl_transport_shedule sh on sh.transport_request_id=tr.transport_request_id inner join tbl_vehicle v on v.vehicle_id=sh.vehicle_id inner join tbl_company c on tr.company_id=c.company_id where user_id='" + session.getAttribute("uid") + "'";
                    System.out.println(selQry);
                    int i = 0;
                    ResultSet rs = con.selectCommand(selQry);
                    while (rs.next()) {
                        i++;


                %>
                <tr>

                    <td><%=i%></td>
                    <td><%=rs.getString("company_name")%></td>
                    <td><a href="tel:<%=rs.getString("company_contact")%>"><%=rs.getString("company_contact")%></a></td>
                    <td><%=rs.getString("vehicle_name")%></td>
                    <td><%=rs.getString("vehicle_detailes")%></td>
                    <td><%=rs.getString("transport_amount")%></td>
                    <td>
                        <%
                            if (rs.getString("transport_shedule_status").equals("2")) {
                                out.println("Processing.....");
                            } else if (rs.getString("transport_shedule_status").equals("3")) {
                                out.println("Not Started Yet.....");
                            } else if (rs.getString("transport_shedule_status").equals("4")) {
                        %>
                        On The way<a href="TransportProgress.jsp?id=<%=rs.getString("transport_shedule_id")%>">Transport Progress</a>
                        <%
                        } else if (rs.getString("transport_shedule_status").equals("5")) {
                        %>
                        <a href="BalPay.jsp?amount=<%=rs.getString("transport_amount")%>&id=<%=rs.getString("transport_shedule_id")%>">Pay Balance Amount</a>
                        <%
                        } else if (rs.getString("transport_shedule_status").equals("6")) {
                            out.println("Delivered");
                        } else if (rs.getString("transport_request_status").equals("0")) {
                            out.println("Pending.........");
                        } else if (rs.getString("transport_request_status").equals("3")) {
                        %>
                        <a href="Payment.jsp?amount=<%=rs.getString("transport_amount")%>&id=<%=rs.getString("transport_shedule_id")%>">Pay Now</a>
                        <%
                            }

                        %>
                    </td>

                </tr>


                <%                        }
                %>
            </table>
            <%
                }
            %>
        </div>
        <%@include file="Foot.jsp" %>
    </body>
</html>
