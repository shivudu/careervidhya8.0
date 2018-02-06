<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
    <%@ page import="cv.models.CVStudent" %>
    <%@ page import="cv.models.Admin" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%
String name;

Admin admin=(Admin)request.getSession().getAttribute("admin");
name=admin.getName();
%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
var batchNos=[];
var adminName='<%=name%>';



$(document).ready( function(){

	<c:forEach items="${batches }" var="b">
	batchNos.push("${b.getBatchNumber()}");
	</c:forEach>
	console.log(batchNos.length);
	
	});


</script>
	<script src='https://code.responsivevoice.org/responsivevoice.js'></script>
	<title>Admin DashBoard</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.6.5/angular.min.js"></script>
   	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="<c:url value="/resources/js/ajaxOp.js"/>"></script>
	<script src="<c:url value="/resources/js/AngularApp.js"/>"></script>
	<!-- <script src="<c:url value="/resources/js/dirPagination.js"/>"></script>-->https://cdnjs.cloudflare.com/ajax/libs/jquery.sticky/1.0.4/jquery.sticky.min.js
	<!-- <script src="<c:url value="/resources/js/multiSelector.js"/>"></script> -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css" type="text/css"> -->
	
	<script src="<c:url value="/resources/js/xeditable.js"/>"></script>
	<!-- <script src="<c:url value="/resources/js/multiSelectBox.js"/>"></script> -->
	
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/xeditable.css"/>"/>
	<!-- <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/multiSelector.css"/>"/> -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/angular-ui-bootstrap/1.3.1/ui-bootstrap-tpls.min.js"></script>
	<!--  <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/3.7.0/lodash.min.js"></script>-->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.min.js"></script>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/adminDashBoard.css"/>"/>
	
	<style>
	   
	   #skitt-toggle-button
	   {
	   	float:right !important;
	   }
        /*.navbar-default .navbar-nav>.active> a, 
			.navbar-default .navbar-nav>.active> a:focus, 
			.navbar-default .navbar-nav>.active> a:hover
        {
            color:#444444 !important;
            text-transform:uppercase !important;
            text-shadow: 0 1px 0 #ffffff !important;
            font-size:12px !important;
            /*background: -webkit-gradient(linear, left top, left bottom, from(#f1f1f3), to(#e8e9ed)) !important;
        }*/

    </style>
	<style>
		output 
		{ 
		  position: relative;
		  background-image: linear-gradient(#444444, #999999);
		  width: 28px; 
		  height: 20px; 
		  text-align: center; 
		  color: white; 
		  border-radius: 10px; 
		  display: inline-block; 
		  font: bold 10px/5px Georgia;
		  /*bottom: 120%;
		  left: 0;*/
		  margin-left: 2% !important;
		}
	</style>
	<style>
		
		#chat,#chat:after,.chatbox
		{
			transition:all .4s ease-in-out
		}
		#chat,#close-chat,.minim-button,.maxi-button,.chat-text
		{
			font-weight:700;
			cursor:pointer;
			font-family:Arial,sans-serif;
			text-align:center;
			height:20px;
			line-height:20px;
		}
		#chat,#close-chat,.chatbox
		{
			border:1px solid #A8A8A8;
		}
		#chat:after,#chat:before
		{
			position:absolute;
			border-style:solid;
			content:"";
		}
		.chatbox
		{
			position:fixed;
			bottom:0;
			right:20px;
			margin:0 0 -450px;
			background-color:#00a69c;
			border-color:#00a69c;
			border-bottom:none;
			border-top-left-radius:5px;
			border-top-right-radius:5px;
			padding:28px 2px 0px 2px; 
			z-index:100000
		}
		.dropdown-submenu 
		{
    		position: relative;
    		fonct-size:12px;
    		font-family: Segoe UI,Trebuchet MS,Sans-Serif !important;
		}
		.dropdown-submenu>.dropdown-menu 
		{
			    top: 0;
			    left: 100%;
			    margin-top: -6px;
			    margin-left: -1px;
			    -webkit-border-radius: 0 6px 6px 6px;
			    -moz-border-radius: 0 6px 6px;
			    border-radius: 0 6px 6px 6px;
			}
			
			.dropdown-submenu:hover>.dropdown-menu {
			    display: block;
			}
			
			.dropdown-submenu>a:after {
			    display: block;
			    content: " ";
			    float: right;
			    width: 0;
			    height: 0;
			    border-color: transparent;
			    border-style: solid;
			    border-width: 5px 0 5px 5px;
			    border-left-color: #ccc;
			    margin-top: 5px;
			    margin-right: -10px;
			}
			
			.dropdown-submenu:hover>a:after {
			    border-left-color: #fff;
			}
			
			.dropdown-submenu.pull-left {
			    float: none;
			}
			
			.dropdown-submenu.pull-left>.dropdown-menu {
			    left: -100%;
			    margin-left: 10px;
			    -webkit-border-radius: 6px 0 6px 6px;
			    -moz-border-radius: 6px 0 6px 6px;
			    border-radius: 6px 0 6px 6px;
			}
			#close-chat
			{
				position:absolute;
				top:2px;
				right:2px;
				font-size:24px;
				border:1px solid #dedede;
				width:20px;
				background:#fefefe;
				z-index:2
			}
			#minim-chat,#maxi-chat
			{
				position:absolute;
				top:0;
				left:0;
				width:100%;
				height:20px;
				line-height:20px;
				cursor:pointer;
				z-index:1
			}
			.minim-button
			{
				position:absolute;
				top:2px;
				right:26px;
				font-size:24px;
				border:1px solid #dedede;
				width:20px;
				background:#fefefe
			}
			.maxi-button
			{
				position:absolute;
				top:2px;
				right:26px;
				font-size:24px;
				border:1px solid #dedede;
				width:20px;
				background:#fefefe;
			}
			.chat-text
			{
				position:absolute;
				top:5px;
				left:10px;
				color:#fff;
				font-size:16px;
			}
			#chat
			{
				width:5%;
				height:30px !important;
				position:fixed;
				top:10;
				right:0 !important;
				margin-top:0.5%;
				margin-right:1%;
				border-radius:3px;
				border-color:#00a69c;
				padding:5px 8px 5px 8px;
				font-size:12px;
				background-color:#00a69c;
				color:#fff;
				z-index:1;
				-webkit-transform:translateZ(0);
				transform:translateZ(0)
			}
			#chat:before
			{
				border-width:10px 11px 0 0;
				border-color:#A8A8A8 transparent transparent;
				left:7px;
				bottom:-10px
			}
			#chat:after
			{
				border-width:9px 8px 0 0;
				border-color:#00a69c transparent transparent;
				left:8px;
				bottom:-8px
			}
			#chat:hover
			{
				background:#ff6666;
				border-color:#ff6666;
				-webkit-animation-name:hvr-pulse-grow;
				animation-name:hvr-pulse-grow;
				-webkit-animation-duration:.3s;
				animation-duration:.3s;
				-webkit-animation-timing-function:linear;
				animation-timing-function:linear;
				-webkit-animation-iteration-count:infinite;
				animation-iteration-count:infinite;
				-webkit-animation-direction:alternate;
				animation-direction:alternate
			}
			#chat:hover:after
			{
				border-color:#ff6666 transparent transparent transparent !important;
				background-color:#ff6666 transparent transparent!important;
			}
			.animated-chat
			{
				-webkit-animation-duration:1s;
				animation-duration:1s;
				-webkit-animation-fill-mode:both;
				animation-fill-mode:both;
				-webkit-animation-timing-function:ease-in;
				animation-timing-function:ease-in
			}
			@-webkit-keyframes tada
			{	
				0%
				{
					-webkit-transform:scale(1)
				}
				10%,20%
				{
					-webkit-transform:scale(.9)rotate(-3deg)
				}
				30%,50%,70%,90%
				{
					-webkit-transform:scale(1.1)rotate(3deg)
				}
				40%,60%,80%
				{
					-webkit-transform:scale(1.1)rotate(-3deg)
				}
				100%
				{
					-webkit-transform:scale(1)rotate(0)
				}
			}
			@keyframes tada
			{
				0%
				{
					transform:scale(1)
				}
				10%,20%
				{
					transform:scale(.9)rotate(-3deg)
				}
				30%,50%,70%,90%
				{
					transform:scale(1.1)rotate(3deg)
				}
				40%,60%,80%
				{
					transform:scale(1.1)rotate(-3deg)
				}
				100%
				{
					transform:scale(1)rotate(0)
				}
			}
			.tada
			{
				-webkit-animation-name:tada;
				animation-name:tada
			}
			@-webkit-keyframes hvr-pulse-grow
			{
				to
				{
					-webkit-transform:scale(1.1);
					transform:scale(1.1)
				}
			}
			@keyframes hvr-pulse-grow
			{
				to
				{
					-webkit-transform:scale(1.1);
					transform:scale(1.1)
				}
			}
			
			@media only screen and (max-width:768px)
			{
				#chat
				{
					width:50%;
					height:30px !important;
					position:relative;
					top:10;
					left:0 !important;
					border-color:#ff6666;
					background-color:#ff6666;
					z-index:0;
				}
				#chat:after
				{
					border-width:9px 8px 0 0;
					border-color:#ff6666 transparent transparent;
					left:8px;
					bottom:-8px
				}
				#chat:hover
				{
					background:#00a69c;
					border-color:#00a69c;
					-webkit-animation-name:hvr-pulse-grow;
					animation-name:hvr-pulse-grow;
					-webkit-animation-duration:.3s;
					animation-duration:.3s;
					-webkit-animation-timing-function:linear;
					animation-timing-function:linear;
					-webkit-animation-iteration-count:infinite;
					animation-iteration-count:infinite;
					-webkit-animation-direction:alternate;
					animation-direction:alternate
				}
				#chat:hover:after
				{
					border-color:#00a69c transparent transparent transparent !important;
					background-color:#00a69c transparent transparent!important;
				}
			}
		</style>
		
		<!-- <style>
			.dropbtnClass {
			    background-color: #efefef !important;
			    color: #4e4e4e;
			    padding: 10px;
			    font-size: 13px;
			    border: none;
			}
			.dropdownNavClass {
			    position: relative !important;
			    display: inline-block !important;
			}
			
			.dropdown-content {
			    display: none !important;
			    position: absolute !important;
			    background-color: #f9f9f9 !important;
			    min-width: 160px !important;
			    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2) !important;
			    z-index: 1 !important;
			}
			
			.dropdown-content a {
			    color: black !important;
			    padding: 12px 16px !important;
			    text-decoration: none !important;
			    display: block !important;
			}
			
			.dropdown-content a:hover 
			{
				background-color: #f1f1f1 !important;
			}
			
			.dropdownNavClass:hover .dropdown-content {
			    display: block;
			}
						
		</style> -->
		
	
<script src="https://cdnjs.cloudflare.com/ajax/libs/annyang/2.6.0/annyang.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/SpeechKITT/0.3.0/speechkitt.min.js"></script>
	
</head>

<body ng-app="App" ng-controller="viewController as view">

<!-- navbar start-->


<div class="container-fluid menuDiv" style="">
	<nav class="navbar navbar-default navClass">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>                        
	      </button>
	      <!--<a href="student_index.html" class="navbar-brand"><img class="logo" src="images/cvcorpLogo.png"></a>-->
	    </div>
	    <div class="collapse navbar-collapse navCollapseClass" id="myNavbar">
	     <ul style="float:left;">
	     	<li style="list-style-type: none;"><i class="fa fa-refresh fa-spin fa-3x fa-fw" style="float:left;display:none;color:#4e4e4e;" id="ajaxPageLoader"></i></li>
	     </ul>
	     <ul class="nav navbar-nav" style="float:right;">
	     		
		        <li class="active">
		        	<a href="#" onclick="displayDiv('welcome')" style="font-size: 12px !important;"><!--<i class="fa fa-home" aria-hidden="true"></i>--> HOME</a>
		        </li>
		        <li class="dropdown" style="font-size: 12px !important;">
					<a class="dropdown-toggle dropbtnClass" style="cursor:pointer;" data-toggle="dropdown"><!-- <i class="fa fa-users" aria-hidden="true"></i> --> STUDENT'S<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li>
							<a style="cursor:pointer;font-size: 12px !important;" onclick="displayDiv('stArea')" ng-click="view.requestAllStudents()"><!-- <i class="fa fa-users" aria-hidden="true"></i> --> View Students</a>
						</li>
						<li>
							<a href="#" onclick="displayDiv('regForm')" style="font-size: 12px !important;"><!-- <i class="fa fa-user" aria-hidden="true"></i> --> Register a New Student</a>
						</li>
						<li>
							<a href="#" onclick="displayDiv('uploadFile')" style="font-size: 12px !important;"><!-- <i class="fa fa-upload" aria-hidden="true"></i> --> Upload Assignment File</a>
						</li>
						<li><a onclick="displayDiv('takeAttendance');verifyPresents();" style="font-size: 12px !important;"><!-- <i class="fa fa-male" aria-hidden="true"></i> --> Take Attendance</a></li>
					</ul>
				</li>
		<!-- Multiple choice menu begin-->
		
		<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#" style="font-size: 12px !important;"><!-- <i class="fa fa-check-square" aria-hidden="true"></i> --> MULTICHOICE<span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a style="cursor:pointer;font-size: 12px !important;" onclick="displayDiv('pushQuestion')"> Push a New Question To DB</a></li>
				<li><a style="cursor:pointer;font-size: 12px !important;" onclick="displayDiv('createQuestion')"> Create a New QP</a></li>
				<li><a style="cursor:pointer;font-size: 12px !important;" onclick="sendData('getQuestionPapers/','Multiple','listQPapers',-1); displayDiv('qpapers')" > View QP's</a></li>			
			</ul>
		</li>
		
			<!-- Multiple choice menu end-->
			
			<!-- QA menu begin-->
		
			<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#" style="font-size: 12px !important;"><!-- <i class="fa fa-question-circle" aria-hidden="true"></i> --> THEORETICAL<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a style="cursor:pointer;font-size: 12px !important;" onclick="displayDiv('QApushQuestion')"> Push a New Question To DB</a></li>
					<li><a style="cursor:pointer;font-size: 12px !important;" onclick="displayDiv('QAcreateQuestion')"> Create a New QP</a></li>
					<li><a style="cursor:pointer;font-size: 12px !important;" onclick="sendData('getQuestionPapers/','QA','listQAQPapers',-1); displayDiv('QAqpapers')"> View QP's</a></li>
				</ul>
			</li>
				
			<!-- QA menu end-->
			
		<!-- View syllabus begin -->
			
			<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" style="font-size: 12px !important;"><!-- <i class="fa fa-book" aria-hidden="true"></i><i class="fa fa-book" aria-hidden="true"></i> --> SYLLABUS<span class="caret"></span></a>
			<ul class="dropdown-menu">
			<li><a style="cursor:pointer;font-size: 12px !important;" onclick="displayDiv('aptiSyllabus')">Aptitude & Reasoning</a></li>
			<li><a style="cursor:pointer;font-size: 12px !important;" onclick="displayDiv('javaSyllabus')">Technical</a></li>
			<li><a style="cursor:pointer;font-size: 12px !important;" onclick="displayDiv('commSyllabus')">Communication</a></li>
			<li><a style="cursor:pointer;font-size: 12px !important;" onclick="displayDiv('linuxSyllabus')">Linux & Database</a></li>
			</ul>
			</li>	
			
		<!--View Syllabus end-->
		
		<!-- organize batches start-->
		
			<li class="dropdown">
			
			<a class="dropdown-toggle" data-toggle="dropdown" style="font-size: 12px !important;"><!-- <i class="fa fa-users" aria-hidden="true"></i> --> BATCHES<span class="caret"></span></a>
			<ul class="dropdown-menu">
			<li><a onclick="displayDiv('addBatch')" style="font-size: 12px !important;"> Enroll a New Batch </a></li>
			<li><a onclick="displayDiv('viewBatches')" style="font-size: 12px !important;"> View All Batches and Info</a></li>
			 <li><a href="#" onclick="displayDiv('welcome')" style="font-size: 12px !important;"><!-- <i class="fa fa-hourglass-start" aria-hidden="true"></i> --> Batch-Progress</a></li>
			</ul>
			
			</li>
			
		<!--organize batches end-->
		
		
		<!-- batch progress start-->
	       
	
		<!-- batch progress end--> 
		
		
			<li class="dropdown">
			
			<a class="dropdown-toggle" data-toggle="dropdown" style="font-size: 12px !important;"><!-- <i class="fa fa-flag-o" aria-hidden="true"></i> --> NOTIFICATIONS<span class="caret"></span></a>
			<ul class="dropdown-menu">
			<li><a onclick="displayDiv('viewNotifications')" style="font-size: 12px !important;"> View All Posted Notifications</a></li>
			<li><a onclick="displayDiv('addNotification')" style="font-size: 12px !important;"> Post a New Notification</a></li>
			</ul>
			</li>
			<li style="border-left: 1px solid #dbdbdb;border-right: 1px solid #dbdbdb;font-size: 12px !important;" class="dropdown"><a class="dropdown-toggle" style="cursor:pointer;" data-toggle="dropdown"><i style="padding:14%;float:left;border:1px solid #4e4e4e;border-radius: 50%;" class="fa fa-user" aria-hidden="true"></i><span style="float:right;    margin-top: 35%;" class="caret"></span></a>
			   <ul class="dropdown-menu" style="left:-107px !important;">
			   		<li><p style="color:#444 !important;padding-left: 4%;font-size: 12px !important;text-align:left;">Welcome <span style="letter-spacing:1px;font-family: Segoe UI Semibold !important;font-weight:600;font-size:12px;"><i><%=name %></i></p></li>
					<li><p class="welcomeDate" id="welDate"></p></li>
			   		<li><p style="margin-left:1%"><a onclick="displayDiv('changePassword')" style="text-align:left;color:#444;cursor:pointer;font-size: 12px !important;"><i style="color:#444;" class="fa fa-wrench" aria-hidden="true"></i> Change Password</a></p></li>
			   		<li><p style="margin-left:1%"><a href="Logout" style="color:#444;text-decoration:none;"><i style="color:#444;text-align:left;font-size: 12px !important;" class="fa fa-power-off" aria-hidden="true"></i> Logout</a></p></li>
				</ul>
			</li>
	      </ul>
	    </div>
	  </div>
	</nav>
</div>

<!-- navbar end-->
	
<!--Notification Response -->
	
  
  <div id="success" style="position:fixed;text-align:center !important;z-index:1;color:#fff;right:0%;top:0%;border:1px solid #00a69c !important;background-color:green !important;display:none;opacity:1 !important;">
  	<strong>Success!</strong><p id="reportT"> </p>
  </div>
  
  <div id="fail" style="position:fixed;text-align:center !important;z-index:1;color:#fff;background-color:red !important;right:0%;top:0%;border:1px solid #ff6666 !important;display:none;opacity:1 !important;">
  	<strong>Not success!</strong><p id="reportF"> </p>
  </div>
 
  
  <!--End of response-->
  
  <!-- Chat box code start  -->
			<div id="chat" class="animated-chat tada" onclick="loadChatbox();speakBegin()"><span>Help </span><span><i class="fa fa-question-circle-o" aria-hidden="true"></i></span> </div>
			<div class="chatbox" id="chatbox">
			<span class="chat-text">Hello <%=name %></span>
			<script>
			document.write('<div id="smartchatbox_img901621879" style="width: 280px; height: 260px;background-color:#fff; overflow: hidden; margin: auto; padding: 0;">');
			document.write('<div id="smartchatbox901621879" style="width: 280px; height: 260px;background-color:#fff; overflow: hidden; margin: auto; padding: 0; border:0; ">');
			document.write('Can I Create a New QuestionPaper?<br>'+
					   '<small>By the way, I can create a new question paper with the random'+
					    'questions and random topics.</small>'+
					   '<br>'+
					   '<button style="border:1px solid #00a69c !important;border-radius:5px;font-size:12px;background-color: transparent !important;color:#00a69c;"  onclick="assistantCreateQuestionPaper(\'Y\')">YES</button><button style="border:1px solid #00a69c !important;border-radius:5px;font-size:12px;background-color: transparent !important;color:#00a69c;" onclick="assistantCreateQuestionPaper(\'N\')" >NO</button></div></div>');
			
			</script>
			<span id="close-chat" onclick="closeChatbox()">&times;</span>
			<div id="minim-chat" onclick="minimChatbox()"><span class="minim-button">&minus;</span></div>
			<div id="maxi-chat" onclick="loadChatbox()"><span class="maxi-button">&plus;</span></div>
			</div>
			
			<script>
			
			function loadChatbox()
			{
				var e=document.getElementById("minim-chat");
				e.style.display="block";
				var e=document.getElementById("maxi-chat");
				e.style.display="none";
				var e=document.getElementById("chatbox");
				e.style.margin="0";
			}
			function closeChatbox()
			{
				var e=document.getElementById("chatbox");
				e.style.margin="0 0 -450px 0";
				responsiveVoice.speak("OK");
			}
			function minimChatbox()
			{
				var e=document.getElementById("minim-chat");
				e.style.display="none";
				var e=document.getElementById("maxi-chat");
				e.style.display="block";
				var e=document.getElementById("chatbox");
				e.style.margin="0 0 -260px 0";
			}
			
			</script>
		<!-- Chat box code end  -->
  
  
 
	<!-- container starts here-->
		<div class="container-fluid" style="width:100%;margin-top:0.3%;">
			<div class="row" style="border:1px solid gray;">
	          	
<!-- Welcome Page-->	

<div id="welcome" class="container-fluid welcomeRow" style="margin-top:10%;">
  
    <div class="row">
        <div class="col-md-3 col-sm-3 col-xs-12">
        
        <div style="margin-top:5% !important;border-right:1px solid #4e4e4e;">
        <c:forEach items="${batches }" var="b">
            <div class="dropdown" style="margin:auto !important;">
                <button class="btn btn-default dropdown-toggle" style="width:30%;border:1px solid #ff6666 !important;margin-top:2% !important;" type="button" id="menu1" data-toggle="dropdown">Batch ${b.getBatchNumber() }
                <span class="caret"></span></button>
                <ul class="dropdown-menu dropdown-menu-left" style="margin-left:31%;margin-top: -8%;" role="menu" aria-labelledby="menu1">
                    <li role="presentation"><a onclick="getProgress('getProgress/${b.getBatchNumber()}/Math',${b.getBatchNumber()},'Math')" role="menuitem" href="#">Aptitude</a></li>
                    <li role="presentation"><a onclick="getProgress('getProgress/${b.getBatchNumber()}/Java',${b.getBatchNumber()},'Java')" role="menuitem" href="#">Java</a></li>
                    <li role="presentation"><a onclick="getProgress('getProgress/${b.getBatchNumber()}/Comms',${b.getBatchNumber()},'Comms')" role="menuitem" href="#">Communication</a></li>
                    <li role="presentation"><a onclick="getProgress('getProgress/${b.getBatchNumber()}/Linux',${b.getBatchNumber()},'Linux')" role="menuitem" href="#">Linux</a></li>
                </ul>
            </div>
            
          </c:forEach> 
          </div>
        </div>
        <div class="col-md-2 col-sm-2 col-xs-12">
        	<div id="updateProgress">
                <h3 style="text-align:center !important;top:20%;right:30%">WELCOME TO THE PORTAL</h3>  
             </div> 
        </div>
        <div class="col-md-7 col-sm-7 col-xs-12">
           <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                   <canvas id="progressPieChart" style="width:100%;height: 300px;"></canvas>                
               </div>
           </div>
        </div>
    </div>
    <br>
    <div class="row">
    <div class="col-sm-6 col-xs-12 col-md-6" id="TopicsFinished"></div>
    <div class="col-sm-6 col-xs-12 col-md-6" id="TopicsUnFinished"></div>
    </div><br>
</div>
	
<!-- Welcome Page end-->
	

<!-- Take attendance Page begin-->	


<div class="container-fluid" style="display:none;" id="takeAttendance">

</div>
	
	
<!-- Take attendamce Page end-->
	

	
	
<!-- student details form begin-->
	
<!-- style="margin-top: -2% !important;margin-left: -1.6%;margin-right: -1.6%;" -->
	
<div id="regForm" style="display:none;">
	<div class="container-fluid" style="padding:0px !important;margin-bottom:5%;margin-top:2%;">
	<form id='registration' onsubmit="return false" class="form-horizontal">
		<div class="row" style="margin:0px !important;">
			<div class="col-md-2" style="background-color:#2F3D4D;height:370px;margin:0px !important;">
				<div class="nav nav-tabs scrollmenuForReg" id="menu-centerForReg">
	             <a data-toggle="tab" class="active regFomLinkClass" href="#personalForm">Personal</a><br>
	             <a data-toggle="tab" class="regFomLinkClass" href="#eduactionForm">Education</a><br>
	             <a data-toggle="tab" class="regFomLinkClass" href="#feeForm">Fee</a><br>
	             <a data-toggle="tab" class="regFomLinkClass" href="#placementForm">Placement</a><br>
	             <a data-toggle="tab" class="regFomLinkClass" href="#otherForm">Social Links</a>
	       		 </div>
       		 <div class="form-group" style="margin-top:50%;"> 
				<div class="col-sm-12">
					<input type="submit" onclick="sendData('registerStudent?','','',0); return false;" value="Register" class="btn btn-default regBtnNewStyleInOtherPlace">
				</div>
			</div>
			</div>
			<div class="col-md-10" style="margin: 0% !important;">
					<div class="tab-content" style="margin-left: -1.4% !important;margin-top: -2% !important;margin-right: -1.6% !important;">
						<div id="personalForm" class="tab-pane fade in active formTabsClassBack">
			                <h3 class="addFormHeadClass">Personal Details</h3>
			                <div class="row">
		                       <div class="col-md-6">
		                            <div class="form-group formGroupClassReg">
		                                <label for="fullname" class="labelClassRegStd">Full Name</label>
		                                <input type="text" name="fullName" class="form-control formInputClassReg" id="fullName" placeholder="Enter Full Name" required>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="email" class="labelClassRegStd">Email</label>
		                                <input type="email" name="email" class="form-control formInputClassReg" id="email" placeholder="Enter email" required>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="dob" class="labelClassRegStd">DateOfBirth</label>
		                                <input type="date" name="dob" class="form-control formInputClassReg" id="dob" placeholder="Enter Date of Birth" required>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="email" class="labelClassRegStd">Gender</label>
		                                <label class="radio-inline labelClassRegStd">
		                                <input type="radio" value="male" checked name="gender">Male
		                                </label>
		                                <label class="radio-inline labelClassRegStd">
		                                <input type="radio" value="female" name="gender">Female
		                                </label>
		                            </div>
		                      
		                            <div class="form-group formGroupClassReg">
		                                <label for="mobile" class="labelClassRegStd">Student Mobile</label>
		                                <input type="text" name="mobile" class="form-control formInputClassReg" id="mobile" placeholder="Enter mobile number" required>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="mobile_Parent" class="labelClassRegStd">Parent Mobile</label>
		                                <input type="text" name="mobile_Parent" class="form-control formInputClassReg" id="mobile_Parent" placeholder="Enter Emergency mobile number" required>
		                            </div>
		                       </div>
		                       <div class="col-md-6">
		                            
		                            <div class="form-group formGroupClassReg">
		                                <label for="parentName" class="labelClassRegStd">Emergency Contact Person</label>
		                                <input type="text" name="parentName" class="form-control formInputClassReg" id="parentName" placeholder="Enter Emergency Contact Person" required>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="locality" class="labelClassRegStd">Address</label>
		                                <textarea name="locality" style="height:54px !important;padding: 3px 4px !important;" placeholder="Enter your address" class="form-control formInputClassReg" rows="5"  id="locality" required></textarea>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="city" class="labelClassRegStd">City</label>
		                                <input type="text" name="city" class="form-control formInputClassReg" id="city" placeholder="Enter city" required>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="email" class="labelClassRegStd">State</label>
		                                <select name="state" class="form-control formInputClassReg" style="height:32px !important;padding: 3px 4px !important;" id="state">
										  <option value="" selected disabled>Select state</option>
										  <option value="AndhraPradesh">Andhra Pradesh</option>
										  <option value="Telangana">Telangana</option>
										  <option value="Others">Others</option>
										</select>
		                            </div>
		                        </div>
				            </div>
						</div>
						
						<div id="eduactionForm"  class="tab-pane fade formTabsClassBack">
							<h3 class="addFormHeadClass">Education Details</h3>
			                <div class="row">
		                       <div class="col-md-6">
		                            <div class="form-group formGroupClassReg">
		                                <label for="sscPercentage" class="labelClassRegStd">SSC Percentage</label>
		                                <input type="number" name="sscPercentage" class="form-control formInputClassReg" id="sscPercentage" placeholder="Enter SSC Percentage" required>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="interPercentage" class="labelClassRegStd">Inter Percentage</label>
		                                <input type="number" name="interPercentage" class="form-control formInputClassReg" id="interPercentage" placeholder="Enter Inter Percentage " required>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="graduationPercentage" class="labelClassRegStd">Graduation Percentage</label>
		                                <input type="number" name="graduationPercentage" class="form-control formInputClassReg" id="graduationPercentage" placeholder="Enter graduation percentage" required>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="math10th" class="labelClassRegStd">10Th Math Marks</label>
		                                <input type="number" name="math10th" class="form-control formInputClassReg" id="math10th" placeholder="Enter 10th marks in maths" required>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="math12th" class="labelClassRegStd">Inter Math marks</label>
		                                <input type="number" name="math12th" class="form-control formInputClassReg" id="math12th" placeholder="Enter inter marks in maths" required>
		                            </div>
		             
		                            
		                       </div>
		                       <div class="col-md-6">
		                       		<div class="form-group formGroupClassReg">
		                                <label for="graduationCollege" class="labelClassRegStd">Graduation College Name</label>
		                                <input type="text" name="graduationCollege" class="form-control formInputClassReg" id="graduationCollege" placeholder="Enter Graduation College" required>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="graduationCity" class="labelClassRegStd">College Location</label>
		                                <input type="text" name="graduationCity" class="form-control formInputClassReg" id="graduationCity" placeholder="Enter city" required>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="graduationYOP" class="labelClassRegStd">Graduation YOP</label>
		                                <input type="number" name="graduationYOP" class="form-control formInputClassReg" placeholder="Enter Graduation YOP" id="graduationYOP">
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="graduationType" class="labelClassRegStd">Graduation Type</label>
		                                <select name="graduationType" class="form-control formInputClassReg" style="height:32px !important;padding: 3px 4px !important;" id="graduationType">
										 <option value="BTech">BTech</option>
										 <option value="MTech">MTech</option>
										 <option value="MBA">MBA</option>
										 <option value="MCA">MCA</option>
										 <option value="Degree">Degree</option>
										  <option value="Others">Others</option>
										 </select>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="graduationBranch" class="labelClassRegStd">Garduation Branch</label>
		                                <select name="graduationBranch" style="height:32px !important;padding: 3px 4px !important;" class="form-control formInputClassReg" id="graduationBranch">
										  <optgroup label="B Tech or M Tech Branches">
										  <option value="CSE">CSE</option>
										  <option value="IT">IT</option>
										  <option value="ECE">ECE</option>
										  <option value="EEE">EEE</option>
										  <option value="MECH">MECH</option>
										  <option value="CIVIL">CIVIL</option>
										  <option value="Aeronautical">Aeronautical</option>
										  <option value="Electronics & Instrumentation Engineering">Electronics & Instrumentation Engineering</option>
										  <option value="Mechatronics Engineering">Mechatronics Engineering</option>
										  <option value="other">Any other</option>
										  </optgroup>
										  
										  <optgroup label="Any other">
										   <option value="Other">Any Other</option>
										  </optgroup>
										  
										  <optgroup label="Degree groups">
										  <option value="BSC Computers">BSC Computers</option>
										  <option value="BSC General">BSC General</option>
										  <option value="BCom">BCom</option>
										   <option value="BA">BA</option>
										   <option value="Other">Any Other</option>
										  </optgroup>
										  </select>
		                            </div>
		                        </div>
				            </div>
				         </div>
						
						<div id="feeForm"  class="tab-pane fade formTabsClassBack">
							<h3 class="addFormHeadClass">Fee Details</h3>
			                <div class="row">
		                       <div class="col-md-6">
		                            <div class="form-group formGroupClassReg">
		                                <label for="batchNumber" class="labelClassRegStd">Batch Number</label>
		                                <select name="batchNumber" style="height:32px !important;padding: 3px 4px !important;" class="form-control formInputClassReg">
											<c:forEach items="${batches }" var="b">
											<option value="${b.getBatchNumber() }" selected>${b.getBatchNumber() }</option>
											</c:forEach>
										</select>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="feePaid" class="labelClassRegStd">FeePaid</label>
		                                <input type="number" name="feePaid" class="form-control formInputClassReg" id="feePaid" placeholder="Enter Fee Paid" required>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="feeTotal" class="labelClassRegStd">TotalFee</label>
		                                <input type="number" name="feeTotal" class="form-control formInputClassReg" id="feeTotal" placeholder="Enter Fee Total" required>
		                            </div>
		             				<div class="form-group formGroupClassReg">
		                                <label for="email" class="labelClassRegStd">Free</label>
		                                <label class="radio-inline labelClassRegStd">
		                                <input type="radio" value="feeFreeyes" name="feefree">Yes
		                                </label>
		                                <label class="radio-inline labelClassRegStd">
		                                <input type="radio" value="feeFreeno" checked name="feeFree">No
		                                </label>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="joinDate" class="labelClassRegStd">Join Date</label>
		                                <input type="date" name="joinDate" class="form-control formInputClassReg" id="joinDate" placeholder="YYYY/MM/DD" required>
		                            </div>
		                       </div>
		                       <div class="col-md-6"></div>
		             		</div>
						</div>
						
						<div id="placementForm"  class="tab-pane fade formTabsClassBack">
							<h3 class="addFormHeadClass">Placement Details</h3>
			                <div class="row">
		                       <div class="col-md-6">
		                            <div class="form-group formGroupClassReg">
		                                <label for="placed" class="labelClassRegStd">Placed</label>
		                                <label class="radio-inline labelClassRegStd">
		                                <input type="radio" value="placedyes" name="placed">Yes
		                                </label>
		                                <label class="radio-inline labelClassRegStd">
		                                <input type="radio" value="placedno" checked name="placed">No
		                                </label>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="companyname" class="labelClassRegStd">Company Name</label>
		                                <input type="text" name="companyname" class="form-control formInputClassReg" id="companyname" placeholder="Enter Company Name" required>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="companyurl" class="labelClassRegStd">Company URL</label>
		                                <input type="text" name="companyurl" class="form-control formInputClassReg" id="companyurl" placeholder="Enter Company URL" required>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="salary" class="labelClassRegStd">Salary</label>
		                                <input type="text" name="salary" class="form-control formInputClassReg" id="salary" placeholder="Enter salary in lakhs" required>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="designation" class="labelClassRegStd">Designation</label>
		                                <input type="text" name="designation" class="form-control formInputClassReg" id="designation" placeholder="Enter designation" required>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="email" class="labelClassRegStd">Technology</label>
		                                <select name="state" class="form-control formInputClassReg" style="height:32px !important;padding: 3px 4px !important;" id="state">
										  <option value="" selected disabled>JAVA</option>
										  <option value="AndhraPradesh">Testing</option>
										  <option value="Telangana">UI-Dev</option>
										  <option value="Others">Others</option>
										</select>
		                            </div>
		                            
		                        </div>
		                        <div class="col-md-6">
		                        	<div class="form-group formGroupClassReg">
		                                <label for="contactperson" class="labelClassRegStd">Contact Person</label>
		                                <input type="text" name="contactperson" class="form-control formInputClassReg" id="contactperson" placeholder="Enter Contact Person Name" required>
		                            </div>
		                             <div class="form-group formGroupClassReg">
		                                <label for="companyurl" class="labelClassRegStd">Contact Person Email</label>
		                                <input type="email" name="personemail" class="form-control formInputClassReg" id="personemail" placeholder="Enter Company Person Email" required>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="personmobile" class="labelClassRegStd">Contact Person Mobile</label>
		                                <input type="number" name="personmobile" class="form-control formInputClassReg" id="personmobile" placeholder="Enter Contact Person Number" required>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="bond" class="labelClassRegStd">Bond</label>
		                                <label class="radio-inline forradiocheckclass">
		                                <input type="radio" value="bondyes" name="bond">Yes
		                                </label>
		                                <label class="radio-inline forradiocheckclass">
		                                <input type="radio" value="bondno" checked name="bond">No
		                                </label>
		                            </div>
		                            <div class="form-group formGroupClassReg">
			                            <label class="checkbox-inline forradiocheckclass">
									      <input type="checkbox" value="certiyes" name="certificatesyes">Certificates
									    </label>
									    <label class="checkbox-inline forradiocheckclass">
									      <input  type="checkbox" value="onlybond" name="onlybond">Only Bond
									    </label>
								    </div>
								    <div class="form-group formGroupClassReg">
		                                <label for="dateofwalkin" class="labelClassRegStd">Date of walkin</label>
		                                <input type="date" name="dateofwalkin" class="form-control formInputClassReg" id="dateofwalkin" placeholder="yyyy/mm/dd" required>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="dateofjoin" class="labelClassRegStd">Date of join</label>
		                                <input type="date" name="dateofjoin" class="form-control formInputClassReg" id="dateofjoin" placeholder="yyyy/mm/dd" required>
		                            </div>
		                       </div>
		             		</div>
						</div>
						
						<div id="otherForm"  class="tab-pane fade formTabsClassBack">
							<h3 class="addFormHeadClass">Social Links</h3>
			                <div class="row">
	                       <div class="col-md-6">
	                            <div class="form-group formGroupClassReg">
	                                <label for="fblink" class="labelClassRegStd">Facebook Link</label>
	                                <input type="text" name="fblink" class="form-control formInputClassReg" id="fblink" placeholder="Enter Facebook Link" required>
	                            </div>
	                            <div class="form-group formGroupClassReg">
	                                <label for="linkedinlink" class="labelClassRegStd">Linkedin Link</label>
	                                <input type="text" name="linkedinlink" class="form-control formInputClassReg" id="linkedinlink" placeholder="Enter Linkedin Link" required>
	                            </div>
	                        </div>
	                        <div class="col-md-6"></div>
						</div>
						<div class="form-group" style="margin-top:10%;"> 
							<div class="col-sm-12">
							<input type="submit" onclick="sendData('registerStudent?','','',0); return false;" value="Register" class="btn btn-default regBtnNewStyle">
							</div>
						</div>
					</div>
				
			</div>
		</div>
		</div>
		</form>
	</div>
</div>

<!-- students details end-->
<!-- Trigger the modal with a button -->
<!-- <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Save To Excel</button> -->

<!-- Modal for save to excel-->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog modal-lg">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Select fields to save to Excel</h4>
      </div>
      <div class="modal-body">
        <div class="container-fluid">
			<div class="row">
				<div class="col-md-4">
					<div class="checkbox">
					  <label><input type="checkbox" name="fieldToSelect" value="0" checked>FullName</label>
					</div>
					<div class="checkbox">
					  <label><input type="checkbox" name="fieldToSelect" value="2" checked>BatchNo</label>
					</div>
					<div class="checkbox">
					  <label><input type="checkbox" name="fieldToSelect" value="3" checked>Email</label>
					</div>
					<div class="checkbox">
					  <label><input type="checkbox" name="fieldToSelect" value="4">Parent Name</label>
					</div>
					<div class="checkbox">
					  <label><input type="checkbox" name="fieldToSelect" value="6" checked>Student Mobile Number</label>
					</div>
					<div class="checkbox">
					  <label><input type="checkbox" name="fieldToSelect" value="7">Gender</label>
					</div>
					<div class="checkbox">
					  <label><input type="checkbox" name="fieldToSelect" value="8" checked>Date Of Birth</label>
					</div>
					
				</div>
				<div class="col-md-4">
					<div class="checkbox">
					  <label><input type="checkbox" name="fieldToSelect" value="9">Graduation City</label>
					</div>
					<div class="checkbox">
					  <label><input type="checkbox" name="fieldToSelect" value="11">Locality</label>
					</div>
					<div class="checkbox">
					  <label><input type="checkbox" name="fieldToSelect" value="14">Parent Mobile Number</label>
					</div>
					<div class="checkbox">
					  <label><input type="checkbox" name="fieldToSelect" value="15">Fee Paid</label>
					</div>
					<div class="checkbox">
					  <label><input type="checkbox" name="fieldToSelect" value="16">Fee Total</label>
					</div>
					<div class="checkbox">
					  <label><input type="checkbox" name="fieldToSelect" value="17" checked>SSC Percentage</label>
					</div>
					<div class="checkbox">
					  <label><input type="checkbox" name="fieldToSelect" value="18" checked>INTER Percentage</label>
					</div>
					
					
				</div>
				<div class="col-md-4">
					<div class="checkbox">
					  <label><input type="checkbox" name="fieldToSelect" value="19" checked>Degree Percentage</label>
					</div>
					<div class="checkbox">
					  <label><input type="checkbox" name="fieldToSelect" value="20">Graduation College</label>
					</div>
					<div class="checkbox">
					  <label><input type="checkbox" name="fieldToSelect" value="21">Graduation YOP</label>
					</div>
					<div class="checkbox">
					  <label><input type="checkbox" name="fieldToSelect" value="22">Graduation Type</label>
					</div>
					<div class="checkbox">
					  <label><input type="checkbox" name="fieldToSelect" value="23">Graduation Branch</label>
					</div>
					<div class="checkbox">
					  <label><input type="checkbox" value="26" checked>Aggregation Percentage</label>
					</div>
					<div class="checkbox">
					  <label><input type="checkbox" name="fieldToSelect" value="28">Join Date</label>
					</div>
					<button type="button" ng-click="view.JSONToCSVConvertor()" class="btn btn-default viewStdBtns" style="float:right;width:20% !important;">Save</button>
				</div>
			</div>
		</div>
      </div>
</div>

  </div>
</div>

<!-- Modal for save to excel-->
<div id="myModalMail" class="modal fade" role="dialog">
  <div class="modal-dialog modal-lg">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Send mail to selected students</h4>
      </div>
      <div class="modal-body">
        <div class="container-fluid">
        	<form id="" class="formClass">
		<div class="row" style="margin-top:1% !important;">
                <div class="form-group">
                    <label class="control-label col-sm-3" for="to">To :</label>
                <div class="col-sm-7" id="mailToStudentTo">
                    <input list="singleStudentMailsList" type="text"class="form-control" onkeyup="getStudentsMails(this.value)"  name="recipients" id="recipientsSt" placeholder="Add recipients" required/>
                     <datalist id="singleStudentMailsList">
                     </datalist>
                     <i class="fa fa-plus-square" onclick="addCC('mailToStudentTo','recipients')" style="cursor:pointer" aria-hidden="true"></i>
                    
                     
                       <div id="mailToStudentTo"></div>
                </div>
                
                <div class="col-sm-2">
                    <input type="button" onclick="displayD('ccrecipientsSt')" class="btn btn-default" style="margin:2px 0px 2px 0px;" name="cc" id="cc" value="CC"/>
                    <input type="button" onclick="displayD('bccrecipientsSt')" class="btn btn-default" name="bcc" id="bcc" value="Bcc"/>
                </div>
                </div>
                
        </div>
       

        <div class="row" style="margin-top:1% !important;display:none;" id="ccrecipientsSt">
                <div class="form-group">
                    <label class="control-label col-sm-3" for="to">Cc :</label>
                <div class="col-sm-7" id="mailToStudentCC">
                    <input type="text"class="form-control"  name="ccrecipients" placeholder="Add Cc"/>
                   <i class="fa fa-plus-square" onclick="addCC('mailToStudentCC','ccrecipients')" style="cursor:pointer" aria-hidden="true"></i>
                </div>
                <div class="col-sm-2"></div>
                </div>
        </div>

        <div class="row" style="margin-top:1% !important;display:none;" id="bccrecipientsSt">
                <div class="form-group">
                    <label class="control-label col-sm-3" for="to">Bcc :</label>
                <div class="col-sm-7" id="mailToStudentbCC">
                    <input type="text"class="form-control"  name="bccrecipients" placeholder="Add Bcc"/>
                    <i class="fa fa-plus-square" onclick="addCC('mailToStudentbCC','bccrecipients')" style="cursor:pointer" aria-hidden="true"></i>
                </div>
                <div class="col-sm-2"></div>
                </div>
        </div>
        
        
        <div class="row" style="margin-top:1% !important;">
            <div class="form-group">
                    <label class="control-label col-sm-3" for="email">Subject :</label>
                <div class="col-sm-7">
                    <textarea name="subject" class="form-control" style="height: 40px !important;" id="subject" placeholder="Enter the subject" rows="3" required></textarea>
                </div>
                <div class="col-sm-2">
                    
                </div>
            </div>
        </div>


        <div class="row" style="margin-top:1% !important;">
            <div class="form-group">
                    <label class="control-label col-sm-3" for="email">Message :</label>
                <div class="col-sm-7">
                    <textarea name="message" class="form-control" style="height: 250px !important;" id="message" placeholder="Enter your message" rows="30" id="comment" required></textarea>
                </div>
                <div class="col-sm-2">
                    
                </div>
            </div>
        </div>
        <div class="row" style="margin:1% 0% 1% 0% !important;">
            <div class="col-md-3"></div>
            <div class="col-md-7">
                <input type="submit" onclick="" class="btn btn-default viewTableBtn" style="width:50% !important;margin:auto !important;display:block !important;" value="send" id="send"/>
            </div>
            <div class="col-md-2"></div>
        </div>
            </form>

		</div>
	  </div>
  	</div>
</div>
</div>
	
<!-- student view div begin-->    

<div id="stArea" style="display:none;border-radius:5px;">
<div class="container-fluid">
	<div style="padding:0% 5% 0% 3.3%;">
		<div class="row">
			<div class="col-md-2"><h1 class="stdHeadhOneForMainHead">Student Details</h1></div>
			<div class="col-md-10"><p class="resultNumClass">{{fstudentsList.length}} / {{view.studentsList.length}}</p></div>
		</div>
        <div style="border-bottom: 1px solid #dbdbdb !important;height: 12px;margin-left:2%;"></div>
	</div>
	<div class="row">
		<div class="col-md-9">
			<div class="row" style="padding:1% 0% 0% 2.5%;">
				<div class="col-md-3">
	                <div class="input-group">
	                    <input type="text" ng-model="studentName" class="form-control inputFirstBox" name="allfields" placeholder="Search Student">
	                    <span class="input-group-addon search-btn"><i class="fa fa-search" aria-hidden="true"></i></span>
	                    <!--<span class="input-group-addon search-btn"><i class="fa fa-question" aria-hidden="true"></i></span>-->
	                </div>
	            </div>
	            <div class="col-md-3"><button class="advancedSearchBtn" data-toggle="modal" data-target="#myModalAdv">Advanced Search <i class="fa fa-search-plus" style="margin-left: 5% !important;" aria-hidden="true"></i></button></div>
                <div class="col-md-2 theadTextDataClass" style="text-align:right;">
				<!--<div class="col-md-4"> <a class="col-md-4" data-toggle="tab" ng-click='view.fetchReport(view.student.email)' href="#progressbar"><button class="profileBtnStd"><i class="fa fa-user-circle" aria-hidden="true"></i></button></a></div> -->
					
                </div>
                <div class="col-md-2"><button class="dropbtn" style="width:80%;float:right;" ng-click="view.resetFilters()"><i class="fa fa-tag" style="" aria-hidden="true"></i> Reset</button></div>
                <div class="col-md-2 dropdown dropdownClass">
				  <button class="dropbtn" style="width:99%;"><i class="fa fa-bars" style="" aria-hidden="true"></i> Actions</button>
				  <div class="dropdown-content">
				    <a data-toggle="modal" data-target="#myModalMail">Send Mail</a>
				    <a data-toggle="modal" data-target="#myModal">Save To Excel</a>
				  </div>
            </div>
		</div>
		<div class="col-md-3"></div>
	</div>
	<div class="row">
		<div class="col-md-9">
			<div class="row" style="padding:1% 0% 0% 2.5%;">
               <div class="col-md-12">
                   <div class="searchFieldsClass" style="height: 38px;">
                   		<div class="row">
                   			<!-- <div class="col-md-1"><p class="selectBoxClass1">YOP</p></div> -->
                   			<div class="col-md-2">
                   				<!-- <div ng-dropdown-multiselect="" options="example14data" selected-model="example14model" checkboxes="true" extra-settings="example14settings"></div> -->
                   				<!-- <select ng-model="yearOfPass" id="multi-select-demoyop" multiple="multiple" style="width:15%;float:left;">
									<option value='2019'>2019</option>
									<option value='2018'>2018</option>
									<option value='2017'>2017</option><option value='2016'>2016</option>
									<option value='2015'>2015</option><option value='2014'>2014</option>
									<option value='2013'>2013</option><option value='2012'>2012</option>
		                        </select>  -->
		                        <div class="dropdown" style="margin-top:-2% !important;">
								    <button class="btn btn-default dropdown-toggle dropMultiSelectBtns" type="button" data-toggle="dropdown">Select YOP
								    <span class="caret"></span></button>
								    <ul class="dropdown-menu" style="font-size:12px;height:200px;overflow-y:scroll;" ng-model="yearOfPass">
								    
								      <li ng-repeat="yV in yearValues"><a tabindex="-1" href="#"><input type="checkbox" ng-model="checkedYears[$index]" ng-true-value="{{yV}}" ng-false-value="-1"/> {{yV}}</a></li> 
								    </ul>
								  </div>
                   			</div>
                   			<!-- <div class="col-md-1"><p class="selectBoxClass1">Batches</p></div> -->
                   			<div class="col-md-2">
                   				<div class="dropdown" style="margin-top:-2% !important;">
								    <button class="btn btn-default dropdown-toggle dropMultiSelectBtns" type="button" data-toggle="dropdown">Select Batch
								    <span class="caret"></span></button>
								    <ul class="dropdown-menu" style="font-size:12px;height:200px;overflow-y:scroll;" ng-model="batchNumber">
	
								      	<li ng-repeat="b in batches"><a tabindex="-1" href="#"><input ng-model="checkedBatches[$index]" ng-true-value="'{{b}}'" ng-false-value="-1" type="checkbox"/>{{b}}</a></li>
								     
								    </ul>
								  </div>
	                   			<!-- <select ng-model="batchNumber" id="multi-select-demobatch" multiple="multiple" style="width:15%;float:left;">
									<c:forEach items="${batches }" var="b">
									<option value='${b.getBatchNumber() }'>${b.getBatchNumber() }</option>
									</c:forEach>
		                         </select> -->	
	                   		</div>
                   			<!-- <div class="col-md-1"><p class="selectBoxClass1">Branch</p></div> -->
                   			<div class="col-md-2">
                   				<div class="dropdown" style="margin-top:-2% !important;">
								    <button class="btn btn-default dropdown-toggle dropMultiSelectBtns" type="button" data-toggle="dropdown">Select Branch
								    <span class="caret"></span></button>
								    <ul ng-model="branchName" class="dropdown-menu" style="font-size:12px;font-family: Segoe UI Semibold;height: 200px;overflow-y: scroll;">
								     
								      <li ng-repeat="bV in branchValues"><a tabindex="-1" href="#"><input type="checkbox" ng-model="checkedBranches[$index]" ng-true-value="'{{bV}}'" ng-false-value="'NA'"/>{{bV}}</a></li>
								      
								    </ul>
								  </div>
                   				<!-- <select ng-model="branchName" style="width:15%;float:left;" id="multi-select-demobranch" multiple="multiple">
                            	   <optgroup label="B Tech or M Tech Branches">
									  <option value="CSE">CSE</option>
									  <option value="IT">IT</option>
									  <option value="ECE">ECE</option>
									  <option value="EEE">EEE</option>
									  <option value="MECH">MECH</option>
									  <option value="CIVIL">CIVIL</option>
									  <option value="Aeronautical">Aero</option>
									  <option value="Electronics & Instrumentation Engineering">EIE</option>
									  <option value="Mechatronics Engineering">ME</option>
									  <option value="other">Any other</option>
									  </optgroup>
									  
									  <optgroup label="Any other">
									   <option value="Other">Any Other</option>
									  </optgroup>
									  
									  <optgroup label="Degree groups">
									  <option value="BSC Computers">BSC(Comp)</option>
									  <option value="BSC General">BSC(Gen)</option>
									  <option value="BCom">BCom</option>
									   <option value="BA">BA</option>
									   <option value="Other">Any Other</option>
									  </optgroup>
	                           		</select>-->
	                           </div>
                   			<!-- <div class="col-md-1"><p class="selectBoxClass1" style="padding-left:1px !important;">GradType</p></div> -->
                   			<div class="col-md-2">
                   				<div class="dropdown" style="margin-top:-2% !important;">
								    <button class="btn btn-default dropdown-toggle dropMultiSelectBtns" type="button" data-toggle="dropdown">Select FeeType
								    <span class="caret"></span></button>
								    <ul class="dropdown-menu" style="font-size:12px;">
								      <li><a tabindex="-1" href="#"><input ng-model="Paid" type="checkbox" value="paid"/> Paid</a></li>
								      <li><a tabindex="-1" href="#"><input ng-model="pPaid" type="checkbox" value="partiallypaid"/> Partially Paid</a></li>
									  <li><a tabindex="-1" href="#"><input ng-model="free" type="checkbox" value="freefees"/> Free</a></li>
								      <li><a tabindex="-1" href="#"><input ng-model="nPaid" type="checkbox" value="notpaid"/> Not Paid</a></li>
								    </ul>
								  </div>
								  <!-- <div class="dropdown" style="margin-top:-2% !important;">
								    <button class="btn btn-default dropdown-toggle dropMultiSelectBtns" type="button" data-toggle="dropdown">Percentages
								    <span class="caret"></span></button>
								    <ul class="dropdown-menu" ng-model="graduationPercentage">
								      <li class="dropdown-submenu">
								        <a class="test" tabindex="-1" href="#">SSC <span class="caret"></span></a>
								        <ul class="dropdown-menu">
								          <li><a tabindex="-1" href="#"><input type="checkbox"/>100 < 90</a></li>
								          <li><a tabindex="-1" href="#"><input type="checkbox"/>89 < 70 </a></li>
										  <li><a tabindex="-1" href="#"><input type="checkbox"/>69 < 50 </a></li>
								        </ul>
								      </li>
									  <li class="dropdown-submenu">
								        <a class="test" tabindex="-1" href="#">Inter <span class="caret"></span></a>
								        <ul class="dropdown-menu">
								          <li><a tabindex="-1" href="#"><input type="checkbox"/>100 < 90</a></li>
								          <li><a tabindex="-1" href="#"><input type="checkbox"/>89 < 70 </a></li>
										  <li><a tabindex="-1" href="#"><input type="checkbox"/>69 < 50 </a></li>
								        </ul>
								      </li>
									  <li class="dropdown-submenu">
								        <a class="test" tabindex="-1" href="#">Degree <span class="caret"></span></a>
								        <ul class="dropdown-menu">
								          <li><a tabindex="-1" href="#"><input type="checkbox"/>100 < 90</a></li>
								          <li><a tabindex="-1" href="#"><input type="checkbox"/>89 < 70 </a></li>
										  <li><a tabindex="-1" href="#"><input type="checkbox"/>69 < 50 </a></li>
								        </ul>
								      </li>
								    </ul>
								  </div> -->
                   				<!-- <select ng-model="graduationType" id="multi-select-demotype" multiple="multiple" style="width:15%;">
									<option value='Btech'>BTech</option><option value='Mtech'>MTech</option><option value='MCA'>MCA</option><option value='MBA'>MBA</option>
									<option value='Degree'>Degree</option><option value='Others'>Others</option>
			                    </select> -->
			                </div>
			                <div class="col-md-2">
			                	<div class="dropdown" style="margin-top:-2% !important;">
								    <button class="btn btn-default dropdown-toggle dropMultiSelectBtns" type="button" data-toggle="dropdown">Select ST Status
								    <span class="caret"></span></button>
								    <ul class="dropdown-menu" style="font-size:12px;" ng-model="feePaid">
								      <li><a tabindex="-1" href="#"><input type="checkbox" value="active"/> Active</a></li>
								      <li><a tabindex="-1" href="#"><input type="checkbox" value="inactive"/> InActive</a></li>
								    </ul>
								</div>
			                </div>
			                <div class="col-md-2">
			                    <i class="fa fa-bars" style="margin-top: 1%;" aria-hidden="true"></i>
                   			</div>
                   		</div>
                   </div>
               </div>
           </div>
           	<!-- Modal -->
		  	<div class="modal fade" id="myModalAdv" role="dialog" style="top:2% !important;">
		        <div class="modal-dialog modal-lg">
		        
		          <!-- Modal content-->
		          <div class="modal-content"  style="margin-top:7%;margin-left:-10%;border-radius:0px !important;border:5px solid #000;">
		            <div class="modal-header">
		              <button type="button" class="close" data-dismiss="modal">&times;</button>
		              <h4 class="modal-title" style="font-size: 20px !important;font-family: Segoe UI Semibold;font-weight: normal;">Advanced Search</h4>
		            </div>
		            <div class="modal-body">
		              <p>Select Search Criteria</p>
		            </div>
		            <div class="modal-footer" style="margin-top:-2% !important;background-color: #f3f4f9;">
		              <div class="row" style="border:1px solid #e5e5e5 !important;">
                   			<div class="col-md-6 modelTableClass" style="pading:1%;">
                   				<table style="width:100%">
                   					<tr>
                   						<td><p class="selectBoxClass1" style="padding-left:1px !important;padding-top: 6% !important;">SSC :</p></td>
                   						<td><input type='text' style="margin-left: 3.5%;" placeholder='SSC Percentage' ng-model="SSC" class='form-control inputFieldClass'></td>
                   					</tr>
                   					<tr>
                   						<td><p class="selectBoxClass1" style="padding-left:1px !important;padding-top: 6% !important;">Inter :</p></td>
                   						<td><input type='text' style="margin-left: 3.5%;" placeholder='Inter Percentage' ng-model="inter" class='form-control inputFieldClass'></td>
                   					</tr>
                   					<tr>
                   						<td><p class="selectBoxClass1" style="padding-left:1px !important;padding-top: 6% !important;">Degree :</p></td>
                   						<td><input type='text' style="margin-left: 3.5%;" placeholder='Degree Percentage' ng-model="degree" class='form-control inputFieldClass'></td>
                   					</tr>
                   					<tr>
                   						<td><p class="selectBoxClass1" style="padding-left:1px !important;padding-top: 6% !important;">Maths(10Th) :</p></td>
                   						<td><input type='text' style="margin-left: 3.5%;" placeholder='10Th Math Marks' ng-model="maths12th" class='form-control inputFieldClass'></td>
                   					</tr>
                   					<tr>
                   						<td><p class="selectBoxClass1" style="padding-left:1px !important;padding-top: 6% !important;">Maths(12Th)  :</p></td>
                   						<td><input type='text' style="margin-left: 3.5%;" placeholder='12Th Math Marks' ng-model="maths12th" class='form-control inputFieldClass'></td>
                   					</tr>
                   					<!-- <tr>
                   						<td><p class="selectBoxClass1" style="padding-left:1px !important;">SSC Percentage :</p></td>
                   						<td>
                   							<select ng-model="sscPercentage" id="multi-select-demoSscForModel" multiple="multiple" style="width:15%;">
												<option value='' selected="selected" disabled>All</option>
												<option value='90'>90</option><option value='80'>80</option><option value='70'>70</option>
												<option value='60'>60</option>
						                    </select>
                   						</td>
                   					</tr>
                   					<tr>
                   						<td><p class="selectBoxClass1" style="padding-left:1px !important;">Inter Percentage :</p></td>
                   						<td>
	                   						<select ng-model="interPercentage" id="multi-select-demoInterForModel" multiple="multiple" style="width:15%;">
						                        <option value='' selected="selected" disabled>All</option>
												<option value='90'>90</option><option value='80'>80</option><option value='70'>70</option>
												<option value='60'>60</option>
						                    </select>
						                </td>
                   					</tr>
                   					<tr>
                   						<td><p class="selectBoxClass1" style="padding-left:1px !important;">Degree Percentage :</p></td>
                   						<td>
                   							<select ng-model="graduationPercentage" id="multi-select-demoDegreeForModel" multiple="multiple" style="width:15%;">
						                        <option value='' selected="selected" disabled>All</option>
												<option value='90'>90</option><option value='80'>80</option><option value='70'>70</option>
												<option value='60'>60</option>
						                    </select>
                   						</td>
                   					</tr>
                   					<tr>
                   						<td><p class="selectBoxClass1" style="padding-left:1px !important;">Maths(10Th) :</p></td>
                   						<td>
                   							<select ng-model="maths10Th" id="multi-select-math10ThForModel" multiple="multiple" style="width:15%;">
						                        <option value='' selected="selected" disabled>All</option>
												<option value='90'>90</option><option value='80'>80</option><option value='70'>70</option>
												<option value='60'>60</option>
						                    </select>
                   						</td>
                   					</tr>
                   					<tr>
                   						<td><p class="selectBoxClass1" style="padding-left:1px !important;">Maths(12Th) :</p></td>
                   						<td>
                   							<select ng-model="maths12Th" id="multi-select-math12ThForModel" multiple="multiple" style="width:15%;">
						                        <option value='' selected="selected" disabled>All</option>
												<option value='90'>90</option><option value='80'>80</option><option value='70'>70</option>
												<option value='60'>60</option>
						                    </select>
                   						</td>
                   					</tr> -->
                   					
                   					<tr>
                   						<td><p class="selectBoxClass1" style="padding-left:1px !important;">State :</p></td>
                   						<td>
                   							 <div class="dropdown inputFieldClass" style="margin-left:3% !important;">
											    <button class="btn btn-default dropdown-toggle dropMultiSelectBtns" type="button" data-toggle="dropdown">Select State
											    <span class="caret"></span></button>
											    <ul class="dropdown-menu" ng-model="state">
											      <li><a href="#"> Telangana</a></li>
											      <li><a href="#"> AndraPradesh</a></li>
												  <li><a href="#"> Other</a></li>
											    </ul>
											  </div>
                   						</td>
                   					</tr>
                   					<tr>
                   						<td><p class="selectBoxClass1" style="padding-left:1px !important;">Gender :</p></td>
                   						<td>
                   							<div class="dropdown inputFieldClass" style="margin-left:3% !important;">
										    <button class="btn btn-default dropdown-toggle dropMultiSelectBtns" type="button" data-toggle="dropdown">Select Gender
										    <span class="caret"></span></button>
										    <ul class="dropdown-menu" ng-model="gender">
										      <li><a href="#"> Male</a></li>
										      <li><a href="#"> Female</a></li>
										    </ul>
										  </div>
                   						</td>
                   					</tr>
                   				</table>
                   			</div>
                   			<div class="col-md-6 modelTableClass" style="pading:1%;">
                   			<table style="width:100%">
                   				<tr>
                   					<td><p class="selectBoxClass1" style="padding-left:1px !important;padding-top: 6% !important;">Placed :</p></td>
                   					<td style="text-align:left;font-size:12px;"><label class="radio-inline"><input type="radio" name="placed" ng-model="yes"> Yes</label>
									<label class="radio-inline"><input type="radio" name="placed" ng-model="no"> No</label></td>
                   				</tr>
                   				<tr>
                   					<td><p class="selectBoxClass1" style="padding-left:1px !important;padding-top: 6% !important;">Company Name :</p></td>
                   					<td><input type='text' style="margin-left: 3.5%;" placeholder='Company Name' ng-model="companyName" class='form-control inputFieldClass'></td>
                   				</tr>
                   				<tr>
                   					<td><p class="selectBoxClass1" style="padding-left:1px !important;padding-top: 6% !important;">Parent Name :</p></td>
                   					<td><input type='text' style="margin-left: 3.5%;" placeholder='Parent Name' ng-model="pname" class='form-control inputFieldClass'></td>
                   				</tr>
                   				<tr>
                   					<td><p class="selectBoxClass1" style="padding-left:1px !important;padding-top: 6% !important;">City :</p></td>
                   					<td><input type='text' style="margin-left: 3.5%;" placeholder='City Name' ng-model="cityname" class='form-control inputFieldClass'></td>
                   				</tr>
                   				<tr>
                   					<td><p class="selectBoxClass1" style="padding-left:1px !important;padding-top: 6% !important;">DOB :</p></td>
                   					<td><input type='text' style="margin-left: 3.5%;" placeholder='yyyy-mm-dd' ng-model="dobDate" class='form-control inputFieldClass'></td>
                   				</tr>
                   				<tr>
                   					<td><p class="selectBoxClass1" style="padding-left:1px !important;padding-top: 6% !important;">GraduationCity :</p></td>
                   					<td><input type='text' style="margin-left: 3.5%;" placeholder='GraduationCity Name' ng-model="gradCityName" class='form-control inputFieldClass'></td>
                   				</tr>
                   				<tr>
                   					<td><p class="selectBoxClass1" style="padding-left:1px !important;padding-top: 6% !important;">College Name :</p></td>
                   					<td><input type='text' style="margin-left: 3.5%;" placeholder='College Name' ng-model="collegename" class='form-control inputFieldClass'></td>
                   				</tr>
                   			</table>
                    	</div>
		              </div>
		              <div class="row" style="margin-top:1%;">
		              	<!-- <div class="col-md-4"></div> -->
		              	<div class="col-md-12">
		              		<button data-dismiss="modal" class="modelSearchBtn close">Search</button>
		              	</div>
		              	<!-- <div class="col-md-2">
		               		<button class="modelCancleBtn">Cancle</button>
		              	</div>
		              	<div class="col-md-4"></div> -->
		              </div>
		            </div>
		          </div>
		          
		        </div>
		      </div>
		      
		      <!-- Modal -->
		  	<div class="modal fade" id="myModalProfile" role="dialog" style="top:2% !important;">
		        <div class="modal-dialog modal-lg">
		        
		          <!-- Modal content-->
		          <div class="modal-content"  style="margin-top:7%;margin-left:-10%;border-radius:0px !important;border:5px solid #000;">
		            <div class="modal-header">
		              <button type="button" class="close" data-dismiss="modal">&times;</button>
		              <h4 class="modal-title" style="font-size: 20px !important;font-family: Segoe UI Semibold;font-weight: normal;">{{view.student.fullName}}</h4>
		            </div>
		            <div class="modal-body">
		              <p>Complete Details of student</p>
		            </div>
		            <div class="modal-footer" style="margin-top:-2% !important;padding:0px 0px 0px -5px !important">
		              <div class="row" style="height:360px;">
		                  <div class="col-md-4"></div>
		                  <div class="col-md-8"></div>
		              </div>
		            </div>
		          </div>
		          
		        </div>
		      </div>
           <div class="row" style="padding:0% 0% 0% 3.2%;">
               <div class="col-md-12 scrollbar" style="width:100.6%;" id="style-7">
               <div class="force-overflow"></div>
                   <table class="table table-bordered tableNewClass">
                       <thead class="theadBackClass">
                           <tr>
                               <th rowspan="2"class="theadTextDataClass" style="width:2%;">
                               <input ng-model="checkAll" type='checkbox' ng-click='selectAll()' type="checkbox"/></th>
                               <th rowspan="2"class="theadTextDataClass" style="width:15%;cursor:pointer">Name
                               	<!-- <span class="glyphicon sort-icon" ng-show="sortKey=='fullName'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->
                               </th>
                               <th rowspan="2" class="theadTextDataClass" style="cursor:pointer">Batch
								<!-- <span class="glyphicon sort-icon" ng-show="sortKey=='batchNumber'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->                             	
                               </th>
                               <th rowspan="2" class="theadTextDataClass" style="cursor:pointer">YOP
                               	<!-- <span class="glyphicon sort-icon" ng-show="sortKey=='graduationYOP'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->
                               </th>
                               <!-- <th rowspan="2" class="theadTextDataClass" style="cursor:pointer" ng-click="sort('feePaid')">Fee
                               	<span class="glyphicon sort-icon" ng-show="sortKey=='feePaid'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                               </th>-->
                               <th rowspan="2" class="theadTextDataClass" style="cursor:pointer">Branch
                               	<!-- <span class="glyphicon sort-icon" ng-show="sortKey=='graduationBranch'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->
                               </th>
                               <th colspan="3" class="theadTextDataClass">Percentages</th>
                               <th colspan="2" class="theadTextDataClass">Math Scores</th>
                               <th colspan="3" class="theadTextDataClass">Progress</th>
                               <th colspan="2" class="theadTextDataClass">Performance</th>
                               <th rowspan="2" class="theadTextDataClass" style="cursor:pointer">Duration
                               	<!-- <span class="glyphicon sort-icon" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->
                               </th>
                           </tr>
                           <tr class="theadBackClass">
                               <th class="theadTextDataClass" style="border-right: 1px solid #ddd !important;cursor:pointer" >10th
                               	<!-- <span class="glyphicon sort-icon" ng-show="sortKey=='sscPercentage'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->
                               </th>
                               <th class="theadTextDataClass" style="cursor:pointer">12th
                               	<!-- <span class="glyphicon sort-icon" ng-show="sortKey=='interPercentage'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->
                               </th>
                               <th class="theadTextDataClass" style="cursor:pointer">G
                               	<!-- <span class="glyphicon sort-icon" ng-show="sortKey=='graduationPercentage'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->
                               </th>
                               <!-- <th class="theadTextDataClass" style="cursor:pointer" ng-click="sort('aggregate')">A
                               	<span class="glyphicon sort-icon" ng-show="sortKey=='aggregate'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                               </th> -->
                               <th class="theadTextDataClass">10th</th>
                               <th class="theadTextDataClass">12th</th>
                               <th class="theadTextDataClass">Apti</th>
                               <th class="theadTextDataClass">Java</th>
                               <th class="theadTextDataClass">Com</th>
                               <th class="theadTextDataClass">Att</th>
                               <th class="theadTextDataClass">Rank</th>
                           </tr>
                       </thead>
                  
                       <tbody ng-repeat="t in ( fstudentsList= (view.studentsList | filter: { graduationType: graduationType, gender: genderI} | filter: sscFilter | filter: interFilter | filter: aggregateFilter | filter: degreeFilter | filter: feeFilter | filter: yearOfPassFilter  | filter: branchFilter | filter: batchFilter ) )">
                           <tr ng-click='view.studentDetails(t,$event)'>
                               <td class="theadTextDataClass"><input ng-click="view.checkStudent(t,$event)" type="checkbox"/></td>
                               <td class="theadTextDataClass">
                 					<p style="float:left;" ng-if="findDuration(t.joinDate) == 'NA'" class="feeNotificationDefault"></p><p style="float:left;" ng-if="findDuration(t.joinDate) > 100 " class="feeNotificationRed"></p><p style="float:left;" ng-if="findDuration(t.joinDate) > 70 && findDuration(t.joinDate) <100" class="feeNotificationYellow"></p><p style="float:left;" ng-if="findDuration(t.joinDate) < 70" class="feeNotificationGreen"></p><p style="text-transform:lowercase;text-align:left !important;cursor:pointer;">{{t.fullName}}</p>
                 				</td>
                               <td class="theadTextDataClass">{{t.batchNumber}}</td>
                               <td class="theadTextDataClass">{{t.graduationYOP}}</td>
                               <!-- <td class="theadTextDataClass">{{t.feePaid}}</td> -->
                               <td class="theadTextDataClass">{{t.graduationBranch}}</td>
                               <td class="theadTextDataClass">{{t.sscPercentage}}</td>
                               <td class="theadTextDataClass">{{t.interPercentage}}</td>
                               <td class="theadTextDataClass">{{t.graduationPercentage}}</td>
                               <!-- <td class="theadTextDataClass">{{view.convertToInt(t.aggregate)}}</td> -->
                               <td class="theadTextDataClass">$80</td>
                               <td class="theadTextDataClass">$80</td>
                               <td class="theadTextDataClass">$80</td>
                               <td class="theadTextDataClass">$80</td>
                               <td class="theadTextDataClass">$80</td>
                               <td class="theadTextDataClass">$80</td>
                               <td class="theadTextDataClass">$80</td>
                               <td class="theadTextDataClass">{{findDuration(t.joinDate)}}</td>
                           </tr>
                       </tbody>
                   </table>
               </div>
           </div>
           <!-- <div class="row">
				<div class="col-md-4">
					<div class="row">
						<div class="col-md-2"><p class="pageShowClass">Show</p></div>
						<div class="col-md-3">
							<select ng-model="pageValues" class="pagerShowSelectClass">
								<option value="10" selected>10</option>
								<option value="20">20</option>
								<option value="30">30</option>
								<option value="40">40</option>
								<option value="50">50</option>
								<option value="60">60</option>
								<option value="70">70</option>
								<option value="80">80</option>
								<option value="90">90</option>
								<option value="100">100</option>
								<option value="110">110</option>
								<option value="120">120</option>
								
							</select>
						</div>
						<div class="col-md-7"><p class="showOutOfResult">1-{{pageValues}} of {{view.studentsList.length}}</p></div>
					</div>
				</div>
				<div class="col-md-8">
					<dir-pagination-controls class="paginationStyleClass" max-size="10" direction-links="true" boundary-links="true"></dir-pagination-controls>
				</div>
			</div>-->
		</div>
		<div class="col-md-3" style="position:sticky !important;top:0;">
			<div class="row">
				<div class="col-md-12">
					<p class="stdHeadhOne">{{view.student.fullName}}</p>
				</div>
			</div>
			<!-- <div style="border-bottom: 1px solid #dbdbdb !important;height: 5px;margin-top:-1%;"></div> -->
			<div class="nav nav-tabs scrollmenu" id="menu-center">
             <a data-toggle="tab" class="active" href="#personal">Personal</a>
             <a data-toggle="tab" href="#eduaction">Education</a>
             <a data-toggle="tab" href="#fee">Fee</a>
             <a data-toggle="tab" href="#address">Address</a>
             
             <a data-toggle="tab" ng-click="editableForm.$show()" ng-show="!editableForm.$visible" title="Edit Student" href="" target='_blank'><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
             <a data-toggle="tab" href='{{"downloadResume/"+view.student.email+"/any"}}' title="Student Resume" target='_blank'><i class="fa fa-file-image-o" aria-hidden="true"></i></a>
             <a data-toggle="tab" onclick="myFunction()" title="Complete Details" href=""><i class="fa fa-external-link" aria-hidden="true"></i></a>
           </div>
           <form editable-form name="editableForm" onaftersave="saveStudent()">
			<div class="tab-content">
			
	        <div id="personal" class="tab-pane fade in active">
	          <table class="table">
       			<thead>
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-user" aria-hidden="true"></i> FullName</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails" editable-text="view.student.fullName" e-name="fullName"> {{view.student.fullName}}</td>
       				</tr>
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-user" aria-hidden="true"></i> ParentName</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails" editable-text="view.student.parentName" e-name="parentName"> {{view.student.parentName}}</td>
       				</tr>
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-user" aria-hidden="true"></i> Gender</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails" editable-select="view.student.gender" e-name="gender" e-ng-options="s.value as s.text for s in genders"> {{view.student.gender}}</td>
       				</tr>
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-calendar" aria-hidden="true"></i> DOB</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails" editable-bsdate="view.student.dob" e-is-open="opened.$data" e-name="dob" e-datepicker-popup="dd-MMMM-yyyy"> {{view.student.dob}}</td>
       				</tr>
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-envelope-o" aria-hidden="true"></i> Email</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails" editable-text="view.student.email" e-name="email"> {{view.student.email}}</td>
       				</tr>
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-mobile" aria-hidden="true"></i> Mobile</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails" editable-text="view.student.mobile" e-name="mobile"> {{view.student.mobile}}</td>
       				</tr>
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-mobile" aria-hidden="true"></i> Parent Mobile</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails" editable-text="view.student.mobile_Parent" e-name="mobile_Parent"> {{view.student.mobile_Parent}}</td>
       				</tr>
       			</thead>
       		</table>
	        </div>
	        <div id="eduaction" class="tab-pane fade">
	        
	          	<table class="table" style="border:0px solid #fff !important;">
                   			<thead>
                   				<tr>
                   					<td class="theadTextDataClassForDetails"><i class="fa fa-users" aria-hidden="true"></i> Batch</td>
                   					<td style="color:#444444 !important">:</td>
                   					<td class="theadTextDataClassForDetails" editable-text="view.student.batchNumber" e-name="batchNumber"> {{view.student.batchNumber}}</td>
                   				</tr>
                   				<tr>
                   					<td class="theadTextDataClassForDetails"><i class="fa fa-calendar-check-o" aria-hidden="true"></i> YOP</td>
                   					<td style="color:#444444 !important">:</td>
                   					<td class="theadTextDataClassForDetails"  editable-text="view.student.graduationYOP" e-name="graduationYOP"> {{view.student.graduationYOP}}</td>
                   				</tr>
                   				<tr>
                   					<td class="theadTextDataClassForDetails"><i class="fa fa-graduation-cap" aria-hidden="true"></i> gType</td>
                   					<td style="color:#444444 !important">:</td>
                   					<td class="theadTextDataClassForDetails" editable-select="view.student.graduationType" e-name="graduationType" e-ng-options="s.value as s.text for s in graduationTypes"> {{view.student.graduationType}}</td>
                   				</tr>
                   				<tr>
                   					<td class="theadTextDataClassForDetails"><i class="fa fa-calendar" aria-hidden="true"></i> Branch</td>
                   					<td style="color:#444444 !important">:</td>
                   					<td class="theadTextDataClassForDetails" editable-select="view.student.graduationBranch" e-name="graduationBranch" e-ng-options="s.value as s.text for s in graduationBranches"> {{view.student.graduationBranch}}</td>
                   				</tr>
                   				<tr>
                   					<td class="theadTextDataClassForDetails"><i class="fa fa-university" aria-hidden="true"></i> College</td>
                   					<td style="color:#444444 !important">:</td>
                   					<td class="theadTextDataClassForDetails" editable-text="view.student.graduationCollege" e-name="graduationCollege"> {{view.student.graduationCollege}}</td>
                   				</tr>
                   				<tr>
                   					<td class="theadTextDataClassForDetails"><i class="fa fa-globe" aria-hidden="true"></i> Grad City</td>
                   					<td style="color:#444444 !important">:</td>
                   					<td class="theadTextDataClassForDetails" editable-text="view.student.graduationCity" e-name="graduationCity"> {{view.student.graduationCity}}</td>
                   				</tr>
                   				<tr>
                   					<th colspan="3" class="theadTextDataClassForDetails subTableHeadingOfEd" style="text-align:center !important;font-weight:600 !important;">% Percentages</th>
                   				</tr>
                   				<tr>
                   					<td class="theadTextDataClassForDetails"><i class="fa fa-bar-chart" aria-hidden="true"></i> 10Th</td>
                   					<td style="color:#444444 !important">:</td>
                   					<td class="theadTextDataClassForDetails" editable-text="view.student.sscPercentage" e-name="sscPercentage"> {{view.student.sscPercentage}}</td>
                   				</tr>
                   				<tr>
                   					<td class="theadTextDataClassForDetails"><i class="fa fa-bar-chart" aria-hidden="true"></i> Inter</td>
                   					<td style="color:#444444 !important">:</td>
                   					<td class="theadTextDataClassForDetails" editable-text="view.student.interPercentage" e-name="interPercentage"> {{view.student.interPercentage}}</td>
                   				</tr>
                   				<tr>
                   					<td class="theadTextDataClassForDetails"><i class="fa fa-bar-chart" aria-hidden="true"></i> Degree</td>
                   					<td style="color:#444444 !important">:</td>
                   					<td class="theadTextDataClassForDetails" editable-text="view.student.graduationPercentage" e-name="graduationPercentage"> {{view.student.graduationPercentage}}</td>
                   				</tr>
            					<tr>
              						<th colspan="3" class="theadTextDataClassForDetails subTableHeadingOfEd" style="text-align:center !important;font-weight:600 !important;">% MathScores</th>
                   				</tr>
                   				<tr>
                   					<td class="theadTextDataClassForDetails"><i class="fa fa-bar-chart" aria-hidden="true"></i> 10Th</td>
                   					<td style="color:#444444 !important">:</td>
                   					<td class="theadTextDataClassForDetails" editable-text="view.student.math10th" e-name="math10th"> {{view.student.graduationPercentage}}</td>
                   				</tr>
                   				<tr>
                   					<td class="theadTextDataClassForDetails"><i class="fa fa-bar-chart" aria-hidden="true"></i> Inter</td>
                   					<td style="color:#444444 !important">:</td>
                   					<td class="theadTextDataClassForDetails" editable-text="view.student.math12th" e-name="math12th"> {{view.student.graduationPercentage}}</td>
                   				</tr>
                   			</thead>
                   		</table>
	        </div>
	        <div id="fee" class="tab-pane fade">
	          <table class="table">
       			<thead>
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-inr" aria-hidden="true"></i> TotalFee</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails" editable-text="view.student.feeTotal" e-name="feeTotal"> {{view.student.feeTotal}}</td>
       				</tr>
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-inr" aria-hidden="true"></i> FeePaid</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails" editable-text="view.student.feePaid" e-name="feePaid"> {{view.student.feePaid}}</td>
       				</tr>
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-inr" aria-hidden="true"></i> FeeDue</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails"> {{(view.student.feeTotal-view.student.feePaid)}}</td>
       				</tr>
       			</thead>
       		</table>
	        </div>
	        <div id="address" class="tab-pane fade">
	            <table class="table">
       			<thead>
       				<tr>
       					<td class="theadTextDataClassForDetails" style="width:18%;"><i class="fa fa-map-marker" aria-hidden="true"></i> H.No</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails" editable-text="view.student.locality" e-name="locality"> {{view.student.locality}}</td>
       				</tr>
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-globe" aria-hidden="true"></i> City</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails" editable-text="view.student.city" e-name="city"> {{view.student.city}}</td>
       				</tr>
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-globe" aria-hidden="true"></i> State</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails" editable-select="view.student.state" e-name="state" e-ng-options="s.value as s.text for s in states"> {{view.student.state}}</td>
       				</tr>
       			</thead>
       		</table>
	        </div>
		        
	        <div id="progressbar" class="tab-pane fade">
	        <div id='progress'></div>
			 	<div class='container-fluid' id='ChartProgress' style='width:96%;margin:auto;border:1px solid #00a69c;border-radius:10px;'>
			 	
			 	<div class='row'>
			 	<span id='ChartAError' style='color:#d00d0d;font-size:20px;'></span>
			 	<canvas id='ChartA'  style='display:none;width:100%;height: auto;'></canvas>
			 	</div>
			 	<div class='row'>
			 	<span id='ChartMError' style='color:#d00d0d;font-size:20px;'></span>
			 	<canvas id='ChartM'  style='display:none;width:100%;height: auto;'></canvas> 	</div>
			 	</div>
	        </div>

	        <div id="placement" class="tab-pane fade">
	        	<h3>Placement</h3>
	        	<p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
	        </div>
	        
	        <div class="row" ng-show="editableForm.$visible" >
              	<div class="col-md-1"></div>
              	<div class="col-md-5">
              		<button type="submit" class="modelSearchBtn" ng-disabled="editableForm.$waiting">Save</button>
              	</div>
              	<div class="col-md-5">
               		<button type="button" class="modelCancleBtn" ng-disabled="editableForm.$waiting" ng-click="editableForm.$cancel()">Cancle</button>
              	</div>
              	<div class="col-md-1"></div>
              </div>
	        </div>
	      	
	        </form>
	    </div>
	</div>
</div>
</div>
</div>

<!-- <div class='container-fluid' style='width:30%;position:fixed;right:0;bottom:0 !important;z-index:10;'><div class='row'>
<div class='col-md-6'><button class='btn btn-default saveBtnsInSearch' style='float:left !important;' data-toggle="modal" data-target="#myModalMail">Send Mail</button></div>
<div class='col-md-6'><button class='btn btn-default saveBtnsInSearch'  data-toggle="modal" data-target="#myModal" style='float:right !important;'>Save To Excel</button></div>
</div></div><br> -->

</div>

<!-- students view end-->
	
	
	
<!-- push a question div start-->

<div id="pushQuestion" style="display: none;border-radius:5px;">
	<p class="push">Push a Question To DB</p>
		<form id="pushQuestionForm" class="form-horizontal formClass" action="pushQuestion" method="get">
		  <h4 style="text-align:center;">Add Question</h4>
		<div class="form-group">
			<label class="control-label col-sm-4" for="question">Enter your Question:</label>
			<div class="col-sm-6 col-xs-12">
			  <textarea name="question" style="height:50px !important" class="form-control" rows="5"  id="questionM" required></textarea>
			</div>
			<div class="col-sm-2"></div>
	  	</div>
	  	
		<!--options starts-->
		<div class="container-fluid">
			<div class="row">
				<div class="form-group">
					<div class="col-md-2"></div>
					<label class="control-label col-md-2" for="optionA">Enter option A:</label>
					<div class="col-md-2">
					<input type="text" name="optionA" class="form-control" id="optionAM" placeholder="Enter option A" required>
					</div>
					<label class="control-label col-md-2" for="optionB">Enter option B:</label>
					<div class="col-md-2">
					<input type="text" name="optionB" class="form-control" id="optionBM" placeholder="Enter option B" required>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
		<div class="container-fluid">
			<div class="row">
				<div class="form-group">
					<div class="col-md-2"></div>
					<label class="control-label col-md-2" for="optionA">Enter option C:</label>
					<div class="col-md-2">
					<input type="text" name="optionC" class="form-control" id="optionCM" placeholder="Enter option C" required>
					</div>
					<label class="control-label col-md-2" for="optionB">Enter option D:</label>
					<div class="col-md-2">
					<input type="text" name="optionD" class="form-control" id="optionDM" placeholder="Enter option D" required>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	
				<div class="row">
				<div class="form-group">
					<div class="col-md-2"></div>
					<label class="control-label col-md-2" for="optionE">Enter option E:</label>
					<div class="col-sm-2">
					  <input type="text" name="optionE" class="form-control" id="optionEM" placeholder="Enter option E" required>
					</div>
					<div class="col-smd-6"></div>
				</div>
				</div>
		<!-- options end here-->
	     
		<!-- select key and select difficulty level starts here-->
		
		<div class="container-fluid">
			<div class="row">
				<div class="form-group">
					<div class="col-md-2"></div>
					<label class="control-label col-md-2" for="optionA">select key:</label>
					<div class="col-md-2">
						<select class="form-control" style="height:32px !important;" name="qkey" id="qkey">
						<option value="A" selected>A</option>
						<option value="B">B</option>
						<option value="C">C</option>
						<option value="D">D</option>
						<option value="E">E</option>
						</select>
					</div>
					<label class="control-label col-md-2" for="optionB">select difficulty level:</label>
					<div class="col-md-2">
						<select class="form-control" style="height:32px !important;" name="difficulty" id="difficulty">
						<option value="Basic" selected>Basic</option>
						<option value="Easy one">Easy one</option>
						<option value="Moderate">Moderate</option>
						<option value="Advance">Not Easy</option>
						<option value="Expertise one">Expertise</option>
						</select>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
		
		<!--select key and difficulty ends here--> 
		
	
		<!--enter topic and subject start  here -->
		
		<div class="container-fluid">
			<div class="row">
				<div class="form-group">
					<div class="col-md-2"></div>
					
					<label class="control-label col-md-2" for="subject">Enter subject:</label>
					<div class="col-md-2">
					<select name="subject" id="questionSubject" style="height:32px !important;" class="form-control">
					<option value="Java">Java</option>
					<option value="Math">Math</option>
					<option value="Linux">Linux And SQL</option>
					<option value="Comms">Comms</option>
					<option value="Misc">Misc</option>
					</select>
					
					</div>
					<label class="control-label col-md-2" for="topic">Enter topic:</label>
					<div class="col-md-2">
					<input type="text" list="topicSuggetions" name="topic" onkeyup="getTopicsList(this.value)" class="form-control" id="topicM" placeholder="Enter topic" required>
					<datalist id="topicSuggetions"></datalist>
					</div>
					
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
		
		<!--enter topic and subject end here -->
		
		<div class="form-group">
			<label class="control-label col-sm-4" for="description">Enter Description:</label>
			<div class="col-sm-6">
			  <input type="text" name="description" class="form-control" id="descriptionM" placeholder="Enter Description" required>
			</div>
			<div class="col-sm-2"></div>
	  	</div>
	  
	  	<div class="form-group">
			<label class="control-label col-sm-4" for="explanation">Give Explanation :</label>
			<div class="col-sm-6">
			  <textarea name="explanation" style="height:50px !important"class="form-control" rows="5"  id="explanationM" required></textarea>
			</div>
			<div class="col-sm-2"></div>
		</div>	  
		
		<div class="form-group"> 
			<div class="col-sm-12 ">
			  <input type="submit" onclick="sendData('pushQuestion?','','',1); return false;" value="Push" class="btn btn-default sub"/>
			</div>
		</div>
	</form>
</div>
			
<!-- push a question end-->	
	
	
	
<!-- create your customized question paper-->

<div id="createQuestion" style="display:none;border-radius:5px;">
	<div class="row">
		
			<div class="col-md-4 col-sm-4 col-xs-12" style="border-right:1px solid #4e4e4e;">
			<form id="createQuestionPaperForm">
			<p class="push">Create your Customized Question Paper<p>
			
			<div class="form-group">
						<div class="row">
							<div class="col-md-6 col-sm-6 col-xs-12"><small id='qcount'></small></div>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<div class="col-md-6">
									<label class="control-label">selected Questions:</label>
								</div>
								<div class="col-md-6">
									<input class="form-control" style="height:30px !important;" type="text" name="questions" id="qts" readonly>
								</div>
							</div>
						</div>
					</div>
				<div class="row">
				<div class="form-group"> 
					<div class="col-md-5 col-sm-6 col-xs-12">
						<label class="control-label testname">Enter Test Name:</label>
					</div>
					<div class="col-md-7 col-sm-6 col-xs-12">
						<input class="form-control" type="text" name="testName" id="testNameM">
					</div>
				</div>
				</div><br>
				<div class="row">
				<div class="form-group"> 
					<div class="col-md-6 col-sm-6 col-xs-12">
					  <small>Note : Do not select batch if you don't want to push now</small>
						<label class="control-label testfor">Test for:</label>
					</div>	
					<div class="col-md-6 col-sm-6 col-xs-12">
					<c:forEach items="${batches }" var="b">
						<label class="checkbox"><input type="checkbox" name="BatchNos" value="${b.getBatchNumber() }">Batch ${b.getBatchNumber() }</label>
						
					</c:forEach>
					</div>
				</div>
				</div><br>
				
				<div style="display:none">
				<input type="text" name="qp_type" value="Multiple">
				</div>
				
				<div class="row">
				<div class="form-group"> 
					<div class="col-md-6 col-sm-6 col-xs-12">
						<label class="control-label testfor">Test Duration in Minutes:</label>
					</div>
					<div class="col-md-6 col-sm-6 col-xs-12">
						<input class="form-control" type="number" id="durationM" name="duration">
					</div>
				</div>
				</div>
				<br>
				<div class="row">
				<div class="form-group"> 
					<div class="col-md-6 col-sm-6 col-xs-12">
						<label class="control-label testfor">Paper Type:</label>
					</div>
					<div class="col-md-6 col-sm-6 col-xs-12">
						<label class="radio"><input type="radio" value="Y" name="isPractice" checked>Practice</label>
						<label class="radio"><input type="radio" value="N" name="isPractice">Test to Examine Students</label>
					</div>
				</div>
				</div><br>
				<input type="submit" onclick="sendData('createQuestionPaper?','','',2); return false;"  value="Create" class="btn btn-primary" style="font-size:16px !important;color:#fff;background-color:#000 !important;border-color:#000 !important;margin:auto !important;display:block !important;"><br>
			</form>
			</div>
			<div class="col-md-8 col-sm-8 col-xs-12">
				<!-- searchquestion here-->
				
				<p class="searchQPClass">SearchQuestion from DB</p>
				<div class="row">
					
					<br>
					<div class="row">
					<div class="form-group">
					
					<div class="col-md-6 col-sm-6 col-xs-12">
					<div class="row" style="border:1px solid #ded4d4">
					<div class="col-md-6 col-sm-6 col-xs-12">
					<label class="control-label col-md-2" for="subject">Subject:</label>
					   <select onchange="setTopicsList(this.value)" name="subject" id="subjectInSearch" style="height:32px !important;" class="form-control">
					<option selected>select</option>
					<option value="Java">Java</option>
					<option value="Math">Math</option>
					<option value="Linux">Linux And SQL</option>
					<option value="Comms">Comms</option>
					<option value="Misc">Misc</option>
					</select>
					 </div>
					 <div class="col-md-6 col-sm-6 col-xs-12">
							<label class="control-label">Search by topic :</label><br>
							<select class="form-control" style="height:30px !important;" onchange="sendData('getQuestionsByTopic/',this.value,'qArea',-1)" id="topicsInSearch">
							
							</select>
							</div>
							</div>
						</div>
						<div class="col-md-3 col-sm-3 col-xs-12" style="border:1px solid #ded4d4">
						<div class="form-group">
							<label class="control-label">Search By Admin :</label><br>
							<select class="form-control" style="height:30px !important;" onchange="sendData('getQuestionsByAdmin/',this.value,'qArea',-1)" class="select">
							<option value="cv" style="font-size:14px;">CV</option>
							<option value="shivakumar" style="font-size:14px;">Shivakumar</option>
							<option value="sandeep" style="font-size:14px;">Sandeep</option>
							<option value="Akanksha" style="font-size:14px;">Akanksha</option>
							<option value="rajkiran" style="font-size:14px;">Rajkiran</option>
							<option value="karunakar" style="font-size:14px;">Karunakar</option>
							<option value="lalitha" style="font-size:14px;">Lalitha</option>
							</select>
						</div>
						</div>
						
						<div class="col-md-3 col-sm-3 col-xs-12" style="border:1px solid #ded4d4">
						<div class="form-group">
							<label class="control-label">Search by question :</label><br>
							<input class="form-control" type="text" style="height:30px !important;" onkeyup="sendData('getQuestionsByQuestion/',this.value,'qArea',-1)" id="topic">
						</div>
						</div>
						
					</div>
					
					</div>
				<br>
						
				<div class="container-fluid" style="width:100%;border:1px solid #4e4e4e;height:330px;overflow:scroll;" id='qArea'></div>
			</div>
			</div>

	</div>
</div>

<!-- question paper ends here-->



	
<!--List Question papers begin -->

<div id="qpapers" style="display:none;border-radius:5px;">
	 <div class="row">
	 	<div class="col-sm-3 scrollClass"  style="border:1px solid black">
	 		<div id="listQPapers"></div>
	 	</div>
	 	
	 <!-- Question paper begin -->
	 
	 	<div class="col-sm-9"  style="border:1px solid black">
			 <div id="viewQPaper">
			Questions Here
			 </div>
	 	</div>
	 
	 <!-- Question paper end -->
	 
	 </div>
</div>
	
<!-- List Question papers end -->
	


<!-- QAPush Question to begin -->

<div id="QApushQuestion" style="display:none;border-radius:5px;">
	<p class="push">Push a Question To DB</p>
		<form id="QApushQuestionForm" class="form-horizontal formClass">
			  <div class="form-group">
				<h4 style="text-align:center;">Add Question</h4>
				<label class="control-label col-sm-4" for="question">Enter your Question:</label>
				<div class="col-sm-6 col-xs-12">
				  <textarea name="question" style="height:50px !important" class="form-control" rows="5"  id="questionQA" required></textarea>
				</div>
				<div class="col-sm-2"></div>
			  </div>
	  
			  
			  
			  <div class="form-group">
				<label class="control-label col-sm-4" for="subject">Select Subject :</label>
				<div class="col-sm-6">
				  <select name="subject" style="height:32px !important;" id="subjectInQA" class="form-control">
					
					<option value="Java">Java</option>
					<option value="Math">Math</option>
					<option value="Linux">Linux And SQL</option>
					<option value="Comms">Comms</option>
					<option value="Misc">Misc</option>
					</select>
				</div>
				<div class="col-sm-2"></div>
			  </div>
			  
			  <div class="form-group">
				<label class="control-label col-sm-4" for="topic">Enter Topic :</label>
				<div class="col-sm-6">
				  <input list="topicsListinQA" type="text" name="topic" onkeyup="getTopicsListQA(this.value)" class="form-control" id="topicQA" placeholder="Enter Topic" required>
				  <datalist id="topicsListinQA">
				  
				  </datalist>
				</div>
				<div class="col-sm-2"></div>
			  </div>
	     
	 <!-- select key and select difficulty level starts here-->
	 
	 	<div class="container-fluid">
			<div class="row">
				<div class="form-group">
					<label class="control-label col-md-4" for="optionB">Select difficulty level:</label>
					<div class="col-md-6">
					<select class="form-control" name="difficulty" id="difficulty" style="height:32px !important;">
						<option value="Basic" selected>Basic</option>
						<option value="Easy one">Easy one</option>
						<option value="Moderate">Moderate</option>
						<option value="Advance">Not Easy</option>
						<option value="Expertise one">Expertise</option>
					</select>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
		
	<!--select key and difficulty ends here--> 
	
		  <div class="form-group">
			<label class="control-label col-sm-4" for="description">Enter Description:</label>
			<div class="col-sm-6">
			  <input type="text" name="description" class="form-control" id="descriptionQA" placeholder="Enter Description" required>
			</div>
			<div class="col-sm-2"></div>
		  </div>
		  
		  <div class="form-group"> 
			<div class="col-sm-offset-2 col-sm-10 ">
			  <input type="submit" value="Push" onclick="sendData('pushQAQuestion?','','',3); return false;" class="btn btn-primary" style="font-size:16px !important;color:#fff;background-color:#000 !important;border-color:#000 !important;margin:auto !important;display:block !important;">
			</div>
		  </div>
	</form>	
</div>
	
<!-- QAPush Question to end -->
	


<!--  customized QA question paper-->
	
<div id="QAcreateQuestion" style="display:none;border-radius:5px;">
	<div class="row">
		<form id="QAcreateQuestionPaperForm">
			<div class="col-md-4 col-sm-4 col-xs-12" style="border-right:1px solid #4e4e4e;">
			<p class="push">Create your Customized Question Paper<p>
				<div class="row">
				<div class="form-group"> 
					<div class="col-md-5 col-sm-6 col-xs-12">
						<label class="control-label testname">Enter Test Name:</label>
					</div>
					<div class="col-md-7 col-sm-6 col-xs-12">
						<input class="form-control" type="text" name="testName" id="testNameQA" required>
					</div>
				</div>
				</div><br>
				<div class="row">
				<div class="form-group"> 
					<div class="col-md-6 col-sm-6 col-xs-12">
						<label class="control-label testfor">Test for:</label>
					</div>	
					<div class="col-md-6 col-sm-6 col-xs-12">
						<c:forEach items="${batches }" var="b">
						<label class="checkbox"><input type="checkbox" name="BatchNos" value="${b.getBatchNumber() }">Batch ${b.getBatchNumber() }</label>
						
					</c:forEach>
					</div>
				</div>
				</div><br>
				
				<div style="display:none">
				<input type="text" name="qp_type" value="QA">
				</div>
				
				<div class="row">
				<div class="form-group"> 
					<div class="col-md-6 col-sm-6 col-xs-12">
						<label class="control-label testfor">Test Duration in Minutes:</label>
					</div>
					<div class="col-md-6 col-sm-6 col-xs-12">
						<input class="form-control" type="number" id="durationQA" name="duration" required>
					</div>
				</div>
				</div>
				<br>
				<div class="row">
				<div class="form-group"> 
					<div class="col-md-6 col-sm-6 col-xs-12">
						<label class="control-label testfor">Paper Type:</label>
					</div>
					<div class="col-md-6 col-sm-6 col-xs-12">
						<label class="radio"><input type="radio" value="Y" name="isPractice" checked>Practice</label>
						<label class="radio"><input type="radio" value="N" name="isPractice">Test to Examine Students</label>
					</div>
				</div>
				</div><br>
				<input type="submit" onclick="sendData('createQuestionPaper?','','QA',4); return false;"  value="Create" class="btn btn-primary" style="font-size:16px !important;color:#fff;background-color:#000 !important;"><br>
			</div>
			<div class="col-md-8 col-sm-8 col-xs-12">
				<!-- searchquestion here-->
				<small id='QAqcount'></small>
				<p class="searchQPClass">SearchQuestion from DB</p>
				<div class="row">
					<div class="form-group">
						<div class="row">
							<div class="col-md-5 col-sm-6 col-xs-12"></div>
							<div class="col-md-7 col-sm-6 col-xs-12">
								<div class="col-md-6">
									<label class="control-label">Your Selected Questions IDs:</label>
								</div>
								<div class="col-md-6">
									<input class="form-control" style="height:30px !important;" type="text" name="questions" id="QAqts" readonly>
								</div>
							</div>
						</div>
					</div>
					<br>
					<div class="row">
					<div class="form-group">
						<div class="col-md-6 col-sm-6 col-xs-12">
						<div class="row" style="border:1px solid #ded4d4">
						<div class="col-md-6 col-sm-6 col-xs-12">
							<label class="control-label">Subject :</label><br>
							<select class="form-control" style="height:30px !important;" onchange="sendData('getQAQuestionsBySubject/',this.value,'QAqArea',-1);setTopicsQA(this.value)">
							<option selected>select</option>
							<option value="Java">Java</option>
							<option value="Math">Math</option>
							<option value="Linux">Linux and SQL</option>
							
							<option value="Comms">Comms</option>
							
					 		<option value="Misc">Misc</option>
						   
							</select>
							</div>
							<div class="col-md-6 col-sm-6 col-xs-12">
							<label class="control-label">Topic :</label><br>
							<select id="topicsListQA" onchange="getQuestionsByTopicQA(this.value)">
							
							</select>
							
							</div>
						</div>
						</div>
						<div class="col-md-3 col-sm-3 col-xs-12" style="border:1px solid #ded4d4">
						<div class="form-group">
							<label class="control-label">Search By Admin :</label><br>
							<select class="form-control" style="height:30px !important;" onchange="sendData('getQAQuestionsByAdmin/',this.value,'QAqArea',-1)" class="select">
							<option value="cv" style="font-size:14px;">CV</option>
							<option value="shivakumar" style="font-size:14px;">Shivakumar</option>
							<option value="sandeep" style="font-size:14px;">Sandeep</option>
							<option value="rajkiran" style="font-size:14px;">Rajkiran</option>
							<option value="rajkiran" style="font-size:14px;">Karunakar</option>
							</select>
						</div>
						</div>
						
						<div class="col-md-3 col-sm-3 col-xs-12" style="border:1px solid #ded4d4">
						<div class="form-group">
							<label class="control-label">Search by question :</label><br>
							<input class="form-control" type="text" style="height:30px !important;" onkeyup="sendData('getQAQuestionsByQuestion/',this.value,'QAqArea',-1)" id="topic">
						</div>
						</div>
					</div>
					</div>
				<br>
				<div class='row' style="pading:0 !important;"><div class='col-sm-5'></div><div class="col-sm-2" id="spinloader" class="spinLoader" style="display:none;"><i class="fa fa-spinner fa-spin" style="font-size:40px"></i><div class='col-sm-5'></div></div></div>
				<div class="container-fluid" style="width:100%;border:1px solid #4e4e4e;height:330px;overflow:scroll;" id='QAqArea'></div>
			</div>
			</div>
		</form>
	</div>
</div>

<!-- QAquestion paper ends here-->
	
	
	
<!--View QA begin -->

<div id="QAqpapers" style="display:none;border-radius:5px;">
	<div class="row">
		<div class="col-sm-3"  style="border:1px solid black">
	 		<div id="listQAQPapers"></div>
	 	</div>
	 
	 <!-- Question paper begin -->
	 
	 	<div class="col-sm-9"  style="border:1px solid black">
	 		<div id="viewQAQPaper">Questions Here</div>
	 	</div>
	</div>
</div>

<!-- View QA end -->
	 


<!-- mail to batch start -->
	 
<div id="mailToBatch" style="display:none;border-radius:5px;">
    <div class="container-fluid">
        <p class="push">Mail to Batch</p>
        <form id="mailToBatchForm" class="formClass">
        <div class="row"><br>
           <div class="form-group">
               <label class="control-label col-sm-3" for="email">Select your batch :</label>
           <div class="col-sm-7">
           <c:forEach items="${batches }" var="b">
               <label class="checkbox-inline"><input type="checkbox" name="batch" onchange="setBatchMails(this)" value="${b.getBatchNumber() }">Batch ${b.getBatchNumber() }</label>
           </c:forEach>
           <span id="errEmail" style="color:red;"></span>
           </div>
               <div class="col-sm-2"></div>
           </div>
        </div>
       
        <div id="multipleMails" style="display:none">
                
        </div>
        
        
         <div class="row" style="margin-top:1% !important;">
                <div class="form-group">
                    <label class="control-label col-sm-3" for="to">To :</label>
                <div class="col-sm-7" id="batchMailButtons" style="border:1px solid black">
                   
                </div>
                <div class="col-sm-2">
                    <input type="button" onclick="displayD('ccrecipients')" class="btn btn-default" style="margin:2px 0px 2px 0px;" name="cc" id="cc" value="CC"/>
                    <input type="button" onclick="displayD('bccrecipients')" class="btn btn-default" name="bcc" id="bcc" value="Bcc"/>
                </div>
                </div>
        </div>

        <div class="row" style="margin-top:1% !important;display:none;" id="ccrecipients">
                <div class="form-group">
                    <label class="control-label col-sm-3" for="to">Cc :</label>
                <div class="col-sm-7" id="mailToBatchCC">
                    <input type="text"class="form-control"  name="ccrecipients" placeholder="Add Cc"/>
                     <i class="fa fa-plus-square" onclick="addCC('mailToBatchCC','ccrecipients')" style="cursor:pointer" aria-hidden="true"></i>
                </div>
                <div class="col-sm-2"></div>
                </div>
        </div>

        <div class="row" style="margin-top:1% !important;display:none;" id="bccrecipients">
                <div class="form-group">
                    <label class="control-label col-sm-3" for="to">Bcc :</label>
                <div class="col-sm-7" id="mailToBatchbCC">
                    <input type="text"class="form-control"  name="bccrecipients" placeholder="Add Bcc"/>
                     <i class="fa fa-plus-square" onclick="addCC('mailToBatchbCC','bccrecipients')" style="cursor:pointer" aria-hidden="true"></i>
                </div>
                <div class="col-sm-2"></div>
                </div>
        </div>
        
        <div class="row" style="margin-top:1% !important;">
            <div class="form-group">
                    <label class="control-label col-sm-3" for="email">Subject :</label>
                <div class="col-sm-7">
                    <textarea name="subject" class="form-control" style="height: 40px !important;" id="subject" placeholder="Enter your subject" rows="3"></textarea>
                </div>
                <div class="col-sm-2">
                    
                </div>
            </div>
        </div>
        
        <div class="row" style="margin-top:1% !important;">
            <div class="form-group">
                    <label class="control-label col-sm-3" for="email">Message :</label>
                <div class="col-sm-7">
                    <textarea name="message" class="form-control" style="height: 250px !important;" id="message" placeholder="Enter your message" rows="30" id="comment"></textarea>
                </div>
                <div class="col-sm-2">
                    
                </div>
            </div>
        </div>
        <div class="row" style="margin:1% 0% 1% 0% !important;">
            <div class="col-md-3"></div>
            <div class="col-md-7">
                <input type="submit" onclick="sendMail('sendMail','mailToBatchForm'); return false;" class="btn btn-primary" style="font-size:16px !important;color:#fff;background-color:#000 !important;border-color:#000 !important;margin:auto !important;display:block !important;" value="send" id="send"/>
            </div>
            <div class="col-md-2"></div>
        </div>
      </form>
	</div>
</div>

<!-- mail to batch end -->
	 


<!-- mail to student start -->

<div id="mailToStudent" style="display:none;border-radius:5px;">
	<p class="push">Mail to Student or Other</p>
	<div class="container-fluid">
	<form id="mailToStudentForm" class="formClass">
		<div class="row" style="margin-top:1% !important;">
                <div class="form-group">
                    <label class="control-label col-sm-3" for="to">To :</label>
                <div class="col-sm-7" id="mailToStudentTo">
                    <input list="singleStudentMailsList" type="text"class="form-control" onkeyup="getStudentsMails(this.value)"  name="recipients" id="recipientsSt" placeholder="Add recipients" required/>
                     <datalist id="singleStudentMailsList">
                     </datalist>
                     <i class="fa fa-plus-square" onclick="addCC('mailToStudentTo','recipients')" style="cursor:pointer" aria-hidden="true"></i>
                    
                     
                       <div id="mailToStudentTo"></div>
                </div>
                
                <div class="col-sm-2">
                    <input type="button" onclick="displayD('ccrecipientsSt')" class="btn btn-default" style="margin:2px 0px 2px 0px;" name="cc" id="cc" value="CC"/>
                    <input type="button" onclick="displayD('bccrecipientsSt')" class="btn btn-default" name="bcc" id="bcc" value="Bcc"/>
                </div>
                </div>
                
        </div>
       

        <div class="row" style="margin-top:1% !important;display:none;" id="ccrecipientsSt">
                <div class="form-group">
                    <label class="control-label col-sm-3" for="to">Cc :</label>
                <div class="col-sm-7" id="mailToStudentCC">
                    <input type="text"class="form-control"  name="ccrecipients" placeholder="Add Cc"/>
                   <i class="fa fa-plus-square" onclick="addCC('mailToStudentCC','ccrecipients')" style="cursor:pointer" aria-hidden="true"></i>
                </div>
                <div class="col-sm-2"></div>
                </div>
        </div>

        <div class="row" style="margin-top:1% !important;display:none;" id="bccrecipientsSt">
                <div class="form-group">
                    <label class="control-label col-sm-3" for="to">Bcc :</label>
                <div class="col-sm-7" id="mailToStudentbCC">
                    <input type="text"class="form-control"  name="bccrecipients" placeholder="Add Bcc"/>
                    <i class="fa fa-plus-square" onclick="addCC('mailToStudentbCC','bccrecipients')" style="cursor:pointer" aria-hidden="true"></i>
                </div>
                <div class="col-sm-2"></div>
                </div>
        </div>
        
        
        <div class="row" style="margin-top:1% !important;">
            <div class="form-group">
                    <label class="control-label col-sm-3" for="email">Subject :</label>
                <div class="col-sm-7">
                    <textarea name="subject" class="form-control" style="height: 40px !important;" id="subject" placeholder="Enter the subject" rows="3" required></textarea>
                </div>
                <div class="col-sm-2">
                    
                </div>
            </div>
        </div>


        <div class="row" style="margin-top:1% !important;">
            <div class="form-group">
                    <label class="control-label col-sm-3" for="email">Message :</label>
                <div class="col-sm-7">
                    <textarea name="message" class="form-control" style="height: 250px !important;" id="message" placeholder="Enter your message" rows="30" id="comment" required></textarea>
                </div>
                <div class="col-sm-2">
                    
                </div>
            </div>
        </div>
        <div class="row" style="margin:1% 0% 1% 0% !important;">
            <div class="col-md-3"></div>
            <div class="col-md-7">
                <input type="submit" onclick="sendMail('sendMail','mailToStudentForm'); return false;" class="btn btn-primary" style="font-size:16px !important;color:#fff;background-color:#000 !important;border-color:#000 !important;margin:auto !important;display:block !important;" value="send" id="send"/>
            </div>
            <div class="col-md-2"></div>
        </div>
            </form>
        </div>
</div>

<!-- mail to student end -->



<!-- aptitude syllabus start -->

<div id="aptiSyllabus" style="display:none;border-radius:5px;">
	 <div class="row">
            <p class="push" style="text-align: center;font-weight:600 !important;">Aptitude syllabus</p>
            <div class="col-md-1 col-sm-1 col-xs-12"></div>
            <div class="col-md-10 col-sm-10 col-xs-12">
            <table class="table table-responsive table-hover table-bordered table-striped">
           	<thead>
            <tr class="theadText"><th class="thText">Flow number of topic</th><th class="thText">Topic Name</th><th class="thText">Duration in Days (approximation)</th><th class="thText">Best internet resource</th></tr>
            </thead>
            <tbody>
            <c:forEach items="${math }" var="m">
            <tr><td class="tdText">${m.getFlowNumber() }</td><td class="tdText">${m.getTopicName() }</td><td class="tdText">${m.getDurationDays() }</td><td class="tdText"><a href="${m.getResource() }" target="_blank">${m.getResource() }</a></td></tr>
            </c:forEach>
           	</tbody>
            </table>
            </div>
            <div class="col-md-1 col-sm-1 col-xs-12"></div>
        </div>
 </div>
	 
<!-- aptitude syllabus end -->




<!-- java syllabus start -->

<div id="javaSyllabus" style="display:none;border-radius:5px;">
		<div class="row">
			<p class="push" style="text-align: center;font-weight:600 !important;">Technical syllabus</p>
            <div class="col-sm-1 col-md-1 col-xs-0"></div>
            <div class="col-sm-10 col-md-10 col-xs-12">
            
            <table class="table table-responsive table-hover table-bordered table-striped">
           	<thead>
            <tr class="theadText"><th class="thText">Flow number of topic</th><th class="thText">Topic Name</th><th class="thText">Duration in Days (approximation)</th><th class="thText">Best internet resource</th></tr>
            </thead>
            <tbody>
            <c:forEach items="${java }" var="j">
            <tr><td class="tdText">${j.getFlowNumber() }</td><td class="tdText">${j.getTopicName() }</td><td class="tdText">${j.getDurationDays() }</td><td class="tdText"><a href="${j.getResource() }" target="_blank">${j.getResource() }</a></td></tr>
            </c:forEach>
           	</tbody>
            </table>
            
            </div>
            
            <div class="col-sm-1 col-md-1 col-xs-0"></div>
        </div>
</div>

<!-- java syllabus end -->
	
	
	
<!-- comm syllabus start -->
	
<div id="commSyllabus" style="display:none;border-radius:5px;">
		<div class="row">
            <p class="push" style="text-align: center;font-weight:600 !important;">English syllabus</p>
            <div class="col-md-1 col-sm-1 col-xs-12"></div>
            <div class="col-md-10 col-sm-10 col-xs-12">
            <table class="table table-responsive table-hover table-bordered table-striped">
           	<thead>
            <tr class="theadText"><th class="thText">Flow number of topic</th><th class="thText">Topic Name</th><th class="thText">Duration in Days (approximation)</th><th class="thText">Best internet resource</th></tr>
            </thead>
            <tbody>
            <c:forEach items="${comms }" var="c">
            <tr><td class="tdText">${c.getFlowNumber() }</td><td class="tdText">${c.getTopicName() }</td><td class="tdText">${c.getDurationDays() }</td><td class="tdText"><a href="${c.getResource() }" target="_blank">${c.getResource() }</a></td></tr>
            </c:forEach>
           	</tbody>
            </table>
            </div>
               <div class="col-md-1 col-sm-1 col-xs-12"></div>
        </div>
</div>	
	
<!-- comm syllabus end -->
	

<!-- Linux syllabus start  -->

<div id="linuxSyllabus" style="display:none;border-radius:5px;">
	<div class="row">
			<p class="push" style="text-align: center;font-weight:600 !important;">Linux syllabus</p>
            <div class="col-md-1 col-sm-1 col-xs-12"></div>
            <div class="col-md-10 col-sm-10 col-xs-12">
           <table class="table table-responsive table-hover table-bordered table-striped">
           <thead>
            <tr class="theadText"><th class="thText">Flow number of topic</th><th class="thText">Topic Name</th><th class="thText">Duration in Days (approximation)</th><th class="thText">Best internet resource</th></tr>
            </thead>
            <tbody>
            <c:forEach items="${linux }" var="l">
            <tr><td class="tdText">${l.getFlowNumber() }</td><td class="tdText">${l.getTopicName() }</td><td class="tdText">${l.getDurationDays() }</td><td class="tdText"><a href="${l.getResource() }" target="_blank">${l.getResource() }</a></td></tr>
            </c:forEach>
           </tbody>
            </table>
            </div>
            <div class="col-md-1 col-sm-1 col-xs-12"></div>
        </div>
</div>	 

<!-- Linux syllabus end  -->



<!-- Add Batch begin -->

<div id="addBatch" style="display:none;border-radius:5px;height:450px;">
	<p class="push">Enroll a New Batch</p><br>
	<div class="row">
		<div class="col-md-2 col-sm-2 col-xs-0"></div>
		<div class="col-md-7 col-sm-7 col-xs-12">
			<form id='addBatchForm' class="formClass" style="padding:1%;">
				<div class="row" style="margin-top:1% !important;">
			         <div class="form-group">
            	        <label class="control-label col-sm-4">Enter the new Batch Number :</label>
                		<div class="col-sm-6">
                    		<input class="form-control" type="number" name="batchNumber" id="batchNumberAdd" placeholder="Enter batch Number" required />
                		</div>
                		<div class="col-sm-2"></div>
         			</div>
				</div><br>
				<div class="row">
			         <div class="form-group">
						<label class="control-label col-sm-4">Enter batch begin Date (Approx) :</label>
						<div class="col-sm-6">
							<input class="form-control" type="text" name="beginDate" id="batchBeginDate" placeholder="YYYY-MM-DD"/>
			            </div>
			          	<div class="col-sm-2"></div>
			         </div>
				</div>
				<br>
				<div class="row">
			         <div class="form-group">
						<label class="control-label col-sm-4">Enter batch end Date (Approx) :</label>
			            <div class="col-sm-6">
							<input class="form-control" type="text" name="endDate" id="batchEndDate" placeholder="YYYY-MM-DD"/>
			            </div>
			            <div class="col-sm-2S"></div>
			         </div>
				</div>
				<br>
				<div class="row" style="margin-top:1% !important;">
            		<div class="col-md-4"></div>
            		<div class="col-md-4">
                		<button id="addBatchButton" class="btn btn-default enroll" style="width:35% !important" onclick="addBatch();return false">Enroll</button>
            		</div>
            		<div class="col-md-4"></div>
     			</div>
     		</form>
     	</div>
     	<div class="col-md-3 col-sm-3 col-xs-0"></div>
	</div>
</div>

<!-- Add Batch begin -->


<!-- View all Batches -->

<div id="viewBatches" style="display:none;border-radius:5px;">
	<p class="push" style="text-align:center !important;font-weight:600 !important;">All batches</p><br>
	<div class="row">
		<div class="col-sm-1 col-md-1 col-xs-0"></div>
		<div class="col-sm-10 col-md-10 col-xs-12">
			<table class="table table-responsive table-hover table-bordered table-striped">
				<thead>
					<tr class="theadText"><th class="thText">Batch Number</th><th class="thText">Begin Date(Approx)</th><th class="thText">End Date(Approx)</th><th class="thText">Number of Students Enrolled</th></tr>
				</thead>
				<tbody>
					<c:forEach items="${batches }" var="b">
					<tr><td class="tdText">${b.getBatchNumber() }</td><td class="tdText">${b.getBeginDate() }</td><td class="tdText">${b.getEndDate() }</td><td class="tdText">${b.getTotalStudents() }</td></tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col-sm-1 col-md-1 col-xs-0"></div>
	</div>
</div>


<!-- View all Batches -->

<!-- Change password start -->

<div id="changePassword" style="display:none;border-radius:5px;">
	<p class="push">Change your password</p><br>
	<form method="post" id="changeAdminPassword" class="formClassForPassChange">
		<div class="row">
	         <div class="form-group marginFormCLass">
	                    <label class="control-label col-sm-5" for="to">Enter old password :</label>
	                <div class="col-sm-4">
	                    <input class="form-control"type="password" name="oldPassword" id="oldPassword" placeholder="Enter old password"/>
	                </div>
	                <div class="col-sm-3"></div>
	         </div>
		</div>
		<div class="row" style="margin-top:1% !important;">
	         <div class="form-group">
	                    <label class="control-label col-sm-5" for="to">Enter New Password :</label>
	                <div class="col-sm-4">
	                    <input class="form-control" type="password" name="newPassword"id="newPassword" placeholder="Enter New Password"/>
	                </div>
	                <div class="col-sm-3"></div>
	         </div>
		</div>
		<div class="row" style="margin-top:1% !important;">
	         <div class="form-group">
	                    <label class="control-label col-sm-5" for="to">Confirm new Password :</label>
	                <div class="col-sm-4">
	                    <input type="password" class="form-control"  name="confirmpsw" id="confirmpsw" placeholder="Confirm new Password"/>
	                	<br>
	                </div>
	                <div class="col-sm-3"></div>
	         </div>
		</div>
		<div class="row" style="margin-top:1% !important;">
	            <div class="col-md-5"></div>
	            <div class="col-md-4">
	                <button id="changeAdminPasswordButton" class="btn btn-default" style="border:1px solid #00a69c !important;border-radius:5px !important;color:#00a69c !important;" onclick="changePassword();return false">Change</button>
	            </div>
	            <div class="col-md-3"></div>
	     </div>
	</form>
</div>


<!-- Change password end -->



<!-- Add notification begin -->


<div id="addNotification" style="display:none;border-radius:5px;height:430px;">
	<p class="push" style="text-align:center !important;font-weight:600 !important;">Add a new Notification to Students</p><br>
	<form method="post" id="addNotificationForm" style="padding:1%;" class="formClass">
		<div class="row">
	         <div class="form-group">
	                    <label class="control-label col-sm-4" for="to">Enter What to notify :</label>
	                <div class="col-sm-4">
	                    <input class="form-control" type="text" name="notification" placeholder="Enter the message"/>
	                </div>
	                <div class="col-sm-4"></div>
	         </div>
		</div><br>
		
		<div class="row">
             <div class="form-group">
                 <label class="control-label col-sm-4" for="email">Select batches to push:</label>
             <div class="col-sm-8">
             <c:forEach items="${batches }" var="b">
                 <label class="checkbox-inline"><input type="checkbox" name="batchNos" value="${b.getBatchNumber() }">Batch ${b.getBatchNumber() }</label>
                </c:forEach>    
             </div>
                 
             </div>
        </div>
		<br>
		<div class="row" style="margin-top:1% !important;">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <input name="btn" type="submit" value="Post"  class="btn btn-default enroll" onclick="addNotification();return false;">
            </div>
            <div class="col-md-4"></div>
	     </div>
	</form>
</div>


<!-- Add notification end -->

<!-- Uploading file start -->


<div id="uploadFile" style="display:none;height:430px;" class="">

<p class="push" style="text-align:center !important;font-weight:600 !important;">Add a New File</p><br>
	<form action="uploadFile" method="post" style="padding:1%;" id="sendFileForm" class="formClass" enctype="multipart/form-data">
		<div class="row">
	         <div class="form-group">
	                    <label class="control-label col-sm-4" for="to">Enter File Name:</label>
	                <div class="col-sm-4">
	                    <input class="form-control" type="text" name="fileName" placeholder="Enter fileName"/>
	                </div>
	                <div class="col-sm-4"></div>
	         </div>
		</div>
		<br>
		<div class="row">
	         <div class="form-group">
	                    <label class="control-label col-sm-4" for="to">Select File:</label>
	                <div class="col-sm-4">
	                    <input type="file" name="file" placeholder="select File"/>
	                </div>
	                <!-- <div class="fileinput fileinput-new col-sm-4" data-provides="fileinput">
					    <span class="btn btn-default btn-file"><span>Choose file</span><input type="file" name="file" /></span>
					    <span class="fileinput-filename"></span><span class="fileinput-new">No file chosen</span>
					</div> -->
	                <div class="col-sm-4"></div>
	                
	         </div>
		</div>
		
		<br>
		<div class="row">
	         <div class="form-group">
	                    <label class="control-label col-sm-4" for="to">Select Subject:</label>
	                <div class="col-sm-4">
	                   <select class="form-control" name="subject" style="height:30px !important;">
	                   <option selected value="Java">Java</option>
	                   <option value="Math">Math</option>
	                   <option value="Linux">Linux</option>
	                   <option value="SQL">SQL</option>
	                   <option value="Comms">Communication</option>
	                   <option value="Others">Others</option>
	                   </select>
	                </div>
	                <div class="col-sm-4"></div>
	         </div>
		</div>
		<br>
		<div class="row">
	           
	                <div class="form-group">
	                    <label class="control-label col-sm-4" for="email">Select batches to push:</label>
	                <div class="col-sm-8">
	                <c:forEach items="${batches }" var="b">
	                    <label class="checkbox-inline"><input type="checkbox" name="batchNos" value="${b.getBatchNumber() }">Batch ${b.getBatchNumber() }</label>
	                   </c:forEach>
	                    
	                        
	                </div>
	                   
	                </div>
	        </div>
		<br>
		<div class="row" style="margin-top:1% !important;">
	            <div class="col-md-4"></div>
	            <div class="col-md-4">
	                <button class="btn btn-default enroll" style="width:50% !important;" onclick="sendFile(); return false;">Upload Data and File</button>
	            </div>
	            <div class="col-md-4"></div>
	     </div>
	</form>

</div>


<!-- Uploading file end -->

<!--view all notification begin -->


<div id='viewNotifications' style="display:none">
	<p class="push" style="text-align:center !important;font-weight:600 !important;">All Notifications</p><br>
	<div class="row">
		<div class="col-sm-1 col-md-1 col-xs-0"></div>
		<div class="col-sm-10 col-md-10 col-xs-12">
			<table class="table table-responsive table-hover table-bordered table-striped">
				<thead>
					<tr class="theadText"><th class="thText">Posted On</th><th class="thText">Posted By</th><th class="thText">Notification</th><th class="thText">Posted For Batches</th></tr>
				</thead>
				<tbody>
					<c:forEach items="${notifications }" var="n">
					<tr><td class="tdText">${n.getPostDate() }</td><td class="tdText">${n.getName() }</td><td class="tdText">${n.getNotification() }</td><td class="tdText">${n.getBatchNos()[0] }</td></tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col-sm-1 col-md-1 col-xs-0"></div>
	</div>
</div>


<!-- view notifications end -->

	</div>
</div>




<!-- <div class="assistant" style="position:fixed;right:0;bottom:10%;background-color:#7b6e2d;color:white;padding:10px;border-radius:15%"><span onclick="displayD('assistantWork')">How Can I Help You?</span>
  <span id="assistantWork" style="width:200px;">
 <br> Hi <%=name %><br>
  I am Your Assistant ""<br>
  <span id="assistantCreateQP">
  </span>
   <span id="assistantCreateQPOptions">
    <br>
   Can I Create a New QuestionPaper?<br>
   <small>By the way, I can create a new question paper with the random
    questions and random topics.</small>
   <br>
   <button style="color:black" onclick="assistantCreateQuestionPaper('Y')">YES</button><button onclick="displayD('assistantWork')" style="color:black" >NO</button>
   
   </span>
   
  </span> 
</div> -->

<!--footer strat-->
<div class="container-fluid footerDiv">
    <div class="row">
        <div class="col-md-12">
            <p class="footers" style="color:#fff;float:left;">@CVCORPCopyRightsReserved</p>
            <img class="logo" style="float:right;margin-top:1%;" src="<c:url value="/resources/images/cvcorpLogo.png"/>">
        </div>
    </div>
</div>



<!-- footer end-->

</div>
<script type="text/javascript">
if (annyang) {
	  // Add our commands to annyang
	  annyang.addCommands({
	    'hello *name': function(name) { responsiveVoice.speak("Hello <%=name%>"); },
	    'create a question paper': function() { assistantCreateQuestionPaper("Y"); },
	    'java': function() { assistantCreateQuestionPaper("Java"); },
	    'maths': function() { assistantCreateQuestionPaper("Math"); },
	    'aptitude': function() { assistantCreateQuestionPaper("Math"); },
	    'multiple choice':function() { assistantCreateQuestionPaper("Multiple"); },
	    'Theory':function() { assistantCreateQuestionPaper("QA"); },
	     'view multiple choice Papers': function(){ sendData("getQuestionPapers/","Multiple","listQPapers",-1); displayDiv("qpapers"); 
	     responsiveVoice.speak("Listed all papers you can check nonw");},
	     'view theory type question Papers': function(){ sendData("getQuestionPapers/","QA","listQAQPapers",-1); displayDiv("QAqpapers"); },
	      'view all students': function(){sendData("viewAll","","stArea",-1); displayDiv("stArea");
	      responsiveVoice.speak("done"); },
	      'send a mail to student *name': function(name){
	    	  responsiveVoice.speak("I dont have permision to send");
	      },
	      'send a mail to batch *num': function(num){
	    	  responsiveVoice.speak("I can send a mail but not now"); 
	      },
	      ' view progress of *name':function(name){
	    	  responsiveVoice.speak("I can view progress but not now");  
	      },
	      
	      'view students from batch *num': function(num){
	    	  console.log(batchNos[batchNos.length-1]);
	    	 
	    	  if(!isNaN(num) && batchNos[batchNos.length-1]>=parseInt(num)){
	    	  sendData("viewBatch/",num,"stArea",-1); displayDiv("stArea");
	    	  
	    	  }
	    	  else{
	      responsiveVoice.speak("Please mention the correct batch Number");} },
	       'search *text':function(text){
	    	   window.open('http://google.com?search'+text, '_blank');
	       },
	       'can you *something': function(){
	    	   responsiveVoice.speak("Yes I can do that but not now");
	       },
	       '*anything': function(anything){
	    	   responsiveVoice.speak("please check what you are asking, If you have'nt said it properly say again, otherwise sorry I cannot help");
	       }, 
	  });

	  // Tell KITT to use annyang
	  SpeechKITT.annyang();

	  annyang.debug();
	  // Define a stylesheet for KITT to use
	  SpeechKITT.setStylesheet('http://cdnjs.cloudflare.com/ajax/libs/SpeechKITT/0.3.0/themes/flat.css');

	  // Render KITT's interface
	  SpeechKITT.vroom();
	}
	</script>
</body>
<script>
		var selector = '.nav li';

			$(selector).on('click', function(){
				$(selector).removeClass('active');
				$(this).addClass('active');
			});
			
			
</script>
<script>
	// DOM Ready
$(function() {
 var el, newPoint, newPlace, offset;
 
 // Select all range inputs, watch for change
 $("input[type='range']").change(function() {
 
   // Cache this for efficiency
   el = $(this);
   
   // Measure width of range input
   width = el.width();
   
   // Figure out placement percentage between left and right of input
   newPoint = (el.val() - el.attr("min")) / (el.attr("max") - el.attr("min"));
   
   // Janky value to get pointer to line up better
   offset = -1.3;
   
   // Prevent bubble from going beyond left or right (unsupported browsers)
   if (newPoint < 0) { newPlace = 0; }
   else if (newPoint > 1) { newPlace = width; }
   else { newPlace = width * newPoint + offset; offset -= newPoint; }
   
   // Move bubble
   el
     .next("output")//.next("output")
     .css({
       //left: newPlace,
       //marginLeft: offset + "%"
     })
     .text(el.val());
 })
 // Fake a change to position bubble at page load
 .trigger('change');
});
</script>
<script>
function myFunction() {
    var url="<c:url value='/views/stdProfilePage.html'/>";
    var myWindow = window.open(url);
    //myWindow.resizeTo(1440,1000);
}
</script>
<!-- <script type="text/javascript">
    $(document).ready(function() {
    	$('#multi-select-demotype').multiselect();
    	$('#multi-select-demobranch').multiselect();
    	$('#multi-select-demobatch').multiselect();
    	$('#multi-select-demoyop').multiselect();
        $('#multi-select-demoSscForModel').multiselect();
        $('#multi-select-demoInterForModel').multiselect();
        $('#multi-select-demoDegreeForModel').multiselect();
        $('#multi-select-demoAggreForModel').multiselect();
        $('#multi-select-math10ThForModel').multiselect();
        $('#multi-select-math12ThForModel').multiselect();
        $('#multi-select-FeeForModel').multiselect();
        $('#multi-select-StateForModel').multiselect();

    });
</script> -->

<script>
$(document).ready(function(){
  $('.dropdown-submenu a.test').on("click", function(e){
    $(this).next('ul').toggle();
    e.stopPropagation();
    e.preventDefault();
  });
});
</script>
<script>
$('#scrollableid').slimScroll();
</script>
</html>