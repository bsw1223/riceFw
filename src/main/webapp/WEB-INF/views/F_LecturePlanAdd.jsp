<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ include file="header.jsp"%>

<style>
.form-group {
	padding: 10px 20px 10px 10px;
}
</style>




<!-- <div class="content-wrapper"> -->
<!--     Content Header (Page header) -->
<!--     <section class="content-header"> -->
<!--       <h1> -->
<!--       </h1> -->
<!--     </section> -->


<div class="content-wrapper" style="min-height: 901px;">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>강의 계획</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li class="active">강의 계획</li>
			</ol>
		</section>
		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-md-10">
					<div class="box box-warning">
						<div class="box-header">
							<h3 class="box-title">강의 계획</h3>
						</div>
							<div class="box-body">
								<div id='timeline_cal'>
									<form class="form-horizontal">
										<div class="box-body">
										     <div class="" id="">
													 <!--<label>강의계획 ID</label> -->
									               <!--   <input type="hidden" class="form-control " placeholder="" id="lecturePlanId"> -->
									            <div class="" style="margin-bottom: 2%;">
									                   <label>과목 분류</label>
									                   <select class="form-control" id="lecCode">
					                    			   <option class="" id="" value="">과목을 선택해 주세요</option>
					                    			   </select>
									                  <input type="hidden" class="form-control " placeholder="" id="hiddenlecCode">
								                </div>
								                <div class=" " style="margin-bottom: 2%;">
									                  <label>강의 명</label>
									                  <input type="text" class="form-control " placeholder="" id="titleLec">
								                </div>
								                <div class="" style="margin-bottom: 2%;">
									                  <label>강의 시작일</label>
									                  <input type="text" class="form-control " placeholder="" id="startDateLec">
								                </div>
								                <div class="" style="margin-bottom: 2%;">
									                  <label>강의 종료일</label>
									                  <input type="text" class="form-control " placeholder="" id="endEndDateLec">
								                </div>
								                <div class="" style="margin-bottom: 2%;">
									                  <label>강의 시작시간</label>
									                  <input type="text" class="form-control " placeholder="" id="startTimeLec">
								                </div>
								                <div class="" style="margin-bottom: 2%;">
									                  <label>강의 종료시간</label>
									                  <input type="text" class="form-control " placeholder="" id="endTimeLec">
								                </div>
								                <div class="" style="margin-bottom: 2%;">
								                	  <label>강의 요일</label>
								                	  <div class="checkbox" style=" margin-left: 2%;">
								                	  <label><input type="checkbox" name ="dayList" id="sun" value="y"> 일   &emsp;</label>
								                	  <label><input type="checkbox" name ="dayList" id="mon" value="y"> 월  &emsp;</label>
								                	  <label><input type="checkbox" name ="dayList" id="tue" value="y"> 화  &emsp;</label>
								                	  <label><input type="checkbox" name ="dayList" id="wed" value="y"> 수  &emsp;</label>
								                	  <label><input type="checkbox" name ="dayList" id="thur" value="y"> 목  &emsp;</label>
								                	  <label><input type="checkbox" name ="dayList" id="fri" value="y"> 금  &emsp;</label>
								                	  <label><input type="checkbox" name ="dayList" id="sat" value="y"> 토  &emsp;</label>
								                	  </div>
								                </div>
								                <div class="" style="margin-bottom: 2%;">
									                  <label>강의 수강정원</label>
									                  <input type="number" class="form-control " placeholder="" id="lecCapacity">
								                </div>
								                <div class="" style="margin-bottom: 2%;">
									                  <label>강의 내용</label>
									                  <div class="form-group">
										                  <textarea class="form-control" rows="3" placeholder="Enter ..." id="descLec" style=""></textarea>
										              </div>
								                </div>
	 							                <!--<div class=""> -->
	 								                  <!--<label>강의계획서_첨부파일</label> -->
	 								                  <!--<input type="text" class="form-control " placeholder="" id="descFileLec"> -->
	 							                <!--</div> -->
												<div class="form-group">
								                 	 <button type="reset" class="btn btn-primary pull-right" style="margin-right: 5px;">
										           	     <i class=""></i> 초기화
										         	 </button>
									                 <button type="button" id="insertSub" class="btn btn-primary pull-right" style="margin-right: 5px;" onclick="">
											             <i ></i> 등록
											         </button>
								                </div>
		   								</div>
									</div>
								</form>	
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
	</div>
 <!-- /.content-wrapper -->

<%@ include file = "footer.jsp" %>

<!-- bootstrap datetimepicker -->
<link rel="stylesheet" href="${contextPath}/resources/api/css/bootstrap-datetimepicker.min.css" />
<script src="${contextPath}/resources/api/js/moment.min.js"></script>
<script src="${contextPath}/resources/api/js/ko.js"></script>
<script src='${contextPath}/resources/api/js/bootstrap-datetimepicker.min.js'></script>

<script>
var memNum = "${loginMem.memNum}";
memNum = JSON.stringify(memNum);

$(document).ready(function(){
	readyLecturePlanAdd();
	dateFunction();
	addLecPlan();
});


//날짜  함수
function dateFunction() {
	$("input#startDateLec").datetimepicker({
		format : 'YYYY-MM-DD',
	});
	$("input#endEndDateLec").datetimepicker({
		format : 'YYYY-MM-DD',
	});
	$("input#startTimeLec").datetimepicker({
		format : 'hh:mm',
	});
	$("input#endTimeLec").datetimepicker({
		format : 'hh:mm',
	});
};



function readyLecturePlanAdd(){
	$.ajax({
		type : "post",
		async: true,
		contentType: 'application/json',
		url: "readyLecturePlanAdd",
		data: {},
		success: function(lecCodeVal){
						for(i in lecCodeVal){
							var codeId = lecCodeVal[i].CODEID;
							var CODENAME = lecCodeVal[i].CODENAME;
							//console.log("codeId : "+codeId);
							//console.log("CODENAME : "+CODENAME);
							var addTag = '<option class="" id="" value="'+codeId+'">'+CODENAME+'</option>';
							$('#lecCode').append(addTag);
						}
				}
	});
}

function addLecPlan(){
	$('#insertSub').on('click',function(){
		var sunD = '';
		var monD = '';
		var tueD = '';
		var wedD = '';
		var thurD = '';
		var friD = '';
		var satD = '';
		
		sunD = $('input[id=sun]:checked').val();
		monD = $('input[id=mon]:checked').val();
		tueD = $('input[id=tue]:checked').val();
		wedD = $('input[id=wed]:checked').val();
		thurD = $('input[id=thur]:checked').val();
		friD = $('input[id=fri]:checked').val();
		satD = $('input[id=sat]:checked').val();
		
		if(!sunD){sunD='n';}
		if(!monD){monD='n';}
		if(!tueD){tueD='n';}
		if(!wedD){wedD='n';}
		if(!thurD){thurD='n';}
		if(!friD){friD='n';}
		if(!satD){satD='n';}
			
		var selectLecCode = $("#lecCode option:selected").val();
		var lecturePlanId=$("select[id=lecCode]").val();
		var titleLec = $('#titleLec').val();
		var startDateLec = $('#startDateLec').val();
		var endEndDateLec = $('#endEndDateLec').val();
		var startTimeLec = $('#startTimeLec').val();
		var endTimeLec = $('#endTimeLec').val();
		var descLec = $('#descLec').val();
		var lecCapacity = $('#lecCapacity').val();
		var submitData ='';
		
// 		var submitData ={
// 				"memNum":memNum,
// 				"planId":lecturePlanId,
// 				"planCode":selectLecCode,
// 				"planName":titleLec,
// 				"planStartDate":startDateLec,
// 				"planEndDate":endEndDateLec,
// 				"planStartTime":startTimeLec,
// 				"planEndTime":endTimeLec,
// 				"planLectureContent":descLec,
// 				"planCapacity":lecCapacity,
// 				"classSun":sunD,    
// 				"classMon":monD,
// 				"classTue":tueD,
// 				"classWed":wedD,
// 				"classThur":thurD,
// 				"classFri":friD,
// 				"classSat":satD
//     }
		
 	submitData ={
				memNum:memNum,
				planCode:selectLecCode,
				planName:titleLec,
				planStartDate:startDateLec,
				planEndDate:endEndDateLec,
				planStartTime:startTimeLec,
				planEndTime:endTimeLec,
				planLectureContent:descLec,
				planCapacity:lecCapacity,
				classSun:sunD,    
				classMon:monD,
				classTue:tueD,
				classWed:wedD,
				classThur:thurD,
				classFri:friD,
				classSat:satD
    } 
	submitData= eval(submitData);
	//submitData= eval(submitData);
	//console.log(submitData);
	submitData= JSON.stringify(submitData);
	//submitData= eval(submitData);
	//console.log(submitData);
	
	
// 			console.log("sunD  : "+sunD);
// 			console.log("monD  : "+monD);
// 			console.log("tueD  : "+tueD);
// 			console.log("wedD  : "+wedD);
// 			console.log("thurD  : "+thurD);
// 			console.log("friD  : "+friD);
// 			console.log("satD  : "+satD);
	
	$.ajax({
		type : "post",
		async: true,
		contentType: 'application/json',
		url: "lecturePlanAdd",
		data: submitData,
		success: function(){
						//console.log("insert complete");
						alert("등록되었습니다.");
						location.reload();
						}
				
	});
//eval & normal x
//eval & JSON.stringify X
//eval % JSON.parse 실행안됨

//normal & JSON.parse 실행안됨
//normal & normal post 에러
//normal & JSON.stringify post에러

//JSON.parse & eval 실행안됨

	});
};


</script>
<style>
input[type=checkbox] {
    transform: scale(1.3);
	}

</style>
	</body>
	</html>