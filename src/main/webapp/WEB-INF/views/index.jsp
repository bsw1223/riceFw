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
          <!-- Widget: user widget style 1 -->
          <div class="box box-widget widget-user-2">
            <!-- Add the bg color to the header using any of the bg-* classes -->
            <div class="widget-user-header bg-yellow">
              <div class="widget-user-image">
                <img class="img-circle" src="${contextPath}/resources/dist/img/user7-128x128.jpg" alt="User Avatar">
              </div>
              <!-- /.widget-user-image -->
              <h3 class="widget-user-username">${loginMem.memName}</h3>
              <h5 class="widget-user-desc"></h5>
            </div>
            <div class="box-footer no-padding">
              <ul class="nav nav-stacked">
                <li><a href="#">Projects <span class="pull-right badge bg-blue">31</span></a></li>
                <li><a href="#">Tasks <span class="pull-right badge bg-aqua">5</span></a></li>
                <li><a href="#">Completed Projects <span class="pull-right badge bg-green">12</span></a></li>
                <li><a href="#">Followers <span class="pull-right badge bg-red">842</span></a></li>
              </ul>
            </div>
          </div>
          <!-- /.widget-user -->
          <div class="box box-solid">
            <div class="box-header with-border">
              <h3 class="box-title">D-day</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                  <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                  <li data-target="#carousel-example-generic" data-slide-to="1" class=""></li>
<!--                   <li data-target="#carousel-example-generic" data-slide-to="2" class=""></li> -->
                </ol>
                <div class="carousel-inner">
                  <div class="item active">
                    <img src="http://placehold.it/900x300/39CCCC/ffffff&text=Toeic :+D+-"+<%=request.getAttribute("compare") %>+"\"" alt="First slide">

                    <div class="carousel-caption" style="text-align: left;padding-left: 100%;">
                    
                    </div>
                  </div>
                  <div class="item">
                    <img src="http://placehold.it/900x300/3c8dbc/ffffff&text=I+Love+Bootstrap" alt="Second slide">

                    <div class="carousel-caption">
                      
                    </div>
                  </div>
                  <div class="item">
                    <img src="http://placehold.it/900x300/f39c12/ffffff&text=I+Love+Bootstrap" alt="Third slide">

                    <div class="carousel-caption">
                      
                    </div>
                  </div>
                </div>
                <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                  <span class="fa fa-angle-left"></span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                  <span class="fa fa-angle-right"></span>
                </a>
              </div>
            </div>
            <!-- /.box-body -->
          </div>
        			
			
			
<div class="row">
        
     <div class="col-md-12">
       <div class="nav-tabs-custom">
         <ul class="nav nav-tabs">
           <li class="active"><a href="#info" data-toggle="tab"> 토익다음 시험</a></li>
		   <li><a href="#pwd" data-toggle="tab"  aria-expanded="true"> 토익스피킹 다음 시험</a></li>
            </ul>
            
            <!-- form  -->
            
           	<div class="tab-content">
	           	<div class="tab-pane active" id="info"><!-- 상위 태그 -->
	           		<div class="form-group"><!-- 이안에내용 -->
		             	 <div class="table-responsive"><!-- 내용시작 -->
				            <table class="table">
				              <tr>
				                <th style="width:50%;padding-left: 25%;padding-top: 4%;">시험일자  </th>
				                <td style="padding-left: 10%;padding-top: 4%;"><a href="https://appexam.ybmnet.co.kr/toeic/receipt/receipt.asp"> ${exDate}</a></td>
				              </tr>
				              <tr>
				                <th style="width:50%;padding-left: 25%;">접수마감  </th>
				                <td style="padding-left: 10%;">${recepShedule}</td>
				              </tr>
				              <tr>
				                <th style="width:50%;padding-left: 25%;">성적발표일  </th>
				                <td style="padding-left: 10%;">${dateRls}</td>
				              </tr>
				            </table>
				          </div> <!-- 내용끝 -->
		                         	
		                </div>
		          </div>
	    <div class="tab-pane" id="pwd"><!-- 상위 태그 -->
				<div class="form-group">
			       <div class="table-responsive"><!-- 내용시작 -->
		            <table class="table">
		              <tr>
		                <th style="width:50%;padding-left: 25%;padding-top: 4%;">시험일자  </th>
		                <td style="padding-left: 10%;padding-top: 4%;"><a href="https://appexam.ybmnet.co.kr/toeicswt/receipt/receipt.asp"> ${exDateS}</a></td>
		              </tr>
		              <tr>
		                <th style="width:50%;padding-left: 25%;">접수마감  </th>
		                <td style="padding-left: 10%;">${recepSheduleS}</td>
		              </tr>
		              <tr>
		                <th style="width:50%;padding-left: 25%;">성적발표일  </th>
		                <td style="padding-left: 10%;">${dateRlsS}</td>
		              </tr>
		            </table>
		          </div> 
                </div> 
<!--                 form-group 끝          -->
	
         	 </div>
       			 <!-- /.tab-pane -->
        </div>
      <!-- /.tab-content -->
      </div>
      <!-- /.nav-tabs-custom -->
    </div>
        	
				
				
				
	
        </div>
			<!-- /.col -->
	</div>		
			
			
			
			
			
			
			
			
			
			
			
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
		<!-- /.row -->

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
	
	$('.widget-user-desc').text(authName);
	
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
	
//오늘 수업 요일 숫자 받기
$(document).ready(function(){
	$.ajax({
			type : "get",
			async : true,
			datatype : "textd; charset=utf-8",
			url : "selectSysdate",
			data : {},
			success : function(selectSysdate) {
				console.log("selectSysdate : "+selectSysdate.selectSysdate);
				var sysDate = selectSysdate.selectSysdate;
				
				if(sysDate==0)
					sysDate='classSun';
				if(sysDate==1)
					sysDate='classMon';
				if(sysDate==2)
					sysDate='classTue';
				if(sysDate==3)
					sysDate='classWed';
				if(sysDate==4)
					sysDate='classThur';
				if(sysDate==5)
					sysDate='classFri';
				if(sysDate==6)
					sysDate='classSat';
				//dateClassChoice(sysDate);
			}
		});
});

//오늘 날짜 받기
$(document).ready(function(){
	$.ajax({
			type : "get",
			async : true,
			datatype : "json; charset=utf-8",
			url : "selectDateToday",
			data : {},
			success : function(selectDateToday) {
				console.log("selectDateToday : "+selectDateToday.selectDateToday);
			
				
			
			}
		});
});

		
</script>
</body>
</html>

