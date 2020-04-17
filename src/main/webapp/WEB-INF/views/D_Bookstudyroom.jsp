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
	
	<!-- 일정 추가 MODAL -->
	<div class="modal fade" id="bookingModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">스터디실 예약</h4> <!-- 스터디실 예약  -->
				</div>
				<!-- /.modal-header -->
				<form class="form-horizontal" action="" method="post">
				<div class="modal-body">
					<div class="form-group">
                        <label class="col-sm-2 control-label" for="bookTitle">일정명</label>
                        <div class="col-sm-10">
                            <input class="form-control" type="text" name="bookTitle" id="bookTitle" required="required" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="bookStartTime">시작</label>
                        <div class="col-sm-10">
                            <input class="form-control" type="text" name="bookStartTime" id="bookStartTime" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="bookEndTime">끝</label>
                        <div class="col-sm-10">
                            <input class="form-control" type="text" name="bookEndTime" id="bookEndTime" />
                        </div>
                    </div>
                    <div class="form-group row">
                    	<label class="col-xs-4" for="bookPurpose">설명</label>
                        <div class="col-sm-12">
                            <textarea class="form-control" rows="4" cols="50" name="bookPurpose" id="bookPurpose"></textarea>
                        </div>
                    </div>
				</div>
				<!-- /.modal-body -->
				<div class="modal-footer modalBtnContainer-addEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
                    </div>
                <div class="modal-footer modalBtnContainer-modifyEvent">
                    <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
                    <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
                </div>
				</form>
				<!-- /.modal-footer -->
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	
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

<!-- bootstrap datetimepicker -->
<link rel="stylesheet" href="${contextPath}/resources/api/css/bootstrap-datetimepicker.min.css">


<script src="${contextPath}/resources/api/js/moment.min.js"></script>
<script src="${contextPath}/resources/api/js/ko.js"></script>
<script src='${contextPath}/resources/api/js/bootstrap-datetimepicker.min.js'></script>

<script>
	var classList = null;
	var bookingList = null;
	
	var addBtnContainer = $('.modalBtnContainer-addEvent');
	var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');

	$(document).ready(function(){
		$('#bookStartTime, #bookEndTime').datetimepicker({
		    format: 'YYYY-MM-DD HH:mm'
 		});
		
		getClassList();
	});
	
	function getClassList() {
		$.ajax({
			type : "post",
			async: true,
			url: "/booking/getClassList",
			success: function(mapList) {
						if(mapList != null) {
							classList = mapList;
						}
						getBookingList();
					},
		});
	}
	
	function getBookingList() {
		$.ajax({
			type : "post",
			async: true,
			url: "/booking/getBookingList",
			success: function(mapList) {
						if(mapList != null) {
							bookingList = mapList;
						}
						rendCal(classList, bookingList);
					},
		});
	}
	
	function rendCal(classList, bookingList) {
		var calendarEl = document.getElementById('timeline_cal');

		var calendar = new FullCalendar.Calendar(calendarEl, {
			locale: 'ko',
		    timezone: "local",
		    selectable: true,
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
			events: bookingList,
// 			dateClick: function(info) {
// 							alert("jhekael");
// 							newBooking(info);
// 			    		},
		    select: function(info) {
					    	alert('selected ' + info.startStr + ' to ' + info.endStr + ' on resource ' + info.resource.id);
					    	newBooking(info);			      	
					    },
		    eventClick: function(info){
		    				eventClick(info);
					    }
		});
		calendar.render();
	}
	
	
	/*
	function newBooking(info) {
		var bookingModal = $('#bookingModal');

		// 	alert('clicked ' + info.dateStr + ' on resource ' + info.resource.id);
		addBtnContainer.show();
		modifyBtnContainer.hide();
		bookingModal.modal();
	}
	*/
	
	function eventClick(info) {
		var bookingModal = $('#bookingModal');
		var bookNum = info.event.id;
		alert(info.event.memNum);
		
		$.ajax({
			type : "post",
			async: true,
			url: "/booking/getBookingInfo",
			data: bookNum,
			success: function(data) {
						alert("success");
						addBtnContainer.hide();
						modifyBtnContainer.show();
						bookingModal.modal();
					},
			error: function(data) {
						alert("fail");
					}
		});
// 		alert('title: ' + info.event.id);
// 		alert('title: ' + info.event.title);
//         alert('start: ' + info.event.start);
//         alert('end: ' + info.event.end);
//         alert('resourceId: ' + info.event.resourceId);
//         alert('Coordinates: ' + info.jsEvent.pageX + ',' + info.jsEvent.pageY);
//         alert('View: ' + info.view.type);

        // change the border color just for fun
//         info.el.style.borderColor = 'red';
	}
	

</script>
</html>