<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ include file="header.jsp"%>

<div class="content-wrapper" style="min-height: 901px;">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Home</h1>
	
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-md-5">
				<!-- Profile Image -->
				<div class="box box-primary">
					<div class="box-body box-profile">
						<img class="profile-user-img img-responsive img-circle"
							src="${contextPath}/resources/dist/img/user4-128x128.jpg"
							alt="User profile picture">
						<h3 class="profile-username text-center">${loginMem.memName}</h3>
						<p class="text-muted text-center" id="jobName"></p>
						<ul class="list-group list-group-unbordered">
							<li class="list-group-item"><b>Followers</b> <a
								class="pull-right">1,322</a></li>
							<li class="list-group-item"><b>Following</b> <a
								class="pull-right">543</a></li>
							<li class="list-group-item"><b>Friends</b> <a
								class="pull-right">13,287</a></li>
						</ul>
					</div>
					<!-- /.box-body -->
				</div>
				<div class="box box-primary" id="toeicList">
					${elemStringRep}
				</div>
				<div class="box box-primary" id="toeicSpeakingList">
					${elemStringRepRG}
				</div>
			</div>
			<!-- /.col -->
			<div class="col-md-6">
			
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
							</div>
							<!-- /.box-body -->
						</form>
				</div>
				<!-- /.modal-body -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-default bg-red color-palette" data-dismiss="modal" id = "eventDelete">삭제</button>
					<button type="button" class="btn btn-primary" id="saveScd">저장</button>
				</div>
				<!-- /.modal-footer -->
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
<!-- /.modal -->



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
							</div>
							<!-- /.box-footer -->
						</form>
					</div>
					<!-- /.modal-body -->
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary" id="iSave">저장</button>
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



	

<%@ include file="footer.jsp"%>

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

<script>
	var memNum = "${loginMem.memNum}";
	var memName = "${loginMem.memName}";
	var eventStart = $("input#eventStart");
	var eventEnd = $("input#eventEnd");
	var eventAllday = $("input#eventAllday");
	var iEventStart= $("input#iEventStart");
	var iEventEnd= $("input#iEventEnd");
	var authName ='';

	if(authId==1000)
		{
			authName="관리자";
		}else if(authId==1001)
			{
				authName="학생";
			}else
				{
				 authName="강사";
				}
	
	$('p#jobName').text(authName);
	
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
	
//--------크롤링 테이블------
//토익테이블
  var aTagLength = $('#reg_table > tbody > tr:nth-child(2) > td > table > tbody > tr');
	for (var i = 0; i < aTagLength.length + 1; i++) {
		aTagChange = "'#reg_table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(" + i + ") > td:nth-child(1) > a'"
		$(eval(aTagChange)).attr("href","https://appexam.ybmnet.co.kr/toeic/receipt/receipt.asp");
		$('td.str > a').attr('style','margin:auto 10px 0 auto; white-space: nowrap; overflow: hidden');
		$('td.str').attr('style','padding-right:15px; overflow: hidden');
		$('th > img').remove();
		$('th:eq(0)').text('시험일자');
		$('th:eq(1)').text('성적발표일');
		$('th:eq(2)').text('접수마감');
		$('#reg_table > tbody > tr:nth-child(1) > td').remove();
	} 
		$('#reg_table > tbody > tr:nth-child(2) > td > table > tbody').prepend('<div class=\"box-header with-border style=\"position:relative; bottom:15px;\">'
																			   +'<h3 class=\"box-title\" style=\"text-align:left; padding-botom:15px; padding-top:3px; margin-top:0px\">TOEIC 일정 안내</h3></div>');
		$('#reg_table > tbody > tr:nth-child(2) > td > table').removeClass();
		$('#reg_table > tbody > tr:nth-child(2) > td > table').attr('style','width:100%; margin-left:3%; margin-right:3%; margin-bottom:3%');
	//스피킹 테이블	
		$('#toeicSpeakingList > div > table > tbody > tr:nth-child(1) > td:nth-child(2)').attr('style','padding-right:15px; overflow: hidden');
		$('#toeicSpeakingList > div > table > thead > tr > th:nth-child(1)').attr('style', 'padding-left: 6%');
		$('#toeicSpeakingList > div > table > thead > tr > th:nth-child(2)').attr('style', 'padding-left: 6%');
		$('#toeicSpeakingList > div > table > thead > tr > th:nth-child(3)').attr('style', 'padding-left: 6%');
		$('#toeicSpeakingList').attr('style', 'width:100%; margin-left:0; margin:auto');
		$('td.left').attr('style','padding-left: 5%');
		var changeLeft= $('#toeicSpeakingList > div > table > tbody > tr');
		for(var i=0 ; i < changeLeft.length+1 ; i++){
			var changeLeftD= $('#toeicSpeakingList > div > table > tbody > tr:nth-child('+i+') > td:nth-child(1)');
			eval(changeLeftD).attr('style', ' padding-right: 6%');
		}
		$('div#toeicSpeakingList').prepend('<div class=\"box-header with-border style=\"position:relative; bottom:15px;\">'
				  							 +'<h3 class=\"box-title\" style=\"text-align:left; padding-botom:15px; padding-top:0px; margin-top:0px; margin-left:4%\">TOEIC SPEAKING 일정 안내</h3></div>');
		$('div.list_schedule_cont').attr('style','margin: 0 3% 5% 7%');
		$('div#toeicSpeakingList').attr('style','max-height:200px; overflow:auto');
		$('div#toeicList').attr('style','max-height:200px; overflow:auto; overflow-x:hidden');
		
		$('div#toeicSpeakingList > tbody:eq(0)').remove(); 
		
</script>
</body>
</html>

