<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<script src="https://code.jquery.com/jquery-2.2.4.js"
	integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
	crossorigin="anonymous"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>RiceLMS</title>
<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet" href="${contextPath}/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="${contextPath}/resources/bower_components/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="${contextPath}/resources/bower_components/Ionicons/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="${contextPath}/resources/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="${contextPath}/resources/dist/css/skins/_all-skins.min.css">
<!-- bootstrap wysihtml5 - text editor -->
<link rel="stylesheet" href="${contextPath}/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// 
[if lt IE 9]>-->
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

<!-- Google Font -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

</head>
<body class="hold-transition skin-black-light sidebar-mini">
<script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="${contextPath}/resources/js/rice_homejs.js"></script>
<script>
$(document).ready(function(){
	setmemNum("${loginMem.memNum}");
	setmemName("${loginMem.memName}");
	setauthId("${loginMem.authId}");
	setauthName();

	var preLogInTag = "<li class=\"\">"
				     +"<a href=\"../../../member/login\" data-toggle=\"\">"
					 +"	<button type=\"button\" class=\"btn btn-block btn-warning btn-xs\">L o g I n -  H e r e</button>"
					 +"	</a>"
					 +"</li> ";
	var afterLogInTag =	"<li class=\"dropdown user user-menu\">"	
			       +"<a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">"
				   +"<button type=\"button\" class=\"btn btn-block btn-info btn-xs btn-warning\">마 이 페 이 지 </button>"
		           +"	</a>"
		           +"<ul class=\"dropdown-menu\">"
				   +"	<li class=\"user-header\">"
				   /* +"	 <img src=\"${contextPath}/resources/dist/img/user2-160x160.jpg\" class=\"img-circle\" alt=\"User Image\">" */
				   +"<p>"
				   +memName+" "+"-"+" "+authName
				  /*  +" <small>Member since Nov. 2012</small>" */
				   +" </p>"
				   +"</li>"
				   +"</li>"
				   +"<li class=\"user-footer\">"
				   +" <div class=\"pull-left\">"
				   +"  <a href=\"../../../member/logout\" class=\"btn btn-default btn-flat\">L o g - O u t</a>"
				   +" </div>"
				   +" <div class=\"pull-right\">"
				   +"   <a href=\"../../../member/modify/info\" class=\"btn btn-default btn-flat\">회원정보 변경</a>"
				   +" </div></li></ul></li>";

				   

	if(eval(memNum)==undefined) {
		$('li#insertTag').after(preLogInTag);
	}else{
		$('li#insertTag').after(afterLogInTag);
	}
	
	$(".logo").click(function (e) {
		setcookie("m1",null);
		setcookie("m2",null);
		setcookie("m3",null);
	});
	
	function setcookie(aa, bb) { // 荑좏궎?앹꽦?⑥닔
		document.cookie = aa + "=" + bb + "; path=/;"
		return false;
	}
});
</script>
	<div class="wrapper">
		<header class="main-header">
			<!-- Logo -->
			<a href="/" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->

				<span class="logo-mini"><img src="${contextPath}/resources/img/로고수정mini.png"></span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><img src="${contextPath}/resources/img/로고수정.png"></span>
			</a>
			<!-- Header Navbar: style can be found in header.less -->
			<nav class="navbar navbar-static-top">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="push-menu"
					role="button"> <span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
				</a>

				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<!-- Messages: style can be found in dropdown.less-->

						<!-- 알람: style can be found in dropdown.less -->
						<li class="dropdown notifications-menu" id="insertTag">
<!-- 							<a -->
<!-- 								href="#" class="dropdown-toggle" data-toggle="dropdown"> <i -->
<!-- 									class="fa fa-bell-o"></i> <span class="label label-warning">10</span> -->
<!-- 							</a> -->
							<ul class="dropdown-menu">
								<li class="header">You have 10 notifications</li>
								<li>
									<!-- inner menu: contains the actual data -->
									<ul class="menu">
										<li><a href="#"> <i class="fa fa-users text-aqua"></i>
												5 new members joined today
										</a></li>
										<li><a href="#"> <i class="fa fa-warning text-yellow"></i>
												Very long description here that may not fit into the page
												and may cause design problems
										</a></li>
										<li><a href="#"> <i class="fa fa-users text-red"></i>
												5 new members joined
										</a></li>

										<li><a href="#"> <i
												class="fa fa-shopping-cart text-green"></i> 25 sales made
										</a></li>
										<li><a href="#"> <i class="fa fa-user text-red"></i>
												You changed your username
										</a></li>
									</ul>
								</li>
								<li class="footer"><a href="#">View all</a></li>
							</ul></li>
						<!-- Tasks: style can be found in dropdown.less -->

						<!-- User Account: style can be found in dropdown.less -->
						<!-- 濡쒓렇?몃찓???쎌엯遺 -->

					</ul>
				</div>
			</nav>
		</header>

		<%@ include file="sidebar.jsp"%>