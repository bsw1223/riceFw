<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>RiceLMS</title>
	<!-- Tell the browser to be responsive to screen width -->
	
<style type="text/css">
.alertText {
	margin: 5px auto 5px auto;
  		display: table;
}
.alertBody {
	min-height: calc(100vh - 101px);
    background-color: #ecf0f5;
    z-index: 800;
    transition: transform .3s ease-in-out, margin .3s ease-in-out;
  		margin-left: 0px;
}
</style>
</head>
<body>
<div class="alertBody">
	<!-- Main content -->
	<section class="content">
		<div class="error-page">

			<div class="error-content">
				<h3>
					<i class="fa fa-warning text-yellow"></i> Oops! Page not found.
				</h3>

				<p class="alertText">
					We could not find the page you were looking for. Meanwhile, you may
					<a href="/">return to dashboard</a> 
<!-- 					or try using the search form. -->
				</p>

<!-- 				<form class="search-form"> -->
<!-- 					<div class="input-group"> -->
<!-- 						<input type="text" name="search" class="form-control" -->
<!-- 							placeholder="Search"> -->

<!-- 						<div class="input-group-btn"> -->
<!-- 							<button type="submit" name="submit" -->
<!-- 								class="btn btn-warning btn-flat"> -->
<!-- 								<i class="fa fa-search"></i> -->
<!-- 							</button> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					/.input-group -->
<!-- 				</form> -->
			</div>
			<!-- /.error-content -->
		</div>
		<!-- /.error-page -->
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<script src="https://code.jquery.com/jquery-2.2.4.js" 
  integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
  crossorigin="anonymous">
</script>

<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet" href="${contextPath}/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="${contextPath}/resources/bower_components/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="${contextPath}/resources/bower_components/Ionicons/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="${contextPath}/resources/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
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
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</body>
</html>