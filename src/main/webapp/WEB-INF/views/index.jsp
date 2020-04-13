<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<%@ include file = "header.jsp" %>


<!-- <link rel="shortcut icon" href="image/favicon.ico"> -->

<link rel="stylesheet" href="${contextPath}/resources/api/fullcalendar/vendor/css/fullcalendar.min.css">
<link rel="stylesheet" href="${contextPath}/resources/api/fullcalendar/vendor/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextPath}/resources/api/fullcalendar/vendor/css/select2.min.css">
<link rel="stylesheet" href="${contextPath}/resources/api/fullcalendar/vendor/css/bootstrap-datetimepicker.min.css">

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<link rel="stylesheet" href="${contextPath}/resources/api/fullcalendar/css/main.css">
<script>
/* var tempVar = "";
$(document).ready(function(){
	$.ajax({
		type : "post",
		async: true,
		datatype:"textd; charset=utf-8",
		url: "/schlist",
		data: {tempVar:tempVar},
		success: function(response){
			mapListSch = JSON.parse(response);
			console.log(mapListSch);
			//var newMapList = JSON.parse(mapListSch);//전체 리스트
			
			
				}
			});
		});
 */

</script>


<div class="content-wrapper" style="min-height: 901px;">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Home</h1>
		<ol class="breadcrumb">
			<li class="active"><i class="fa fa-dashboard"></i>  Home</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">

		<div class="row">
			<div class="col-md-3">

				<!-- Profile Image -->
				<div class="box box-primary">
					<div class="box-body box-profile">
						<img class="profile-user-img img-responsive img-circle" src="${contextPath}/resources/dist/img/user4-128x128.jpg" alt="User profile picture">
						<h3 class="profile-username text-center">Nina Mcintire</h3>
						<p class="text-muted text-center">Software Engineer</p>
						<ul class="list-group list-group-unbordered">
							<li class="list-group-item">
								<b>Followers</b> 
								<a class="pull-right">1,322</a>
							</li>
							<li class="list-group-item">
								<b>Following</b> 
							<a class="pull-right">543</a>
							</li>
							<li class="list-group-item">
								<b>Friends</b> 
							<a class="pull-right">13,287</a></li>
						</ul>
						<a href="#" class="btn btn-primary btn-block"><b>Follow</b></a>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
			</div>
			<!-- /.col -->

			<div class="col-md-9">
				<!-- Full Calendar -->
				<div class="box box-primary">
					<div class="box-body">
						<div class="container">
							<!-- 일자 클릭시 메뉴오픈 -->
							<div id="contextMenu" class="dropdown clearfix">
								<ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu" 
									style="display: block; position: static; margin-bottom: 5px;">
									<li><a tabindex="-1" href="#">카테고리1</a></li>
									<li><a tabindex="-1" href="#">카테고리2</a></li>
									<li><a tabindex="-1" href="#">카테고리3</a></li>
									<li><a tabindex="-1" href="#">카테고리4</a></li>
									<li class="divider"></li>
									<li><a tabindex="-1" href="#" data-role="close">Close</a></li>
								</ul>
							</div>
							<div id="wrapper">
								<div id="loading"></div>
								<div id="calendar"></div>
							</div>
							<!-- 일정 추가 MODAL -->
							<div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
											<h4 class="modal-title"></h4>
										</div>
										<div class="modal-body"> 
											<div class="row">
												<div class="col-xs-12">
													<label class="col-xs-4" for="edit-allDay">하루종일</label> 
													<input class='allDayNewEvent' id="edit-allDay" type="checkbox">
												</div>
											</div>

											<div class="row">
												<div class="col-xs-12">
													<label class="col-xs-4" for="edit-title">일정명</label> 
													<input class="inputModal" type="text" name="edit-title" id="edit-title" required="required" />
												</div>
											</div>
											<div class="row">
												<div class="col-xs-12">
													<label class="col-xs-4" for="edit-start">시작</label> 
													<input class="inputModal" type="text" name="edit-start" id="edit-start" />
												</div>
											</div>
											<div class="row">
												<div class="col-xs-12">
													<label class="col-xs-4" for="edit-end">끝</label> <input
														class="inputModal" type="text" name="edit-end"
														id="edit-end" />
												</div>
											</div>
											<div class="row">
												<div class="col-xs-12">
													<label class="col-xs-4" for="edit-type">구분</label> 
													<select class="inputModal" type="text" name="edit-type" id="edit-type">
														<option value="카테고리1">카테고리1</option>
														<option value="카테고리2">카테고리2</option>
														<option value="카테고리3">카테고리3</option>
														<option value="카테고리4">카테고리4</option>
													</select>
												</div>
											</div>
											<div class="row">
												<div class="col-xs-12">
													<label class="col-xs-4" for="edit-color">색상</label> 
													<select class="inputModal" name="color" id="edit-color">
														<option value="#D25565" style="color: #D25565;">빨간색</option>
														<option value="#9775fa" style="color: #9775fa;">보라색</option>
														<option value="#ffa94d" style="color: #ffa94d;">주황색</option>
														<option value="#74c0fc" style="color: #74c0fc;">파란색</option>
														<option value="#f06595" style="color: #f06595;">핑크색</option>
														<option value="#63e6be" style="color: #63e6be;">연두색</option>
														<option value="#a9e34b" style="color: #a9e34b;">초록색</option>
														<option value="#4d638c" style="color: #4d638c;">남색</option>
														<option value="#495057" style="color: #495057;">검정색</option>
													</select>
												</div>
											</div>
											<div class="row">
												<div class="col-xs-12">
													<label class="col-xs-4" for="edit-desc">설명</label>
													<textarea rows="4" cols="50" class="inputModal" name="edit-desc" id="edit-desc"></textarea>
												</div>
											</div>
										</div>
										<div class="modal-footer modalBtnContainer-addEvent">
											<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
											<button type="button" class="btn btn-primary" id="save-event">저장</button>
										</div>
										<div class="modal-footer modalBtnContainer-modifyEvent">
											<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
											<button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
											<button type="button" class="btn btn-primary" id="updateEvent">저장</button>
										</div>
									</div>
									<!-- /.modal-content -->
								</div>
								<!-- /.modal-dialog -->
							</div>
							<!-- /.modal -->

<!-- 							<div class="panel panel-default"> -->
<!-- 								<div class="panel-heading"> -->
<!-- 									<h3 class="panel-title">필터</h3> -->
<!-- 								</div> -->

<!-- 								<div class="panel-body"> -->
<!-- 									<div class="col-lg-6"> -->
<!-- 										<label for="calendar_view">구분별</label> -->
<!-- 										<div class="input-group"> -->
<!-- 											<select class="filter" id="type_filter" multiple="multiple"> -->
<!-- 												<option value="카테고리1">카테고리1</option> -->
<!-- 												<option value="카테고리2">카테고리2</option> -->
<!-- 												<option value="카테고리3">카테고리3</option> -->
<!-- 												<option value="카테고리4">카테고리4</option> -->
<!-- 											</select> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									/.col	 -->
<!-- 									<div class="col-lg-6"> -->
<!-- 										<label for="calendar_view">등록자별</label> -->
<!-- 										<div class="input-group"> -->
<!-- 											<label class="checkbox-inline"><input class='filter' type="checkbox" value="정연" checked>정연</label>  -->
<!-- 											<label class="checkbox-inline"><input class='filter' type="checkbox" value="다현" checked>다현</label>  -->
<!-- 											<label class="checkbox-inline"><input class='filter' type="checkbox" value="사나" checked>사나</label>  -->
<!-- 											<label class="checkbox-inline"><input class='filter' type="checkbox" value="나연" checked>나연</label>  -->
<!-- 											<label class="checkbox-inline"><input class='filter' type="checkbox" value="지효" checked>지효</label> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									/.col -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							/.filter panel -->
						</div>
						<!-- /.container -->



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

<script src="${contextPath}/resources/api/fullcalendar/vendor/js/jquery.min.js"></script>
<script src="${contextPath}/resources/api/fullcalendar/vendor/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/api/fullcalendar/vendor/js/moment.min.js"></script>
<script src="${contextPath}/resources/api/fullcalendar/vendor/js/fullcalendar.min.js"></script>
<script src="${contextPath}/resources/api/fullcalendar/vendor/js/ko.js"></script>
<script src="${contextPath}/resources/api/fullcalendar/vendor/js/select2.min.js"></script>
<script src="${contextPath}/resources/api/fullcalendar/vendor/js/bootstrap-datetimepicker.min.js"></script>
<script src="${contextPath}/resources/api/fullcalendar/js/main.js"></script>
<script src="${contextPath}/resources/api/fullcalendar/js/addEvent.js"></script>
<script src="${contextPath}/resources/api/fullcalendar/js/editEvent.js"></script>
<script src="${contextPath}/resources/api/fullcalendar/js/etcSetting.js"></script>


<%@ include file = "footer.jsp" %>

</html>