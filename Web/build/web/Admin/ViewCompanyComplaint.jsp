<%-- 
    Document   : ViewCompanyComplaint
    Created on : May 16, 2021, 3:07:31 PM
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
        <%@include file="Header.jsp" %>
    </head>

    <%        if (request.getParameter("btn_save") != null) {

            String upQry = "update tbl_complaint set complaint_reply='" + request.getParameter("txt_reply") + "', complaint_reply_date=curdate(),complaint_status='1' where complaint_id='" + request.getParameter("hid") + "'";
            System.out.println(upQry);
            con.executeCommand(upQry);
            response.sendRedirect("ViewCompanyComplaint.jsp");
        }


    %>
    <body>
        <section class="main_content dashboard_part">

            <!--/ menu  -->
            <div class="main_content_iner ">
                <div class="container-fluid p-0">
                    <div class="row justify-content-center">
                        <div class="col-12">
                            <div class="QA_section">
                                <!--Form-->
                                <%                                    if (request.getParameter("up") != null) {
                                %>

                                <div class="white_box_tittle list_header">
                                    <div class="col-lg-12">
                                        <div class="white_box mb_30">
                                            <div class="box_header ">
                                                <div class="main-title">
                                                    <h3 class="mb-0" >Send Reply</h3>
                                                </div>
                                            </div>
                                            <form>
                                                <div class="form-group">
                                                    <label for="txt_reply">Reply</label>
                                                    <input required="" type="text" class="form-control" id="txt_reply" name="txt_reply">
                                                    <input type="hidden" name="hid" value="<%=request.getParameter("up")%>">
                                                </div>
                                                <div class="form-group" align="center">
                                                    <input type="submit" class="btn-dark" style="width:100px; border-radius: 10px 5px " name="btn_save" value="Save">
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                                <%
                                    }


                                %>
                                <h1>New Complaints</h1>
                                <div class="QA_table mb_30">
                                    <!-- table-responsive -->
                                    <table class="table lms_table_active">
                                        <thead>
                                            <tr style="background-color: #74CBF9">
                                                <td align="center" scope="col">Sl.No</td>
                                                <td align="center" scope="col">Type</td>
                                                <td align="center" scope="col">Complaint</td>
                                                <td align="center" scope="col">Date</td>
                                                <td align="center" scope="col">Company</td>
                                                <td align="center" scope="col">Action</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%                                                int i = 0;
                                                String selQry = "select * from tbl_complaint c inner join tbl_complainttype ct on ct.complainttype_id=c.complainttype_id inner join tbl_company co on co.company_id=c.company_id where complaint_status='0'";
                                                ResultSet rs = con.selectCommand(selQry);
                                                while (rs.next()) {

                                                    i++;

                                            %>
                                            <tr>
                                                <td align="center"><%=i%></td>
                                                <td align="center"><%=rs.getString("complainttype_name")%></td>
                                                <td align="center"><%=rs.getString("complaint_content")%></td>
                                                <td align="center"><%=rs.getString("complaint_date")%></td>
                                                <td align="center"><%=rs.getString("company_name")%></td>
                                                <td align="center"><a href="ViewCompanyComplaint.jsp?up=<%=rs.getString("complaint_id")%>" class="status_btn">Reply</a> </td>
                                            </tr>
                                            <%                      }


                                            %>

                                        </tbody>
                                    </table>
                                </div>
                                <h1>Replied Complaints</h1>
                                <div class="QA_table mb_30">
                                    <!-- table-responsive -->
                                    <table class="table lms_table_active">
                                        <thead>
                                            <tr style="background-color: #74CBF9">
                                                <td align="center" scope="col">Sl.No</td>
                                                <td align="center" scope="col">Type</td>
                                                <td align="center" scope="col">Complaint</td>
                                                <td align="center" scope="col">Date</td>
                                                <td align="center" scope="col">Company</td>
                                                <td align="center" scope="col">Reply</td>
                                                <td align="center" scope="col">Reply Date</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%                                                int j = 0;
                                                String selQry1 = "select * from tbl_complaint c inner join tbl_complainttype ct on ct.complainttype_id=c.complainttype_id inner join tbl_company co on co.company_id=c.company_id where complaint_status='1'";
                                                ResultSet rs1 = con.selectCommand(selQry1);
                                                while (rs1.next()) {

                                                    j++;

                                            %>
                                            <tr>
                                                <td align="center"><%=j%></td>
                                                <td align="center"><%=rs1.getString("complaint_content")%></td>
                                                <td align="center"><%=rs1.getString("complainttype_name")%></td>
                                                <td align="center"><%=rs1.getString("complaint_date")%></td>
                                                <td align="center"><%=rs1.getString("company_name")%></td>
                                                <td align="center"><%=rs1.getString("complaint_reply")%></td>
                                                <td align="center"><%=rs1.getString("complaint_reply_date")%></td>
                                            </tr>
                                            <%                      }


                                            %>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </section>
    </body>
    <%@include file="Footer.jsp" %>
</html>
