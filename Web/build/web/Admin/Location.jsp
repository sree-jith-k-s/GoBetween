<%-- 
    Document   : Location
    Created on : May 5, 2021, 2:10:22 PM
    Author     : Pro-TECH
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Location</title>
        <%@include file="Header.jsp" %>
    </head>

    <%        String id = "", name = "", dis = "", longi = "", lati = "", pincode = "";

        if (request.getParameter("edit") != null) {

            id = request.getParameter("edit");
            name = request.getParameter("name");
            dis = request.getParameter("id");
            longi = request.getParameter("longi");
            lati = request.getParameter("lati");
            pincode = request.getParameter("pincode");

        }

        if (request.getParameter("btn_save") != null) {

            if (request.getParameter("hid").equals("")) {
                String insQry = "insert into tbl_location(district_id,location_name,location_longitude,location_latitude,location_pincode)values('" + request.getParameter("sel_district") + "','" + request.getParameter("txt_location") + "','" + request.getParameter("txt_longitude") + "','" + request.getParameter("txt_latitude") + "','" + request.getParameter("txt_pincode") + "')";
                con.executeCommand(insQry);
                response.sendRedirect("Location.jsp");
            } else {
                String upQry = "update tbl_location set district_id='" + request.getParameter("sel_district") + "',location_name='" + request.getParameter("txt_location") + "',location_longitude='" + request.getParameter("txt_longitude") + "',location_latitude='" + request.getParameter("txt_latitude") + "',location_pincode='" + request.getParameter("txt_pincode") + "' where location_id='" + request.getParameter("hid") + "'";
                con.executeCommand(upQry);
                System.out.println(upQry);
                response.sendRedirect("Location.jsp");
            }
        }

        if (request.getParameter("del") != null) {
            String delQry = "delete from tbl_location where location_id='" + request.getParameter("del") + "'";
            con.executeCommand(delQry);
            response.sendRedirect("Location.jsp");
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
                                                    <h3 class="mb-0" >Table Location</h3>
                                                </div>
                                            </div>
                                            <form>
                                                <div class="form-group">
                                                    <label for="sel_district">Select District</label>
                                                    <select required="" class="form-control" name="sel_district" id="sel_district">
                                                        <option value="" >Select</option>
                                                        <%                                                            String disQry = "select * from tbl_district";
                                                            ResultSet rs1 = con.selectCommand(disQry);
                                                            while (rs1.next()) {
                                                        %>
                                                        <option value="<%=rs1.getString("district_id")%>" <%if (dis.equals(rs1.getString("district_id"))) {
                                                                out.println("selected");
                                                            }%>><%=rs1.getString("district_name")%></option>
                                                        <%
                                                            }

                                                        %>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txt_location">Location Name</label>
                                                    <input required="" type="text" class="form-control" value="<%=name%>" id="txt_location" name="txt_location">
                                                    <input type="hidden" name="hid" value="<%=id%>">
                                                </div>
                                                <div class="form-group">
                                                    <label for="txt_longitude">Location Longitude</label>
                                                    <input required="" type="text" class="form-control" value="<%=longi%>" id="txt_longitude" name="txt_longitude">
                                                </div>
                                                <div class="form-group">
                                                    <label for="txt_latitude">Location Latitude</label>
                                                    <input required="" type="text" class="form-control" value="<%=lati%>" id="txt_latitude" name="txt_latitude">
                                                </div>
                                                <div class="form-group">
                                                    <label for="txt_pincode">Location Pin code</label>
                                                    <input required="" type="text" class="form-control" value="<%=pincode%>" id="txt_pincode" name="txt_pincode">
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
                                                <td align="center" scope="col">District</td>
                                                <td align="center" scope="col">Location</td>
                                                <td align="center" scope="col">Longitude</td>
                                                <td align="center" scope="col">Latitude</td>
                                                <td align="center" scope="col">Pin code</td>
                                                <td align="center" scope="col">Action</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%                                                int i = 0;
                                                String selQry = "select * from tbl_location p inner join tbl_district d on d.district_id=p.district_id";
                                                ResultSet rs = con.selectCommand(selQry);
                                                while (rs.next()) {

                                                    i++;

                                            %>
                                            <tr>    
                                                <td align="center"><%=i%></td>
                                                <td align="center"><%=rs.getString("district_name")%></td>
                                                <td align="center"><%=rs.getString("location_name")%></td>
                                                <td align="center"><%=rs.getString("location_longitude")%></td>
                                                <td align="center"><%=rs.getString("location_latitude")%></td>
                                                <td align="center"><%=rs.getString("location_pincode")%></td>
                                                <td align="center"> 
                                                    <a href="Location.jsp?del=<%=rs.getString("location_id")%>" class="status_btn">Delete</a> &nbsp;&nbsp;&nbsp;&nbsp; 
                                                    <a class="status_btn" href="Location.jsp?edit=<%=rs.getString("location_id")%>&name=<%=rs.getString("location_name")%>&id=<%=rs.getString("district_id")%>&longi=<%=rs.getString("location_longitude")%>&lati=<%=rs.getString("location_latitude")%>&pincode=<%=rs.getString("location_pincode")%>">Edit</a>
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
