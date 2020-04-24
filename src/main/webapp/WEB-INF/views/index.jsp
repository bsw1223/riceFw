<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ include file="header.jsp"%>

<div class="content-wrapper" style="min-height: 901px;">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Home</h1>
		<ol class="breadcrumb">
			<li class="active"><i class="fa fa-dashboard"></i> Home</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-md-3">
				<!-- Profile Image -->
				<div class="box box-primary">
					<div class="box-body box-profile">
						<img class="profile-user-img img-responsive img-circle"
							src="${contextPath}/resources/dist/img/user4-128x128.jpg"
							alt="User profile picture">
						<h3 class="profile-username text-center">Nina Mcintire</h3>
						<p class="text-muted text-center">Software Engineer</p>
						<ul class="list-group list-group-unbordered">
							<li class="list-group-item"><b>Followers</b> <a
								class="pull-right">1,322</a></li>
							<li class="list-group-item"><b>Following</b> <a
								class="pull-right">543</a></li>
							<li class="list-group-item"><b>Friends</b> <a
								class="pull-right">13,287</a></li>
						</ul>
						<a href="#" class="btn btn-primary btn-block"><b>Follow</b></a>
					</div>
					<!-- /.box-body -->
				</div>
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
<div>
</div>
	</section>
<%@ include file="footer.jsp"%>
	<!-- 수정모달창(이벤트 클릭) -->

	<div class="modal fade" id="modalPop">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">일정 확인</h4>
				</div>
				<div class="modal-body">

						<form class="form-horizontal">
							<div class="box-body">
							
								<div class="form-group">
									<!-- <label for="inputEmail3" class="col-sm-2 control-label">일정번호</label> -->

									<div class="col-sm-10">
										<input type="hidden" class="form-control eventId" id="eventId"
											placeholder="">
									</div>
								</div>
								
							  	<div class="form-group">
									<label for="inputEmail3" class="col-sm-2 control-label">제 목</label>

									<div class="col-sm-10">
										<input type="text" class="form-control eventTitle" id="eventTitle" placeholder="">
									</div>
								</div>
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-2 control-label">시작 시간</label>

									<div class="col-sm-10">
										<input type="text" class="form-control eventStart" id="eventStart" placeholder="">
									</div>
								</div>
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-2 control-label">종료 시간</label>

									<div class="col-sm-10">
										<input type="text" class="form-control eventEnd" id="eventEnd"	placeholder="">
									</div>
								</div>
								<div class="form-group">
									<label for="inputPassword3" class="col-sm-2 control-label ">하루종일</label>

									<div class="col-sm-10">
										
										<input type="checkbox" id="eventAllday" class="eventAllday" >
									</div>
								</div>
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-2 control-label">설 명</label>

									<div class="col-sm-10">
										<input type="text" class="form-control eventDescription" id="eventDescription" placeholder="">
									</div>
								</div>
							<!-- /.box-footer -->
						</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-default bg-red color-palette" data-dismiss="modal" id = "eventDelete">Delete</button>
					<button type="button" class="btn btn-primary" id="saveScd">Save changes</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
<!-- /.modal -->
</div>


<!-- 입력 모달창(날짜 클릭) -->

	<div class="modal fade" id="insertModalPop">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">일정 확인</h4>
				</div>
				<div class="modal-body">
						<form class="form-horizontal">
							<div class="box-body">
							
								<div class="form-group">
									<!-- <label for="inputEmail3" class="col-sm-2 control-label">일정번호</label> -->

									<div class="col-sm-10">
										<input type="hidden" class="form-control eventId" id="iEventId" placeholder="">
									</div>
								</div>
								
							  	<div class="form-group">
									<label for="inputEmail3" class="col-sm-2 control-label">제 목</label>

									<div class="col-sm-10">
										<input type="text" class="form-control eventTitle" id="iEventTitle" placeholder="">
									</div>
								</div>
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-2 control-label">시작 시간</label>

									<div class="col-sm-10">
										<input type="text" class="form-control eventStart" id="iEventStart" value=" " placeholder="">
									</div>
								</div>
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-2 control-label">종료 시간</label>

									<div class="col-sm-10">
										<input type="text" class="form-control eventEnd" id="iEventEnd"	placeholder="">
									</div>
								</div>
								<div class="form-group">
									<label for="inputPassword3" class="col-sm-2 control-label ">하루종일</label>

									<div class="col-sm-10">
										
										<input type="checkbox" id="iEventAllday" class="iEventAllday" >
									</div>
								</div>
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-2 control-label">설 명</label>

									<div class="col-sm-10">
										<input type="text" class="form-control eventDescription" id="iEventDescription" placeholder="">
									</div>
								</div>
							<!-- /.box-footer -->
						</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="iSave">Save</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
</div>
<!-- /.content-wrapper -->
<link href='${contextPath}/resources/static/fullcalendar/core/main.css'	rel='stylesheet' />
<link href='${contextPath}/resources/static/fullcalendar/daygrid/main.css' rel='stylesheet' />
<link href='${contextPath}/resources/static/fullcalendar/timegrid/main.min.css' rel='stylesheet' />
<script src='${contextPath}/resources/static/fullcalendar/core/main.js'></script>
<script	src='${contextPath}/resources/static/fullcalendar/interaction/main.js'></script>
<script	src='${contextPath}/resources/static/fullcalendar/daygrid/main.js'></script>
<script	src="${contextPath}/resources/static/fullcalendar/timegrid/main.min.js"></script>
<script src='${contextPath}/resources/static/fullcalendar/core/locales/ko.js'></script>


<!-- bootstrap datetimepicker -->
<link rel="stylesheet" href="${contextPath}/resources/api/css/bootstrap-datetimepicker.min.css" />
<script src="${contextPath}/resources/api/js/moment.min.js"></script>
<script src="${contextPath}/resources/api/js/ko.js"></script>
<script src='${contextPath}/resources/api/js/bootstrap-datetimepicker.min.js'></script>
</head>
<script>
	var memNum = "${loginMem.memNum}";
	
	var eventStart = $("input#eventStart");
	var eventEnd = $("input#eventEnd");
	var eventAllday = $("input#eventAllday");
		
	var iEventStart= $("input#iEventStart");
	var iEventEnd= $("input#iEventEnd");

	
	
	$(document).ready(function() {
		$.ajax({
			type : "post",
			async : true,
			datatype : "textd; charset=utf-8",
			url : "calMain",
			data : {
				memNum : memNum
			},
			success : function(map) {
					  readyView(map);
			}
		});
	});

	function readyView(map) {
		
		var Calendar = FullCalendar.Calendar;
		var containerEl = document.getElementById('external-events');
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			
			plugins : [ 'interaction', 'dayGrid', 'timeGrid' ],
			selectable : true,
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'dayGridMonth,timeGridWeek,timeGridDay'
			},
			events : map,
			eventResizableFromStart : false,
			//날짜 클릭시 적용
			dateClick : function(info) {
				dateClick(info)
			},
			//이벤트 클릭시 적용
			eventClick : function(info) {
				eventClick(info)
			},
			locale : 'ko'
		});
		
		dateFunction();
		dateFunctionE();
		calendar.render();
	};

	//날짜 클릭 시 일정번호 받아옴
	function dateClick(info){
	$.ajax({
		type : "get",
		async : true,
		datatype : "textd; charset=utf-8",
		url : "selectSchSeqNo",
		data : {},
		success : function(map) {
			var dateTodayS = moment(info.dateStr).format('YYYY-MM-DD HH:mm');
			var dateTodayE = moment(info.dateStr).format('YYYY-MM-DD 01:00');
			
			$("input#iEventStart").val(dateTodayS);
			$("input#iEventEnd").val(dateTodayE);
			$("input#iEventId").prop('disabled', true);//편집 불가로 변경
			$("input#iEventTitle").val('');
			$("input#iEventDescription").val('');
			//id추가
			var id = map.id;
			$('input#iEventId').attr('value', id);
			$('#insertModalPop').modal();
		}
	});
	};
	
//이벤트 클릭
	function eventClick(info) {
		var eventTitle = info.event.title;
		var eventId = info.event.id;
		var eventAllday = null;
		if (info.event.allDay == 1) {
			$('input#eventAllday').prop("checked", true);
		} else {
			$('input#eventAllday').prop("checked", false);
		}
		var eventStartE = moment(info.event.start).format('YYYY-MM-DD HH:mm');
		var eventEndE = moment(info.event.end).format('YYYY-MM-DD HH:mm');
		$("input#eventStart").val(eventStartE);
		$("input#eventEnd").val(eventEndE);
		$('input#eventTitle').val(eventTitle);
		$('input#eventId').val(eventId);
		$("input#eventId").prop('disabled', true)

		//기존 이벤트 클릭 시 desc받아옴 ->정보 전체로 변경
		$.ajax({
			type : "get",
			async : true,
			datatype : "textd; charset=utf-8",
			url : "selectDesc",
			data : {
						memNum : memNum,
						schId : eventId
					},
			success : function(map) {
				if (map.allDay == 1) {
					eventAllday = "checked";
					$('input#eventAllday').prop('checked',false);
					$('input#eventAllday').prop('checked', true);
				} else {
					$('input#eventAllday').prop('checked',false);
				}
				var schDescription = map.schDescription;
				$('input.eventDescription').val(schDescription);
			}
		});
		dateFunctionE(info);
		//check박스 설정
		$('div#modalPop').modal();
	};

	//스케쥴 수정saveScd
	$(document).ready(function() {
		$("#saveScd").on("click", function() {
			   if ($("input#eventStart").val() > $("input#eventEnd").val()) {
		            alert('끝나는 날짜가 앞설 수 없습니다.');
		            return false;
		        }
		       if ($('input#eventTitle').val() === '') {
		            alert('일정명은 필수입니다.')
		           return false;
		        }
				var con_result = confirm("정말 수정하시겠습니까?")
				if (!con_result) {
					return false;
				}
				//allDay일 때
				if ($("input#eventAllday").is(':checked')==true) {
					$("#eventStart").val(moment($("#eventStart").val()).format('YYYY-MM-DD'));
		        //render시 날짜표기수정
		        $("#eventEnd").val(moment($("#eventEnd").val()).add(1, 'days').format('YYYY-MM-DD'));
		        }else{
					$("#eventStart").val(moment($("#eventStart").val()).format('YYYY-MM-DD HH:mm'));
			        //render시 날짜표기수정
			        $("#eventEnd").val(moment($("#eventEnd").val()).format('YYYY-MM-DD HH:mm'));
			        }
				
				
			$.ajax({
				type : "post",
				async : true,
				datatype : "textd; charset=utf-8",
				url : "schModify",
				data : {
					schId : $("#eventId").val(),
					schTitle : $("#eventTitle").val(),
					schStart : $("#eventStart").val(),
					schEnd : $("#eventEnd").val(),
					schAllDay : $("input#eventAllday").is(':checked'),
					schDescription : $("#eventDescription").val(),
					memNum : memNum,
				},
				success : function(data) {
					if (data == '1') {
						alert("수정 되었습니다");
						window.location.href = '/';
					} else {
						alert("수정에 실패했습니다");
					}
				},
			});
		});
	});
	
	//insert 스케쥴
	$(document).ready(function() {
		$("#iSave").on("click", function() {
			 if ($("input#iEventStart").val() > $("input#iEventEnd").val()) {
		            alert('끝나는 날짜가 앞설 수 없습니다.');
		            return false;
		        }
		     if ($('input#iEventTitle').val() === '') {
		          alert('일정명은 필수입니다.')
		          return false;
		        }
		   //allDay일 때
				if ($("input#iEventAllday").is(':checked')==true) {
					$("#iEventStart").val(moment($("#iEventStart").val()).format('YYYY-MM-DD'));
		        //render시 날짜표기수정
		        $("#iEventEnd").val(moment($("#iEventEnd").val()).add(1, 'days').format('YYYY-MM-DD'));
		        }else{
					$("#iEventStart").val(moment($("#iEventStart").val()).format('YYYY-MM-DD HH:mm'));
			        //render시 날짜표기수정
			        $("#iEventEnd").val(moment($("#iEventEnd").val()).format('YYYY-MM-DD HH:mm'));
			        }
		   
				
			$.ajax({
				type : "post",
				async : true,
				datatype : "textd; charset=utf-8",
				url : "schInsert",
				data : {
					schId : $("#iEventId").val(),
					schTitle : $("#iEventTitle").val(),
					schStart : $("#iEventStart").val(),
					schEnd : $("#iEventEnd").val(),
					schAllDay : $("input#iEventAllday").is(':checked'),
					schDescription : $("#iEventDescription").val(),
					memNum : memNum,
				},
				success : function(data) {
					if (data == '1') {
						alert("스케쥴이 등록되었습니다");
						window.location.href = '/';
					} else {
						alert("등록에 실패했습니다");
					}
				},
			});
		});
	});
	
	//삭제
	$(document).ready(function() {
		$("#eventDelete").on("click", function() {
			var con_result = confirm("정말 삭제하시겠습니까?")
			if (!con_result) {
				return false;
			}
			$.ajax({
				type : "post",
				async : true,
				datatype : "textd; charset=utf-8",
				url : "deleteSchInfo",
				data : {
					schId : $("#eventId").val(),
					memNum : memNum,
				},
				success : function(data) {
					if (data == '1') {
						alert("삭제 되었습니다.");
						window.location.href = '/';
					} else {
						alert("삭제에 실패했습니다");
					}
				},
			});
		});
	});

	//날짜 클릭
	function dateClick(info) {
		//날짜 클릭 시 일정번호 받아옴
		$.ajax({
			type : "get",
			async : true,
			datatype : "textd; charset=utf-8",
			url : "selectSchSeqNo",
			data : {},
			success : function(map) {
				var dateTodayS = moment(info.dateStr)
						.format('YYYY-MM-DD HH:mm');
				var dateTodayE = moment(info.dateStr)
						.format('YYYY-MM-DD 01:00');
				$("input#iEventStart").val(dateTodayS);
				$("input#iEventEnd").val(dateTodayE);
				$("input#iEventId").prop('disabled', true);//편집 불가로 변경
				$("input#iEventTitle").val('');
				$("input#iEventDescription").val('');
				//id추가
				var id = map.id;
				$('input#iEventId').attr('value', id);
				$('#insertModalPop').modal();
			}
		});
	};

	//시간 설정
	function dateFunctionE() {
		$("input.eventStart").datetimepicker(
				{
					format : 'YYYY-MM-DD HH:mm',
					stepping : 5,
				});
		$("input.eventEnd").datetimepicker(
				{
					format : 'YYYY-MM-DD HH:mm',
					stepping : 5,
				});
	};

	function dateFunction() {
		$("input#iEventStart").datetimepicker(
				{
					format : 'YYYY-MM-DD HH:mm',
					stepping : 5,
				});
		$("input#iEventEnd").datetimepicker(
				{
					format : 'YYYY-MM-DD HH:mm',
					stepping : 5,
				});
	};
	
	
	//모달 닫힐 때 실행(체크 박스 초기화)

	$('div#modalPop').on('hide.bs.modal', function(e){
		modalClose();
		e.stopImmediatePropagation();
	});
	$('#insertModalPop').on('hide.bs.modal', function(e){
		modalClose();
		e.stopImmediatePropagation();
	});
	
	//체크박스 초기화
	function modalClose()
		{
			$('input#eventAllday').prop("checked", false);
			$('input#iEventAllday').prop("checked", false);
		}
	

	
	
</script>

</html>

