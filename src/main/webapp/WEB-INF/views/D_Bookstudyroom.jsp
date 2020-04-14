<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<%@ include file = "header.jsp" %>



<div class="content-wrapper" style="min-height: 901px;">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>스터디실 예약</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">스터디실 예약</li>
		</ol>
	</section>
	
	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box box-primary">
					<div class="box-body">
						<div id='timeline_cal'></div>
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
<link href='${contextPath}/resources/static/fullcalendar/timeline/main.css' rel='stylesheet' />
<link href='${contextPath}/resources/static/fullcalendar/resource-timeline/main.css' rel='stylesheet' />


<script src='${contextPath}/resources/static/fullcalendar/core/main.js'></script>
<script src='${contextPath}/resources/static/fullcalendar/timeline/main.js'></script>
<script src='${contextPath}/resources/static/fullcalendar/resource-common/main.js'></script>
<script src='${contextPath}/resources/static/fullcalendar/resource-timeline/main.js'></script>

<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('timeline_cal');

		var calendar = new FullCalendar.Calendar(calendarEl, {
			plugins : [ 'resourceTimeline' ],
			header: {
			      left: 'today prev,next',
			      center: 'title',
			      right: 'resourceTimelineDay,resourceTimelineWeek'
			    },
			defaultView: 'resourceTimelineDay',
			resourceGroupField: 'building',
			resources: [
				  { id: 'a', building: '460 Bryant', title: 'Auditorium A' },
			      { id: 'b', building: '460 Bryant', title: 'Auditorium B' },
			      { id: 'c', building: '460 Bryant', title: 'Auditorium C' },
			      { id: 'd', building: '460 Bryant', title: 'Auditorium D' },
			      { id: 'e', building: '460 Bryant', title: 'Auditorium E' },
			      { id: 'f', building: '460 Bryant', title: 'Auditorium F' },
			      { id: 'g', building: '564 Pacific', title: 'Auditorium G' },
			      { id: 'h', building: '564 Pacific', title: 'Auditorium H' },
			      { id: 'i', building: '564 Pacific', title: 'Auditorium I' },
			      { id: 'j', building: '564 Pacific', title: 'Auditorium J' },
			      { id: 'k', building: '564 Pacific', title: 'Auditorium K' },
			      { id: 'l', building: '564 Pacific', title: 'Auditorium L' },
			      { id: 'm', building: '564 Pacific', title: 'Auditorium M' },
			      { id: 'n', building: '564 Pacific', title: 'Auditorium N' },
			      { id: 'o', building: '101 Main St', title: 'Auditorium O' },
			      { id: 'p', building: '101 Main St', title: 'Auditorium P' },
			      { id: 'q', building: '101 Main St', title: 'Auditorium Q' },
			      { id: 'r', building: '101 Main St', title: 'Auditorium R' },
			      { id: 's', building: '101 Main St', title: 'Auditorium S' },
			      { id: 't', building: '101 Main St', title: 'Auditorium T' },
			      { id: 'u', building: '101 Main St', title: 'Auditorium U' },
			      { id: 'v', building: '101 Main St', title: 'Auditorium V' },
			      { id: 'w', building: '101 Main St', title: 'Auditorium W' },
			      { id: 'x', building: '101 Main St', title: 'Auditorium X' },
			      { id: 'y', building: '101 Main St', title: 'Auditorium Y' },
			      { id: 'z', building: '101 Main St', title: 'Auditorium Z' }
			  ]
		});

		calendar.render();
	});
</script>
</html>