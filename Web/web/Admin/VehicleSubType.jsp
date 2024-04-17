<%-- 
    Document   : VehicleSubType
    Created on : May 16, 2021, 3:15:00 PM
    Author     : Pro-TECH
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vehicle Sub Type</title>
        <%@include file="Header.jsp" %>
    </head>

    <%        String id = "", name = "", dis = "";

        if (request.getParameter("edit") != null) {

            id = request.getParameter("edit");
            name = request.getParameter("name");
            dis = request.getParameter("id");

        }

        if (request.getParameter("btn_save") != null) {

            if (request.getParameter("hid").equals("")) {
                String insQry = "insert into tbl_vehiclesubtype(vehicletype_id,vehiclesubtype_name)values('" + request.getParameter("sel_vehicletype") + "','" + request.getParameter("txt_vehiclesubtype") + "')";
                con.executeCommand(insQry);
                response.sendRedirect("VehicleSubType.jsp");
            } else {
                String upQry = "update tbl_vehiclesubtype set vehicletype_id='" + request.getParameter("sel_vehicletype") + "',vehiclesubtype_name='" + request.getParameter("txt_vehiclesubtype") + "' where vehiclesubtype_id='" + request.getParameter("hid") + "'";
                con.executeCommand(upQry);
                System.out.println(upQry);
                response.sendRedirect("VehicleSubType.jsp");
            }
        }

        if (request.getParameter("del") != null) {
            String delQry = "delete from tbl_vehiclesubtype where vehiclesubtype_id='" + request.getParameter("del") + "'";
            con.executeCommand(delQry);
            response.sendRedirect("VehicleSubType.jsp");
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
                                <div class="white_box_tittle list_header">
                                    <div class="col-lg-12">
                                        <div class="white_box mb_30">
                                            <div class="box_header ">
                                                <div class="main-title">
                                                    <h3 class="mb-0" >Table Vehicle Sub Type</h3>
                                                </div>
                                            </div>
                                            <form>
                                                <div class="form-group">
                                                    <label for="sel_vehicletype">Select Vehicle Type</label>
                                                    <select required="" class="form-control" name="sel_vehicletype" id="sel_vehicletype">
                                                        <option value="" >Select</option>
                                                        <%                                                            String disQry = "select * from tbl_vehicletype";
                                                            ResultSet rs1 = con.selectCommand(disQry);
                                                            while (rs1.next()) {
                                                        %>
                                                        <option value="<%=rs1.getString("vehicletype_id")%>" <%if (dis.equals(rs1.getString("vehicletype_id"))) {
                                                                out.println("selected");
                                                            }%>><%=rs1.getString("vehicletype_name")%></option>
                                                        <%
                                                            }

                                                        %>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txt_vehiclesubtype">Vehicle Sub Type Name</label>
                                                    <input required="" type="text" class="form-control" value="<%=name%>" id="txt_vehiclesubtype" name="txt_vehiclesubtype">
                                                    <input type="hidden" name="hid" value="<%=id%>">
                                                </div>
                                                    <div class="form-group" align="center">
                                                    <input type="submit" class="btn-dark" name="btn_save" style="width:100px; border-radius: 10px 5px " value="Save">
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                                <div class="QA_table mb_30">
                                    <!-- table-responsive -->
                                    <table class="table lms_table_active">
                                        <thead>
                                            <tr style="background-color: #74CBF9">
                                                <td align="center" scope="col">Sl.No</td>
                                                <td align="center" scope="col">Vehicle Type</td>
                                                <td align="center" scope="col">Vehicle Sub Type</td>
                                                <td align="center" scope="col">Action</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%                                                int i = 0;
                                                String selQry = "select * from tbl_vehiclesubtype p inner join tbl_vehicletype d on d.vehicletype_id=p.vehicletype_id";
                                                ResultSet rs = con.selectCommand(selQry);
                                                while (rs.next()) {

                                                    i++;

                                            %>
                                            <tr>    
                                                <td align="center"><%=i%></td>
                                                <td align="center"><%=rs.getString("vehicletype_name")%></td>
                                                <td align="center"><%=rs.getString("vehiclesubtype_name")%></td>
                                                <td align="center"> 
                                                    <a href="VehicleSubType.jsp?del=<%=rs.getString("vehiclesubtype_id")%>" class="status_btn">Delete</a> &nbsp;&nbsp;&nbsp;&nbsp; 
                                                    <a class="status_btn" href="VehicleSubType.jsp?edit=<%=rs.getString("vehiclesubtype_id")%>&name=<%=rs.getString("vehiclesubtype_name")%>&id=<%=rs.getString("vehicletype_id")%>">Edit</a>
                                                </td> 
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
