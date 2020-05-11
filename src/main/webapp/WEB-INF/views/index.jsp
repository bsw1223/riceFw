<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ include file="header.jsp"%>

<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1></h1>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-md-3">
				<!-- Widget: user widget style 1 -->
				<div class="box box-widget widget-user-2">
					<!-- Add the bg color to the header using any of the bg-* classes -->
					<div class="widget-user-header bg-yellow">
						<div class="widget-user-image">
							<img class="img-circle"
								src="${contextPath}/resources/img/logo_crop.jpg"
								alt="User Avatar">
						</div>
						<!-- /.widget-user-image -->
						<h3 class="widget-user-username">${loginMem.memName}</h3>
						<h5 class="widget-user-desc"></h5>
					</div>
					<div class="box-footer no-padding">
						<ul class="nav nav-stacked" id="todayClass">
							<li><a href="#"><b>Today</b></a></li>
						</ul>
					</div>
				</div>
				<!-- /.widget-user -->
			
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
		<!--  form-group 끝          -->
	
         	 </div>
       <!-- /.tab-pane -->
        </div>
      <!-- /.tab-content -->
      </div>
      <!-- /.nav-tabs-custom -->
    </div>
	<!-- /.col -->
   </div>
   <!-- /.row -->
        
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
</section>
<!-- /.content -->

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
								<label for="inputEmail3" class="col-sm-2 control-label">제
									목</label>

								<div class="col-sm-10">
									<input type="text" class="form-control eventTitle"
										id="eventTitle" placeholder="">
								</div>
							</div>
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">시작
									시간</label>

								<div class="col-sm-10">
									<input type="text" class="form-control eventStart"
										id="eventStart" placeholder="">
								</div>
							</div>
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">종료
									시간</label>

								<div class="col-sm-10">
									<input type="text" class="form-control eventEnd" id="eventEnd"
										placeholder="">
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label ">하루종일</label>

								<div class="col-sm-10">

									<input type="checkbox" id="eventAllday" class="eventAllday">
								</div>
							</div>
							 <!-- Color Picker -->
<!-- 				              <div class="form-group"> -->
<!-- 				                <label for="eventColor" class="col-sm-2 control-label ">일정색상</label> -->
<!-- 				                <div class="col-sm-10 my-colorpicker2"> -->
<!-- 				                  <input type="text" class="form-control" name="eventColor" id="eventColor">  -->
<!-- 				                </div> -->
<!-- 				                /.input group -->
<!-- 				              </div> -->
				              <!-- /.form group -->
				              
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">설
									명</label>

								<div class="col-sm-10">
									<input type="text" class="form-control eventDescription"
										id="eventDescription" placeholder="">
								</div>
							</div>
						</div>
						<!-- /.box-body -->
					</form>
				</div>
				<!-- /.modal-body -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-default bg-red color-palette"
						data-dismiss="modal" id="eventDelete">삭제</button>
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
									<input type="hidden" class="form-control eventId" id="iEventId"
										placeholder="">
								</div>
							</div>

							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">제
									목</label>

								<div class="col-sm-10">
									<input type="text" class="form-control eventTitle"
										id="iEventTitle" placeholder="">
								</div>
							</div>
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">시작
									시간</label>

								<div class="col-sm-10">
									<input type="text" class="form-control eventStart"
										id="iEventStart" value=" " placeholder="">
								</div>
							</div>
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">종료
									시간</label>

								<div class="col-sm-10">
									<input type="text" class="form-control eventEnd" id="iEventEnd"
										placeholder="">
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label ">하루종일</label>

								<div class="col-sm-10">

									<input type="checkbox" id="iEventAllday" class="iEventAllday">
								</div>
							</div>
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">설
									명</label>

								<div class="col-sm-10">
									<input type="text" class="form-control eventDescription"
										id="iEventDescription" placeholder="">
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

<!-- Bootstrap Color Picker -->
<link rel="stylesheet" href="${contextPath}/resources/bower_components/bootstrap-colorpicker/dist/css/bootstrap-colorpicker.min.css">
<!-- full calendar -->
<link href='${contextPath}/resources/static/fullcalendar/core/main.css' rel='stylesheet' />
<link href='${contextPath}/resources/static/fullcalendar/daygrid/main.css' rel='stylesheet' />
<link href='${contextPath}/resources/static/fullcalendar/timegrid/main.min.css' rel='stylesheet' />
<script src='${contextPath}/resources/static/fullcalendar/core/main.js'></script>
<script src='${contextPath}/resources/static/fullcalendar/interaction/main.js'></script>
<script src='${contextPath}/resources/static/fullcalendar/daygrid/main.js'></script>
<script src="${contextPath}/resources/static/fullcalendar/timegrid/main.min.js"></script>
<script src='${contextPath}/resources/static/fullcalendar/core/locales/ko.js'></script>
<!-- Bootstrap Color Picker -->
<script src="${contextPath}/resources/bower_components/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
<!-- bootstrap datetimepicker -->
<link rel="stylesheet" href="${contextPath}/resources/api/css/bootstrap-datetimepicker.min.css" />
<script src="${contextPath}/resources/api/js/moment.min.js"></script>
<script src="${contextPath}/resources/api/js/ko.js"></script>
<script src='${contextPath}/resources/api/js/bootstrap-datetimepicker.min.js'></script>

<script src="${contextPath}/resources/js/rice_homejs.js"></script>
<script>
	var ipt_eventColor = $('#eventColor');
	
	$(document).ready(function() {
		setmemNum("${loginMem.memNum}");
		setmemName("${loginMem.memName}");
		setauthId("${loginMem.authId}");
		setauthName();
		
		ipt_eventColor.colorpicker();
		
		$('.widget-user-desc').text(authName);
		
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
		});	// ajax end
		
		todayClass();
	});
</script>
</body>
</html>

