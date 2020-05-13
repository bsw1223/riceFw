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
				<div class="box box-warning">
					<div class="box-body">
						<div id='timeline_cal'></div>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->

				<div class="box box-warning">
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
							<label class="col-sm-2 control-label" for="bookPurpose">설명</label>
							<div class="col-sm-10">
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
<script src="${contextPath}/resources/js/rice_bookjs.js"></script>
<script>
	var ipt_StartTime = $("input[name='bookStartTime']");
	var ipt_EndTime = $("input[name='bookEndTime']");
	
	$(document).ready(function(){
		setmemNum('${loginMem.memNum}');
		
		ipt_StartTime.datetimepicker({
			locale: 'ko',
		    format: 'YYYY-MM-DD HH:mm',
		    stepping : 30,
		    enabledHours: [9,10,11,12,13,14,15,16,17,18]
 		});
		
		ipt_EndTime.datetimepicker({
			locale: 'ko',
		    format: 'YYYY-MM-DD HH:mm',
		    stepping : 30,
		    enabledHours: [9,10,11,12,13,14,15,16,17,18]
 		});
		getClassList();
		getMybookList();
	});

</script>
</body>
</html>