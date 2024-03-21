<%-- 
    Document   : index
    Created on : May 28, 2021, 7:15:38 PM
    Author     : Pro-TECH
--%>


<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <%@include file="Header.jsp" %>
    </head>

    <body>
        <section class="main_content dashboard_part">
            <!-- menu  -->

            <!--/ menu  -->
            <div class="main_content_iner ">
                <div class="container-fluid p-0">
                    <div class="row justify-content-center">
                        <div class="col-lg-12">
                            <div class="single_element">
                                <div class="quick_activity">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="quick_activity_wrap">
                                                <div class="single_quick_activity d-flex">
                                                    <div class="icon">
                                                        <img src="../Assets/Templates/admin/img/icon/College.png" alt="">
                                                    </div>
                                                    <div class="count_content">
                                                        <h3><span class="counter">
                                                                <%
                                                                    String csel = "select count(*) as c from tbl_company where company_status='1'";
                                                                    ResultSet cc = con.selectCommand(csel);
                                                                    if (cc.next()) {
                                                                        out.println(cc.getString("c"));
                                                                    }
                                                                %>
                                                            </span> </h3>
                                                        <p>Company</p>
                                                    </div>
                                                </div>
                                                <div class="single_quick_activity d-flex">
                                                    <div class="icon">
                                                        <img src="../Assets/Templates/admin/img/icon/Department.png" alt="">
                                                    </div>
                                                    <div class="count_content">
                                                        <h3><span class="counter">
                                                                <%
                                                                    String dsel = "select count(*) as c from tbl_driver where driver_status='1'";
                                                                    ResultSet dc = con.selectCommand(dsel);
                                                                    if (dc.next()) {
                                                                        out.println(dc.getString("c"));
                                                                    }
                                                                %>
                                                            </span> </h3>
                                                        <p>Drivers</p>
                                                    </div>
                                                </div>
                                                <div class="single_quick_activity d-flex">
                                                    <div class="icon">
                                                        <img src="../Assets/Templates/admin/img/icon/Student.png" alt="">
                                                    </div>
                                                    <div class="count_content">
                                                        <h3><span class="counter"> 
                                                                <%
                                                                    String ssel = "select count(*) as c from tbl_user where user_status='1'";
                                                                    ResultSet sc = con.selectCommand(ssel);
                                                                    if (sc.next()) {
                                                                        out.println(sc.getString("c"));
                                                                    }
                                                                %>
                                                            </span> </h3>
                                                        <p>Users</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-xl-12">
                            <div class="white_box card_height_100">
                                <div class="box_header border_bottom_1px  ">
                                    <div class="main-title">
                                        <h3 class="mb_25">Company</h3>
                                    </div>
                                </div>
                                <div class="staf_list_wrapper sraf_active owl-carousel">


                                    <%
                                        String cQry = "select * from tbl_company d inner join tbl_location l on l.location_id=d.location_id ORDER BY RAND()";
                                        ResultSet crs = con.selectCommand(cQry);
                                        while (crs.next()) {

                                    %>


                                    <!-- single carousel  -->
                                    <div class="single_staf">
                                        <div class="staf_thumb">
                                            <img src="../Assets/Files/CompanyLogo/<%=crs.getString("company_logo")%>" alt="">
                                        </div>
                                        <h4><%=crs.getString("company_name")%></h4>
                                        <p><%=crs.getString("location_name")%></p>
                                    </div>



                                    <%

                                        }
                                    %>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-12">
                            <div class="white_box card_height_100">
                                <div class="box_header border_bottom_1px  ">
                                    <div class="main-title">
                                        <h3 class="mb_25">Drivers</h3>
                                    </div>
                                </div>
                                <div class="staf_list_wrapper sraf_active owl-carousel">


                                    <%
                                        String dQry = "select * from tbl_driver d inner join tbl_location l on l.location_id=d.location_id ORDER BY RAND()";
                                        ResultSet drs = con.selectCommand(dQry);
                                        while (drs.next()) {

                                    %>


                                    <!-- single carousel  -->
                                    <div class="single_staf">
                                        <div class="staf_thumb">
                                            <img src="../Assets/Files/DriverPhoto/<%=drs.getString("driver_photo")%>" alt="">
                                        </div>
                                        <h4><%=drs.getString("driver_name")%></h4>
                                        <p><%=drs.getString("location_name")%></p>
                                    </div>



                                    <%

                                        }
                                    %>
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
