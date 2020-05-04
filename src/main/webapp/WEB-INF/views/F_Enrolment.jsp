<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<%@ include file = "header.jsp" %>

<div class="content-wrapper" style="min-height: 901px;">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>수강 신청</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">수강신청</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box box-success">
					<div class="box-body">
						<div id='timeline_cal'>
						오오오
						
						
						
						</div>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->

				<div class="box box-success">
					<div class="box-header">
						<h3 class="box-title">강의 목록</h3>
						
						<div class="box-tools pull-right">
		                	<button type="button" class="btn btn-box-tool" data-widget="collapse">
		                		<i class="fa fa-minus"></i>
		                	</button>
		              	</div>
					</div>
					<!-- /.box-header -->
					<div class="box-body table-responsive no-padding">
						<table class="table table-hover">
							<tbody id="openClassList">
								<tr>
									<th>선택</th>
									<th>과정명</th>
									<th>선생님</th>
									<th>일 시</th>
									<th>강의 설명</th>
									<th>수강료</th>
									<th>정원</th>
								</tr>
							</tbody>
						</table>
						<div class="form-group">
							<button type="reset" class="btn btn-primary pull-right"
								style="margin-right: 5px;">
								<i class=""></i> 장바구니
							</button>
							<form action ="/kakaoPay" method ="post"><button  id="insertSub"
								class="btn btn-primary pull-right" style="margin-right: 5px;"
								onclick="">수강신청</button></form>
								<i></i> 
							
						</div>
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
var addTagEnrolTable = null;
var getClassCapacity = null;
var getClassdesc = null;
var getSubid = null;
var getMemNum =  null;
var getOpenclassId =  null;
var getOpenClassId =  null;
var getOpenEndTime =  null;
var getOpenEndDate =  null;
var getOpenStartDate =  null;
var getClassPrice =  null;
var getClassId =  null;
var getMemName = null;
var dayArray = new Array();
var classMon = null;
var classTue = null;
var classWed = null;
var classThur = null;
var classFri = null;
var classSat = null;
var classSun = null;

//radio  샘플
//"<td><input type=\"radio\" name=\"selectTeacher\" class=\"flat-red\" value=\""+memNumSecond+"\"></td>"
//onclick 샘플
/* $("select#bulSelLecOption").on( "change", function() {
		$('tr#addClassLec').remove();
		bulCodeLec = $('#bulSelLecOption option:selected').val();
		//console.log("bulCodeLec : "+bulCodeLec);
		//ajax로 건물 번호 lecNameBul.val 보내서 거기에 맞는 강의실만 받아오기
			$.ajax({
					type : "post",
					async : true,
					datatype : "json; charset=utf-8",
					url : "bulCodeLec",
					data : {bulId:bulCodeLec},
					success : function(bulCodeLec) {
					} */

//과정명, 선생님, 일시, 강의설명, 수강료, 정원

$(document).ready(function(){
	$.ajax({
		type : "post",
		async : true,
		datatype : "json; charset=utf-8",
		url : "enrolmentInfo",
		data : {},
		success : function(enrolmentInfo) 
				{
					for(i in enrolmentInfo){
						
					getMemName = enrolmentInfo[i].MEMNAME;
					getOpenClassName = enrolmentInfo[i].OPENCLASSNAME;
					getClassCapacity = enrolmentInfo[i].CLASSCAPACITY;
					getClassdesc = enrolmentInfo[i].CLASSDESC;
					getSubid = enrolmentInfo[i].SUBID;
					getMemNum = enrolmentInfo[i].MEMNUM;
					getOpenclassId = enrolmentInfo[i].OPENCLASSID;
					
					getOpenStartTime = enrolmentInfo[i].OPENSTARTTIME
					getOpenEndTime = enrolmentInfo[i].OPENENDTIME
					getOpenStartDate = enrolmentInfo[i].OPENSTARTDATE;
					getOpenEndDate = enrolmentInfo[i].OPENENDDATE;
					
					getClassPrice = enrolmentInfo[i].CLASSPRICE;
					getClassId = enrolmentInfo[i].CLASSID;
					
					classMon = enrolmentInfo[i].CLASSMON;
					classTue = enrolmentInfo[i].CLASSTUE;
					classWed = enrolmentInfo[i].CLASSWED;
					classThur = enrolmentInfo[i].CLASSTHUR;
					classFri = enrolmentInfo[i].CLASSFRI;
					classSat = enrolmentInfo[i].CLASSSAT;
					classSun = enrolmentInfo[i].CLASSSUN;
					
					

					if(classMon=='y'){dayArray.push(" 월  ");}
					if(classTue=='y'){dayArray.push(" 화  ");}
					if(classWed=='y'){dayArray.push(" 수  ");}
					if(classThur=='y'){dayArray.push(" 목  ");}
					if(classFri=='y'){dayArray.push(" 금  ");}
					if(classSat=='y'){dayArray.push(" 토  ");}
					if(classSun=='y'){dayArray.push(" 일  ");}
					var tempString =''; 
					for(j in dayArray)(
							tempString += dayArray.pop()
							
					)
							
					
					//getClassDescFile = conrolmentInfo[i].CLASSDESCFILE;
					addTagEnrolTable = "<tr>"
										+"<td><input type=\"checkbox\" name=\"radioTagEnrol\" class=\"flat-red\" value=\""+ getOpenclassId +"\"></td>"
										+"<td>"+ getOpenClassName + "</td>"
										+"<td value=\'"+getMemNum+"\'>"+ getMemName + "</td>"
										+"<td>"+ getOpenStartDate+"~"+ getOpenEndDate +", "+getOpenStartTime+"~"+getOpenEndTime+" , "+ tempString+ "</td>"
										+"<td>"+ getClassdesc + "</td>"
										+"<td value=\'"+getClassPrice+"\'>"+ getClassPrice + "</td>"
										+"<td>"+ getClassCapacity + "</td>"
										+"</tr>"
					$("tbody#openClassList").append(addTagEnrolTable);				
					
					}
					dayArray=[];
				} 


	});
});
					
					
					
					
					
					
					



</script>
</html>