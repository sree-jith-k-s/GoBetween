<%-- 
    Document   : Head
    Created on : May 28, 2021, 8:22:27 PM
    Author     : Pro-TECH
--%>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Go-Between</title>
        <style>
            .dropbtn {  
                background: transparent;
                color: #000;
                font-weight: bold;
                font-size: 18px;
                border: none;
                cursor: pointer;
            }

            .dropdown {
                padding: 25px;
                position: relative;
                display: inline-block;
            }

            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #FFF;
                border-radius: 20px;
                min-width: 160px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 1;
            }

            .dropdown-content a {
                color: #039;
                padding: 12px 16px;
                border-radius: 20px;
                text-decoration: none;
                display: block;
            }

            .dropdown-content a:hover {
                border-radius: 20px;    
                background-color: #FFF;
                color: #900;
            }

            .dropdown:hover .dropdown-content {
                display: block;

            }

            .dropdown:hover .dropbtn {
                color:#900;
            }
        </style>
        <!-- Bootstrap core CSS -->
        <link href="../Assets/Templates/web/css/bootstrap.css" rel="stylesheet">
        <link href="../Assets/Templates/form.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="../Assets/Templates/web/css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="../Assets/Templates/web/css/elusive-webfont.css">
        <link href="../Assets/Templates/web/css/animate.css" rel="stylesheet">

        <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,700,300italic,400italic' rel='stylesheet' type='text/css'>

        <script src="../Assets/Templates/web/js/jquery.min.js"></script>
        <script type="text/javascript" src="../Assets/Templates/web/js/modernizr.custom.js"></script>

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="js/html5shiv.js"></script>
          <script src="js/respond.min.js"></script>
        <![endif]-->
    </head>

    <body data-spy="scroll" data-offset="0" data-target="#navbar-main">


        <div id="navbar-main">
            <!-- Fixed navbar -->
            <div class="navbar navbar-default navbar-fixed-top">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <i class="el-icon-lines"></i>
                        </button>
                        <a href="index.jsp"><h1> Go-Between</h1></a>
                    </div>
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <div class="dropdown">
                                <a class="dropbtn" href="index.jsp">Home</a>
                            </div>
                            <div class="dropdown">
                                <a class="dropbtn" href="ViewProfile.jsp">Profile</a>
                            </div>
                            <div class="dropdown">
                                <a class="dropbtn" href="NewDriver.jsp">Driver</a>
                            </div>
                            <div class="dropdown">
                                <a class="dropbtn" href="javascript:void(0)">Vehicle</a>
                                <div class="dropdown-content">
                                    <a href="NewVehicleRegistraion.jsp">New Vehicle </a>
                                    <a href="VehicleList.jsp">Vehicle List</a>
                                </div>
                            </div>
                            <div class="dropdown">
                                <a class="dropbtn" href="javascript:void(0)">Request</a>
                                <div class="dropdown-content">
                                    <a href="TransportRequest.jsp">Transport</a>
                                    <a href="ViewDriverRequest.jsp">Drivers</a>
                                </div>
                            </div>
                            <div class="dropdown">
                                <a class="dropbtn" href="javascript:void(0)">Others</a>
                                <div class="dropdown-content">
                                    <a href="Complaint.jsp">Compliant</a>
                                    <a href="Feedback.jsp">Feedback</a>
                                    <a href="../Guest/Login.jsp">logout</a>
                                </div>
                            </div>
                        </ul>
                    </div><!--/.nav-collapse -->
                </div>
            </div>
        </div>

        <br><br><br><br><br><br><br><br>