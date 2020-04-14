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

	</section>
	<!-- /.content -->

	<div class="modal fade" id="modalPop">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">Modal title</h4>
				</div>
				<div class="modal-body">
					<p>One fine body&hellip;</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
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

	var memNum = "${loginMem.memNum}";
	console.log("index _ menNum : "+ memNum)
	document.addEventListener('DOMContentLoaded', function() {
			
			$.ajax({
				type : "get",
				async: true,
				datatype:"textd; charset=utf-8",
				url: "data.json",
				data: {memNum:memNum},
				success: function(map){
						
					for(i in map)
							{
								console.log("map : title-"+ map[i].title+", id -"+ map[i]._id);
							}
				    var Calendar = FullCalendar.Calendar;
				    var Draggable = FullCalendarInteraction.Draggable;
				    
				    var containerEl = document.getElementById('external-events');
				    var calendarEl = document.getElementById('calendar');
				    var checkbox = document.getElementById('drop-remove');
				 
				    // initialize the external events
				    // -----------------------------------------------------------------
				 
				    new Draggable(containerEl, {
				      itemSelector: '.fc-event',
				      eventData: function(eventEl) {
				        return {
				          title: eventEl.innerText
				        };
				      }
				    });
				   

				var calendar = new FullCalendar.Calendar(calendarEl, {
					plugins : [ 'interaction', 'dayGrid', 'timeGrid' ],
					selectable : true,
					header : {
						left : 'prev,next today',
						center : 'title',
						right : 'dayGridMonth,timeGridWeek,timeGridDay'
					},

					editable : true,
					droppable : true, // this allows things to be dropped onto the calendar
					drop : function(info) {
						// is the "remove after drop" checkbox checked?
						if (checkbox.checked) {
							// if so, remove the element from the "Draggable Events" list
							info.draggedEl.parentNode.removeChild(info.draggedEl);
						}
					}, dateClick: function(info) {
						$('#modalPop').modal();
						//alert('clicked ' + info.dateStr);
				    }, events : map/* [ 
				    {
						"title" : "Meeting",
						"start" : "2020-04-14T10:30:00+09:00",
						"end" : "2020-04-14T12:30:00+09:00"
					},{
						"allDay": "0",
						"groupId" : "999", 
						"title" : "Repeating Event",
						"start" : "2020-04-09T16:00:00+09:00"
					}] */,
				    
								
					
					locale : 'ko'
				});

				calendar.render();
										
						}
					});
				});
		
	
	 $("#btnAddTest").click(function(){
	      //var arr = getCalendarEvent();
	      var arr = getCalendarDataInDB();
	      //console.log('arr[0].size : ' +  Object.keys( arr[0] ).length );
	      $.each(arr, function(index, item){
	          calendar.addEvent( item );
	          console.log('click evt loop_in_cal' + index + ' : ' + item);
	          $.each(item, function(iii, ttt){
	                console.log('click evt inner loop_in_cal => ' + iii + ' : ' + ttt);
	          });
	      });
	      
	      //calendar.addEvent( {'title':'evt4', 'start':'2019-09-04', 'end':'2019-09-06'});
	      calendar.render();
	  });  
	

	 
	function getCalendarEvent(){
	    //var arr = [ {'title':'evt4', 'start':'2019-09-04', 'end':'2019-09-06'} ];
	    var arr = { 'title':'evt4', 'start':'2019-09-04', 'end':'2019-09-06' };
	    return arr;
	}
	 
	function getCalendarDataInDB(){
	    var arr = [{title: 'evt1', start:'ssssss'}, {title: 'evt2', start:'123123123'}];
	    
	    //배열 초기화
	    var viewData = {};
	    //data[키] = 밸류
	    viewData["id"] = $("#currId").text().trim();
	    viewData["title"] = $("#title").val();
	    viewData["content"] = $("#content").val();
	      
	    return arr;
	}
	
	
	$(document).on("click",".fc-event-container",function(){
			console.log("눌림");
	      	$('#modalPop').modal();
	    });
	
	


</script>

</html>

