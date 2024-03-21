<%-- 
    Document   : Login
    Created on : May 5, 2021, 2:13:16 PM
    Author     : Pro-TECH
--%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <meta http-equiv="x-ua-compatible" content="ie=edge">

            <title>Login</title>

            <!-- Core CSS -->
            <link rel="stylesheet" href="../Assets/Templates/Templates/friendskit/assets/css/bulma.css">
            <link rel="stylesheet" href="../Assets/Templates/friendskit/assets/css/app.css">
            <link rel="stylesheet" href="../Assets/Templates/friendskit/assets/css/core.css">

            <title>Go-Between</title>
        </head>
    <%
        if (request.getParameter("btn_login") != null) {

            String email = request.getParameter("txt_email");
            String password = request.getParameter("txt_password");

            String seladmin = "select * from tbl_admin where admin_email='" + email + "' and admin_password='" + password + "'";
            ResultSet rsadmin = con.selectCommand(seladmin);

            String selcompany = "select * from tbl_company where company_status='1' and owner_email='" + email + "' and owner_password='" + password + "'";
            ResultSet rscompany = con.selectCommand(selcompany);

            String seldriver = "select * from tbl_driver where driver_status='1' and driver_email='" + email + "' and driver_password='" + password + "'";
            ResultSet rsdriver = con.selectCommand(seldriver);

            String seluser = "select * from tbl_user where user_status='1' and user_email='" + email + "' and user_password='" + password + "'";
            ResultSet rsuser = con.selectCommand(seluser);

            if (rsadmin.next()) {

                response.sendRedirect("../Admin/index.jsp");

            } else if (rscompany.next()) {

                session.setAttribute("cid", rscompany.getString("company_id"));
                session.setAttribute("cname", rscompany.getString("company_name"));
                response.sendRedirect("../Company/index.jsp");

            } else if (rsdriver.next()) {

                session.setAttribute("did", rsdriver.getString("driver_id"));
                session.setAttribute("dname", rsdriver.getString("driver_name"));
                response.sendRedirect("../Driver/index.jsp");

            } else if (rsuser.next()) {

                session.setAttribute("uid", rsuser.getString("user_id"));
                session.setAttribute("uname", rsuser.getString("user_name"));
                response.sendRedirect("../User/index.jsp");

            } else {
    %>
    <script type="text/javascript">
        alert("Invalid Login Credentials");
        setTimeout(function() {
            window.location.href = 'Login.jsp'
        }, 100);
    </script>
    <%
            }
        }
    %>
    <body>

        <!--         Pageloader 
                <div class="pageloader"></div>
                <div class="infraloader is-active"></div>-->
        <div class="signup-wrapper">

            <!--        Fake navigation
                    <div class="fake-nav">
                        <a href="/" class="logo" style="font-weight:bolder;font-size: xx-large;color: dimgray;" >
                         College-Connect
                            
                        </a>
                    </div>-->

            <div class="container">
                <!--Container-->
                <div class="login-container">
                    <div class="columns is-vcentered">
                        <div class="column is-6 image-column">
                            <!--Illustration-->
                            <img class="light-image login-image" src="../Assets/Templates/friendskit/assets/img/illustrations/login.svg" alt="">
                            <img class="dark-image login-image" src="../Assets/Templates/friendskit/assets/img/illustrations/login-dark.svg" alt="">
                        </div>
                        <div class="column is-6">

                            <h2 class="form-title">Welcome </h2>
                            <h3 class="form-subtitle">Enter your credentials to sign in.</h3>

                            <!--Form-->

                            <form method="post">
                                <div class="login-form">
                                    <div class="form-panel">
                                        <div class="field">
                                            <label>Email</label>
                                            <div class="control">
                                                <input type="email" id="input" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
                                                       class="input" autocomplete="off"  name="txt_email" placeholder="Enter your Email" required="required"/>
                                            </div>
                                        </div>
                                        <div class="field">
                                            <label>Password</label>
                                            <div class="control">
                                                <input type="password" class="input" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
                                                       title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters" 
                                                       name="txt_password" placeholder="Enter your password" required="required"/>
                                            </div>

                                        </div>
                                        <br><br>

                                    </div>
                                    <div class="buttons">
                                        <button class="button is-solid primary-button is-fullwidth raised" type="submit"  name="btn_login"><span>Login</span></button>                    
                                    </div>
                                    <div align="right" style="font-size: 10dp;">
                                        <a href="index.html" >return to home</a>    
                                    </div>


                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Concatenated js plugins and jQuery -->
        <script src="../Assets/Templates/friendskit/assets/js/app.js"></script>

        <!-- Core js -->
        <script src="../Assets/Templates/friendskit/assets/data/tipuedrop_content.js"></script>
        <script src="../Assets/Templates/friendskit/assets/js/global.js"></script>
        <script src="../Assets/Templates/friendskit/assets/js/main.js"></script>

        <!-- Page and UI related js -->
        <script src="../Assets/Templates/friendskit/assets/js/signup.js"></script>
    </body>

</html>