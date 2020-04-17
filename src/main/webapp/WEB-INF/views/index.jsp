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
				<!-- /.box -->
			<!-- 	드래그 메뉴
				<div id="external-events">
					<p>
						<strong>Draggable Events</strong>
					</p>
					<div class="fc-event">My Event 1</div>
					<div class="fc-event">My Event 2</div>
					<div class="fc-event">My Event 3</div>
					<div class="fc-event">My Event 4</div>
					<div class="fc-event">My Event 5</div>
					<p>
						<input type="checkbox" id="drop-remove"> <label
							for="drop-remove">remove after drop</label>
					</p>
				</div> -->
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
	<!-- 수정모달창 -->

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
									<label for="inputEmail3" class="col-sm-2 control-label">일정번호</label>

									<div class="col-sm-10">
										<input type="text" class="form-control eventId" id="eventId"
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
					<button type="button" class="btn btn-default bg-red color-palette" data-dismiss="modal">Delete</button>
					<button type="button" class="btn btn-primary" id="saveScd">Save changes</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->



<!-- 입력 모달창 -->

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
									<label for="inputEmail3" class="col-sm-2 control-label">일정번호</label>

									<div class="col-sm-10">
										<input type="text" class="form-control eventId" id="iEventId"
											placeholder="">
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
										<input type="text" class="form-control eventStart" id="iEventStart" placeholder="">
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
										
										<input type="checkbox" id="iEventAllday" class="eventAllday" >
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
					<button type="button" class="btn btn-default bg-red color-palette" data-dismiss="modal">Delete</button>
					<button type="button" class="btn btn-primary" id="iSaveScd">Save changes</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->








</div>
<!-- /.content-wrapper -->
<%@ include file="footer.jsp"%>


<link href='${contextPath}/resources/static/fullcalendar/core/main.css'	rel='stylesheet' />
<link href='${contextPath}/resources/static/fullcalendar/daygrid/main.css' rel='stylesheet' />
<link href='${contextPath}/resources/static/fullcalendar/timegrid/main.min.css' rel='stylesheet' />
<script src='${contextPath}/resources/static/fullcalendar/core/main.js'></script>
<script	src='${contextPath}/resources/static/fullcalendar/interaction/main.js'></script>
<script	src='${contextPath}/resources/static/fullcalendar/daygrid/main.js'></script>
<script	src="${contextPath}/resources/static/fullcalendar/timegrid/main.min.js"></script>
<script src='${contextPath}/resources/static/fullcalendar/core/locales/ko.js'></script>
</head>
<script>
	var mapList = null;
	var memNum = "${loginMem.memNum}";
	var eventMemNum = null;
	var eventId = null;
	//var eventAllday = null;
	var eventTitle = null;
	var eventStart = null;
	var eventEnd = null;
	var eventDescription = null;
	var eventBackgroundColor = null;
	
	console.log("index _ menNum : "+ memNum);
	
	$(document).ready(
			function() {
				$.ajax({
					type : "get",
					async : true,
					datatype : "textd; charset=utf-8",
					url : "data.json",
					data : {
						memNum : memNum
					},
					success : function(map) {
						mapList = map;
						for (i in map) {
							console.log("map : title-" + map[i].title
									+ ", id -" + map[i]._id);
						}
						readyView(mapList);
					}
				});
			});
	
function readyView(mapList){	

		console.log("maplist : " +mapList);
	    var Calendar = FullCalendar.Calendar;
	    var Draggable = FullCalendarInteraction.Draggable;
	    
	    var containerEl = document.getElementById('external-events');
	    var calendarEl = document.getElementById('calendar');
	    var checkbox = document.getElementById('drop-remove');
	 
	    // initialize the external events
	    // -----------------------------------------------------------------
	 

	/* new Draggable(containerEl, {
			itemSelector : '.fc-event',
			eventData : function(eventEl) {
				return {
					title : eventEl.innerText
				}
			}
		}); *///드래그 메뉴기능
		var calendar = new FullCalendar.Calendar(calendarEl, {
			plugins : [ 'interaction', 'interaction', 'dayGrid', 'timeGrid' ],
			selectable : true,
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'dayGridMonth,timeGridWeek,timeGridDay'
			},

			editable : true,
			//droppable : false, // this allows things to be dropped onto the calendar
			eventResizableFromStart : false , 
			drop : function(info) {
				// is the "remove after drop" checkbox checked?
				if (checkbox.checked) {
					// if so, remove the element from the "Draggable Events" list
					info.draggedEl.parentNode.removeChild(info.draggedEl);
				}
			},
			//날짜 클릭시 적용
			dateClick : function(info) {
				//alert('Clicked on: ' + info.title);
			$('input.eventId').prop('disabled',true );
			$('#insertModalPop').modal();
				
			},
			//이벤트 클릭시 적용
			eventClick : function(info) {
				var eventId = info.event.id;
				var eventAllday = null;
				var eventTitle = info.event.title;
				var eventStart = info.event.start;
				var eventEnd = info.event.end;
				var eventDescription = info.event.description;
				console.log(" eventDescription :  "+ eventDescription);
				var eventBackgroundColor = info.event.backgroundColor;
				//check박스 설정
				if(info.event.allDay===1){
					eventAllday = "checked";
					$('input#eventAllday').remove('checked');
					$('input#eventAllday').attr('checked','checked');
				}
				if(info.event.allDay===0) {$('input#eventAllday').remove('checked');}
				$('input.eventId').attr('value',eventId );
				$('input.eventId').prop('disabled',true );
				$('input.eventTitle').attr('value',eventTitle );
				$('input.eventStart').attr('value',eventStart );
				$('input.eventEnd').attr('value',eventEnd );
				$('input.eventDescription').attr('value',eventDescription );
				console.log("eventDescription : "+eventDescription)
				//$('input.eventBackgroundColor').0oattr('value',eventBackgroundColor );
				$('div#modalPop').modal();
				
			},
			events : mapList,

			locale : 'ko'
		});

		calendar.render();

	};
	
	//스케쥴 저장saveScd
 	$(document).ready(function(){

    $("#saveScd").on("click",function(){ 
    	$.ajax({
			type : "post",
			async : true,
			datatype : "textd; charset=utf-8",
			url : "schModify",
			data : {schId :$("#eventId").val(),
				   schTitle :$("#eventTitle").val(),
				   schStart :$("#eventStart").val(),
				   schEnd :$("#eventEnd").val(),
				   schDescription :$("#eventDescription").val(),
				   memNum: memNum,
				   
			},
			success : function() {
					console.log("Modify_sucess")
				/* mapList = map;
				for (i in map) {
					console.log("map : title-" + map[i].title
							+ ", id -" + map[i]._id);
				}
				readyView(mapList); */
			}
		});
    	
    	
    }); 
 	});


	

	$("#btnAddTest").click(
			function() {
				var arr = getCalendarDataInDB();
				$.each(arr,
						function(index, item) {
							calendar.addEvent(item);
							console.log('click evt loop_in_cal' + index + ' : '
									+ item);
							$.each(item, function(iii, ttt) {
								console.log('click evt inner loop_in_cal => '
										+ iii + ' : ' + ttt);
							});
						});

				calendar.render();
			});

	function getCalendarEvent() {
		var arr = {
			'title' : 'evt4',
			'start' : '2019-09-04',
			'end' : '2019-09-06'
		};
		return arr;
	}

	function getCalendarDataInDB() {
		var arr = [ {
			title : 'evt1',
			start : 'ssssss'
		}, {
			title : 'evt2',
			start : '123123123'
		} ];

		//배열 초기화
		var viewData = {};
		//data[키] = 밸류
		viewData["id"] = $("#currId").text().trim();
		viewData["title"] = $("#title").val();
		viewData["content"] = $("#content").val();

		return arr;
	}
</script>

</html>

