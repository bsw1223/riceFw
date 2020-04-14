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
<script src='${contextPath}/resources/static/fullcalendar/interaction/main.js'></script>
<script src='${contextPath}/resources/static/fullcalendar/resource-common/main.js'></script>
<script src='${contextPath}/resources/static/fullcalendar/resource-timeline/main.js'></script>

<script>
	var classList = null;
	var bookingList = null;
	$(document).ready(function(){
		$.ajax({
			type : "post",
			async: false,
			url: "/booking/getClassList",
			success: function(mapList) {
						if(mapList != null) {
							classList = mapList;
						}
					},
		});
		
		$.ajax({
			type : "post",
			async: false,
			url: "/booking/getBookingList",
			success: function(mapList) {
						if(mapList != null) {
							bookingList = mapList;
						}
					},
		});
		
		rendCal(classList, bookingList);
	});
	
	function rendCal(classList, bookingList) {
		var calendarEl = document.getElementById('timeline_cal');

		var calendar = new FullCalendar.Calendar(calendarEl, {
			timeZone: 'local',
			plugins : [ 'interaction', 'resourceTimeline' ],
			header: {
			      left: 'today prev,next',
			      center: 'title',
			      right: 'resourceTimelineDay,resourceTimelineWeek,resourceTimelineMonth'
			    },
			defaultView: 'resourceTimelineDay',
			resourceColumns: [
			      {
			        labelText: '강의실',
			        field: 'title'
			      },
			      {
			        labelText: '수용인원',
			        field: 'occupancy'
			      }
			    ],
			resourceGroupField: 'building',
			resources: classList,
			events: bookingList
// 			dateClick: function(info) {
// 			      alert('clicked ' + info.dateStr + ' on resource ' + info.resource.id);
// 			    },
// 		    select: function(info) {
// 		      alert('selected ' + info.startStr + ' to ' + info.endStr + ' on resource ' + info.resource.id);
// 		    }
		});
		calendar.render();
	}

</script>
</html>