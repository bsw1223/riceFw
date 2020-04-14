<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<%@ include file = "header.jsp" %>


<div class="content-wrapper" style="min-height: 901px;">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Home</h1>
		<ol class="breadcrumb">
			<li class="active"><i class="fa fa-dashboard"></i>  Home</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">

		<div class="row">
			<div class="col-md-3">
				<!-- Profile Image -->
				<div class="box box-primary">
					<div class="box-body box-profile">
						<img class="profile-user-img img-responsive img-circle" src="${contextPath}/resources/dist/img/user4-128x128.jpg" alt="User profile picture">
						<h3 class="profile-username text-center">Nina Mcintire</h3>
						<p class="text-muted text-center">Software Engineer</p>
						<ul class="list-group list-group-unbordered">
							<li class="list-group-item">
								<b>Followers</b> 
								<a class="pull-right">1,322</a>
							</li>
							<li class="list-group-item">
								<b>Following</b> 
							<a class="pull-right">543</a>
							</li>
							<li class="list-group-item">
								<b>Friends</b> 
							<a class="pull-right">13,287</a></li>
						</ul>
						<a href="#" class="btn btn-primary btn-block"><b>Follow</b></a>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
			</div>
			<!-- /.col -->

			<div class="col-md-9">
				<!-- Full Calendar -->
				<div class="box box-primary">
					<div class="box-body">
						<div id='calendar'></div>
						<!-- /#calendar -->
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->

	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<%@ include file = "footer.jsp" %>


<link href='${contextPath}/resources/static/fullcalendar/core/main.css' rel='stylesheet' />
<link href='${contextPath}/resources/static/fullcalendar/daygrid/main.css' rel='stylesheet' />
<script src='${contextPath}/resources/static/fullcalendar/core/main.js'></script>
<script src='${contextPath}/resources/static/fullcalendar/daygrid/main.js'></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
      var calendarEl = document.getElementById('calendar');
    
      var calendar = new FullCalendar.Calendar(calendarEl, {
        plugins: [ 'dayGrid' ]
      });
    
      calendar.render();
    });
</script>

</html>