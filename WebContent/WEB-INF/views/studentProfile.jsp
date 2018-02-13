<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="../assets/img/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Shiva Kumar</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
    <!-- CSS Files -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/css/light-bootstrap-dashboard.css?v=2.0.1" rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="../assets/css/demo.css" rel="stylesheet" />
    <style>
        .trow {
            font-size: 12px!important;
            font-family: Segoe UI Semibold;
            padding: 0.30rem!important;

        }

        p {
            font-size: 12px!important;
        }

    </style>
    <style>
        .progress {
            width: 90px;
            height: 90px;
            line-height: 90px;
            background: none;
            margin: 0 auto;
            box-shadow: none;
            position: relative;
        }

        .progress:after {
            content: "";
            width: 100%;
            height: 100%;
            border-radius: 50%;
            border: 12px solid #fff;
            position: absolute;
            top: 0;
            left: 0;
        }

        .progress>span {
            width: 50%;
            height: 100%;
            overflow: hidden;
            position: absolute;
            top: 0;
            z-index: 1;
        }

        .progress .progress-left {
            left: 0;
        }

        .progress .progress-bar {
            width: 100%;
            height: 100%;
            background: none;
            border-width: 12px;
            border-style: solid;
            position: absolute;
            top: 0;
        }

        .progress .progress-left .progress-bar {
            left: 100%;
            border-top-right-radius: 80px;
            border-bottom-right-radius: 80px;
            border-left: 0;
            -webkit-transform-origin: center left;
            transform-origin: center left;
        }

        .progress .progress-right {
            right: 0;
        }

        .progress .progress-right .progress-bar {
            left: -100%;
            border-top-left-radius: 80px;
            border-bottom-left-radius: 80px;
            border-right: 0;
            -webkit-transform-origin: center right;
            transform-origin: center right;
            animation: loading-1 1.8s linear forwards;
        }

        .progress .progress-value {
            width: 94%;
            height: 94%;
            border-radius: 50%;
            background: #fff;
            font-size: 14px;
            color: #44484b;
            line-height: 80px;
            font-weight: 700;
            text-align: center;
            position: absolute;
            top: 5%;
            left: 5%;
        }

        .progress.blue .progress-bar {
            border-color: #049dff;
        }

        .progress.blue .progress-left .progress-bar {
            animation: loading-2 1.5s linear forwards 1.8s;
        }

        .progress.yellow .progress-bar {
            border-color: #fdba04;
        }

        .progress.yellow .progress-left .progress-bar {
            animation: loading-3 1s linear forwards 1.8s;
        }

        .progress.pink .progress-bar {
            border-color: #ed687c;
        }

        .progress.pink .progress-left .progress-bar {
            animation: loading-4 0.4s linear forwards 1.8s;
        }

        .progress.green .progress-bar {
            border-color: #1abc9c;
        }

        .progress.green .progress-left .progress-bar {
            animation: loading-5 1.2s linear forwards 1.8s;
        }

        @keyframes loading-1 {
            0% {
                -webkit-transform: rotate(0deg);
                transform: rotate(0deg);
            }
            100% {
                -webkit-transform: rotate(180deg);
                transform: rotate(180deg);
            }
        }

        @keyframes loading-2 {
            0% {
                -webkit-transform: rotate(0deg);
                transform: rotate(0deg);
            }
            100% {
                -webkit-transform: rotate(144deg);
                transform: rotate(144deg);
            }
        }

        @keyframes loading-3 {
            0% {
                -webkit-transform: rotate(0deg);
                transform: rotate(0deg);
            }
            100% {
                -webkit-transform: rotate(90deg);
                transform: rotate(90deg);
            }
        }

        @keyframes loading-4 {
            0% {
                -webkit-transform: rotate(0deg);
                transform: rotate(0deg);
            }
            100% {
                -webkit-transform: rotate(36deg);
                transform: rotate(36deg);
            }
        }

        @keyframes loading-5 {
            0% {
                -webkit-transform: rotate(0deg);
                transform: rotate(0deg);
            }
            100% {
                -webkit-transform: rotate(126deg);
                transform: rotate(126deg);
            }
        }

        @media only screen and (max-width: 990px) {
            .progress {
                margin-bottom: 20px;
            }
        }

    </style>
</head>

<body>
    <div class="wrapper">
        <div class="main-panel">
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg" color-on-scroll="500">
                <div class=" container-fluid  ">
                    <a class="navbar-brand" href="#"> Shiva Kumar </a>
                </div>
            </nav>
            <!-- End Navbar -->
            <div class="content" style="">
                <div class="container-fluid">
                    <div class="row" style="margin-bottom: 15px;">
                        <div class="col-md-2" style="background-color: #fff;">
                            <p style="text-align: center; font-size: 20px!important; color:forestgreen; margin-top: 10px; margin-bottom: 0px; font-weight: 500;">BATCH</p>
                            <p style="text-align: center; font-size: 60px!important; color:forestgreen; font-weight:700; margin-bottom: 0px;">10</p>
                            <p style="text-align: center; font-size: 30px!important; font-weight:700; margin-bottom: 0px;">2017</p>
                            <p style="text-align: center; font-size: 20px!important; color:forestgreen; margin-top: 10px; margin-bottom: 0px; font-weight: 500; margin-top: 0px;">Pass Out</p>
                        </div>
                        <div class="col-md-4" style="">
                            <div class="table" style="background-color: #fff!important;">
                                <table style="width: 100%;">
                                    <tr>
                                        <th colspan="3" class="trow" style="text-align: center;">Students Detail</th>
                                        <th class="trow"></th>
                                        <th class="trow"></th>
                                    </tr>
                                    <tr>
                                        <td class="trow">Full Name</td>
                                        <td class="trow">:</td>
                                        <td class="trow">Vishal Kumar</td>
                                    </tr>
                                    <tr>
                                        <td class="trow">Parent Name</td>
                                        <td class="trow">:</td>
                                        <td class="trow">Akhilesh Kumar</td>
                                    </tr>
                                    <tr>
                                        <td class="trow">Gender</td>
                                        <td class="trow">:</td>
                                        <td class="trow">Male</td>
                                    </tr>
                                    <tr>
                                        <td class="trow">DOB</td>
                                        <td class="trow">:</td>
                                        <td class="trow">28/06/1994</td>
                                    </tr>
                                    <tr>
                                        <td class="trow">email</td>
                                        <td class="trow">:</td>
                                        <td class="trow">vishal@gmail.com</td>
                                    </tr>
                                    <tr>
                                        <td class="trow">Mob No.</td>
                                        <td class="trow">:</td>
                                        <td class="trow">9430288438</td>
                                    </tr>
                                    <tr>
                                        <td class="trow">Parent Mob. No.</td>
                                        <td class="trow">:</td>
                                        <td class="trow">8507437408</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="col-md-3" style="margin-top: 15px;">
                            <div class="table" style="background-color: #fff!important;">
                                <table style="width: 100%;">
                                    <tr>
                                        <th colspan="3" class="trow" style="text-align:center!important;">Educational Detail</th>
                                        <th class="trow"></th>
                                        <th class="trow"></th>
                                    </tr>
                                    <tr>
                                        <td class="trow">Batch</td>
                                        <td class="trow">:</td>
                                        <td class="trow">12th</td>
                                    </tr>
                                    <tr>
                                        <td class="trow">Year of Passing</td>
                                        <td class="trow">:</td>
                                        <td class="trow">2017</td>
                                    </tr>
                                    <tr>
                                        <td class="trow">Graduation Type</td>
                                        <td class="trow">:</td>
                                        <td class="trow">B.Tech</td>
                                    </tr>
                                    <tr>
                                        <td class="trow">Branch</td>
                                        <td class="trow">:</td>
                                        <td class="trow">AEI</td>
                                    </tr>
                                    <tr>
                                        <td class="trow">College</td>
                                        <td class="trow">:</td>
                                        <td class="trow">GIET, Gunupur</td>
                                    </tr>
                                    <tr>
                                        <td class="trow">Graduation City</td>
                                        <td class="trow">:</td>
                                        <td class="trow">Rayagada</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="col-md-12">
                                <div class="table" style="background-color: #fff!important;">
                                    <table style="width: 100%;">
                                        <tr>
                                            <th colspan="3" class="trow" style="text-align: center;">%percentage</th>
                                            <th class="trow"></th>
                                            <th class="trow"></th>
                                        </tr>
                                        <tr>
                                            <td class="trow">10th</td>
                                            <td class="trow">:</td>
                                            <td class="trow">8.2</td>
                                        </tr>
                                        <tr>
                                            <td class="trow">12th</td>
                                            <td class="trow">:</td>
                                            <td class="trow">66.8%</td>
                                        </tr>
                                        <tr>
                                            <td class="trow">Degree</td>
                                            <td class="trow">:</td>
                                            <td class="trow">8.01</td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="table" style="background-color: #fff!important;">
                                    <table style="width: 100%;">
                                        <tr>
                                            <th colspan="3" class="trow" style="text-align: center;">%Math Marks</th>
                                            <th class="trow"></th>
                                            <th class="trow"></th>
                                        </tr>
                                        <tr>
                                            <td class="trow">10th</td>
                                            <td class="trow">:</td>
                                            <td class="trow">94</td>
                                        </tr>
                                        <tr>
                                            <td class="trow">12th</td>
                                            <td class="trow">:</td>
                                            <td class="trow">76</td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <div class="table" style="background-color: #fff!important;">
                                <table style="width: 100%;">
                                    <tr>
                                        <th colspan="3" class="trow" style="text-align: center;">Address</th>
                                        <th class="trow"></th>
                                        <th class="trow"></th>
                                    </tr>
                                    <tr>
                                        <td class="trow">house No.</td>
                                        <td class="trow">:</td>
                                        <td class="trow">203</td>
                                    </tr>
                                    <tr>
                                        <td class="trow">City</td>
                                        <td class="trow">:</td>
                                        <td class="trow">Hyderabad</td>
                                    </tr>
                                    <tr>
                                        <td class="trow">State</td>
                                        <td class="trow">:</td>
                                        <td class="trow">Telangana</td>
                                    </tr>
                                    <tr>
                                        <td class="trow">Facebook Link</td>
                                        <td class="trow">:</td>
                                        <td class="trow">http://vishalfb.in</td>
                                    </tr>
                                    <tr>
                                        <td class="trow">Linkedin Link</td>
                                        <td class="trow">:</td>
                                        <td class="trow">http://vishallinkedin.in</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row" style="background-color: #fff;">
                                <p style="width: 100%; text-align: center!important; margin:5px!important;">Full Academic Marks</p>
                            </div>
                            <div class="row" style="">
                                <div class="col-md-4 col-sm-6" style="background-color: #fff;">
                                    <div class="progress blue">
                                        <span class="progress-left">
                                        <span class="progress-bar"></span>
                                        </span>
                                        <span class="progress-right">
                                        <span class="progress-bar"></span>
                                        </span>
                                        <div class="progress-value">90%</div>
                                    </div>
                                    <p style="padding-left: 42px!important;">10th%</p>
                                </div>
                                <div class="col-md-4 col-sm-6" style="background-color: #fff;">
                                    <div class="progress yellow">
                                        <span class="progress-left">
                                        <span class="progress-bar"></span>
                                        </span>
                                        <span class="progress-right">
                                        <span class="progress-bar"></span>
                                        </span>
                                        <div class="progress-value">75%</div>
                                    </div>
                                    <p style="padding-left: 42px!important;">12th%</p>
                                </div>
                                <div class="col-md-4 col-sm-6" style="background-color: #fff;">
                                    <div class="progress pink">
                                        <span class="progress-left">
                                        <span class="progress-bar"></span>
                                        </span>
                                        <span class="progress-right">
                                        <span class="progress-bar"></span>
                                        </span>
                                        <div class="progress-value">60%</div>
                                    </div>
                                    <p style="padding-left: 42px!important;">Degree%</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4" style="">
                            <div class="row" style="background-color: #fff;">
                                <p style="width: 100%; text-align: center!important; margin:5px!important;">Mathematics Marks</p>
                            </div>
                            <div class="row" style="background-color: #fff;">
                                <div class="col-md-6 col-sm-6">
                                    <div class="progress green">
                                        <span class="progress-left">
                                        <span class="progress-bar"></span>
                                        </span>
                                        <span class="progress-right">
                                        <span class="progress-bar"></span>
                                        </span>
                                        <div class="progress-value">50%</div>
                                    </div>
                                    <p style="padding-left: 60px!important;">10th</p>
                                </div>
                                <div class="col-md-6 col-sm-6">
                                    <div class="progress yellow">
                                        <span class="progress-left">
                                        <span class="progress-bar"></span>
                                        </span>
                                        <span class="progress-right">
                                        <span class="progress-bar"></span>
                                        </span>
                                        <div class="progress-value">80%</div>
                                    </div>
                                    <p style="padding-left: 60px!important;">12th</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="footer">
            <div class="container">
                <nav>
                    <p class="copyright text-center">
                        ©
                        <script>
                            document.write(new Date().getFullYear())

                        </script>
                        <a href="#">CVCORP</a>, all rights reserved
                    </p>
                </nav>
            </div>
        </footer>
    </div>
</body>
<!--   Core JS Files   -->
<script src="../assets/js/core/jquery.3.2.1.min.js" type="text/javascript"></script>
<script src="../assets/js/core/popper.min.js" type="text/javascript"></script>
<script src="../assets/js/core/bootstrap.min.js" type="text/javascript"></script>
<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
<script src="../assets/js/plugins/bootstrap-switch.js"></script>
<!--  Google Maps Plugin    -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!--  Chartist Plugin  -->
<script src="../assets/js/plugins/chartist.min.js"></script>
<!--  Notifications Plugin    -->
<script src="../assets/js/plugins/bootstrap-notify.js"></script>
<!-- Control Center for Light Bootstrap Dashboard: scripts for the example pages etc -->
<script src="../assets/js/light-bootstrap-dashboard.js?v=2.0.1" type="text/javascript"></script>
<!-- Light Bootstrap Dashboard DEMO methods, don't include it in your project! -->
<script src="../assets/js/demo.js"></script>

</html>