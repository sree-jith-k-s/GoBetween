<%-- 
    Document   : NewCompany
    Created on : May 28, 2021, 3:47:51 PM
    Author     : Pro-TECH
--%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!DOCTYPE html>
<html lang="en">

    <%
        DateFormat yearf = new SimpleDateFormat("YYYY");
        DateFormat monthf = new SimpleDateFormat("MM");
        DateFormat dayf = new SimpleDateFormat("dd");

        String year = yearf.format(new Date());
        String month = monthf.format(new Date());
        String day = dayf.format(new Date());

        int yearnew = Integer.parseInt(year);
        
        String Date = String.valueOf(yearnew)+"-"+month+"-"+day;

     

    %>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">

      <title> Go-Between</title>
        <link rel="icon" type="image/png" href="../Assets/Templates/friendskit/assets/img/favicon.png" />
        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:600,700,800,900" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Roboto:400,500" rel="stylesheet">
        <!-- Core CSS -->
        <link rel="stylesheet" href="../Assets/Templates/friendskit/assets/css/app.css">
        <link rel="stylesheet" href="../Assets/Templates/friendskit/assets/css/core.css">
    </head>

    <body>

        <div class="signup-wrapper">


            <div class="process-bar-wrap">
                <div class="process-bar">
                    <div class="progress-wrap">
                        <div class="track"></div>
                        <div class="bar" style="width: 25%;"></div>
                        <div id="step-dot-1" class="dot is-first is-active is-current" data-step="0">
                            <i data-feather="smile"></i>
                        </div>
                        <div id="step-dot-2" class="dot is-second" data-step="25">
                            <i data-feather="user"></i>
                        </div>
                        <div id="step-dot-3" class="dot is-third" data-step="50">
                            <i data-feather="image"></i>
                        </div>
                        <div id="step-dot-4" class="dot is-fourth" data-step="75">
                            <i data-feather="lock"></i>
                        </div>
                        <div id="step-dot-5" class="dot is-fifth" data-step="100">
                            <i data-feather="flag"></i>
                        </div>
                    </div>
                </div>
            </div>
            <form method="post" enctype="multipart/form-data" action="../Assets/ActionPages/CompanyUploadAction.jsp"> 
                <div class="outer-panel">
                    <div class="outer-panel-inner">
                        <div class="process-title">
                            <h2 id="step-title-1" class="step-title" style="margin-top: 20px">Welcome, select an account type.</h2>
                            <h2 id="step-title-2" class="step-title is-active" style="margin-top: 20px">Tell us more about company.</h2>
                            <h2 id="step-title-3" class="step-title" style="margin-top: 20px">Upload Files.</h2>
                            <h2 id="step-title-4" class="step-title" style="margin-top: 20px">About Admin.</h2>
                            <h2 id="step-title-5" class="step-title" style="margin-top: 20px">You're all set. Ready?</h2>
                        </div>

                        <div id="signup-panel-1" class="process-panel-wrap">
                            <div class="columns mt-4">
                                <div class="column is-4">
                                    <div class="account-type">
                                        <div class="type-image">
                                            <img class="type-illustration" src="../Assets/Templates/friendskit/assets/img/illustrations/type-1.svg" alt="">
                                            <img class="type-bg light-image" src="../Assets/Templates/friendskit/assets/img/illustrations/type-1-bg.svg" alt="">
                                            <img class="type-bg dark-image" src="../Assets/Templates/friendskit/assets/img/illustrations/type-1-bg-dark.svg" alt="">
                                        </div>
                                        <h3>Company</h3>
                                        <p>Create a company account to be able to do some awesome things.</p>
                                        <a class="button is-fullwidth process-button" data-step="step-dot-2">
                                            Continue
                                        </a>
                                    </div>
                                </div>
                                <div class="column is-4">
                                    <div class="account-type">
                                        <div class="type-image">
                                            <img class="type-illustration" src="../Assets/Templates/friendskit/assets/img/illustrations/type-2.svg" alt="">
                                            <img class="type-bg light-image" src="../Assets/Templates/friendskit/assets/img/illustrations/type-2-bg.svg" alt="">
                                            <img class="type-bg dark-image" src="../Assets/Templates/friendskit/assets/img/illustrations/type-2-bg-dark.svg" alt="">
                                        </div>
                                        <h3>Driver</h3>
                                        <p>Create a Driver account to be able to do some awesome things.</p>
                                        <a class="button is-fullwidth process-button" data-step="step-dot-2">
                                            Continue
                                        </a>
                                    </div>
                                </div>
                                <div class="column is-4">
                                    <div class="account-type">
                                        <div class="type-image">
                                            <img class="type-illustration" src="../Assets/Templates/friendskit/assets/img/illustrations/type-3.svg" alt="">
                                            <img class="type-bg light-image" src="../Assets/Templates/friendskit/assets/img/illustrations/type-3-bg.svg" alt="">
                                            <img class="type-bg dark-image" src="../Assets/Templates/friendskit/assets/img/illustrations/type-3-bg-dark.svg" alt="">
                                        </div>

                                        <h3>User</h3>
                                        <p>Create a User account to be able to do some awesome things.</p>
                                        <a class="button is-fullwidth process-button" data-step="step-dot-2">
                                            Continue
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="signup-panel-2" class="process-panel-wrap is-narrow is-active">
                            <div class="form-panel">
                                <div class="field">
                                    <label>Name</label>
                                    <div class="control">
                                        <input type="text" required="" name="txt_name" class="input" placeholder="Enter company name">
                                    </div>
                                </div>
                                <div class="field">
                                    <label>Contact</label>
                                    <div class="control">
                                        <input type="text" required="" class="input" name="txt_contact" placeholder="Enter company contact">
                                    </div>
                                </div>
                                <div class="field">
                                    <label>Email</label>
                                    <div class="control">
                                        <input type="text" required="" class="input" name="txt_email"  placeholder="Enter company email address">
                                    </div>
                                </div>
                                <div class="field">
                                    <label>Address</label>
                                    <div class="control">
                                        <input type="text" required="" class="input" name="txt_address" placeholder="Enter company address">
                                    </div>
                                </div>
                                <div class="field">
                                    <label>Since</label>
                                    <div class="control">
                                        <input type="date" max="<%=Date%>" required="" name="txtddate" class="input" >
                                    </div>
                                </div>
                                <div class="field">
                                    <label>State</label>
                                    <div class="control">
                                        <select  required="" style="border: none;background: transparent;width: 100%;padding-left: 100;" name="sel_state" onchange="getDistrict(this.value)">
                                            <option value="">Select</option>
                                            <%
                                                String selQry = "select * from tbl_state";
                                                ResultSet rs = con.selectCommand(selQry);
                                                while (rs.next()) {
                                            %>
                                            <option value="<%=rs.getString("state_id")%>"><%=rs.getString("state_name")%></option>
                                            <%
                                                }
                                            %>
                                        </select>
                                    </div>
                                </div>
                                <div class="field">
                                    <label>District</label>
                                    <div class="control">
                                        <select required="" style="border: none;background: transparent;width: 100%;padding-left: 100;" name="sel_district" id="sel_district" onchange="getPlace(this.value)">
                                            <option value="">Select</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="field">
                                    <label>Place</label>
                                    <div class="control">
                                        <select required="" style="border: none;background: transparent;width: 100%;padding-left: 100;" id="sel_location" name="sel_location">
                                            <option>Select</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="buttons">
                                <a class="button process-button" data-step="step-dot-1">Back</a>
                                <a class="button process-button is-next" data-step="step-dot-3">Next</a>
                            </div>
                        </div>

                        <div id="signup-panel-3" class="process-panel-wrap is-narrow">
                            <div class="form-panel">
                                <div class="photo-upload">

                                    <div class="limitation">
                                        Proof <input required="" type="file" name="file_proof"><br><br>
                                        Logo <input required="" type="file" name="file_logo">
                                        <br><br>
                                        <small>Only files with a size lower than 3MB are allowed.</small>
                                    </div>
                                </div>
                            </div>

                            <div class="buttons">
                                <a class="button process-button" data-step="step-dot-2">Back</a>
                                <a class="button process-button is-next" data-step="step-dot-4">Next</a>
                            </div>
                        </div>

                        <div id="signup-panel-4" class="process-panel-wrap is-narrow">
                            <div class="form-panel">
                                <div class="field">
                                    <label>Name</label>
                                    <div class="control">
                                        <input type="text" required="" name="txt_oname" class="input" placeholder="Enter owner name">
                                    </div>
                                </div>
                                <div class="field">
                                    <label>Contact</label>
                                    <div class="control">
                                        <input type="text" required="" name="txt_onumber" class="input" placeholder="Enter owner contact">
                                    </div>
                                </div>
                                <div class="field">
                                    <label>Email</label>
                                    <div class="control">
                                        <input type="text" required="" name="txt_oemail" class="input" placeholder="Enter owner email address">
                                    </div>
                                </div>
                                <div class="field">
                                    <label>Password</label>
                                    <div class="control">
                                        <input type="password" required="" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
                                   title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters" name="txt_password" class="input" placeholder="Choose a password">
                                    </div>
                                </div>
                            </div>

                            <div class="buttons">
                                <a class="button process-button" data-step="step-dot-3">Back</a>
                                <a class="button process-button is-next" data-step="step-dot-5">Next</a>
                            </div>
                        </div>

                        <div id="signup-panel-5" class="process-panel-wrap is-narrow">
                            <div class="form-panel">
                                <img class="success-image" src="../Assets/Templates/friendskit/assets/img/illustrations/mailbox.svg" alt="">
                                <div class="success-text">
                                    <h3>Congratz, you successfully created your account.</h3>
                                    <p> We confirm your account within 24 hours.</p>
                                    <input type="submit" class="button is-fullwidth" value="Let me in">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>

        <script src="../Assets/JQuery/jQuery.js"></script>
        <script>
                                            function getDistrict(sid)
                                            {

                                                $.ajax({
                                                    type: "POST",
                                                    data: {sid: sid},
                                                    url: "../Assets/AjaxPages/AjaxDistrict.jsp",
                                                    success: function(result) {
                                                        $("#sel_district").html(result);
                                                    }});
                                            }
                                            function getPlace(did)
                                            {

                                                $.ajax({
                                                    type: "POST",
                                                    data: {did: did},
                                                    url: "../Assets/AjaxPages/AjaxLocation.jsp",
                                                    success: function(result) {
                                                        $("#sel_location").html(result);
                                                    }});
                                            }
        </script>
        <!-- Concatenated js plugins and jQuery -->
        <script src="../Assets/Templates/friendskit/assets/js/app.js"></script>
        <script src="https://js.stripe.com/v3/"></script>
        <script src="../Assets/Templates/friendskit/assets/data/tipuedrop_content.js"></script>

        <!-- Core js -->
        <script src="../Assets/Templates/friendskit/assets/js/global.js"></script>

        <!-- Navigation options js -->
        <script src="../Assets/Templates/friendskit/assets/js/navbar-v1.js"></script>
        <script src="../Assets/Templates/friendskit/assets/js/navbar-v2.js"></script>
        <script src="../Assets/Templates/friendskit/assets/js/navbar-mobile.js"></script>
        <script src="../Assets/Templates/friendskit/assets/js/navbar-options.js"></script>
        <script src="../Assets/Templates/friendskit/assets/js/sidebar-v1.js"></script>

        <!-- Core instance js -->
        <script src="../Assets/Templates/friendskit/assets/js/main.js"></script>
        <script src="../Assets/Templates/friendskit/assets/js/chat.js"></script>
        <script src="../Assets/Templates/friendskit/assets/js/touch.js"></script>
        <script src="../Assets/Templates/friendskit/assets/js/tour.js"></script>

        <!-- Components js -->
        <script src="../Assets/Templates/friendskit/assets/js/explorer.js"></script>
        <script src="../Assets/Templates/friendskit/assets/js/widgets.js"></script>
        <script src="../Assets/Templates/friendskit/assets/js/modal-uploader.js"></script>
        <script src="../Assets/Templates/friendskit/assets/js/popovers-users.js"></script>
        <script src="../Assets/Templates/friendskit/assets/js/popovers-pages.js"></script>
        <script src="../Assets/Templates/friendskit/assets/js/lightbox.js"></script>

        <!-- Landing page js -->

        <!-- Signup page js -->
        <script src="../Assets/Templates/friendskit/assets/js/signup.js"></script>

        <!-- Feed pages js -->


        <!-- profile js -->

        <!-- stories js -->

        <!-- friends js -->

        <!-- questions js -->

        <!-- video js -->

        <!-- events js -->

        <!-- news js -->

        <!-- shop js -->

        <!-- inbox js -->

        <!-- settings js -->

    </body>

</html>