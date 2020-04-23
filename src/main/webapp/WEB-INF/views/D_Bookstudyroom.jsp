<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
				<div class="box box-success">
					<div class="box-body">
						<div id='timeline_cal'></div>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->

				<div class="box box-success">
					<div class="box-header">
						<h3 class="box-title">내 예약 현황</h3>
						
						<div class="box-tools pull-right">
		                	<button type="button" class="btn btn-box-tool" data-widget="collapse">
		                		<i class="fa fa-minus"></i>
		                	</button>
		              	</div>
					</div>
					<!-- /.box-header -->
					<div class="box-body table-responsive no-padding">
						<table class="table table-hover">
							<tbody id="mybookList">
								<tr>
									<th>예약번호</th>
									<th>장소</th>
									<th>예약명</th>
									<th>예약시작시간</th>
									<th>예약종료시간</th>
									<th>예약상태</th>
								</tr>
							</tbody>
						</table>
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
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">스터디실 예약</h4>
					<!-- 스터디실 예약  -->
				</div>
				<!-- /.modal-header -->
				<form class="form-horizontal">
					<div class="modal-body">
						<div class="form-group">
							<label class="col-sm-2 control-label" for="className">장소</label>
							<div class="col-sm-10">
								<input class="form-control" type="text" name="className"
									disabled="disabled" /> <input type="hidden" name="classId" /> <input
									type="hidden" name="bookNum" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="bookTitle">일정명</label>
							<div class="col-sm-10">
								<input class="form-control" type="text" name="bookTitle"
									required="required" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="bookStartTime">시작
								시간</label>
							<div class="col-sm-10">
								<input class="form-control" type="text" name="bookStartTime" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="bookEndTime">끝
								시간</label>
							<div class="col-sm-10">
								<input class="form-control" type="text" name="bookEndTime" />
							</div>
						</div>
						<div class="form-group row">
							<label class="col-xs-4" for="bookPurpose">설명</label>
							<div class="col-sm-12">
								<textarea class="form-control" rows="4" cols="50"
									name="bookPurpose" id="bookPurpose"></textarea>
							</div>
						</div>
					</div>
					<!-- /.modal-body -->
					<div class="modal-footer modalBtnContainer-addEvent">
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary" id="save-event">예약</button>
					</div>
					<div class="modal-footer modalBtnContainer-modifyEvent">
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-danger" id="delete-event">예약취소</button>
						<button type="button" class="btn btn-primary" id="update-event">예약수정</button>
					</div>
				</form>
				<!-- /.modal-footer -->
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->


	<!-- 일정 보여주기 MODAL -->
	<div class="modal fade" id="bookInfoModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">스터디실 예약 정보</h4>
					<!-- 스터디실 예약  -->
				</div>
				<!-- /.modal-header -->
				<div class="modal-body">
					<div class="box">
						<div class="box-body no-padding">
							<table class="table table-condensed">
								<tbody id="bookInfoBody">
								</tbody>
							</table>
						</div>
						<!-- /.box-body -->
					</div>
				</div>
				<!-- /.modal-body -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
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
<link rel="stylesheet" href="${contextPath}/resources/api/css/bootstrap-datetimepicker.min.css" />
<script src="${contextPath}/resources/api/js/moment.min.js"></script>
<script src="${contextPath}/resources/api/js/ko.js"></script>
<script src='${contextPath}/resources/api/js/bootstrap-datetimepicker.min.js'></script>

<script>
	var classList = null;
	var bookingList = null;
	
	var addBtnContainer = $('.modalBtnContainer-addEvent');
	var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');
	
	var bookingModal = $('#bookingModal');
	var bookInfoModal = $('#bookInfoModal');
	var bookInfoBody = $("#bookInfoBody");
	
	var ipt_className = $("input[name='className']");
	var ipt_classId = $("input[name='classId']");
	var ipt_bookNum = $("input[name='bookNum']");
	var ipt_bookTitle = $("input[name='bookTitle']");
	var ipt_bookStartTime = $("input[name='bookStartTime']");
	var ipt_bookEndTime = $("input[name='bookEndTime']");
	var ipt_bookPurpose = $("#bookPurpose");
	
	var save_event_btn = $('#save-event');
	var delete_event_btn = $('#delete-event');
	var update_event_btn = $('#update-event');
	
	var mybookList = $('#mybookList');
	
	save_event_btn.click(function () {		// 예약 등록 버튼 click
		var eventData = {
			classId: ipt_classId.val(),
			bookTitle: ipt_bookTitle.val(),
			bookStartTime: moment(ipt_bookStartTime.val()).format('YYYY-MM-DDTHH:mm'),
			bookEndTime: moment(ipt_bookEndTime.val()).format('YYYY-MM-DDTHH:mm'),
			bookPurpose: ipt_bookPurpose.val(),
			memNum: '${loginMem.memNum}'
		}
		
		if(eventData.memNum === '') {
			alert('로그인이 필요합니다');
			return false;
		}
		
		if(eventData.bookStartTime >= eventData.bookEndTime) {
			alert('끝나는 날짜가 앞설 수 없습니다.');
			return false;
		}
		
		if(eventData.bookTitle === '') {
			alert('예약명은 필수입니다.');
			return false;
		}
		
		// 새로운 예약 생성
		$.ajax({
			type : "post",
			async: true,
			url: "/booking/insertBooking",
			data: JSON.stringify(eventData),
			contentType: 'application/json',
			success: function(data) {
						if(data == '1') {
							alert("스티디실 예약이 등록되었습니다");
							window.location.href = '/booking/bookstudyroom';
						} else {
							alert("예약 등록에 실패했습니다");
						}
					},
			error: function(data) {
						console.log("fail");
					}
		}); // ajax end
	});
	
	delete_event_btn.click(function () {	// 예약 삭제 버튼 click
		var con_result = confirm("예약은 취소하면 수정할 수 없습니다. 정말 취소하시겠습니까?")
		
		if(!con_result) {
			return false;
		}
		
		var eventData = {
				classId: ipt_classId.val(),
				bookNum: ipt_bookNum.val(),
				bookTitle: ipt_bookTitle.val(),
				bookStartTime: moment(ipt_bookStartTime.val()).format('YYYY-MM-DDTHH:mm'),
				bookEndTime: moment(ipt_bookEndTime.val()).format('YYYY-MM-DDTHH:mm'),
				bookPurpose: ipt_bookPurpose.val(),
				memNum: '${loginMem.memNum}'
			}
		
		console.log(JSON.stringify(eventData))
		// 예약 삭제 처리
		$.ajax({
			type : "post",
			async: true,
			url: "/booking/deleteBooking",
			data: JSON.stringify(eventData),
			contentType: 'application/json',
			success: function(data) {
						if(data == '1') {
							alert("스티디실 예약이 취소되었습니다");
							window.location.href = '/booking/bookstudyroom';
						} else {
							alert("예약 취소에 실패했습니다");
						}
					},
			error: function(data) {
						console.log("fail");
					}
		}); // ajax end
	});

	update_event_btn.click(function () {	// 예약 수정 버튼 click
		var con_result = confirm("예약 정보를 수정하시겠습니까?")
		
		if(!con_result) {
			return false;
		}
		
		var eventData = {
			classId: ipt_classId.val(),
			bookNum: ipt_bookNum.val(),
			bookTitle: ipt_bookTitle.val(),
			bookStartTime: moment(ipt_bookStartTime.val()).format('YYYY-MM-DDTHH:mm'),
			bookEndTime: moment(ipt_bookEndTime.val()).format('YYYY-MM-DDTHH:mm'),
			bookPurpose: ipt_bookPurpose.val(),
			memNum: '${loginMem.memNum}'
		}
		
		
		if(eventData.bookStartTime >= eventData.bookEndTime) {
			alert('끝나는 날짜가 앞설 수 없습니다.');
			return false;
		}
		
		if(eventData.bookTitle === '') {
			alert('예약명은 필수입니다.');
			return false;
		}
		
		// 새로운 예약 생성
		$.ajax({
			type : "post",
			async: true,
			url: "/booking/updateBooking",
			data: JSON.stringify(eventData),
			contentType: 'application/json',
			success: function(data) {
						if(data == '1') {
							alert("스티디실 예약 정보가 수정되었습니다");
							window.location.href = '/booking/bookstudyroom';
						} else {
							alert("예약 수정에 실패했습니다");
						}
					},
			error: function(data) {
						console.log("fail");
					}
		}); // ajax end
	});

	
	function selectDate(info) {
		var classId = info.resource.id;
		var startStr = moment(info.startStr).format('YYYY-MM-DD HH:mm');
		var endStr = moment(info.endStr).format('YYYY-MM-DD HH:mm');
		
		$.ajax({
			type : "post",
			async: true,
			url: "/booking/getClassInfo",
			data: {"classId" : classId},
			success: function(data) {
						ipt_bookNum.val('');
						ipt_bookTitle.val('');
						ipt_bookPurpose.html('');
						ipt_classId.val(data.classId);
						ipt_className.val(data.className);
						ipt_bookStartTime.val(startStr);
						ipt_bookEndTime.val(endStr);
						addBtnContainer.show();
						modifyBtnContainer.hide();
						bookingModal.modal();
					},
			error: function(data) {
						alert("fail");
					}
		}); // ajax end
	}
	
	function eventClick(info) {		
		var bookNum = info.event.id;
		
		$.ajax({
			type : "post",
			async: true,
			url: "/booking/getBookingInfo",
			data: {"bookNum" : bookNum},
			success: function(data) {						
						bookStartTimeVal = moment(data.bookStartTime).format('YYYY-MM-DD HH:mm');
						bookEndTimeVal = moment(data.bookEndTime).format('YYYY-MM-DD HH:mm');
											
						if(data.modalMsg == '1') {
							
							ipt_bookNum.val(data.bookNum);
							ipt_classId.val(data.classId);
							ipt_className.val(data.className);
							ipt_bookTitle.val(data.bookTitle);
							ipt_bookStartTime.val(bookStartTimeVal);
							ipt_bookEndTime.val(bookEndTimeVal);
							ipt_bookPurpose.html(data.bookPurpose);
							
							bookInfoModal.modal("hide");
							addBtnContainer.hide();
							modifyBtnContainer.show();
							bookingModal.modal();
						} else {
							bookingModal.modal("hide");
							bookInfoModal.modal();
							var htmlStr = "<tr><td>예약명</td><td>" + data.bookTitle + "</td></tr>"
										+ "<tr><td>시작시간</td><td>" + bookStartTimeVal + "</td></tr>"
										+ "<tr><td>종료시간</td><td>" + bookEndTimeVal + "</td></tr>"
										+ "<tr><td>예약자</td><td>" + data.memName + "</td></tr>";
							bookInfoBody.html(htmlStr);
						}
						
					},
			error: function(data) {
						console.log("fail");
					}
		});	// ajax end
	}
	
	$(document).ready(function(){
		ipt_bookStartTime.datetimepicker({
			locale: 'ko',
		    format: 'YYYY-MM-DD HH:mm',
		    stepping : 30,
		    enabledHours: [9,10,11,12,13,14,15,16,17,18]
 		});
		
		ipt_bookEndTime.datetimepicker({
			locale: 'ko',
		    format: 'YYYY-MM-DD HH:mm',
		    stepping : 30,
		    enabledHours: [9,10,11,12,13,14,15,16,17,18]
 		});

		getClassList();
		getMybookList();
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
			error: function(data) {
						console.log("fail");
					}	
		});	// ajax end
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
			error: function(data) {
						console.log("fail");
					}
		});	// ajax end
	}	
	
	function getMybookList() {
		var info = {
			memNum: '${loginMem.memNum}'
		}
		
		if(info.memNum == '') {
			mybookList.append("<tr><td colspan='6'>정보 없음</td></tr>");
		} else {
			$.ajax({
				type : "post",
				async: true,
				url: "/booking/getMybookList",
				data: JSON.stringify(info),
				contentType: 'application/json',
				success: function(mapList) {
							for(i = 0 ; i < mapList.length; i++) {
								var str = "<tr>"
									+ "<td>" + mapList[i].bookNum + "</td>"
									+ "<td>" + mapList[i].className + "</td>"
									+ "<td>" + mapList[i].bookTitle + "</td>"
									+ "<td>" + mapList[i].bookStartTime + "</td>"
									+ "<td>" + mapList[i].bookEndTime + "</td>"
									+ "<td>" + mapList[i].bookState + "</td>"
								 + "</tr>";
								 mybookList.append(str);
							}
						},
				error: function(data) {
							console.log("fail");
						}
			});	// ajax end
		}
	}
	
	function rendCal(classList, bookingList) {
		var calendarEl = document.getElementById('timeline_cal');

		var calendar = new FullCalendar.Calendar(calendarEl, {
			locale: 'ko',
		    timezone: "local",
		    selectable: true,
		    minTime: "09:00:00",
		    maxTime: "20:00:00",	
		    aspectRatio: 2,
		    slotWidth: "5%",
		    height: 600,
		    resourceAreaWidth: "20%",
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
		    select: function(info) {
					    	selectDate(info);			      	
					    },
		    eventClick: function(info){
		    				eventClick(info);
					    }
		});	// calendar end
		calendar.render();
	}
	
</script>
</html>