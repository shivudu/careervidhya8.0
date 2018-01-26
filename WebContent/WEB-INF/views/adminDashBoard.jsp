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
<script type="text/javascript">
var batchNos=[];
var adminName='<%=name%>';

</script>

<script src='https://code.responsivevoice.org/responsivevoice.js'></script>

	<title>Admin DashBoard</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.6.5/angular.min.js"></script>
   	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="<c:url value="/resources/js/ajaxOp.js"/>"></script>
	<script src="<c:url value="/resources/js/AngularApp.js"/>"></script>
	<script src="<c:url value="/resources/js/dirPagination.js"/>"></script>
	<script src="<c:url value="/resources/js/multiSelector.js"/>"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css" type="text/css">
	
	<script src="<c:url value="/resources/js/xeditable.js"/>"></script>
	<!-- <script src="<c:url value="/resources/js/multiSelectBox.js"/>"></script> -->
	
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/xeditable.css"/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/multiSelector.css"/>"/>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/angular-ui-bootstrap/1.3.1/ui-bootstrap-tpls.min.js"></script>
	<!--  <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/3.7.0/lodash.min.js"></script>-->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.min.js"></script>
	   <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/adminDashBoard.css"/>"/>
	   <style>
	   
	   #skitt-toggle-button{
	   float:right !important;
	   }
        .navbar-default .navbar-nav>.active> a, 
			.navbar-default .navbar-nav>.active> a:focus, 
			.navbar-default .navbar-nav>.active> a:hover
        {
            color:#444444 !important;
            text-transform:uppercase !important;
            text-shadow: 0 1px 0 #ffffff !important;
            font-size:12px !important;
            /*background: -webkit-gradient(linear, left top, left bottom, from(#f1f1f3), to(#e8e9ed)) !important;*/
        }

    </style>
        <style>
			output { 
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
/*output:after { 
  content: '';
  position: absolute;
  width: 0;
  height: 0;
  border-top: 10px solid #999999;
  border-left: 5px solid transparent;
  border-right: 5px solid transparent;
  top: 100%;
  left: 50%;
  /*margin-left: -5px;*/
  margin-top: -1px;
}*/


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
			
.dropdown-submenu {
    position: relative;
}

.dropdown-submenu>.dropdown-menu {
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
<script>

$(document).ready( function(){

	<c:forEach items="${batches }" var="b">
	batchNos.push("${b.getBatchNumber()}");
	</c:forEach>
	console.log(batchNos);
	
	});
</script>	
<script src="https://cdnjs.cloudflare.com/ajax/libs/annyang/2.6.0/annyang.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/SpeechKITT/0.3.0/speechkitt.min.js"></script>


<script>  
   /*function employeeController($scope,$http) {  
      var url = "http://localhost:8080/CareerVidhya_Operations8.0/viewAll";  
     
      $http.get(url).success( function(response) {  
         $scope.employees = response;  
      });  
   }  */
  
</script>	
</head>
<body ng-app="App" ng-controller="viewController as view">
	<!-- Entire div-->
<!-- <div class="container-fluid other">

	header	
	<div class="container-fluid">
		<div class="row firdiv">
			<div class="col-md-6 col-sm-6 col-xs-6">
				<i class="fa fa-refresh fa-spin fa-3x fa-fw" style="float:left;display:none;" id="ajaxPageLoader"></i><br>
				<br>
			</div>
			<div class="col-md-6 col-sm-6 col-xs-6" style="margin-top:20px;margin-left:0px !important">
			  <ul style="float:right;color:#000;cursor:pointer">
			  
			</ul>
			</div>
		</div>
	</div>-->
	<!--header end-->


<!-- navbar start-->


<div class="container-fluid menuDiv">
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
	    <div class="collapse navbar-collapse" style="width:100% !important" id="myNavbar">
	      <ul class="nav navbar-nav" style="float:right;">
	        <li class="active"><a href="#" onclick="displayDiv('welcome')" style="font-size: 12px !important;"><!--<i class="fa fa-home" aria-hidden="true"></i>--> HOME</a></li>
	        
	        <li class="dropdown" style="font-size: 12px !important;">
				<a class="dropdown-toggle" style="cursor:pointer;" data-toggle="dropdown"><!-- <i class="fa fa-users" aria-hidden="true"></i> --> STUDENT'S<span class="caret"></span></a>
				<ul class="dropdown-menu">
					
				<!--  	<c:forEach items="${batches }" var="b">
					<li>
					
 				<a style="cursor:pointer;" onclick="sendData('viewBatch/',${b.getBatchNumber()},'stArea',-1); displayDiv('stArea')">
					BATCH ${b.getBatchNumber()}</a>
					
	
	     	        <a style="cursor:pointer;" onclick="displayDiv('stArea')" ng-click="view.requestBatchStudents(${b.getBatchNumber()})">
					BATCH ${b.getBatchNumber()}</a>
					
					
					
					</li>
					
					</c:forEach>
					-->
					
					
					<li>
				<!--  	<a style="cursor:pointer;" onclick="sendData('viewAll','','stArea',-1); displayDiv('stArea')">View All Students</a>-->
					<a style="cursor:pointer;" onclick="displayDiv('stArea')" ng-click="view.requestAllStudents()" style="font-size: 12px !important;"><!-- <i class="fa fa-users" aria-hidden="true"></i> --> View Students</a>
					</li>
					<li><a href="#" onclick="displayDiv('regForm')" style="font-size: 12px !important;"><!-- <i class="fa fa-user" aria-hidden="true"></i> --> Register a New Student</a></li>
					<!-- <li><a style="cursor:pointer;" ng-click="viewAll();">View All Students</a></li>-->
					<li><a href="#" onclick="displayDiv('uploadFile')" style="font-size: 12px !important;"><!-- <i class="fa fa-upload" aria-hidden="true"></i> --> Upload Assignment File</a></li>
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
			
			<!-- Mail Students begin-->
		
			<!-- <li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-reply-all" aria-hidden="true"></i> Mail To Students<span class="caret"></span></a>
			<ul class="dropdown-menu">
			<li><a style="cursor:pointer" onclick="displayDiv('mailToBatch')">Mail To Batches</a></li>
			<li><a style="cursor:pointer" onclick="displayDiv('mailToStudent')"> Mail To Single Student or Others</a></li>
			
			</ul>
			</li> -->
				
		<!-- Mail Students end-->
		<!-- View syllabus begin-->
			
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
			<li style="float:right !important;font-size: 12px !important;" class="dropdown"><a class="dropdown-toggle" style="cursor:pointer;" data-toggle="dropdown"> <i style="padding:1%;border:1px solid #4e4e4e;" class="fa fa-user" aria-hidden="true"></i><span class="caret"></span></a>
			   <ul class="dropdown-menu">
			   		<li><span class="welocmeName" style="color:#000 !important;font-size: 12px !important;">Welcome <span style="letter-spacing:1px;font-family:'Cherry Swash';font-weight:600;font-size:12px;"><i><%=name %></i></span></li>
					<li><span class="welcomeDate" id="welDate"></span></li>
			   		<li><a onclick="displayDiv('changePassword')" style="float:right;color:#000;cursor:pointer;font-size: 12px !important;">&nbsp<i style="color:#000;" class="fa fa-wrench" aria-hidden="true"></i> Change Password</a></li>
			   		<li><a href="Logout" style="float:right;color:#000"><i style="color:#000;marggin-right:1%;font-size: 12px !important;" class="fa fa-power-off" aria-hidden="true"></i> Logout</a></li>
				</ul>
			</li>
	      </ul>
	      <!-- <ul class="nav navbar-nav navbar-right">
	        <li><a href="#"><i class="fa fa-power-off" aria-hidden="true"></i> Logout</a></li>
	        <li><a href="#"></span><i class="fa fa-key" aria-hidden="true"></i> Change Password</a></li>
	      </ul> -->
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

<div id="welcome" class="container-fluid welcomeRow">
  
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
	
	

<!-- <div class="container-fluid">

	<div class="dropdown">
        <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Dropdown Example
        <span class="caret"></span></button>
        <ul class="dropdown-menu" ng-model="batchWise">
          <li ng-repeat="ba in batchsList" ><a href="#">{{ba}}</a></li>
        </ul>
      </div><br>
      <div class="container-fluid">
      	<div class="row">
      		<div class="col-md-1">SearchStudent</div>
      		<div class="form-group col-md-2">      			
				<select class="form-control" ng-model="yop" style="height:30px !important;">
				    <option disabled selected>YOP</option>
				    <option ng-repeat="yr in years">{{yr}}</option>
				 </select>
			</div>
			<div class="form-group col-md-2">      			
				<select class="form-control" ng-model="per" style="height:30px !important;">
				    <option disabled selected>Percentage</option>
				    <option ng-repeat="perc in percentages">{{perc}}</option>
				 </select>
			</div>
			<div class="form-group col-md-2">      			
				<select class="form-control" style="height:30px !important;">
				    <option disabled selected>Graduation</option>
				    <option value="btech">B.Tech</option>
					<option value="bsc">B.Sc</option>
					<option value="mca">MCA</option>
					<option value="mba">MBA</option>
				 </select>
			</div>
			<div class="form-group col-md-2">      			
				<select class="form-control" ng-model="branch" style="height:30px !important;">
				    <option disabled selected>Branch</option>
				    <option ng-repeat="bat in branches">{{bat}}</option>
				 </select>
			</div>
			<div class="col-md-1">SortBY</div>
			<div class="form-group col-md-2">      			
				<select class="form-control" style="height:30px !important;">
				    <option disabled selected>Percentage</option>
				    <option value="60%">60%</option>
					<option value="70%">70%</option>
					<option value="80%">80%</option>
					<option value="90%">90%</option>
				 </select>
			</div>
      	</div>
      </div>
	<table class="table table-border">
		<tr>
			<th>BatchNo</th>
			<th>FullName</th>
			<th>MobileNumber</th>
			<th>Email</th>
			<th>FeePaid</th>
			<th>TotalFee</th>
			<th>Graduation YOP</th>
			<th>Percentage(10+12+UG)</th>
			<th colspan="2">ViewMore</th>
			<th>Resume</th>
		</tr>
		<tr ng-repeat="std in stdData.studentsList | filter:{'graduationYOP':yop,'aggregate':per,'graduationBranch':branch}">
			<td>{{std.batchNumber}}</td>
			<td>{{std.fullName}}</td>
			<td>{{std.mobile}}</td>
			<td>{{std.email}}</td>
			<td>{{std.feePaid}}</td>
			<td>{{std.feeTotal}}</td>
			<td>{{std.graduationYOP}}</td>
			<td>{{std.aggregate}}</td>
			<td>{{std.graduationBranch}}</td>
			<td>{{std.email}}</td>
			<td>{{std.email}}</td>
			
		</tr>
	</table>
</div>-->


<!-- Take attendance Page begin-->	


<div class="container-fluid" style="display:none;" id="takeAttendance">

</div>
	
	
<!-- Take attendamce Page end-->
	

	
	
<!-- student details form begin-->
	
	
<div id="regForm" style="display:none;margin:0.5%;">
	<div class="row">
		<form id='registration' onsubmit="return false" class="form-horizontal">
			<div class="col-md-6 col-sm-6 col-xs-12">
			
			<div class="form-group">
				<h3 class="control" style="text-align:center;padding-bottom:3%;">PersonalDetails :</h3>
				<label class="control-label col-sm-4" for="fullName">Enter FullName :</label>
				<div class="col-sm-6">
				<input type="text" name="fullName" class="form-control" id="fullName" placeholder="Enter Full Name" required>
				</div>
				<div class="col-sm-2"></div>
			</div>
	  
			<div class="form-group">
				<label class="control-label col-sm-4" for="email">Enter email :</label>
				<div class="col-sm-6">
				<input type="email" name="email" class="form-control" id="email" placeholder="Enter email" required>
				</div>
				<div class="col-sm-2"></div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-4" for="email">Enter DOB :</label>
				<div class="col-sm-6">
				<input type="date" name="dob" class="form-control" id="dob" placeholder="Enter Date of Birth" required>
				</div>
				<div class="col-sm-2"></div>
			</div>
	  
			<div class="form-group">
				<label class="control-label col-sm-4" for="gender">Gender :</label>
				<div class="col-sm-6">
				<label class="radio-inline"><input type="radio" value="male" checked name="gender">Male</label>
				<label class="radio-inline"><input type="radio" value="female" name="gender">Female</label>
				</div>
				<div class="col-sm-2"></div>
			</div>
	  
			<div class="form-group">
				<label class="control-label col-sm-4" for="mobile">Enter mobile number :</label>
				<div class="col-sm-6">
				<input type="text" name="mobile" class="form-control" id="mobile" placeholder="Enter mobile number" required>
				</div>
				<div class="col-sm-2"></div>
			</div>
			  
			<div class="form-group">
				<label class="control-label col-sm-4" for="mobile_Parent">Enter Emergency mobile :</label>
				<div class="col-sm-6">
				<input type="text" name="mobile_Parent" class="form-control" id="mobile_Parent" placeholder="Enter Emergency mobile number" required>
				</div>
				<div class="col-sm-2"></div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-4" for="parentName">Enter Emergency Contact Person :</label>
				<div class="col-sm-6">
				<input type="text" name="parentName" class="form-control" id="parentName" placeholder="Enter Emergency Contact Person" required>
				</div>
				<div class="col-sm-2"></div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-4" for="address">Addresss :</label>
				<div class="col-sm-6 col-xs-12">
			  		<textarea name="locality" style="height:40px !important" placeholder="Enter your address" class="form-control" rows="5"  id="locality" required></textarea>
				</div>
				<div class="col-sm-2"></div>
	  		</div>
			
			<div class="form-group">
				<label class="control-label col-sm-4" for="parentName"></label>
				<div class="col-sm-6">
				<input style="margin-top:5px;" type="text" name="city" class="form-control" id="city" placeholder="Enter city" required>
				</div>
				<div class="col-sm-2"></div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-4" for="state"></label>
				<div class="col-sm-6">
				  <select name="state" class="form-control" style="height:32px !important;" id="state">
				  <option value="" selected disabled>Select state</option>
				  <option value="AndhraPradesh">Andhra Pradesh</option>
				  <option value="Telangana">Telangana</option>
				  <option value="Others">Others</option>
				  </select>
				</div>
			</div>
		</div>
		<div class="col-md-6 col-sm-6 col-xs-12">
			<div class="form-group">
				  <h3 class="control" style="text-align:center;padding-bottom:3%;">Education Details :</h3>
				  <label class="control-label col-sm-5" style="text-align:right;" for="sscPercentage">Enter SSC Percentage :</label>
				<div class="col-sm-6">
				  <input type="number" name="sscPercentage" class="form-control" id="sscPercentage" placeholder="Enter SSC Percentage" required>
				</div>
				<div class="col-sm-1"></div>
			</div>
				  
			<div class="form-group">
				<label class="control-label col-sm-5" style="text-align:right;" for="interPercentage">Enter Inter Percentage :</label>
				<div class="col-sm-6">
				  <input type="number" name="interPercentage" class="form-control" id="interPercentage" placeholder="Enter Inter Percentage " required>
				</div>
				<div class="col-sm-1"></div>
			</div>
				  
			<div class="form-group">
				<label class="control-label col-sm-5" style="text-align:right;" for="graduationPercentage">Enter Graduation Percentage :</label>
				<div class="col-sm-6">
				  <input type="number" name="graduationPercentage" class="form-control" id="graduationPercentage" placeholder="Enter graduation percentage" required>
				</div>
				<div class="col-sm-1"></div>
			</div>	  
				  
			<div class="form-group">
				<label class="control-label col-sm-5" style="text-align:right;" for="graduationCollege">Enter Graduation College :</label>
				<div class="col-sm-6">
				  <input type="text" name="graduationCollege" class="form-control" id="graduationCollege" placeholder="Enter Graduation College" required>
				</div>
				<div class="col-sm-1"></div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-5" style="text-align:right;" for="graduationCollege">Enter College Location :</label>
				<div class="col-sm-6">
				  <input type="text" name="graduationCity" class="form-control" id="graduationCity" placeholder="Enter city" required>
				</div>
				<div class="col-sm-1"></div>
			</div> 
							  
			<div class="form-group">
				<label class="control-label col-sm-5" style="text-align:right;" for="graduationYOP">Enter Graduation YOP:</label>
				<div class="col-sm-6">
				  <input type="number" name="graduationYOP" class="form-control" placeholder="Enter Graduation YOP" id="graduationYOP">
				</div>
				<div class="col-sm-1"></div>
			</div>
				
			<div class="form-group">
				<label class="control-label col-sm-5" style="text-align:right;" for="graduationType">Enter Graduation Type :</label>
				<div class="col-sm-6">
				  <select name="graduationType" class="form-control" style="height:32px !important;" id="graduationType">
				 <option value="BTech">BTech</option>
				 <option value="MTech">MTech</option>
				 <option value="MBA">MBA</option>
				 <option value="MCA">MCA</option>
				 <option value="Degree">Degree</option>
				  <option value="Others">Others</option>
				  </select>
				</div>
				<div class="col-sm-1"></div>
			</div>
		  
			<div class="form-group">
				<label class="control-label col-sm-5" style="text-align:right;" for="graduationBranch">Enter Graduation Branch:</label>
				<div class="col-sm-6">
				  <select name="graduationBranch" style="height:32px !important;" class="form-control" id="graduationBranch">
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
				<div class="col-sm-1"></div>
			</div>	
			
			<div class="form-group">
				<h3 class="control" style="text-align:center;padding-bottom:3%;">Other Details :</h3>
				<label class="control-label col-sm-4" style="text-align:right;" for="batchNumber">Enter Batch Number :</label>
				<div class="col-sm-6">
				<select name="batchNumber" style="height:32px !important;" class="form-control">
				<c:forEach items="${batches }" var="b">
				<option value="${b.getBatchNumber() }" selected>${b.getBatchNumber() }</option>
				</c:forEach>
				</select>
				</div>
				<div class="col-sm-2"></div>
			</div>
			
	  
			<div class="form-group">
				<label class="control-label col-sm-4" style="text-align:right;" for="feePaid">Enter Fee Paid:</label>
				<div class="col-sm-6">
				<input type="number" name="feePaid" class="form-control" id="feePaid" placeholder="Enter Fee Paid" required>
				</div>
				<div class="col-sm-2"></div>
			</div>
			
			
			<div class="form-group">
				<label class="control-label col-sm-4" style="text-align:right;" for="feeTotal">Enter Total Fee:</label>
				<div class="col-sm-6">
				<input type="number" name="feeTotal" class="form-control" id="feeTotal" placeholder="Enter Fee Total" required>
				</div>
				<div class="col-sm-2"></div>
			</div>	
			
			
			<div class="form-group">
				<label class="control-label col-sm-4" style="text-align:right;" for="joinDate">joinDate:</label>
				<div class="col-sm-6">
				<input type="date" name="joinDate" class="form-control" id="joinDate" placeholder="YYYY/MM/DD" required>
				</div>
				<div class="col-sm-2"></div>
			</div>
		</div>
	
			<div class="form-group"> 
				<div class="col-sm-12">
				<input type="submit" onclick="sendData('registerStudent?','','',0); return false;" value="Register" class="btn btn-default" style="font-size:16px !important;color:#ff6666;border-radius:5px;border-color:#ff6666 !important;margin:auto !important;display:block !important;">
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
			<div class="col-md-2"><h1 class="stdHeadhOne">Student Details</h1></div>
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
                <div class="col-md-2 theadTextDataClass" style="text-align:right;"></div>
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
                   			<div class="col-md-1"><p class="selectBoxClass1">YOP</p></div>
                   			<div class="col-md-2">
                   				<!-- <div ng-dropdown-multiselect="" options="example14data" selected-model="example14model" checkboxes="true" extra-settings="example14settings"></div> -->
                   				<select ng-model="yearOfPass" id="multi-select-demoyop" multiple="multiple" style="width:15%;float:left;">
									<option value='2019'>2019</option>
									<option value='2018'>2018</option>
									<option value='2017'>2017</option><option value='2016'>2016</option>
									<option value='2015'>2015</option><option value='2014'>2014</option>
									<option value='2013'>2013</option><option value='2012'>2012</option>
		                        </select>
                   			</div>
                   			<div class="col-md-1"><p class="selectBoxClass1">Batches</p></div>
                   			<div class="col-md-2">
	                   			<select ng-model="batchNumber" id="multi-select-demobatch" multiple="multiple" style="width:15%;float:left;">
									<c:forEach items="${batches }" var="b">
									<option value='${b.getBatchNumber() }'>${b.getBatchNumber() }</option>
									</c:forEach>
		                         </select>	
	                   		</div>
                   			<div class="col-md-1"><p class="selectBoxClass1">Branch</p></div>
                   			<div class="col-md-2">
                   				<select ng-model="branchName" style="width:15%;float:left;" id="multi-select-demobranch" multiple="multiple">
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
	                           		</select>
	                           </div>
                   			<div class="col-md-1"><p class="selectBoxClass1" style="padding-left:1px !important;">GradType</p></div>
                   			<div class="col-md-2">
                   				<select ng-model="graduationType" id="multi-select-demotype" multiple="multiple" style="width:15%;">
									<option value='Btech'>BTech</option><option value='Mtech'>MTech</option><option value='MCA'>MCA</option><option value='MBA'>MBA</option>
									<option value='Degree'>Degree</option><option value='Others'>Others</option>
			                    </select>
			                    <i class="fa fa-bars" style="margin-right:-10%;margin-top: 3%; float:right;" aria-hidden="true"></i>
                   			</div>
                   		</div>
                       <!-- <span class="selectBoxClass1" style="float:left;">SSC</span>
                       
                       <span>
                           <select ng-model="sscFilter" style="width:15%;float:left;">
                               	<option value="" selected="selected">All</option>
								<option value='90'>>90</option>
								<option value='80'>>80</option>
								<option value='70'>>70</option>
								<option value='60'>>60</option>
								<option value='50'>>50</option>
                           </select>
                       </span> -->
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
                   						<td><p class="selectBoxClass1" style="padding-left:1px !important;">SSC Percentage :</p></td>
                   						<td>
                   							<select ng-model="sscPercentage" id="multi-select-demoSscForModel" multiple="multiple" style="width:15%;">
												<option value='90'>90</option><option value='80'>80</option><option value='70'>70</option>
												<option value='60'>60</option>
						                    </select>
                   						</td>
                   					</tr>
                   					<tr>
                   						<td><p class="selectBoxClass1" style="padding-left:1px !important;">Inter Percentage :</p></td>
                   						<td>
	                   						<select ng-model="interPercentage" id="multi-select-demoInterForModel" multiple="multiple" style="width:15%;">
						                        <option value='' selected="selected">All</option>
												<option value='90'>90</option><option value='80'>80</option><option value='70'>70</option>
												<option value='60'>60</option>
						                    </select>
						                </td>
                   					</tr>
                   					<tr>
                   						<td><p class="selectBoxClass1" style="padding-left:1px !important;">Degree Percentage :</p></td>
                   						<td>
                   							<select ng-model="graduationPercentage" id="multi-select-demoDegreeForModel" multiple="multiple" style="width:15%;">
						                        <option value='' selected="selected">All</option>
												<option value='90'>90</option><option value='80'>80</option><option value='70'>70</option>
												<option value='60'>60</option>
						                    </select>
                   						</td>
                   					</tr>
                   					<tr>
                   						<td><p class="selectBoxClass1" style="padding-left:1px !important;">Aggregation Percentage :</p></td>
                   						<td>
                   							<select ng-model="aggregation" id="multi-select-demoAggreForModel" multiple="multiple" style="width:15%;">
						                        <option value='' selected="selected">All</option>
												<option value='90'>90</option><option value='80'>80</option><option value='70'>70</option>
												<option value='60'>60</option>
						                    </select>
                   						</td>
                   					</tr>
                   					<tr>
                   						<td><p class="selectBoxClass1" style="padding-left:1px !important;">Fee :</p></td>
                   						<td>
                   							<select ng-model="feePaid" id="multi-select-FeeForModel" multiple="multiple" style="width:15%;">
						                        <option value='' selected="selected">All</option>
												<option value='feepaid'>FeePaid</option>
												<option value='notpaid'>NotPaid</option>
											</select>
                   						</td>
                   					</tr>
                   					<tr>
                   						<td><p class="selectBoxClass1" style="padding-left:1px !important;">State :</p></td>
                   						<td>
                   							<select ng-model="state" id="multi-select-StateForModel" multiple="multiple" style="width:15%;">
						                        <option value='' selected="selected">All</option>
												<option value='ts'>Telangana</option>
												<option value='ap'>AndraPradesh</option>
						                    </select>
                   						</td>
                   					</tr>
                   					<tr>
                   						<td><p class="selectBoxClass1" style="padding-left:1px !important;">Gender :</p></td>
                   						<td>
                   							<select ng-model="gender" style="width:66%;font-size:12px;font-family: Segoe UI Semibold;">
			                   					<option value='' selected disabled>Select Gender</option>
												<option value='male'>Male</option>
												<option value='female'>Femail</option>
						                    </select>
                   						</td>
                   					</tr>
                   				</table>
                   			</div>
                   			<div class="col-md-6 modelTableClass" style="pading:1%;">
                   			<table style="width:100%">
                   				<tr>
                   					<td><p class="selectBoxClass1" style="padding-left:1px !important;padding-top: 6% !important;">Email :</p></td>
                   					<td><input type='text' style="margin-left: 3.5%;" placeholder='Student Email' ng-model="emaiId" class='form-control inputFieldClass'></td>
                   				</tr>
                   				<tr>
                   					<td><p class="selectBoxClass1" style="padding-left:1px !important;padding-top: 6% !important;">StudentMobile :</p></td>
                   					<td><input type='text' style="margin-left: 3.5%;" placeholder='Student Mobile' ng-model="snumber" class='form-control inputFieldClass'></td>
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
		              	<div class="col-md-4"></div>
		              	<div class="col-md-2">
		              		<button class="modelSearchBtn">Search</button>
		              	</div>
		              	<div class="col-md-2">
		               		<button class="modelCancleBtn">Cancle</button>
		              	</div>
		              	<div class="col-md-4"></div>
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
           <div class="row" style="padding:0% 0% 0% 2.5%;">
               <div class="col-md-12">
                   <table class="table table-bordered tableNewClass">
                       <thead class="theadBackClass">
                           <tr>
                               <th rowspan="2"class="theadTextDataClass" style="width:2%;">
                               <input ng-model="checkAll" type='checkbox' ng-click='selectAll()' type="checkbox"/></th>
                               <th rowspan="2"class="theadTextDataClass" style="width:15%;cursor:pointer" ng-click="sort('fullName')">Name
                               	<span class="glyphicon sort-icon" ng-show="sortKey=='fullName'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                               </th>
                               <th rowspan="2" class="theadTextDataClass" style="cursor:pointer" ng-click="sort('batchNumber')">Batch
								<span class="glyphicon sort-icon" ng-show="sortKey=='batchNumber'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>	                               	
                               </th>
                               <th rowspan="2" class="theadTextDataClass" style="cursor:pointer" ng-click="sort('graduationYOP')">YOP
                               	<span class="glyphicon sort-icon" ng-show="sortKey=='graduationYOP'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                               </th>
                               <th rowspan="2" class="theadTextDataClass" style="cursor:pointer" ng-click="sort('feePaid')">Fee
                               	<span class="glyphicon sort-icon" ng-show="sortKey=='feePaid'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                               </th>
                               <th rowspan="2" class="theadTextDataClass" style="cursor:pointer" ng-click="sort('graduationBranch')">Branch
                               	<span class="glyphicon sort-icon" ng-show="sortKey=='graduationBranch'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                               </th>
                               <th colspan="4" class="theadTextDataClass">Percentages</th>
                               <th colspan="2" class="theadTextDataClass">Math Scores</th>
                               <th colspan="3" class="theadTextDataClass">Progress</th>
                               <th colspan="2" class="theadTextDataClass">Attendance</th>
                           </tr>
                           <tr class="theadBackClass">
                               <th class="theadTextDataClass" style="border-right: 1px solid #ddd !important;cursor:pointer" ng-click="sort('sscPercentage')">10th
                               	<span class="glyphicon sort-icon" ng-show="sortKey=='sscPercentage'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                               </th>
                               <th class="theadTextDataClass" style="cursor:pointer" ng-click="sort('interPercentage')">12th
                               	<span class="glyphicon sort-icon" ng-show="sortKey=='interPercentage'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                               </th>
                               <th class="theadTextDataClass" style="cursor:pointer" ng-click="sort('graduationPercentage')">G
                               	<span class="glyphicon sort-icon" ng-show="sortKey=='graduationPercentage'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                               </th>
                               <th class="theadTextDataClass" style="cursor:pointer" ng-click="sort('aggregate')">A
                               	<span class="glyphicon sort-icon" ng-show="sortKey=='aggregate'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                               </th>
                               <th class="theadTextDataClass">10th</th>
                               <th class="theadTextDataClass">12th</th>
                               <th class="theadTextDataClass">Apti</th>
                               <th class="theadTextDataClass">Java</th>
                               <th class="theadTextDataClass">Com</th>
                               <th class="theadTextDataClass">%</th>
                               <th class="theadTextDataClass">%</th>
                           </tr>
                       </thead>
                       <tbody dir-paginate="t in ( fstudentsList= (view.studentsList |itemsPerPage:pageValues | filter:studentName:yearOfPass:graduationType:branchName:genderI:batchNumber | orderBy:sortKey:reverse | filter: { graduationYOP:yearOfPass, graduationType: graduationType, graduationBranch: branchName, gender: genderI, batchNumber: batchNumber} | filter: sscFilter | filter: interFilter | filter: aggregateFilter | filter: degreeFilter | filter: feeFilter ) )">
                           <tr>
                               <td class="theadTextDataClass"><input ng-click="view.checkStudent(t,$event)" type="checkbox"/></td>
                               <td class="theadTextDataClass"><p style="float:left;" ng-if=" t.feeTotal-t.feePaid <= 0" class="feeNotification1"></p><p style="float:left;" ng-if="t.feeTotal-t.feePaid > 0" class="feeNotification2"></p><p ng-click='view.studentDetails(t)' style="text-transform:lowercase;text-align:left !important;cursor:pointer;">{{t.fullName}}</p></td>
                               <td class="theadTextDataClass">{{t.batchNumber}}</td>
                               <td class="theadTextDataClass">{{t.graduationYOP}}</td>
                               <td class="theadTextDataClass">{{t.feePaid}}</td>
                               <td class="theadTextDataClass">{{t.graduationBranch}}</td>
                               <td class="theadTextDataClass">{{t.sscPercentage}}</td>
                               <td class="theadTextDataClass">{{t.interPercentage}}</td>
                               <td class="theadTextDataClass">{{t.graduationPercentage}}</td>
                               <td class="theadTextDataClass">{{view.convertToInt(t.aggregate)}}</td>
                               <td class="theadTextDataClass">$80</td>
                               <td class="theadTextDataClass">$80</td>
                               <td class="theadTextDataClass">$80</td>
                               <td class="theadTextDataClass">$80</td>
                               <td class="theadTextDataClass">$80</td>
                               <td class="theadTextDataClass">$80</td>
                               <td class="theadTextDataClass">$80</td>
                           </tr>
                       </tbody>
                   </table>
               </div>
           </div>
           <div class="row">
				<div class="col-md-4">
					<div class="row">
						<div class="col-md-2"><p class="pageShowClass">Show</p></div>
						<div class="col-md-3">
							<select ng-model="pageValues" class="pagerShowSelectClass">
								<option value="20" selected>20</option>
								<option value="40">40</option>
								<option value="60">60</option>
								<option value="80">80</option>
								<option value="100">100</option>
								<option value="120">120</option>
								<option value="140">140</option>
							</select>
						</div>
						<div class="col-md-7"><p class="showOutOfResult">1-{{pageValues}} of {{view.studentsList.length}}</p></div>
					</div>
				</div>
				<div class="col-md-8">
					<dir-pagination-controls class="paginationStyleClass" max-size="10" direction-links="true" boundary-links="true"></dir-pagination-controls>
				</div>
			</div>
		</div>
		<div class="col-md-3">
			<div class="row">
				<div class="col-md-10">
					<h4 class="stdHeadhOne">{{view.student.fullName}}</h4>
				</div>
				<div class="col-md-2">
					<a data-toggle="tab" ng-click='view.fetchReport(view.student.email)' href="#progressbar"><button class="profileBtnStd"><i class="fa fa-user-circle" aria-hidden="true"></i></button></a>
				</div>
			</div>
			<!-- <div style="border-bottom: 1px solid #dbdbdb !important;height: 5px;margin-top:-1%;"></div> -->
			<div class="nav nav-tabs scrollmenu">
             <a data-toggle="tab" href="#personal" active style="margin:0px !important">Personal</a>
             <a data-toggle="tab" href="#eduaction" style="margin:0px !important">Education</a>
             <a data-toggle="tab" href="#fee" style="margin:0px !important">Fee</a>
             <a data-toggle="tab" href="#address" style="margin:0px !important">Addr</a>
             <a data-toggle="tab" style="margin:0px !important" onclick="myFunction()">More <i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
           </div>
			<div class="tab-content">
	        <div id="personal" class="tab-pane fade in active">
	          <table class="table">
       			<thead>
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-user" aria-hidden="true"></i> FullName</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails"> {{view.student.fullName}}</td>
       				</tr>
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-user" aria-hidden="true"></i> ParentName</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails"> {{view.student.parentName}}</td>
       				</tr>
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-user" aria-hidden="true"></i> Gender</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails"> {{view.student.gender}}</td>
       				</tr>
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-calendar" aria-hidden="true"></i> DOB</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails"> {{view.student.dob}}</td>
       				</tr>
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-envelope-o" aria-hidden="true"></i> Email</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails"> {{view.student.email}}</td>
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
                   					<td class="theadTextDataClassForDetails"> {{view.student.batchNumber}}</td>
                   				</tr>
                   				<tr>
                   					<td class="theadTextDataClassForDetails"><i class="fa fa-calendar-check-o" aria-hidden="true"></i> YOP</td>
                   					<td style="color:#444444 !important">:</td>
                   					<td class="theadTextDataClassForDetails"> {{view.student.graduationYOP}}</td>
                   				</tr>
                   				<tr>
                   					<td class="theadTextDataClassForDetails"><i class="fa fa-graduation-cap" aria-hidden="true"></i> gType</td>
                   					<td style="color:#444444 !important">:</td>
                   					<td class="theadTextDataClassForDetails"> {{view.student.graduationType}}</td>
                   				</tr>
                   				<tr>
                   					<td class="theadTextDataClassForDetails"><i class="fa fa-calendar" aria-hidden="true"></i> Branch</td>
                   					<td style="color:#444444 !important">:</td>
                   					<td class="theadTextDataClassForDetails"> {{view.student.graduationBranch}}</td>
                   				</tr>
                   				<tr>
                   					<td class="theadTextDataClassForDetails"><i class="fa fa-university" aria-hidden="true"></i> College</td>
                   					<td style="color:#444444 !important">:</td>
                   					<td class="theadTextDataClassForDetails"> {{view.student.graduationCollege}}</td>
                   				</tr>
                   				<tr>
                   					<th colspan="2" class="theadTextDataClass" style="text-align:center">% Percentages</th>
                   					<th colspan="2" class="theadTextDataClass" style="text-align:center">% MathScores</th>
              						<tr>
	              						<th class="theadTextDataClass">10th</th>
	              						<th class="theadTextDataClass">12th</th>
	              						<th class="theadTextDataClass"> Grad </th>
	              						<th class="theadTextDataClass"> Aggre </th>
	              						<th class="theadTextDataClass">10th</th>
	              						<th class="theadTextDataClass">12th</th>
              						</tr>
                   					<tr>
                   						<td class="theadTextDataClass"> {{view.student.sscPercentage}}</td>
                   						<td class="theadTextDataClass"> {{view.student.interPercentage}}</td>
                   						<td class="theadTextDataClass"> {{view.student.graduationPercentage}}</td>
                   						<td class="theadTextDataClass"> 90</td>
                   						<td class="theadTextDataClass">80</td>
                   						<td class="theadTextDataClass">90</td>
                   					</tr>
                   				</tr>
                   			</thead>
                   		</table>
	        </div>
	        <div id="fee" class="tab-pane fade">
	          <table class="table">
       			<thead>
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-user" aria-hidden="true"></i> TotalFee</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails"> {{view.student.feeTotal}}</td>
       				</tr>
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-user" aria-hidden="true"></i> FeePaid</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails"> {{view.student.feePaid}}</td>
       				</tr>
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-user" aria-hidden="true"></i> FeeDue</td>
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
       					<td class="theadTextDataClassForDetails"><i class="fa fa-user" aria-hidden="true"></i> H.No</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails"> {{view.student.locality}}</td>
       				</tr>
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-user" aria-hidden="true"></i> ParentName</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails"> {{view.student.parentName}}</td>
       				</tr>
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-user" aria-hidden="true"></i> Gender</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails"> {{view.student.gender}}</td>
       				</tr>
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-calendar" aria-hidden="true"></i> DOB</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails"> {{view.student.dob}}</td>
       				</tr>
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-envelope-o" aria-hidden="true"></i> Email</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails"> {{view.student.email}}</td>
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
	    </div>
    
		
		
		
		
		 <!--<br><br><br>
			<div style="position:sticky;top:0;position: -webkit-sticky;">
			<div class="panel-group" id="accordion" style="margin-top:5%;">
               <div class="panel panel-default">
                 <div class="panel-heading">
                   <h4 class="panel-title panelHeadTextData">
                     <a data-toggle="collapse" class="hoverColorChange" data-parent="#accordion" href="#collapse1">Personal Details</a>
                   </h4>
                 </div>
                 <div id="collapse1" class="panel-collapse collapse">
                   <div class="panel-body">
                   		<table class="table">
                   			<thead>
                   				<tr>
                   					<td class="theadTextDataClassForDetails"><i class="fa fa-user" aria-hidden="true"></i> FullName</td>
                   					<td style="color:#444444 !important">:</td>
                   					<td class="theadTextDataClassForDetails"> {{view.student.fullName}}</td>
                   				</tr>
                   				<tr>
                   					<td class="theadTextDataClassForDetails"><i class="fa fa-user" aria-hidden="true"></i> ParentName</td>
                   					<td style="color:#444444 !important">:</td>
                   					<td class="theadTextDataClassForDetails"> {{view.student.parentName}}</td>
                   				</tr>
                   				<tr>
                   					<td class="theadTextDataClassForDetails"><i class="fa fa-user" aria-hidden="true"></i> Gender</td>
                   					<td style="color:#444444 !important">:</td>
                   					<td class="theadTextDataClassForDetails"> {{view.student.gender}}</td>
                   				</tr>
                   				<tr>
                   					<td class="theadTextDataClassForDetails"><i class="fa fa-calendar" aria-hidden="true"></i> DOB</td>
                   					<td style="color:#444444 !important">:</td>
                   					<td class="theadTextDataClassForDetails"> {{view.student.dob}}</td>
                   				</tr>
                   				<tr>
                   					<td class="theadTextDataClassForDetails"><i class="fa fa-envelope-o" aria-hidden="true"></i> Email</td>
                   					<td style="color:#444444 !important">:</td>
                   					<td class="theadTextDataClassForDetails"> {{view.student.email}}</td>
                   				</tr>
                   			</thead>
                   		</table>
                   </div>
                 </div>
               </div>
               <div class="panel panel-default">
                 <div class="panel-heading">
                   <h4 class="panel-title panelHeadTextData">
                     <a data-toggle="collapse" class="hoverColorChange" data-parent="#accordion" href="#collapse2">Education Details</a>
                   </h4>
                 </div>
                 <div id="collapse2" class="panel-collapse collapse">
                   <div class="panel-body">
                   		<table class="table" style="border:0px solid #fff !important;">
                   			<thead>
                   				<tr>
                   					<td class="theadTextDataClassForDetails"><i class="fa fa-users" aria-hidden="true"></i> Batch</td>
                   					<td style="color:#444444 !important">:</td>
                   					<td class="theadTextDataClassForDetails"> {{view.student.batchNumber}}</td>
                   				</tr>
                   				<tr>
                   					<td class="theadTextDataClassForDetails"><i class="fa fa-calendar-check-o" aria-hidden="true"></i> YOP</td>
                   					<td style="color:#444444 !important">:</td>
                   					<td class="theadTextDataClassForDetails"> {{view.student.graduationYOP}}</td>
                   				</tr>
                   				<tr>
                   					<td class="theadTextDataClassForDetails"><i class="fa fa-graduation-cap" aria-hidden="true"></i> gType</td>
                   					<td style="color:#444444 !important">:</td>
                   					<td class="theadTextDataClassForDetails"> {{view.student.graduationType}}</td>
                   				</tr>
                   				<tr>
                   					<td class="theadTextDataClassForDetails"><i class="fa fa-calendar" aria-hidden="true"></i> Branch</td>
                   					<td style="color:#444444 !important">:</td>
                   					<td class="theadTextDataClassForDetails"> {{view.student.graduationBranch}}</td>
                   				</tr>
                   				<tr>
                   					<td class="theadTextDataClassForDetails"><i class="fa fa-university" aria-hidden="true"></i> College</td>
                   					<td style="color:#444444 !important">:</td>
                   					<td class="theadTextDataClassForDetails"> {{view.student.graduationCollege}}</td>
                   				</tr>
                   				<tr>
                   					<th colspan="2" class="theadTextDataClass"><i class="fa fa-percent" aria-hidden="true"></i> Percentages</th>
                   					<th colspan="2" class="theadTextDataClass"><i class="fa fa-percent" aria-hidden="true"></i> MathScores</th>
              						<tr>
	              						<th class="theadTextDataClass">10th</th>
	              						<th class="theadTextDataClass">12th</th>
	              						<th class="theadTextDataClass"> Grad </th>
	              						<th class="theadTextDataClass"> Aggre </th>
	              						<th class="theadTextDataClass">10th</th>
	              						<th class="theadTextDataClass">12th</th>
              						</tr>
                   					<tr>
                   						<td class="theadTextDataClass"> {{view.student.sscPercentage}}</td>
                   						<td class="theadTextDataClass"> {{view.student.interPercentage}}</td>
                   						<td class="theadTextDataClass"> {{view.student.graduationPercentage}}</td>
                   						<td class="theadTextDataClass"> {{(view.student.sscPercentage+view.student.interPercentage+view.student.graduationPercentage)/3}}</td>
                   						<td class="theadTextDataClass">80</td>
                   						<td class="theadTextDataClass">90</td>
                   					</tr>
                   				</tr>
                   			</thead>
                   		</table>
                   	</div>
                 </div>
               </div>
               <div class="panel panel-default">
                 <div class="panel-heading">
                   <h4 class="panel-title panelHeadTextData">
                     <a data-toggle="collapse" class="hoverColorChange" data-parent="#accordion" href="#collapse3">Fee Details</a>
                   </h4>
                 </div>
                 <div id="collapse3" class="panel-collapse collapse">
                   <div class="panel-body">
                   		<table class="table">
                   			<thead>
                   				<tr>
                   					<td class="theadTextDataClassForDetails"><i class="fa fa-user" aria-hidden="true"></i> TotalFee</td>
                   					<td style="color:#444444 !important">:</td>
                   					<td class="theadTextDataClassForDetails"> {{view.student.feeTotal}}</td>
                   				</tr>
                   				<tr>
                   					<td class="theadTextDataClassForDetails"><i class="fa fa-user" aria-hidden="true"></i> FeePaid</td>
                   					<td style="color:#444444 !important">:</td>
                   					<td class="theadTextDataClassForDetails"> {{view.student.feePaid}}</td>
                   				</tr>
                   				<tr>
                   					<td class="theadTextDataClassForDetails"><i class="fa fa-user" aria-hidden="true"></i> FeeDue</td>
                   					<td style="color:#444444 !important">:</td>
                   					<td class="theadTextDataClassForDetails"> {{(view.student.feeTotal-view.student.feePaid)}}</td>
                   				</tr>
                   			</thead>
                   		</table>
                   	</div>
                 </div>
               </div>
               <div class="panel panel-default">
                 <div class="panel-heading">
                   <h4 class="panel-title panelHeadTextData">
                     <a data-toggle="collapse" class="hoverColorChange" data-parent="#accordion" href="#collapse4">Address</a>
                   </h4>
                 </div>
                 <div id="collapse4" class="panel-collapse collapse">
                   <div class="panel-body">
                   	<table class="table">
                   			<thead>
                   				<tr>
                   					<td class="theadTextDataClassForDetails"><i class="fa fa-user" aria-hidden="true"></i> FullName</td>
                   					<td style="color:#444444 !important">:</td>
                   					<td class="theadTextDataClassForDetails"> {{view.student.fullName}}</td>
                   				</tr>
                   				<tr>
                   					<td class="theadTextDataClassForDetails"><i class="fa fa-user" aria-hidden="true"></i> ParentName</td>
                   					<td style="color:#444444 !important">:</td>
                   					<td class="theadTextDataClassForDetails"> {{view.student.parentName}}</td>
                   				</tr>
                   				<tr>
                   					<td class="theadTextDataClassForDetails"><i class="fa fa-user" aria-hidden="true"></i> Gender</td>
                   					<td style="color:#444444 !important">:</td>
                   					<td class="theadTextDataClassForDetails"> {{view.student.gender}}</td>
                   				</tr>
                   				<tr>
                   					<td class="theadTextDataClassForDetails"><i class="fa fa-calendar" aria-hidden="true"></i> DOB</td>
                   					<td style="color:#444444 !important">:</td>
                   					<td class="theadTextDataClassForDetails"> {{view.student.dob}}</td>
                   				</tr>
                   				<tr>
                   					<td class="theadTextDataClassForDetails"><i class="fa fa-envelope-o" aria-hidden="true"></i> Email</td>
                   					<td style="color:#444444 !important">:</td>
                   					<td class="theadTextDataClassForDetails"> {{view.student.email}}</td>
                   				</tr>
                   			</thead>
                   		</table>
                   </div>
                 </div>
               </div>
               <div class="panel panel-default">
                 <div class="panel-heading">
                   <h4 class="panel-title panelHeadTextData">
                     <a data-toggle="collapse" class="hoverColorChange" data-parent="#accordion" href="#collapse5">Progress</a>
                   </h4>
                 </div>
                 <div id="collapse5" class="panel-collapse collapse">
                   <div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                   sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                   quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</div>
                 </div>
               </div>
             </div>
             </div>
		</div> -->
	</div>
</div>

<br><br>
<br><br>
<br><br>
<div class="row">
	<div class="col-md-1">
		<p>
			<i class="fa fa-refresh filterIconClass" aria-hidden="true"></i>
			<i ng-click="view.displayD('filterDiv')" title="Search Student" class="fa fa-filter filterIconClass" aria-hidden="true"></i>
			<p style="font-size:11px !important;margin-left:-2%;">{{fstudentsList.length}} / {{view.studentsList.length}}</p>
		</p>
	</div>
	<div class="col-md-10" style="padding-left:0% !important;">
		<div id="filterDiv" class='container-fluid' style="">
			<div class='form-group col-md-2 col-sm-2'>
				<input type='text' style="margin-left: 3.5%;" placeholder='Student Name' ng-model="studentName" class='form-control inputFieldClass'>
				<i ng-click='studentName=""' class="fa fa-times" style="color:#ff6666;float:right;" aria-hidden="true"></i>
			</div>
			<div class='form-group col-md-2 col-sm-2'>
				<select ng-model="yearOfPass" class="form-control inputFieldClass">
				<option value="" selected="selected">Year Of Passing</option>
				<option value='2019'>2019</option>
				<option value='2018'>2018</option>
				<option value='2017'>2017</option><option value='2016'>2016</option>
				<option value='2015'>2015</option><option value='2014'>2014</option>
				<option value='2013'>2013</option><option value='2012'>2012</option>
				</select><i class="fa fa-times" ng-click='yearOfPass=""' style="color:#ff6666;float:right;" aria-hidden="true"></i>
			</div>
			<div class='form-group col-md-2 col-sm-2'>
				<select ng-model="batchNumber" class="form-control inputFieldClass">
				<option value="" selected="selected">All Batches</option>
				<c:forEach items="${batches }" var="b">
				<option value='${b.getBatchNumber() }'>${b.getBatchNumber() }</option>
				</c:forEach>
				</select><i class="fa fa-times" ng-click='batchNumber=""' style="color:#ff6666;float:right;" aria-hidden="true"></i>
			</div>
			<div class='form-group col-md-2 col-sm-2'>
				<select ng-model="branchName" class='form-control inputFieldClass'>
					<option value="" selected>Branch</option>
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
				<i class="fa fa-times" ng-click='branchName=""' style="color:#ff6666;float:right;" aria-hidden="true"></i>
			</div>
			<div class='form-group col-md-2 col-sm-2'>
				<select ng-model="graduationType" class='form-control inputFieldClass'>
					<option value='' selected="selected">Garduation Type</option>
					<option value='Btech'>BTech</option><option value='Mtech'>MTech</option><option value='MCA'>MCA</option><option value='MBA'>MBA</option>
					<option value='Degree'>Degree</option><option value='Others'>Others</option>
				</select>
				<i class="fa fa-times" ng-click='graduationType=""' style="color:#ff6666;float:right" aria-hidden="true"></i>
			</div>
			<div class='form-group col-md-2 col-sm-2'>
				<select ng-model="fee" class='form-control inputFieldClass'>
					<option selected="selected" value="-1">Fee</option>
					<option value="1">Paid</option>
					<option value="0">Not Paid</option>
					<option value="0.5">Partially Paid</option>
				</select>
				<i class="fa fa-times" ng-click='fee=""' style="color:#ff6666;float:right" aria-hidden="true"></i>
			</div>
			<div class='form-group col-md-2 col-sm-2'>
				<select ng-model="genderI" class='form-control inputFieldClass'>
				<option value="" selected="selected">Gender</option>
				<option value='male'>Male</option><option value='female'>Female</option></select>
				<i class="fa fa-times" ng-click='genderI=""' style="color:#ff6666;float:right" aria-hidden="true"></i>
			</div>
			<div class='col-md-2 col-sm-2'>
				<p class="rangeInputText">Aggregation</p>
				<input ng-model="aggregate" class="rangeInputClass" type='range' id='' name='rangeInput' min='0' max='100' value='0' oninput='amount.value=rangeInput.value'>
				<output name='amount' id='amount' for='rangeInput'>0</output>
				<i class="fa fa-times" ng-click='aggregate=0' style="color:#ff6666;" aria-hidden="true"></i>
				
			</div>
			<div class='col-md-2 col-sm-2'>
				<p class="rangeInputText">SSC</p>
				<input ng-model="SSC" type='range' class="rangeInputClass" id='' name='rangeInput1' min='0' max='100' value='0' oninput='amount1.value=rangeInput1.value'>
				<output name='amount1' id='amount1' for='rangeInput1'>0</output>
				<i class="fa fa-times" ng-click='SSC=0' style="color:#ff6666;" aria-hidden="true"></i>
				
			</div>	
			<div class='col-md-2 col-sm-2'>
				<p class="rangeInputText">Inter</p>
				<input ng-model="inter" type='range' class="rangeInputClass" id='' name='rangeInput2' min='0' max='100' value='0' oninput='amount2.value=rangeInput2.value'>
				<output name='amount2' id='amount2' for='rangeInput2'>0</output>
				<i class="fa fa-times" ng-click='inter=0' style="color:#ff6666;" aria-hidden="true"></i>
				
			</div>
			<div class='col-md-2 col-sm-2'>
				<p class="rangeInputText">Degree</p>
				<input ng-model="degree" type='range' class="rangeInputClass" id='' name='rangeInput3' min='0' max='100' value='0' oninput='amount3.value=rangeInput3.value'>
				<output name='amount3' id='amount3' for='rangeInput3'>0</output>
				<i class="fa fa-times" ng-click='degree=0' style="color:#ff6666;" aria-hidden="true"></i>
			</div>
			<div class="col-md-2 col-sm-2">
				<button ng-click="view.resetFilters()" class="btn btn-default resetBtnsInSearch">Reset</button>
			</div>
		</div>
	</div>
	<div class="col-md-1 col-sm-0"></div>
</div>
<hr class="htLineStdClass">


<div id="innerStArea">

<div class='container-fluid'><div class='row'>

<div class='col-md-8 col-sm-8' style='height:430px;overflow-y:scroll;'> 
 		<table class='table table-bordered' style='border: 1px solid #ddd !important;'>
 		<thead style="position: -webkit-sticky !important;position: sticky !important;top: 0 !important;z-index: 1;"> 
 		<tr><th class='thText'><div class='checkbox'><label style='font-weight:600 !important;'><input ng-model="checkAll" type='checkbox' ng-click='selectAll()' style='height:15px;width:15px;'>All</label></div></th><th class='thText'>B No</th><th class='thText'>FullName</th><th class='thText'>FeePaid</th> 
 		<th class='thText'>TotalFee</th><th class='thText'>G YOP</th><th class='thText'>Percentage<br>(10+12+UG)</th>
 		<!-- <th class='thText' colspan='2'>View More</th> 
 		<th class='thText'>Resume</th> --></tr> 
 		</thead> 
 		
 		
 		
 		<tbody>
 		
 		<tr ng-repeat="t in ( fstudentsList= (view.studentsList | filter: { fullName: studentName, graduationType: graduationType, graduationBranch: branchName, gender: genderI, batchNumber: batchNumber} | filter: sscFilter | filter: interFilter | filter: aggregateFilter | filter: degreeFilter | filter: feeFilter ) )">
 		<td style="width:6% !important;"><div class='checkbox'><label><input ng-click="view.checkStudent(t,$event)" type='checkbox' style='height:15px;width:15px;margin-left:-17% !important;'></label></div></td>
 		<td class='tdText' style='padding-top:1% !important;'>
 		
 		<span ng-if=" t.feeTotal-t.feePaid <= 0">{{t.batchNumber}}</span>
 		<span ng-if="t.feeTotal-t.feePaid > 0" style="background-color:red;padding:15% !important;color:white; border-radius:50%;">{{t.batchNumber}}</span>
 		
 		</td>
 		<td class='tdText' style="text-align: left !important;width:30% !important">{{t.fullName}} <i ng-click='view.studentDetails(t)' class="fa fa-address-card-o" style="padding-left:1%;" aria-hidden="true"></i></td>
 		
 		<td class='tdText'><span>{{t.feePaid}}<i class='fa fa-plus-square' ng-click='view.showhide("paidUFee_"+t.email)' aria-hidden='true'></i></span>
 		
 	   <span id='{{"paidUFee_"+t.email}}' style='display:none'><input class='form-control' type='number' style='border:1px solid #00a69c !important;' placeholder='Add fee' id='{{t.email+"Fee"}}'/> <i class='fa fa-plus-square' ng-click='view.updateFee(t)' aria-hidden='true'></i></span></td>
 		<td class='tdText'><span id='{{"feeUpdate_"+t.email}}'>{{t.feeTotal}}<i style='cursor:pointer;' ng-click='view.showhide("totalUFee_"+t.email)' class='fa fa-pencil-square' aria-hidden='true'></i></span>
 		<span style="display:none" id='{{"totalUFee_"+t.email}}'><input type='number' id='{{"totalFee_"+t.email}}' value='20000'><i style='cursor:pointer;color:66ffff' ng-click='view.updateTotalFee(t.email)' class='fa fa-pencil-square' aria-hidden='true'></i>
 		</span></td>
 		<td class='tdText'>{{t.graduationYOP}}</td>
 		<td class='tdText'>({{t.sscPercentage}}+{{t.interPercentage}}+{{t.graduationPercentage}})<br>{{view.convertToInt(t.aggregate)}}</td>
 		<!-- <td style='font-size:12px !important;'> <i ng-click='view.studentDetails(t)' class="fa fa-address-card-o" aria-hidden="true"></i></td>
 		<td style='font-size:12px !important;'><i class="fa fa-tasks" ng-click='view.fetchReport(t.email)' aria-hidden="true"></i></td>
 		<td style='font-size:12px !important;'><a href='downloadResume/"+t.email+"/any' target='_blank'><i class="fa fa-file-image-o" aria-hidden="true"></i></a></td> -->
 		</tr>
 	
 <!-- 
 	<tr><td colspan='10'><div id='{{"V"+t.email}}' class='container-fluid' style='display:none;width:96%;background-color:#fff;margin:auto;border:1px solid #00a69c;border-radius:10px;'>
 			
 			
 			<div class'row' style='margin:1% !important;'>
 			<h3 style='color:#ff6666;text-align:center !important;'>More details</h3>
 				<div class='col-md-6 col-sm-6'>
 					<div class='row' style='margin:1% !important;'>
 						<div class='col-md-6 col-sm-6'>
				 			<p style='padding-top:1% !important;font-weight:600;'>Parent Name<span style='float:right;'>:</span></p>
				 			<p style='font-weight:600;'>Parent Mobile<span style='float:right;'>:</span></p>
				 			<p style='font-weight:600;'>HouseNo<span style='float:right;'>:</span></p>
				 			<p style='font-weight:600;'>Locality or street<span style='float:right;'>:</span></p>
				 			<p style='font-weight:600;'>City or District<span style='float:right;'>:</span></p>
				 			<p style='font-weight:600;'>State<span style='float:right;'>:</span></p>
				 		</div>
				 		<div class='col-md-6 col-sm-6'>
				 			<p>{{t.parentName}}</p>
				 			<p>{{t.mobile_Parent}}</p>
				 			<p>{{t.houseNo}}</p>
				 			<p>{{t.locality}}</p>
				 			<p>{{t.city}}</p>
				 			<p>{{t.state}}</p>
				 		</div>
				 	</div>
				 </div>
	 			<div class='col-md-6 col-sm-6'>
	 				<div class='row'>
	 					<div class='col-md-6 col-sm-6'>
				 			<p style='font-weight:600;padding-top:1% !important;'>Gender<span style='float:right;'>:</span></p>
				 			<p style='font-weight:600;'>SSC Percentage<span style='float:right;'>:</span></p>
				 			<p style='font-weight:600;'>Inter Percentage<span style='float:right;'>:</span></p>
				 			<p style='font-weight:600;'>Graduation Percentage<span style='float:right;'>:</span></p>
				 			<p style='font-weight:600;'>Graduation Type<span style='float:right;'>:</span></p>
				 			<p style='font-weight:600;'>Graduation College<span style='float:right;'>:</span></p>
				 		</div>
				 		<div class='col-md-6 col-sm-6'>
				 			<p>{{t.gender}}</p>
				 			<p>{{t.sscPercentage}}</p>
				 			<p>{{t.interPercentage}}</p>
				 			<p>{{t.graduationPercentage}}</p>
				 			<p>{{t.graduationType}}</p>
				 			<p>{{t.graduationCollege}}</p>
				 		</div>
				 	</div>
				 </div>
			</div>
			</div>
			
			
			
			</td>
			</tr>
			 -->
 		</tbody>
	</table>
		</div>
	<div class="col-md-4 col-sm-4" style='height:430px;overflow-y:scroll;'>
		<div class="row fixedStdDetailsHeading">
			<div class="col-md-8">
				<h4>{{view.student.fullName}} <i class="fa fa-pencil-square-o" ng-click="editableForm.$show()" ng-show="!editableForm.$visible" style="padding-left:1% !mportant" aria-hidden="true"></i> </h4>
			</div>
			<div class="col-md-4">
				<i ng-click='view.studentDetails(view.student)' class="fa fa-address-card-o" aria-hidden="true"></i>
				<i class="fa fa-tasks" ng-click='view.fetchReport(view.student.email)' aria-hidden="true"></i>
				<a href='downloadResume/"+view.student.email+"/any' target='_blank'><i class="fa fa-file-image-o" aria-hidden="true"></i></a>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
		<form editable-form name="editableForm" onaftersave="saveStudent()">
			
		<div id='viewMore_Student' class='container-fluid' style='display:none;width:96%;background-color:#fff;margin:auto;border-radius:10px;'>
 			
 			<span ng-show="editableForm.$visible">
        <button type="submit" class="btn btn-primary" ng-disabled="editableForm.$waiting">
          Save
        </button>
        <button type="button" class="btn btn-default" ng-disabled="editableForm.$waiting" ng-click="editableForm.$cancel()">
          Cancel
        </button>
      </span>
 			
 			
 				<h5 class="stdHeadTextClass">Personal-details</h5>
 				<div class='col-md-12 col-sm-12 detailsBoxClass'>
 					<div class="row">
 						<div class="col-md-6">
 							<p class="textOfStdDetails" style="float:left;" editable-text="view.student.fullName" e-name="fullName"><i class="fa fa-user" aria-hidden="true"></i> Name :  {{view.student.fullName}}</p> 
		 					<p class="textOfStdDetails" editable-text="view.student.parentName" e-name="parentName"><i class="fa fa-user" aria-hidden="true"></i> ParentName : {{view.student.parentName}}</p>
		 			
 						</div>
 						<div class="col-md-6">
 							<p class="textOfStdDetails"><i class="fa fa-btc" aria-hidden="true"></i> Batch Number : <span class="batchNumClassForStdDet">{{view.student.batchNumber}}</span></p>
 							<p class="textOfStdDetails" editable-select="view.student.gender" e-name="gender" e-ng-options="s.value as s.text for s in genders"><i class="fa fa-user-circle" aria-hidden="true"></i> Gender : {{view.student.gender}}</p>
		 					<p class="textOfStdDetails" editable-bsdate="view.student.dob" e-is-open="opened.$data" e-name="dob" e-datepicker-popup="dd-MMMM-yyyy"><i class="fa fa-calendar" aria-hidden="true"></i> DOB : {{ (view.student.dob | date:"dd/MM/yyyy") || 'empty'}}</p>
 						</div>
 					</div>
		 		</div><br>
				<h5 class="stdHeadTextClass">Education-details</h5>
	 			<div class='col-md-12 col-sm-12 detailsBoxClass'>
	 				<div class='row'>
				 		<div class='col-md-12 col-sm-12'>
				 			<p class="textOfStdDetails col-md-6" editable-text="view.student.graduationYOP" e-name="graduationYOP"><i class="fa fa-calendar-check-o" aria-hidden="true"></i> YOP : {{view.student.graduationYOP}}</p>
				 			<p class="textOfStdDetails col-md-6" editable-select="view.student.graduationBranch" e-name="graduationBranch" e-ng-options="s.value as s.text for s in graduationBranches"><i class="fa fa-building-o" aria-hidden="true"></i> Branch : {{view.student.graduationBranch}}</p>	
				 			<p class="textOfStdDetails col-md-6" editable-select="view.student.graduationType" e-name="graduationType" e-ng-options="s.value as s.text for s in graduationTypes"><i class="fa fa-graduation-cap" aria-hidden="true"></i> GType : {{view.student.graduationType}}</p>
				 			<p class="textOfStdDetails col-md-6" editable-text="view.student.graduationCollege" e-name="graduationCollege"><i class="fa fa-university" aria-hidden="true"></i> College : {{view.student.graduationCollege}}</p>
				 		</div>
				 	</div>
				 	<div class="row">
				 		<div class="col-md-12 col-sm-12">
				 			<div style="border:1px solid #00a69c;border-radius:10px;padding:1% 2% 1% 2%;width:100%;">
				 				<p class="textOfStdDetails">
				 					<div class="progress">
					    				<div  editable-text="view.student.sscPercentage" e-name="sscPercentage" class="progress-bar progress-bar-striped active textOfStdDetails progressBarClass" role="progressbar" aria-valuenow="{{view.student.sscPercentage}}" aria-valuemin="0" aria-valuemax="100" style="width:{{view.student.sscPercentage}}%;">
					      					SSC : {{view.student.sscPercentage}}%
					    				</div>
					 				</div>
				 				</p>
				 				<p class="textOfStdDetails">
				 					<div class="progress">
					    				<div editable-text="view.student.interPercentage" e-name="interPercentage" class="progress-bar progress-bar-striped active textOfStdDetails progressBarClass" role="progressbar" aria-valuenow="{{view.student.interPercentage}}" aria-valuemin="0" aria-valuemax="100" style="width:{{view.student.interPercentage}}%;">
					      					Inter : {{view.student.interPercentage}}%
					    				</div>
					 				</div>
				 				</p>
				 				<p class="textOfStdDetails">
				 					<div class="progress">
					    				<div editable-text="view.student.graduationPercentage" e-name="graduationPercentage" class="progress-bar progress-bar-striped active textOfStdDetails progressBarClass" role="progressbar" aria-valuenow="{{view.student.graduationPercentage}}" aria-valuemin="0" aria-valuemax="100" style="width:{{view.student.graduationPercentage}}%;">
					      					Degree : {{view.student.graduationPercentage}}%
					    				</div>
					 				</div>
				 				</p>
				 				<p class="textOfStdDetails">
				 					<div class="progress">
					    				<div editable-text="view.student.aggregate" e-name="aggregate" class="progress-bar progress-bar-striped active textOfStdDetails progressBarClass" role="progressbar" aria-valuenow="{{view.student.aggregate}}" aria-valuemin="0" aria-valuemax="100" style="width:{{view.student.aggregate}}%;">
					      					Aggregation : {{view.student.aggregate}}%
					    				</div>
					 				</div>
				 				</p>
				 			</div>
				 		</div>
				 	</div>
				 </div>
				 <br>
				 <h5 class="stdHeadTextClass">Contact-details</h5>
				 <div class="col-md-12 col-sm-12 detailsBoxClass">
		 			<p class="textOfStdDetails col-md-12 col-sm-12" editable-text="view.student.email" e-name="email"><i class="fa fa-envelope-o" aria-hidden="true"></i> Email : {{view.student.email}}</p>
		 			<p class="textOfStdDetails col-md-6 col-sm-12" editable-text="view.student.mobile" e-name="mobile"><i class="fa fa-mobile" aria-hidden="true"></i> S Mobile : {{view.student.mobile}}</p>
		 			
		 			<p class="textOfStdDetails col-md-6 col-sm-12" editable-text="view.student.mobile_Parent" e-name="mobile_Parent"><i class="fa fa-mobile" aria-hidden="true"></i> P Mobile :{{view.student.mobile_Parent}}</p>
		 			<h5 class="stdHeadTextClass"><i class="fa fa-address-card" aria-hidden="true"></i> Address</h5>
		 			<div class="col-md-8 detailsBoxClass">
			 			<p class="textOfStdDetails" editable-text="view.student.locality" e-name="locality">{{view.student.locality}}</p>
			 			<p class="textOfStdDetails" editable-text="view.student.city" e-name="city">{{view.student.city}}</p>
			 			<p class="textOfStdDetails" editable-select="view.student.state" e-name="state" e-ng-options="s.value as s.text for s in states">{{view.student.state}}</p>
		 			</div>
		 			<div class="col-md-4">
		 				<button style="width:8%;margin:auto;display:block;font-size:13px;" class="btn btn-default">View In Maps</button>
		 			</div>
			 	</div>
			</div>
		</form>
		</div>
		</div>
		</div>
		
		
		
		
		</div></div>
 		
 		
 		


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
    var url="/WebContent/WEB-INF/views/stdProfilePage.html";
    var myWindow = window.open(url);
    //myWindow.resizeTo(1440,1000);
}
</script>
<script type="text/javascript">
    $(document).ready(function() {
    	$('#multi-select-demotype').multiselect();
    	$('#multi-select-demobranch').multiselect();
    	$('#multi-select-demobatch').multiselect();
    	$('#multi-select-demoyop').multiselect();
        $('#multi-select-demoSscForModel').multiselect();
        $('#multi-select-demoInterForModel').multiselect();
        $('#multi-select-demoDegreeForModel').multiselect();
        $('#multi-select-demoAggreForModel').multiselect();
        
        $('#multi-select-FeeForModel').multiselect();
        $('#multi-select-StateForModel').multiselect();

    });
</script>

<script>
/**
 * Bootstrap Multiselect (https://github.com/davidstutz/bootstrap-multiselect)
 * 
 * Apache License, Version 2.0:
 * Copyright (c) 2012 - 2015 David Stutz
 * 
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a
 * copy of the License at http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations
 * under the License.
 * 
 * BSD 3-Clause License:
 * Copyright (c) 2012 - 2015 David Stutz
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *    - Redistributions of source code must retain the above copyright notice,
 *      this list of conditions and the following disclaimer.
 *    - Redistributions in binary form must reproduce the above copyright notice,
 *      this list of conditions and the following disclaimer in the documentation
 *      and/or other materials provided with the distribution.
 *    - Neither the name of David Stutz nor the names of its contributors may be
 *      used to endorse or promote products derived from this software without
 *      specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
 * ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
!function ($) {
    "use strict";// jshint ;_;

    if (typeof ko !== 'undefined' && ko.bindingHandlers && !ko.bindingHandlers.multiselect) {
        ko.bindingHandlers.multiselect = {
            after: ['options', 'value', 'selectedOptions', 'enable', 'disable'],

            init: function(element, valueAccessor, allBindings, viewModel, bindingContext) {
                var $element = $(element);
                var config = ko.toJS(valueAccessor());

                $element.multiselect(config);

                if (allBindings.has('options')) {
                    var options = allBindings.get('options');
                    if (ko.isObservable(options)) {
                        ko.computed({
                            read: function() {
                                options();
                                setTimeout(function() {
                                    var ms = $element.data('multiselect');
                                    if (ms)
                                        ms.updateOriginalOptions();//Not sure how beneficial this is.
                                    $element.multiselect('rebuild');
                                }, 1);
                            },
                            disposeWhenNodeIsRemoved: element
                        });
                    }
                }

                //value and selectedOptions are two-way, so these will be triggered even by our own actions.
                //It needs some way to tell if they are triggered because of us or because of outside change.
                //It doesn't loop but it's a waste of processing.
                if (allBindings.has('value')) {
                    var value = allBindings.get('value');
                    if (ko.isObservable(value)) {
                        ko.computed({
                            read: function() {
                                value();
                                setTimeout(function() {
                                    $element.multiselect('refresh');
                                }, 1);
                            },
                            disposeWhenNodeIsRemoved: element
                        }).extend({ rateLimit: 100, notifyWhenChangesStop: true });
                    }
                }

                //Switched from arrayChange subscription to general subscription using 'refresh'.
                //Not sure performance is any better using 'select' and 'deselect'.
                if (allBindings.has('selectedOptions')) {
                    var selectedOptions = allBindings.get('selectedOptions');
                    if (ko.isObservable(selectedOptions)) {
                        ko.computed({
                            read: function() {
                                selectedOptions();
                                setTimeout(function() {
                                    $element.multiselect('refresh');
                                }, 1);
                            },
                            disposeWhenNodeIsRemoved: element
                        }).extend({ rateLimit: 100, notifyWhenChangesStop: true });
                    }
                }

                var setEnabled = function (enable) {
                    setTimeout(function () {
                        if (enable)
                            $element.multiselect('enable');
                        else
                            $element.multiselect('disable');
                    });
                };

                if (allBindings.has('enable')) {
                    var enable = allBindings.get('enable');
                    if (ko.isObservable(enable)) {
                        ko.computed({
                            read: function () {
                                setEnabled(enable());
                            },
                            disposeWhenNodeIsRemoved: element
                        }).extend({ rateLimit: 100, notifyWhenChangesStop: true });
                    } else {
                        setEnabled(enable);
                    }
                }

                if (allBindings.has('disable')) {
                    var disable = allBindings.get('disable');
                    if (ko.isObservable(disable)) {
                        ko.computed({
                            read: function () {
                                setEnabled(!disable());
                            },
                            disposeWhenNodeIsRemoved: element
                        }).extend({ rateLimit: 100, notifyWhenChangesStop: true });
                    } else {
                        setEnabled(!disable);
                    }
                }

                ko.utils.domNodeDisposal.addDisposeCallback(element, function() {
                    $element.multiselect('destroy');
                });
            },

            update: function(element, valueAccessor, allBindings, viewModel, bindingContext) {
                var $element = $(element);
                var config = ko.toJS(valueAccessor());

                $element.multiselect('setOptions', config);
                $element.multiselect('rebuild');
            }
        };
    }

    function forEach(array, callback) {
        for (var index = 0; index < array.length; ++index) {
            callback(array[index], index);
        }
    }

    /**
     * Constructor to create a new multiselect using the given select.
     *
     * @param {jQuery} select
     * @param {Object} options
     * @returns {Multiselect}
     */
    function Multiselect(select, options) {

        this.$select = $(select);
        
        // Placeholder via data attributes
        if (this.$select.attr("data-placeholder")) {
            options.nonSelectedText = this.$select.data("placeholder");
        }
        
        this.options = this.mergeOptions($.extend({}, options, this.$select.data()));

        // Initialization.
        // We have to clone to create a new reference.
        this.originalOptions = this.$select.clone()[0].options;
        this.query = '';
        this.searchTimeout = null;
        this.lastToggledInput = null;

        this.options.multiple = this.$select.attr('multiple') === "multiple";
        this.options.onChange = $.proxy(this.options.onChange, this);
        this.options.onDropdownShow = $.proxy(this.options.onDropdownShow, this);
        this.options.onDropdownHide = $.proxy(this.options.onDropdownHide, this);
        this.options.onDropdownShown = $.proxy(this.options.onDropdownShown, this);
        this.options.onDropdownHidden = $.proxy(this.options.onDropdownHidden, this);
        this.options.onInitialized = $.proxy(this.options.onInitialized, this);
        
        // Build select all if enabled.
        this.buildContainer();
        this.buildButton();
        this.buildDropdown();
        this.buildSelectAll();
        this.buildDropdownOptions();
        this.buildFilter();

        this.updateButtonText();
        this.updateSelectAll(true);

        if (this.options.disableIfEmpty && $('option', this.$select).length <= 0) {
            this.disable();
        }
        
        this.$select.hide().after(this.$container);
        this.options.onInitialized(this.$select, this.$container);
    }

    Multiselect.prototype = {

        defaults: {
            /**
             * Default text function will either print 'None selected' in case no
             * option is selected or a list of the selected options up to a length
             * of 3 selected options.
             * 
             * @param {jQuery} options
             * @param {jQuery} select
             * @returns {String}
             */
            buttonText: function(options, select) {
                if (this.disabledText.length > 0 
                        && (this.disableIfEmpty || select.prop('disabled')) 
                        && options.length == 0) {
                    
                    return this.disabledText;
                }
                else if (options.length === 0) {
                    return this.nonSelectedText;
                }
                else if (this.allSelectedText 
                        && options.length === $('option', $(select)).length 
                        && $('option', $(select)).length !== 1 
                        && this.multiple) {

                    if (this.selectAllNumber) {
                        return this.allSelectedText + ' (' + options.length + ')';
                    }
                    else {
                        return this.allSelectedText;
                    }
                }
                else if (options.length > this.numberDisplayed) {
                    return options.length + ' ' + this.nSelectedText;
                }
                else {
                    var selected = '';
                    var delimiter = this.delimiterText;
                    
                    options.each(function() {
                        var label = ($(this).attr('label') !== undefined) ? $(this).attr('label') : $(this).text();
                        selected += label + delimiter;
                    });
                    
                    return selected.substr(0, selected.length - 2);
                }
            },
            /**
             * Updates the title of the button similar to the buttonText function.
             * 
             * @param {jQuery} options
             * @param {jQuery} select
             * @returns {@exp;selected@call;substr}
             */
            buttonTitle: function(options, select) {
                if (options.length === 0) {
                    return this.nonSelectedText;
                }
                else {
                    var selected = '';
                    var delimiter = this.delimiterText;
                    
                    options.each(function () {
                        var label = ($(this).attr('label') !== undefined) ? $(this).attr('label') : $(this).text();
                        selected += label + delimiter;
                    });
                    return selected.substr(0, selected.length - 2);
                }
            },
            /**
             * Create a label.
             *
             * @param {jQuery} element
             * @returns {String}
             */
            optionLabel: function(element){
                return $(element).attr('label') || $(element).text();
            },
            /**
             * Create a class.
             *
             * @param {jQuery} element
             * @returns {String}
             */
            optionClass: function(element) {
                return $(element).attr('class') || '';
            },
            /**
             * Triggered on change of the multiselect.
             * 
             * Not triggered when selecting/deselecting options manually.
             * 
             * @param {jQuery} option
             * @param {Boolean} checked
             */
            onChange : function(option, checked) {

            },
            /**
             * Triggered when the dropdown is shown.
             *
             * @param {jQuery} event
             */
            onDropdownShow: function(event) {

            },
            /**
             * Triggered when the dropdown is hidden.
             *
             * @param {jQuery} event
             */
            onDropdownHide: function(event) {

            },
            /**
             * Triggered after the dropdown is shown.
             * 
             * @param {jQuery} event
             */
            onDropdownShown: function(event) {
                
            },
            /**
             * Triggered after the dropdown is hidden.
             * 
             * @param {jQuery} event
             */
            onDropdownHidden: function(event) {
                
            },
            /**
             * Triggered on select all.
             */
            onSelectAll: function(checked) {
                
            },
            /**
             * Triggered after initializing.
             *
             * @param {jQuery} $select
             * @param {jQuery} $container
             */
            onInitialized: function($select, $container) {

            },
            enableHTML: false,
            buttonClass: 'btn btn-default',
            inheritClass: false,
            buttonWidth: 'auto',
            buttonContainer: '<div class="btn-group" />',
            dropRight: false,
            dropUp: false,
            selectedClass: 'active',
            // Maximum height of the dropdown menu.
            // If maximum height is exceeded a scrollbar will be displayed.
            maxHeight: false,
            checkboxName: false,
            includeSelectAllOption: false,
            includeSelectAllIfMoreThan: 0,
            selectAllText: ' Select all',
            selectAllValue: 'multiselect-all',
            selectAllName: false,
            selectAllNumber: true,
            selectAllJustVisible: true,
            enableFiltering: false,
            enableCaseInsensitiveFiltering: false,
            enableFullValueFiltering: false,
            enableClickableOptGroups: false,
            enableCollapsibelOptGroups: false,
            filterPlaceholder: 'Search',
            // possible options: 'text', 'value', 'both'
            filterBehavior: 'text',
            includeFilterClearBtn: true,
            preventInputChangeEvent: false,
            nonSelectedText: 'All',
            nSelectedText: 'selected',
            allSelectedText: 'All selected',
            numberDisplayed: 3,
            disableIfEmpty: false,
            disabledText: '',
            delimiterText: ', ',
            templates: {
                button: '<button type="button" style="font-family: Segoe UI,Trebuchet MS,Sans-Serif;align-items: center;border-color: rgb(169, 169, 169) !important;margin-left: -16px !important;white-space: pre;-webkit-rtl-ordering: logical;color: black;background-color: white;border-width: 1px;border-style: solid;border-color: initial;border-image: initial;display:block !important;border-radius:0px !important;font-size:12px;padding: 2px 0px 2px 2px;" class="multiselect dropdown-toggle" data-toggle="dropdown"><span class="multiselect-selected-text"></span> <b class="caret" style="margin-left: 94px;margin-right: 2px;"></b></button>',
                ul: '<ul class="multiselect-container dropdown-menu" style="height:150px;overflow-y:scroll;font-size:12px !important;border-radius:0px !important;font-family: Segoe UI,Trebuchet MS,Sans-Serif;"></ul>',
                filter: '<li class="multiselect-item filter"  style="font-family: Segoe UI,Trebuchet MS,Sans-Serif;"><div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span><input class="form-control multiselect-search" type="text"></div></li>',
                filterClearBtn: '<span class="input-group-btn"><button class="btn btn-default multiselect-clear-filter" type="button"><i class="glyphicon glyphicon-remove-circle"></i></button></span>',
                li: '<li  style="font-family: Segoe UI,Trebuchet MS,Sans-Serif;"><a tabindex="0"><label  style="padding: 3px 0px 3px 28px !important;font-family: Segoe UI,Trebuchet MS,Sans-Serif !important;font-weight:normal !important;"></label></a></li>',
                divider: '<li class="multiselect-item divider"></li>',
                liGroup: '<li class="multiselect-item multiselect-group"><label></label></li>'
            }
        },

        constructor: Multiselect,

        /**
         * 
         * Builds the container of the multiselect.
         */
        buildContainer: function() {
            this.$container = $(this.options.buttonContainer);
            this.$container.on('show.bs.dropdown', this.options.onDropdownShow);
            this.$container.on('hide.bs.dropdown', this.options.onDropdownHide);
            this.$container.on('shown.bs.dropdown', this.options.onDropdownShown);
            this.$container.on('hidden.bs.dropdown', this.options.onDropdownHidden);
        },

        /**
         * Builds the button of the multiselect.
         */
        buildButton: function() {
            this.$button = $(this.options.templates.button).addClass(this.options.buttonClass);
            if (this.$select.attr('class') && this.options.inheritClass) {
                this.$button.addClass(this.$select.attr('class'));
            }
            // Adopt active state.
            if (this.$select.prop('disabled')) {
                this.disable();
            }
            else {
                this.enable();
            }

            // Manually add button width if set.
            if (this.options.buttonWidth && this.options.buttonWidth !== 'auto') {
                this.$button.css({
                    'width' : this.options.buttonWidth,
                    'overflow' : 'hidden',
                    'text-overflow' : 'ellipsis'
                });
                this.$container.css({
                    'width': this.options.buttonWidth
                });
            }

            // Keep the tab index from the select.
            var tabindex = this.$select.attr('tabindex');
            if (tabindex) {
                this.$button.attr('tabindex', tabindex);
            }

            this.$container.prepend(this.$button);
        },

        /**
         * Builds the ul representing the dropdown menu.
         */
        buildDropdown: function() {

            // Build ul.
            this.$ul = $(this.options.templates.ul);

            if (this.options.dropRight) {
                this.$ul.addClass('pull-right');
            }

            // Set max height of dropdown menu to activate auto scrollbar.
            if (this.options.maxHeight) {
                // TODO: Add a class for this option to move the css declarations.
                this.$ul.css({
                    'max-height': this.options.maxHeight + 'px',
                    'overflow-y': 'auto',
                    'overflow-x': 'hidden'
                });
            }
            
            if (this.options.dropUp) {
                
                var height = Math.min(this.options.maxHeight, $('option[data-role!="divider"]', this.$select).length*26 + $('option[data-role="divider"]', this.$select).length*19 + (this.options.includeSelectAllOption ? 26 : 0) + (this.options.enableFiltering || this.options.enableCaseInsensitiveFiltering ? 44 : 0));
                var moveCalc = height + 34;
                
                this.$ul.css({
                    'max-height': height + 'px',
                    'overflow-y': 'auto',
                    'overflow-x': 'hidden',
                    'margin-top': "-" + moveCalc + 'px'
                });
            }
            
            this.$container.append(this.$ul);
        },

        /**
         * Build the dropdown options and binds all nessecary events.
         * 
         * Uses createDivider and createOptionValue to create the necessary options.
         */
        buildDropdownOptions: function() {

            this.$select.children().each($.proxy(function(index, element) {

                var $element = $(element);
                // Support optgroups and options without a group simultaneously.
                var tag = $element.prop('tagName')
                    .toLowerCase();
            
                if ($element.prop('value') === this.options.selectAllValue) {
                    return;
                }

                if (tag === 'optgroup') {
                    this.createOptgroup(element);
                }
                else if (tag === 'option') {

                    if ($element.data('role') === 'divider') {
                        this.createDivider();
                    }
                    else {
                        this.createOptionValue(element);
                    }

                }

                // Other illegal tags will be ignored.
            }, this));

            // Bind the change event on the dropdown elements.
            $('li input', this.$ul).on('change', $.proxy(function(event) {
                var $target = $(event.target);

                var checked = $target.prop('checked') || false;
                var isSelectAllOption = $target.val() === this.options.selectAllValue;

                // Apply or unapply the configured selected class.
                if (this.options.selectedClass) {
                    if (checked) {
                        $target.closest('li')
                            .addClass(this.options.selectedClass);
                    }
                    else {
                        $target.closest('li')
                            .removeClass(this.options.selectedClass);
                    }
                }

                // Get the corresponding option.
                var value = $target.val();
                var $option = this.getOptionByValue(value);

                var $optionsNotThis = $('option', this.$select).not($option);
                var $checkboxesNotThis = $('input', this.$container).not($target);

                if (isSelectAllOption) {
                    if (checked) {
                        this.selectAll(this.options.selectAllJustVisible);
                    }
                    else {
                        this.deselectAll(this.options.selectAllJustVisible);
                    }
                }
                else {
                    if (checked) {
                        $option.prop('selected', true);

                        if (this.options.multiple) {
                            // Simply select additional option.
                            $option.prop('selected', true);
                        }
                        else {
                            // Unselect all other options and corresponding checkboxes.
                            if (this.options.selectedClass) {
                                $($checkboxesNotThis).closest('li').removeClass(this.options.selectedClass);
                            }

                            $($checkboxesNotThis).prop('checked', false);
                            $optionsNotThis.prop('selected', false);

                            // It's a single selection, so close.
                            this.$button.click();
                        }

                        if (this.options.selectedClass === "active") {
                            $optionsNotThis.closest("a").css("outline", "");
                        }
                    }
                    else {
                        // Unselect option.
                        $option.prop('selected', false);
                    }
                    
                    // To prevent select all from firing onChange: #575
                    this.options.onChange($option, checked);
                }

                this.$select.change();

                this.updateButtonText();
                this.updateSelectAll();

                if(this.options.preventInputChangeEvent) {
                    return false;
                }
            }, this));

            $('li a', this.$ul).on('mousedown', function(e) {
                if (e.shiftKey) {
                    // Prevent selecting text by Shift+click
                    return false;
                }
            });
        
            $('li a', this.$ul).on('touchstart click', $.proxy(function(event) {
                event.stopPropagation();

                var $target = $(event.target);
                
                if (event.shiftKey && this.options.multiple) {
                    if($target.is("label")){ // Handles checkbox selection manually (see https://github.com/davidstutz/bootstrap-multiselect/issues/431)
                        event.preventDefault();
                        $target = $target.find("input");
                        $target.prop("checked", !$target.prop("checked"));
                    }
                    var checked = $target.prop('checked') || false;

                    if (this.lastToggledInput !== null && this.lastToggledInput !== $target) { // Make sure we actually have a range
                        var from = $target.closest("li").index();
                        var to = this.lastToggledInput.closest("li").index();
                        
                        if (from > to) { // Swap the indices
                            var tmp = to;
                            to = from;
                            from = tmp;
                        }
                        
                        // Make sure we grab all elements since slice excludes the last index
                        ++to;
                        
                        // Change the checkboxes and underlying options
                        var range = this.$ul.find("li").slice(from, to).find("input");
                        
                        range.prop('checked', checked);
                        
                        if (this.options.selectedClass) {
                            range.closest('li')
                                .toggleClass(this.options.selectedClass, checked);
                        }
                        
                        for (var i = 0, j = range.length; i < j; i++) {
                            var $checkbox = $(range[i]);

                            var $option = this.getOptionByValue($checkbox.val());

                            $option.prop('selected', checked);
                        }                   
                    }
                    
                    // Trigger the select "change" event
                    $target.trigger("change");
                }
                
                // Remembers last clicked option
                if($target.is("input") && !$target.closest("li").is(".multiselect-item")){
                    this.lastToggledInput = $target;
                }

                $target.blur();
            }, this));

            // Keyboard support.
            this.$container.off('keydown.multiselect').on('keydown.multiselect', $.proxy(function(event) {
                if ($('input[type="text"]', this.$container).is(':focus')) {
                    return;
                }

                if (event.keyCode === 9 && this.$container.hasClass('open')) {
                    this.$button.click();
                }
                else {
                    var $items = $(this.$container).find("li:not(.divider):not(.disabled) a").filter(":visible");

                    if (!$items.length) {
                        return;
                    }

                    var index = $items.index($items.filter(':focus'));

                    // Navigation up.
                    if (event.keyCode === 38 && index > 0) {
                        index--;
                    }
                    // Navigate down.
                    else if (event.keyCode === 40 && index < $items.length - 1) {
                        index++;
                    }
                    else if (!~index) {
                        index = 0;
                    }

                    var $current = $items.eq(index);
                    $current.focus();

                    if (event.keyCode === 32 || event.keyCode === 13) {
                        var $checkbox = $current.find('input');

                        $checkbox.prop("checked", !$checkbox.prop("checked"));
                        $checkbox.change();
                    }

                    event.stopPropagation();
                    event.preventDefault();
                }
            }, this));

            if(this.options.enableClickableOptGroups && this.options.multiple) {
                $('li.multiselect-group', this.$ul).on('click', $.proxy(function(event) {
                    event.stopPropagation();
                    console.log('test');
                    var group = $(event.target).parent();

                    // Search all option in optgroup
                    var $options = group.nextUntil('li.multiselect-group');
                    var $visibleOptions = $options.filter(":visible:not(.disabled)");

                    // check or uncheck items
                    var allChecked = true;
                    var optionInputs = $visibleOptions.find('input');
                    var values = [];
                    
                    optionInputs.each(function() {
                        allChecked = allChecked && $(this).prop('checked');
                        values.push($(this).val());
                    });

                    if (!allChecked) {
                        this.select(values, false);
                    }
                    else {
                        this.deselect(values, false);
                    }
                    
                    this.options.onChange(optionInputs, !allChecked);
               }, this));
            }

            if (this.options.enableCollapsibleOptGroups && this.options.multiple) {
                $("li.multiselect-group input", this.$ul).off();
                $("li.multiselect-group", this.$ul).siblings().not("li.multiselect-group, li.multiselect-all", this.$ul).each( function () {
                    $(this).toggleClass('hidden', true);
                });
                
                $("li.multiselect-group", this.$ul).on("click", $.proxy(function(group) {
                    group.stopPropagation();
                }, this));
                
                $("li.multiselect-group > a > b", this.$ul).on("click", $.proxy(function(t) {
                    t.stopPropagation();
                    var n = $(t.target).closest('li');
                    var r = n.nextUntil("li.multiselect-group");
                    var i = true;
                    
                    r.each(function() {
                        i = i && $(this).hasClass('hidden');
                    });
                    
                    r.toggleClass('hidden', !i);
                }, this));
                
                $("li.multiselect-group > a > input", this.$ul).on("change", $.proxy(function(t) {
                    t.stopPropagation();
                    var n = $(t.target).closest('li');
                    var r = n.nextUntil("li.multiselect-group", ':not(.disabled)');
                    var s = r.find("input");
                    
                    var i = true;
                    s.each(function() {
                        i = i && $(this).prop("checked");
                    });
                    
                    s.prop("checked", !i).trigger("change");
                }, this));
                
                // Set the initial selection state of the groups.
                $('li.multiselect-group', this.$ul).each(function() {
                    var r = $(this).nextUntil("li.multiselect-group", ':not(.disabled)');
                    var s = r.find("input");
                    
                    var i = true;
                    s.each(function() {
                        i = i && $(this).prop("checked");
                    });
                    
                    $(this).find('input').prop("checked", i);
                });
                
                // Update the group checkbox based on new selections among the
                // corresponding children.
                $("li input", this.$ul).on("change", $.proxy(function(t) {
                    t.stopPropagation();
                    var n = $(t.target).closest('li');
                    var r1 = n.prevUntil("li.multiselect-group", ':not(.disabled)');
                    var r2 = n.nextUntil("li.multiselect-group", ':not(.disabled)');
                    var s1 = r1.find("input");
                    var s2 = r2.find("input");
                    
                    var i = $(t.target).prop('checked');
                    s1.each(function() {
                        i = i && $(this).prop("checked");
                    });
                    
                    s2.each(function() {
                        i = i && $(this).prop("checked");
                    });
                    
                    n.prevAll('.multiselect-group').find('input').prop('checked', i);
                }, this));
                
                $("li.multiselect-all", this.$ul).css('background', '#f3f3f3').css('border-bottom', '1px solid #eaeaea');
                $("li.multiselect-group > a, li.multiselect-all > a > label.checkbox", this.$ul).css('padding', '3px 20px 3px 35px');
                $("li.multiselect-group > a > input", this.$ul).css('margin', '4px 0px 5px -20px');
            }
        },

        /**
         * Create an option using the given select option.
         *
         * @param {jQuery} element
         */
        createOptionValue: function(element) {
            var $element = $(element);
            if ($element.is(':selected')) {
                $element.prop('selected', true);
            }

            // Support the label attribute on options.
            var label = this.options.optionLabel(element);
            var classes = this.options.optionClass(element);
            var value = $element.val();
            var inputType = this.options.multiple ? "checkbox" : "radio";

            var $li = $(this.options.templates.li);
            var $label = $('label', $li);
            $label.addClass(inputType);
            $li.addClass(classes);

            if (this.options.enableHTML) {
                $label.html(" " + label);
            }
            else {
                $label.text(" " + label);
            }
        
            var $checkbox = $('<input/>').attr('type', inputType);

            if (this.options.checkboxName) {
                $checkbox.attr('name', this.options.checkboxName);
            }
            $label.prepend($checkbox);

            var selected = $element.prop('selected') || false;
            $checkbox.val(value);

            if (value === this.options.selectAllValue) {
                $li.addClass("multiselect-item multiselect-all");
                $checkbox.parent().parent()
                    .addClass('multiselect-all');
            }

            $label.attr('title', $element.attr('title'));

            this.$ul.append($li);

            if ($element.is(':disabled')) {
                $checkbox.attr('disabled', 'disabled')
                    .prop('disabled', true)
                    .closest('a')
                    .attr("tabindex", "-1")
                    .closest('li')
                    .addClass('disabled');
            }

            $checkbox.prop('checked', selected);

            if (selected && this.options.selectedClass) {
                $checkbox.closest('li')
                    .addClass(this.options.selectedClass);
            }
        },

        /**
         * Creates a divider using the given select option.
         *
         * @param {jQuery} element
         */
        createDivider: function(element) {
            var $divider = $(this.options.templates.divider);
            this.$ul.append($divider);
        },

        /**
         * Creates an optgroup.
         *
         * @param {jQuery} group
         */
        createOptgroup: function(group) {            
            if (this.options.enableCollapsibleOptGroups && this.options.multiple) {
                var label = $(group).attr("label");
                var value = $(group).attr("value");
                var r = $('<li class="multiselect-item multiselect-group"><a href="javascript:void(0);"><input type="checkbox" value="' + value + '"/><b> ' + label + '<b class="caret"></b></b></a></li>');

                if (this.options.enableClickableOptGroups) {
                    r.addClass("multiselect-group-clickable")
                }
                this.$ul.append(r);
                if ($(group).is(":disabled")) {
                    r.addClass("disabled")
                }
                $("option", group).each($.proxy(function($, group) {
                    this.createOptionValue(group)
                }, this))
            }
            else {
                var groupName = $(group).prop('label');

                // Add a header for the group.
                var $li = $(this.options.templates.liGroup);

                if (this.options.enableHTML) {
                    $('label', $li).html(groupName);
                }
                else {
                    $('label', $li).text(groupName);
                }

                if (this.options.enableClickableOptGroups) {
                    $li.addClass('multiselect-group-clickable');
                }

                this.$ul.append($li);

                if ($(group).is(':disabled')) {
                    $li.addClass('disabled');
                }

                // Add the options of the group.
                $('option', group).each($.proxy(function(index, element) {
                    this.createOptionValue(element);
                }, this));
            }
        },

        /**
         * Build the select all.
         * 
         * Checks if a select all has already been created.
         */
        buildSelectAll: function() {
            if (typeof this.options.selectAllValue === 'number') {
                this.options.selectAllValue = this.options.selectAllValue.toString();
            }
            
            var alreadyHasSelectAll = this.hasSelectAll();

            if (!alreadyHasSelectAll && this.options.includeSelectAllOption && this.options.multiple
                    && $('option', this.$select).length > this.options.includeSelectAllIfMoreThan) {

                // Check whether to add a divider after the select all.
                if (this.options.includeSelectAllDivider) {
                    this.$ul.prepend($(this.options.templates.divider));
                }

                var $li = $(this.options.templates.li);
                $('label', $li).addClass("checkbox");
                
                if (this.options.enableHTML) {
                    $('label', $li).html(" " + this.options.selectAllText);
                }
                else {
                    $('label', $li).text(" " + this.options.selectAllText);
                }
                
                if (this.options.selectAllName) {
                    $('label', $li).prepend('<input type="checkbox" name="' + this.options.selectAllName + '" />');
                }
                else {
                    $('label', $li).prepend('<input type="checkbox" />');
                }
                
                var $checkbox = $('input', $li);
                $checkbox.val(this.options.selectAllValue);

                $li.addClass("multiselect-item multiselect-all");
                $checkbox.parent().parent()
                    .addClass('multiselect-all');

                this.$ul.prepend($li);

                $checkbox.prop('checked', false);
            }
        },

        /**
         * Builds the filter.
         */
        buildFilter: function() {

            // Build filter if filtering OR case insensitive filtering is enabled and the number of options exceeds (or equals) enableFilterLength.
            if (this.options.enableFiltering || this.options.enableCaseInsensitiveFiltering) {
                var enableFilterLength = Math.max(this.options.enableFiltering, this.options.enableCaseInsensitiveFiltering);

                if (this.$select.find('option').length >= enableFilterLength) {

                    this.$filter = $(this.options.templates.filter);
                    $('input', this.$filter).attr('placeholder', this.options.filterPlaceholder);
                    
                    // Adds optional filter clear button
                    if(this.options.includeFilterClearBtn){
                        var clearBtn = $(this.options.templates.filterClearBtn);
                        clearBtn.on('click', $.proxy(function(event){
                            clearTimeout(this.searchTimeout);
                            this.$filter.find('.multiselect-search').val('');
                            $('li', this.$ul).show().removeClass("filter-hidden");
                            this.updateSelectAll();
                        }, this));
                        this.$filter.find('.input-group').append(clearBtn);
                    }
                    
                    this.$ul.prepend(this.$filter);

                    this.$filter.val(this.query).on('click', function(event) {
                        event.stopPropagation();
                    }).on('input keydown', $.proxy(function(event) {
                        // Cancel enter key default behaviour
                        if (event.which === 13) {
                          event.preventDefault();
                        }
                        
                        // This is useful to catch "keydown" events after the browser has updated the control.
                        clearTimeout(this.searchTimeout);

                        this.searchTimeout = this.asyncFunction($.proxy(function() {

                            if (this.query !== event.target.value) {
                                this.query = event.target.value;

                                var currentGroup, currentGroupVisible;
                                $.each($('li', this.$ul), $.proxy(function(index, element) {
                                    var value = $('input', element).length > 0 ? $('input', element).val() : "";
                                    var text = $('label', element).text();

                                    var filterCandidate = '';
                                    if ((this.options.filterBehavior === 'text')) {
                                        filterCandidate = text;
                                    }
                                    else if ((this.options.filterBehavior === 'value')) {
                                        filterCandidate = value;
                                    }
                                    else if (this.options.filterBehavior === 'both') {
                                        filterCandidate = text + '\n' + value;
                                    }

                                    if (value !== this.options.selectAllValue && text) {

                                        // By default lets assume that element is not
                                        // interesting for this search.
                                        var showElement = false;

                                        if (this.options.enableCaseInsensitiveFiltering) {
                                            filterCandidate = filterCandidate.toLowerCase();
                                            this.query = this.query.toLowerCase();
                                        }

                                        if (this.options.enableFullValueFiltering && this.options.filterBehavior !== 'both') {
                                            var valueToMatch = filterCandidate.trim().substring(0, this.query.length);
                                            if (this.query.indexOf(valueToMatch) > -1) {
                                                showElement = true;
                                            }
                                        }
                                        else if (filterCandidate.indexOf(this.query) > -1) {
                                            showElement = true;
                                        }

                                        // Toggle current element (group or group item) according to showElement boolean.
                                        $(element).toggle(showElement).toggleClass('filter-hidden', !showElement);
                                        
                                        // Differentiate groups and group items.
                                        if ($(element).hasClass('multiselect-group')) {
                                            // Remember group status.
                                            currentGroup = element;
                                            currentGroupVisible = showElement;
                                        }
                                        else {
                                            // Show group name when at least one of its items is visible.
                                            if (showElement) {
                                                $(currentGroup).show().removeClass('filter-hidden');
                                            }
                                            
                                            // Show all group items when group name satisfies filter.
                                            if (!showElement && currentGroupVisible) {
                                                $(element).show().removeClass('filter-hidden');
                                            }
                                        }
                                    }
                                }, this));
                            }

                            this.updateSelectAll();
                        }, this), 300, this);
                    }, this));
                }
            }
        },

        /**
         * Unbinds the whole plugin.
         */
        destroy: function() {
            this.$container.remove();
            this.$select.show();
            this.$select.data('multiselect', null);
        },

        /**
         * Refreshs the multiselect based on the selected options of the select.
         */
        refresh: function () {
            var inputs = $.map($('li input', this.$ul), $);
            
            $('option', this.$select).each($.proxy(function (index, element) {
                var $elem = $(element);
                var value = $elem.val();
                var $input;
                for (var i = inputs.length; 0 < i--; /**/) {
                    if (value !== ($input = inputs[i]).val())
                        continue; // wrong li

                    if ($elem.is(':selected')) {
                        $input.prop('checked', true);

                        if (this.options.selectedClass) {
                            $input.closest('li')
                                .addClass(this.options.selectedClass);
                        }
                    }
                    else {
                        $input.prop('checked', false);

                        if (this.options.selectedClass) {
                            $input.closest('li')
                                .removeClass(this.options.selectedClass);
                        }
                    }

                    if ($elem.is(":disabled")) {
                        $input.attr('disabled', 'disabled')
                            .prop('disabled', true)
                            .closest('li')
                            .addClass('disabled');
                    }
                    else {
                        $input.prop('disabled', false)
                            .closest('li')
                            .removeClass('disabled');
                    }
                    break; // assumes unique values
                }
            }, this));

            this.updateButtonText();
            this.updateSelectAll();
        },

        /**
         * Select all options of the given values.
         * 
         * If triggerOnChange is set to true, the on change event is triggered if
         * and only if one value is passed.
         * 
         * @param {Array} selectValues
         * @param {Boolean} triggerOnChange
         */
        select: function(selectValues, triggerOnChange) {
            if(!$.isArray(selectValues)) {
                selectValues = [selectValues];
            }

            for (var i = 0; i < selectValues.length; i++) {
                var value = selectValues[i];

                if (value === null || value === undefined) {
                    continue;
                }

                var $option = this.getOptionByValue(value);
                var $checkbox = this.getInputByValue(value);

                if($option === undefined || $checkbox === undefined) {
                    continue;
                }
                
                if (!this.options.multiple) {
                    this.deselectAll(false);
                }
                
                if (this.options.selectedClass) {
                    $checkbox.closest('li')
                        .addClass(this.options.selectedClass);
                }

                $checkbox.prop('checked', true);
                $option.prop('selected', true);
                
                if (triggerOnChange) {
                    this.options.onChange($option, true);
                }
            }

            this.updateButtonText();
            this.updateSelectAll();
        },

        /**
         * Clears all selected items.
         */
        clearSelection: function () {
            this.deselectAll(false);
            this.updateButtonText();
            this.updateSelectAll();
        },

        /**
         * Deselects all options of the given values.
         * 
         * If triggerOnChange is set to true, the on change event is triggered, if
         * and only if one value is passed.
         * 
         * @param {Array} deselectValues
         * @param {Boolean} triggerOnChange
         */
        deselect: function(deselectValues, triggerOnChange) {
            if(!$.isArray(deselectValues)) {
                deselectValues = [deselectValues];
            }

            for (var i = 0; i < deselectValues.length; i++) {
                var value = deselectValues[i];

                if (value === null || value === undefined) {
                    continue;
                }

                var $option = this.getOptionByValue(value);
                var $checkbox = this.getInputByValue(value);

                if($option === undefined || $checkbox === undefined) {
                    continue;
                }

                if (this.options.selectedClass) {
                    $checkbox.closest('li')
                        .removeClass(this.options.selectedClass);
                }

                $checkbox.prop('checked', false);
                $option.prop('selected', false);
                
                if (triggerOnChange) {
                    this.options.onChange($option, false);
                }
            }

            this.updateButtonText();
            this.updateSelectAll();
        },
        
        /**
         * Selects all enabled & visible options.
         *
         * If justVisible is true or not specified, only visible options are selected.
         *
         * @param {Boolean} justVisible
         * @param {Boolean} triggerOnSelectAll
         */
        selectAll: function (justVisible, triggerOnSelectAll) {
            justVisible = (this.options.enableCollapsibleOptGroups && this.options.multiple) ? false : justVisible;
            
            var justVisible = typeof justVisible === 'undefined' ? true : justVisible;
            var allCheckboxes = $("li input[type='checkbox']:enabled", this.$ul);
            var visibleCheckboxes = allCheckboxes.filter(":visible");
            var allCheckboxesCount = allCheckboxes.length;
            var visibleCheckboxesCount = visibleCheckboxes.length;
            
            if(justVisible) {
                visibleCheckboxes.prop('checked', true);
                $("li:not(.divider):not(.disabled)", this.$ul).filter(":visible").addClass(this.options.selectedClass);
            }
            else {
                allCheckboxes.prop('checked', true);
                $("li:not(.divider):not(.disabled)", this.$ul).addClass(this.options.selectedClass);
            }
                
            if (allCheckboxesCount === visibleCheckboxesCount || justVisible === false) {
                $("option:not([data-role='divider']):enabled", this.$select).prop('selected', true);
            }
            else {
                var values = visibleCheckboxes.map(function() {
                    return $(this).val();
                }).get();
                
                $("option:enabled", this.$select).filter(function(index) {
                    return $.inArray($(this).val(), values) !== -1;
                }).prop('selected', true);
            }
            
            if (triggerOnSelectAll) {
                this.options.onSelectAll();
            }
        },

        /**
         * Deselects all options.
         * 
         * If justVisible is true or not specified, only visible options are deselected.
         * 
         * @param {Boolean} justVisible
         */
        deselectAll: function (justVisible) {
            justVisible = (this.options.enableCollapsibleOptGroups && this.options.multiple) ? false : justVisible;
            justVisible = typeof justVisible === 'undefined' ? true : justVisible;
            
            if(justVisible) {              
                var visibleCheckboxes = $("li input[type='checkbox']:not(:disabled)", this.$ul).filter(":visible");
                visibleCheckboxes.prop('checked', false);
                
                var values = visibleCheckboxes.map(function() {
                    return $(this).val();
                }).get();
                
                $("option:enabled", this.$select).filter(function(index) {
                    return $.inArray($(this).val(), values) !== -1;
                }).prop('selected', false);
                
                if (this.options.selectedClass) {
                    $("li:not(.divider):not(.disabled)", this.$ul).filter(":visible").removeClass(this.options.selectedClass);
                }
            }
            else {
                $("li input[type='checkbox']:enabled", this.$ul).prop('checked', false);
                $("option:enabled", this.$select).prop('selected', false);
                
                if (this.options.selectedClass) {
                    $("li:not(.divider):not(.disabled)", this.$ul).removeClass(this.options.selectedClass);
                }
            }
        },

        /**
         * Rebuild the plugin.
         * 
         * Rebuilds the dropdown, the filter and the select all option.
         */
        rebuild: function() {
            this.$ul.html('');

            // Important to distinguish between radios and checkboxes.
            this.options.multiple = this.$select.attr('multiple') === "multiple";

            this.buildSelectAll();
            this.buildDropdownOptions();
            this.buildFilter();

            this.updateButtonText();
            this.updateSelectAll(true);
            
            if (this.options.disableIfEmpty && $('option', this.$select).length <= 0) {
                this.disable();
            }
            else {
                this.enable();
            }
            
            if (this.options.dropRight) {
                this.$ul.addClass('pull-right');
            }
        },

        /**
         * The provided data will be used to build the dropdown.
         */
        dataprovider: function(dataprovider) {
            
            var groupCounter = 0;
            var $select = this.$select.empty();
            
            $.each(dataprovider, function (index, option) {
                var $tag;
                
                if ($.isArray(option.children)) { // create optiongroup tag
                    groupCounter++;
                    
                    $tag = $('<optgroup/>').attr({
                        label: option.label || 'Group ' + groupCounter,
                        disabled: !!option.disabled
                    });
                    
                    forEach(option.children, function(subOption) { // add children option tags
                        $tag.append($('<option/>').attr({
                            value: subOption.value,
                            label: subOption.label || subOption.value,
                            title: subOption.title,
                            selected: !!subOption.selected,
                            disabled: !!subOption.disabled
                        }));
                    });
                }
                else {
                    $tag = $('<option/>').attr({
                        value: option.value,
                        label: option.label || option.value,
                        title: option.title,
                        class: option.class,
                        selected: !!option.selected,
                        disabled: !!option.disabled
                    });
                    $tag.text(option.label || option.value);
                }
                
                $select.append($tag);
            });
            
            this.rebuild();
        },

        /**
         * Enable the multiselect.
         */
        enable: function() {
            this.$select.prop('disabled', false);
            this.$button.prop('disabled', false)
                .removeClass('disabled');
        },

        /**
         * Disable the multiselect.
         */
        disable: function() {
            this.$select.prop('disabled', true);
            this.$button.prop('disabled', true)
                .addClass('disabled');
        },

        /**
         * Set the options.
         *
         * @param {Array} options
         */
        setOptions: function(options) {
            this.options = this.mergeOptions(options);
        },

        /**
         * Merges the given options with the default options.
         *
         * @param {Array} options
         * @returns {Array}
         */
        mergeOptions: function(options) {
            return $.extend(true, {}, this.defaults, this.options, options);
        },

        /**
         * Checks whether a select all checkbox is present.
         *
         * @returns {Boolean}
         */
        hasSelectAll: function() {
            return $('li.multiselect-all', this.$ul).length > 0;
        },

        /**
         * Updates the select all checkbox based on the currently displayed and selected checkboxes.
         */
        updateSelectAll: function(notTriggerOnSelectAll) {
            if (this.hasSelectAll()) {
                var allBoxes = $("li:not(.multiselect-item):not(.filter-hidden) input:enabled", this.$ul);
                var allBoxesLength = allBoxes.length;
                var checkedBoxesLength = allBoxes.filter(":checked").length;
                var selectAllLi  = $("li.multiselect-all", this.$ul);
                var selectAllInput = selectAllLi.find("input");
                
                if (checkedBoxesLength > 0 && checkedBoxesLength === allBoxesLength) {
                    selectAllInput.prop("checked", true);
                    selectAllLi.addClass(this.options.selectedClass);
                    this.options.onSelectAll(true);
                }
                else {
                    selectAllInput.prop("checked", false);
                    selectAllLi.removeClass(this.options.selectedClass);
                    if (checkedBoxesLength === 0) {
                        if (!notTriggerOnSelectAll) {
                            this.options.onSelectAll(false);
                        }
                    }
                }
            }
        },

        /**
         * Update the button text and its title based on the currently selected options.
         */
        updateButtonText: function() {
            var options = this.getSelected();
            
            // First update the displayed button text.
            if (this.options.enableHTML) {
                $('.multiselect .multiselect-selected-text', this.$container).html(this.options.buttonText(options, this.$select));
            }
            else {
                $('.multiselect .multiselect-selected-text', this.$container).text(this.options.buttonText(options, this.$select));
            }
            
            // Now update the title attribute of the button.
            $('.multiselect', this.$container).attr('title', this.options.buttonTitle(options, this.$select));
        },

        /**
         * Get all selected options.
         *
         * @returns {jQUery}
         */
        getSelected: function() {
            return $('option', this.$select).filter(":selected");
        },

        /**
         * Gets a select option by its value.
         *
         * @param {String} value
         * @returns {jQuery}
         */
        getOptionByValue: function (value) {

            var options = $('option', this.$select);
            var valueToCompare = value.toString();

            for (var i = 0; i < options.length; i = i + 1) {
                var option = options[i];
                if (option.value === valueToCompare) {
                    return $(option);
                }
            }
        },

        /**
         * Get the input (radio/checkbox) by its value.
         *
         * @param {String} value
         * @returns {jQuery}
         */
        getInputByValue: function (value) {

            var checkboxes = $('li input', this.$ul);
            var valueToCompare = value.toString();

            for (var i = 0; i < checkboxes.length; i = i + 1) {
                var checkbox = checkboxes[i];
                if (checkbox.value === valueToCompare) {
                    return $(checkbox);
                }
            }
        },

        /**
         * Used for knockout integration.
         */
        updateOriginalOptions: function() {
            this.originalOptions = this.$select.clone()[0].options;
        },

        asyncFunction: function(callback, timeout, self) {
            var args = Array.prototype.slice.call(arguments, 3);
            return setTimeout(function() {
                callback.apply(self || window, args);
            }, timeout);
        },

        setAllSelectedText: function(allSelectedText) {
            this.options.allSelectedText = allSelectedText;
            this.updateButtonText();
        }
    };

    $.fn.multiselect = function(option, parameter, extraOptions) {
        return this.each(function() {
            var data = $(this).data('multiselect');
            var options = typeof option === 'object' && option;

            // Initialize the multiselect.
            if (!data) {
                data = new Multiselect(this, options);
                $(this).data('multiselect', data);
            }

            // Call multiselect method.
            if (typeof option === 'string') {
                data[option](parameter, extraOptions);
                
                if (option === 'destroy') {
                    $(this).data('multiselect', false);
                }
            }
        });
    };

    $.fn.multiselect.Constructor = Multiselect;

    $(function() {
        $("select[data-role=multiselect]").multiselect();
    });

}(window.jQuery);
</script>

</html>