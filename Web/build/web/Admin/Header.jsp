
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Go-Between</title>

        <!-- <link rel="icon" href="../Assets/Templates/admin/img/favicon.png" type="image/png"> -->
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="../Assets/Templates/admin/css/bootstrap.min.css" />
        <!-- themefy CSS -->
        <link rel="stylesheet" href="../Assets/Templates/admin/vendors/themefy_icon/themify-icons.css" />
        <!-- swiper slider CSS -->
        <link rel="stylesheet" href="../Assets/Templates/admin/vendors/swiper_slider/css/swiper.min.css" />
        <!-- select2 CSS -->
        <link rel="stylesheet" href="../Assets/Templates/admin/vendors/select2/css/select2.min.css" />
        <!-- select2 CSS -->
        <link rel="stylesheet" href="../Assets/Templates/admin/vendors/niceselect/css/nice-select.css" />
        <!-- owl carousel CSS -->
        <link rel="stylesheet" href="../Assets/Templates/admin/vendors/owl_carousel/css/owl.carousel.css" />
        <!-- gijgo css -->
        <link rel="stylesheet" href="../Assets/Templates/admin/vendors/gijgo/gijgo.min.css" />
        <!-- font awesome CSS -->
        <link rel="stylesheet" href="../Assets/Templates/admin/vendors/font_awesome/css/all.min.css" />
        <link rel="stylesheet" href="../Assets/Templates/admin/vendors/tagsinput/tagsinput.css" />
        <!-- datatable CSS -->
        <link rel="stylesheet" href="../Assets/Templates/admin/vendors/datatable/css/jquery.dataTables.min.css" />
        <link rel="stylesheet" href="../Assets/Templates/admin/vendors/datatable/css/responsive.dataTables.min.css" />
        <link rel="stylesheet" href="../Assets/Templates/admin/vendors/datatable/css/buttons.dataTables.min.css" />
        <!-- text editor css -->
        <link rel="stylesheet" href="../Assets/Templates/admin/vendors/text_editor/summernote-bs4.css" />
        <!-- morris css -->
        <link rel="stylesheet" href="../Assets/Templates/admin/vendors/morris/morris.css">
        <!-- metarial icon css -->
        <link rel="stylesheet" href="../Assets/Templates/admin/vendors/material_icon/material-icons.css" />

        <!-- menu css  -->
        <link rel="stylesheet" href="../Assets/Templates/admin/css/metisMenu.css">
        <!-- style CSS -->
        <link rel="stylesheet" href="../Assets/Templates/admin/css/style.css" />
        <link rel="stylesheet" href="../Assets/Templates/admin/css/colors/default.css" id="colorSkinCSS">
    
        
        <nav class="sidebar">
            <div class="logo d-flex justify-content-between">
                <a href="index.jsp"><h4 align="center">Welcome<br>Admin</h4></a>
                <div class="sidebar_close_icon d-lg-none">
                    <i class="ti-close"></i>
                </div>
            </div>
            <ul id="sidebar_menu">
                <li class="side_menu_title">
                    <span>Dashboard</span>
                </li>
                <li class="mm-active">
                    <a  href="index.jsp"  aria-expanded="false">
                        <img src="../Assets/Templates/admin/img/menu-icon/1.svg" alt="">
                        <span>Dashboard</span>
                    </a>
                   
                </li>
                <li class="side_menu_title">
                    <span>Management</span>
                </li>
                <li class="">
                    <a   class="has-arrow" href="#" aria-expanded="false">
                        <img src="../Assets/Templates/admin/img/menu-icon/2.svg" alt="">
                        <span>Company</span>
                    </a>
                    <ul>
                        <li><a href="NewCompany.jsp">New Company List</a></li>
                        <li><a href="AcceptedCompany.jsp">Accepted Company List</a></li>
                        <li><a href="RejectedCompany.jsp">Rejected Company List</a></li>
                    </ul>
                </li>
                <li class="">
                    <a   class="has-arrow" href="#" aria-expanded="false">
                        <img src="../Assets/Templates/admin/img/menu-icon/2.svg" alt="">
                        <span>Drivers</span>
                    </a>
                    <ul>
                        <li><a href="NewDriver.jsp">New Driver List</a></li>
                        <li><a href="AcceptedDriver.jsp">Accepted Driver List</a></li>
                        <li><a href="RejectedDriver.jsp">Rejected Driver List</a></li>
                    </ul>
                </li>
                <li class="">
                    <a   class="has-arrow" href="#" aria-expanded="false">
                        <img src="../Assets/Templates/admin/img/menu-icon/2.svg" alt="">
                        <span>Users</span>
                    </a>
                    <ul>
                        <li><a href="NewUser.jsp">New User List</a></li>
                        <li><a href="AcceptedUser.jsp">Accepted User List</a></li>
                        <li><a href="RejectedUser.jsp">Rejected User List</a></li>
                    </ul>
                </li>
                <li class="side_menu_title">
                    <span>Basic Data's</span>
                </li>
                <li class="">
                    <a   class="has-arrow" href="#" aria-expanded="false">
                        <img src="../Assets/Templates/admin/img/menu-icon/2.svg" alt="">
                        <span>Location</span>
                    </a>
                    <ul>
                        <li><a href="State.jsp">State</a></li>
                        <li><a href="District.jsp">District</a></li>
                        <li><a href="Location.jsp">Location</a></li>
                    </ul>
                </li>
                 <li class="">
                    <a   class="has-arrow" href="#" aria-expanded="false">
                        <img src="../Assets/Templates/admin/img/menu-icon/2.svg" alt="">
                        <span>Types</span>
                    </a>
                    <ul>
                        <li><a href="VehicleType.jsp">Vehicle Type</a></li>
                        <li><a href="VehicleSubType.jsp">Vehicle Sub Type</a></li>
                        <li><a href="ComplaintType.jsp">Compliant Type</a></li>
                        <li><a href="Category.jsp">Category</a></li>
                    </ul>
                </li>
                 <li class="side_menu_title">
                    <span>Others</span>
                </li>
                <li class="">
                    <a   class="has-arrow" href="#" aria-expanded="false">
                        <img src="../Assets/Templates/admin/img/menu-icon/2.svg" alt="">
                        <span>Complaints</span>
                    </a>
                    <ul>
                        <li><a href="ViewCompanyComplaint.jsp">Company Complaints</a></li>
                        <li><a href="ViewDriverComplaint.jsp">Driver Complaint</a></li>
                        <li><a href="ViewUserComplaint.jsp">User Complaint</a></li>
                    </ul>
                </li>
                <li class="">
                    <a   class="has-arrow" href="#" aria-expanded="false">
                        <img src="../Assets/Templates/admin/img/menu-icon/2.svg" alt="">
                        <span>Feedbacks</span>
                    </a>
                    <ul>
                        <li><a href="ViewCompanyFeedback.jsp">Company Feedback</a></li>
                        <li><a href="ViewDriverFeedback.jsp">Driver Feedback</a></li>
                        <li><a href="ViewUserFeedback.jsp">User Feedback</a></li>
                    </ul>
                </li>
                <li class="">
                    <a   class="has-arrow" href="../Guest/Login.jsp" aria-expanded="false">
                        <img src="../Assets/Templates/admin/img/menu-icon/2.svg" alt="">
                        <span>Logout</span>
                    </a>
                </li>
            </ul>

        </nav>