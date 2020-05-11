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



   <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
 		     교육 과목 개설
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">수업관리</a></li>
        <li class="active">교육 과목 개설</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <div class="row">
        
        <div class="col-md-12">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#info" data-toggle="tab">교육과목 등록</a></li>
				<li><a href="#pwd" data-toggle="tab">교육과목 개설</a></li>
            </ul>
            
            <!-- form  -->
            <div class="tab-content">
           	<div class="active tab-pane" id="info">
              	<form class="form-horizontal">
             	
             	 <!-- <div class="form-group">
                  <label>강의번호</label> -->
                  <input type="hidden" class="form-control classNumber" placeholder="" id="subIdInsert">
               <!--  </div> -->
               <div class="">
                  <label>강의 명</label>
                    <input type="text" class="form-control classNumber" placeholder="" id="subNameInsert">
                </div>
                <div class="">
                  <label>생성일자</label>
                  <input type="text" class="form-control classNumber" placeholder="" id="subRegDate">
                </div>
                <div class="">
                    <label>폐지일자</label>
                 </div>   
                <div class="" id="delSub">
                <label>
                  <input type="radio" name="delSub" class="flat-red" id="nonDel" checked>
                	미 폐지
                </label>
                <label>
                  <input type="radio" name="delSub" id="delSub" class="flat-red">
					폐지 
                </label>
                 <input type="text" class="form-control classNumber" placeholder="" id="subAblDate">
               </div>
                <div class="">
                  <label>과목 분류</label>
                  <select class="form-control bulId " id="subCode" >
                  </select>
                  
                  </div>
                <!-- textarea -->
                <div class="">
                  <label>교육과목 내용</label>
                 <textarea class="form-control classRemark" rows="3" placeholder="Enter ..." id="subDesc"></textarea> 
                </div>
                 <div class="form-group">
                </div>
				<div class="">
                 <button type="reset" class="btn btn-primary pull-right" style="margin-right: 5px;">
		            <i class=""></i> 초기화
		          </button>
                 <button type="button" id="insertSubj" class="btn btn-primary pull-right" style="margin-right: 5px;" onclick="">
		            <i ></i> 등록
		          </button>
             	 </div>
             	 <!-- /. -->
                </form>
                <!-- /.form-horizontal -->
              </div>
              <!-- /.tab-pane 교육과목 개설 -->

              <div class="tab-pane" id="pwd">
                <form class="form-horizontal" action="" method="" onsubmit="">
                  <div class="">
                <div class="">
                </div>
                <div class="">
                 <!--  <label>개설교과과정 ID</label> -->
                  <input type="hidden" class="form-control " placeholder="" id="getPlanId">
                </div>
                  <label>교육과목</label>
                    <select class="form-control" id="subName">
                    <option style="color:gray" value="" >-  과목을 선택해 주세요  -</option>
                  </select>
                </div>
                <div class="">
                  <label>강사 및 계획</label>
                  <input type="text" class="form-control " placeholder="" id="teaLec">
                </div>
                <div class="">
                  <label>개설과목 명</label>
                  <input type="text" class="form-control " placeholder="" id="titleLec">
                </div>
                <div class="">
                  <label>수업시작일</label>
                  <input type="text" class="form-control " placeholder="" id="startDateLec">
                </div>
                <div class="">
                  <label>수업종료일</label>
                  <input type="text" class="form-control " placeholder="" id="endEndDateLec">
                </div>
                <div class="">
                  <label>수업시작시간</label>
                  <input type="text" class="form-control " placeholder="" id="startTimeLec">
                </div>
                <div class="">
                  <label>수업종료시간</label>
                  <input type="text" class="form-control " placeholder="" id="endTimeLec">
                </div>
                <div class="">
                  <label>과정개요</label>
                  <input type="text" class="form-control " placeholder="" id="descLec">
                </div>
                <div class="">
                  <label>수강정원</label>
                  <input type="text" class="form-control " placeholder="" id="lecCapacity">
                </div>
                <div class="">
                  <label>강의실</label>
                  <input type="text" class="form-control " placeholder="" id="classIdLec">
                  <input type="hidden" class="form-control " placeholder="" id="hiddenClassIdLec">
                </div>
                <div class="">
                  <label>과정금액</label>
                  <input type="text" class="form-control " placeholder="" id="costLec">
                </div>
                <div class="">
                  <label>강의계획서_첨부파일</label>
                  <input type="text" class="form-control " placeholder="" id="descFileLec">
                </div>
                <div class="form-group">
                </div>
				<div class="form-group">
                 <button type="reset" class="btn btn-primary pull-right" style="margin-right: 5px;">
		            <i class=""></i> 초기화
		          </button>
                 <button type="button" id="insertSub" class="btn btn-primary pull-right" style="margin-right: 5px;" onclick="">
		            <i ></i> 등록
		          </button>
                </div>
                </form>
                form-horizontal
              </div>
              <!-- /.tab-pane 강사로 변경 -->
            </div>
            <!-- /.tab-content -->
          </div>
          <!-- /.nav-tabs-custom -->
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
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">강사 선택</h4>
				</div>
				<div class="modal-body">
						<form class="form-horizontal">
							<div class="box-body">
							
								<div class="form-group  col-sm-12">
				                <label for="" class="col-sm-6" id="selectSub">과목선택</label>
				                  <select class="form-control" id="subId2">
				                    
				                  </select>
				                </div>
				                <div class="form-group  col-sm-12">
				                 <label for="" class="col-sm-12" id="searchTeacher">강사검색</label>
										<input type="text" class="form-control" id="eventTitle" placeholder="이름을 입력해 주세요">
								</div>
								<button type="button" class="btn btn-primary col-sm-12" id="selectTeaName">검색</button>
								</div>
							</form>	
							<!-- /.form-horizontal -->
			<div class="box-header with-border">
            <div class="box-header">
              <h3 class="box-title">강사 목록</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <table class="table table-condensed" id="lecInfoTable">
                <tr>
                  <th style="width: 5px">No</th>
                  <th style="width: 5px">선택</th>
                  <th style="width: 40px">강사번호</th>
                  <th style="width: 40px">강사이름</th>
                </tr>
 
              </table>
            </div>
            <!-- /.box-body -->
      	  </div>
		<!-- /.box-header-->
		<div class="box-header with-border">
			<div class="box-header">
			<h3 class="box-title">강의 계획 목록</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body no-padding">
					<table class="table table-condensed" id="lecInfoTeacher">
						<tr>
							<th style="width: 5px">No</th>
							<th style="width: 5px">선택</th>
							<th style="width: 40px">강의 계획명</th>
							<th style="width: 40px">강의 내용</th>
						</tr>
	
					</table>
				</div>
				<!-- /.box-body -->
		</div>
			</div>
				<!-- /.modal-body -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id="saveSub">선택</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
<!-- /.modal -->




	<div class="modal fade" id="classModalPop">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">강의실 선택</h4>
				</div>
				<div class="modal-body">
				<form class="form-horizontal">
							<div class="box-body">
							
								<div class="form-group  col-sm-12">
				                <label for="" class="col-sm-6" id="bulSelLec">건물 선택</label>
				                  <select class="form-control" id="bulSelLecOption">
				                    <option class="" id="" value="">건물을 선택해 주세요</option>
				                  </select>
				                </div>
				     	  </div>
				       </form>        
					<form class="form-horizontal">
						<div class="box-header with-border">
							<div class="box-header">
								<h3 class="box-title">강의실 목록</h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body no-padding">
								<table class="table table-condensed" id="classNumLec">
									<tr>
										<th style="width: 5px">No</th>
										<th style="width: 5px">선택</th>
										<th style="width: 40px">건물명</th>
										<th style="width: 40px">강의실</th>
										<th style="width: 40px">수용인원</th>
									</tr>
								</table>
							</div>
							<!-- /.box-body -->
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id="selBulCl">선택</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
  </div>
  <!-- /.content-wrapper -->

<%@ include file = "footer.jsp" %>

<!-- bootstrap datetimepicker -->
<link rel="stylesheet" href="${contextPath}/resources/api/css/bootstrap-datetimepicker.min.css" />
<script src="${contextPath}/resources/api/js/moment.min.js"></script>
<script src="${contextPath}/resources/api/js/ko.js"></script>
<script src='${contextPath}/resources/api/js/bootstrap-datetimepicker.min.js'></script>

<script>
var getSubId = null;
var getSubCodeName = new Array;
var getSubCodeOrder = new Array;
var selectMenu = null;
var delTag = "<input type=\"text\" class=\"form-control classNumber\" placeholder=\"\" id=\"subAblDate\">"

$(document).ready(function(){
//subCode 가져오기
	selectSubCode();
//날짜 형식
	dateFunctionL();
//subId가져오기
	selectSubIdL();
//subCode 가져오기
	selectSubCodeL();
//폐지 미폐지 표시	
	delSub();
	radioEvent();
	selectLecPlanId();
//날짜 형식
	dateFunction();
//subId가져오기
	//selectSubId();
	
});



//등록
$(document).on("click","#insertSubj",function(){
		 $.ajax({
				type : "post",
				async: true,
				datatype:"text; charset=utf-8",
				url: "lectureadd",
				data: {
						subId:$("#subIdInsert").val(),
						subName:$("#subNameInsert").val(),
						subRegDate:$("#subRegDate").val(),
						subAblDate:$("#subAblDate").val(),
						subCode:$("#subCode").val(), 
						subDesc:$("#subDesc").val(), 
				      },
				success: function()
							{
								if(confirm("등록되었습니다.")) document.location = "../../../../../lectureMng/lectureregist";
							}
				});
		});


//날짜  함수
	function dateFunctionL() {
		$("input#subRegDate").datetimepicker(
				{
					format : 'YYYY-MM-DD',
				});
		$("input#subAblDate").datetimepicker(
				{
					format : 'YYYY-MM-DD',
				});
	};
	
//seq로 subId받아오기
function selectSubIdL(){
	$.ajax({
			type : "post",
			async: true,
			datatype:"text; charset=utf-8",
			url: "selectSubId",
			data: {},
			success: function(subId)
						{
							getSubId = JSON.stringify(subId.SUBID);
							$('#subIdInsert').val(getSubId);
							$('#subIdInsert').prop('disabled', true)
						}
			});
	};
	
//강의코드 받아오기
function selectSubCodeL(){
	$.ajax({
			type : "post",
			async: true,
			datatype:"text; charset=utf-8",
			url: "selectSubCode",
			data: {},
			success: function(subCode)
						{
							for(i in subCode){
								getSubCodeName = subCode[i].CODENAME;
								getSubCodeId = subCode[i].CODEID;
								selectMenu = "<option VALUE=\""+ getSubCodeId+"\">"+getSubCodeName+"</option>";
								 $('#subCode').append(selectMenu);	
							}
						}
			});
	};
	
//폐지/미폐지
function delSub(){
    if($("input[id='nonDel']").val()== 'on'){
       	$("input[id='subAblDate']").remove();
    	//$("#delSub").append(delTag);                    
		//console.log("unselect");
    };
};

$(document).on("click","input:radio[id='nonDel']",function(){

	 if($("input[id='nonDel']").val()== 'on'){
	       	$("input[id='subAblDate']").remove();
	    	//$("#delSub").append(delTag);                    
			//console.log("unselect");
			dateFunctionL();
	    }
});
	
$(document).on("click","input:radio[id='delSub']",function(){
	 if($("input[id='delSub']").val()== 'on'){
	       	{
	    	$("input[id='subAblDate']").remove();
	    	$("#delSub").append(delTag);  
	    	//console.log("select");
	    	dateFunctionL();
	    }
}
});	

	

var getSubCode = null;
var getSubName = null;
var selectMenu =null;
var getMemNum = null;
var memName = null;
var addTeacherTag = null;
var numI = 0;
var numJ = 0;
var numK = 0;
var numL = 0;
var compare=new Array();
var selectMemNum = null;
var modalSelSub = null;
var getPlanName = null;
var getPlanId = null;
var getPlanLectureContent = null;
var addTeacherSubTag = null;
var getPlId = null;
var planStartDateLec = null;
var planLectureContentLec = null;
var planIdLec = null;
var planEndDateLec = null;
var planStartTimeLec = null;
var planEndTimeLec = null;
var planNameLec = null;
var planDescFileLec = null;
var planCapacityLec = null;
var planCodeLec = null;
var memNumLec = null;
var reGetTeacherA = null;
var classId= null;
var classPliceLec=null;
var subCodeLecFin=null;
var titleLec= null;
var classNumLecTag = null;
var classNumLecSel = null;
var bulNameLec = null;
var classBulIdSel = null;
var selectMenuLecCl = null;
var compareLec = new Array();
var bulCodeLec = null;
var classCapaLec = null;
var classBulIdSelLec = null;
var classNumLecSelLec = null;
var bulNameLecLec = null;
var classCapacityLec = null;
var selBulName = null;
var selClLecNum = null;
var selClLecCapa = null;
var selBulNameB = null;
var selBulNameC = null;
var selBulNameT = null;
var selBulNameV = null;
var teaMemName = null;
var memNameSecond =null;
var memNumSecond = null;
var teaSubCode = null;
var compareLecTea = new Array();
var getSelSubName = null;
var getclassIdLec = null;
//개설 교과과정 등록
//insertSub

	$(document).on("click","#insertSub",function() {
				if ($('#subName').val() == '' || $('#teaLec').val() == ''
						|| $('#titleLec').val() == '' || $('#startDateLec').val() == ''
						|| $('#endEndDateLec').val() == ''
						|| $('#startTimeLec').val() == '' || $('#endTimeLec').val() == ''
						|| $('#descLec').val() == '' || $('#lecCapacity').val() == ''
						|| $('#costLec').val() == '' || $('#classIdLec').val() == '') {

					alert("빈칸을 모두 채워 주세요");
					
				}else{
				classId = $('input#hiddenClassIdLec').val();
				classPliceLec = $('#costLec').val();
				//classDescFile://첨부파일 차후 적용
				
				/* console.log("insertOpenLec : "+
						"classId : "+classId+" "+
						"planStartDateLec : "+planStartDateLec+"  "+
						"planLectureContentLec : "+planLectureContentLec+"  "+
						"planCapacityLec : "+planCapacityLec+"  "+
						"memNumLec : "+memNumLec+"  "+
						"classPliceLec : "+classPliceLec+"  "+
						"planNameLec : "+planNameLec+"  "+
						"subCodeLecFin : "+subCodeLecFin+"  "+
						"planEndDateLec : "+planEndDateLec+"  "+
						"planStartTimeLec : "+planStartTimeLec+"  "+
						"planEndTimeLec : "+planEndTimeLec) */

				$.ajax({
					type : "post",
					async : true,
					datatype : "text; charset=utf-8",
					url : "insertOpenLec",
					data : {
						classId : classId,
						openStartDate : planStartDateLec,
						classDesc : planLectureContentLec,
						classCapacity : planCapacityLec,
						memNum : memNumLec,
						classPrice : classPliceLec,
						openclassName : planNameLec,
						subId : subCodeLecFin,
						openEndDate : planEndDateLec,
						openStartTime : planStartTimeLec,
						openEndTime : planEndTimeLec
					},
					success : function() {
						confirm("등록되었습니다.");
							$("#subName").val('');
							$("#teaLec").val('');
							$("#titleLec").val('');
							$("#startDateLec").val('');
							$("#endEndDateLec").val('');
							$("#startTimeLec").val('');
							$("#endTimeLec").val('');
							$("#lecCapacity").val('');
							$("#descLec").val('');
							$("#costLec").val('');
							$("#classIdLec").val('');
					
							document.location = "#";
					}
				});
				}
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

	//seq로 subId, subName받아오기
	function selectSubCode() {
		getSubCode = $("#subName").val();
		getSubName = $("#subName option:checked").text();

		$.ajax({
			type : "post",
			async : true,
			datatype : "json; charset=utf-8",
			url : "selectsubidname",
			data : {},
			success : function(selectSubIdName) {
				   	for(i in selectSubIdName) 
			     {
					getSubCodeName = selectSubIdName[i].SUBNAME;
					//console.log("getSubCodeName : "+getSubCodeName);
					getSubCode = selectSubIdName[i].SUBCODE;
					selectMenu = "<option id=\"\"VALUE=\""+ getSubCode+"\">"
							+ getSubCodeName + "</option>";
					$('#subName').append(selectMenu);
				}
				teacherClick(selectSubIdName);
				lecturePlanInfo();
				
			}
		});
	};

	//교과코드 정하고 강사 클릭시 교과코드로, 강사정보 받아오기	
	function teacherClick(selectSubIdName) {
		$(document).on("click",	"#teaLec",function() {
							getSubCode = $("#subName").val();
							getSubName = $("#subName option:checked").text();
							if (getSubCode == '') {
								for (i in selectSubIdName) {
									getSubCodeName = selectSubIdName[i].SUBNAME;
									getSubCode = selectSubIdName[i].SUBCODE;
									selectMenu = "<option class=\"selectMenuSub\" value=\""+getSubCode+"\">"
											+ getSubCodeName + "</option>";
									$("#subId2").append(selectMenu);//모달에 메뉴 추가
								}
								//과목선택 후 모달 띄우면 과목 고정							
							} else {
								selectMenu = "<option class=\"selectMenuSub\"  value=\""+getSubCode+"\">"
										+ getSubName + "</option>";
								$("#subId2").append(selectMenu);//모달에 메뉴 추가
							}
							lecturePlanInfo();
							$('#modalPop').modal();
						});
	};

	//강의계획 정보 가져오기, 강사번호, 이름사용
	function lecturePlanInfo() {
		getSubCode = $("#subId2").val();
		$.ajax({
			type : "post",
			async : true,
			datatype : "json; charset=utf-8",
			url : "selectLecturePlanInfo",
			data : {
				subCode : getSubCode
			},
			success : function(selectLecturePlanInfo) {
				//이름과 강의명, 강의계획Id 가져오기
				//console.log("selectLecturePlanInfo :"+selectLecturePlanInfo);
				for(var i=0; i<selectLecturePlanInfo.length;i++) {
					numI++;
					//i번째와 앞에 것들과 비교해서 다르면 받기
					getMemNum = selectLecturePlanInfo[i].MEMNUM;//맴버 넘버 
					//console.log("getMemNum : "+getMemNum);
					if (!compare.includes(getMemNum)) {
						compare.push(getMemNum);
						selectMemName(getMemNum, numI, getMemNum, memName);//이름가져오기
					}
				}
				numI = 0;
			}
		});
	};

	//memNum으로 이름 가져오기		C001ClassBoardVO사용하기, 강사 목록 추가 프로세스			
	function selectMemName(getMemNum, numI, getMemNum, memName) {
		$.ajax({
					type : "post",
					async : true,
					datatype : "text; charset=utf-8",
					url : "selectMemName",
					data : {
						memNum:getMemNum
					},
					error :function(request,status,error) {
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

					},
					success : function(selectMemName) {
						memName = selectMemName;
						addTeacherTag = "<tr id=\"addTeacherTr\">"
								+ "<td>"
								+ numI
								+ "</td>"
								+ "<td><input type=\"radio\" name=\"selectTeacher\" class=\"flat-red\" value=\""+getMemNum+"\"></td>"
								+ "<td>" + getMemNum + "</td>" + "<td>"
								+ memName + "</td>";
						+"<tr>"
						$('table#lecInfoTable').append(addTeacherTag);
					}
				});
	};

	//강사번호 선택 시 마다 과목코드와 강사번호로(선택된 것 -라디오)로 계획 append하기
	//라디오 네임 name="selectTeacher"
	function radioEvent() {
		$(document).on("click", "input:radio[name=selectTeacher]", function() {
			var selectMemNum = $('input[name=selectTeacher]:checked').val();
			//subId2의  벨류받기
			modalSelSub = $("#subId2").val();
			lecturePlanInfoND(selectMemNum, modalSelSub);
		});
	};

	//강의계획 정보 가져오기, 강의 계획명, 강의 설명 사용
	function lecturePlanInfoND(selectMemNum, modalSelSub) {
		$.ajax({
					type : "post",
					async : true,
					datatype : "json; charset=utf-8",
					url : "lecturePlanInfoND",
					//subId2의 셀랙트 벨류도 전송 해야함_과목코드
					data : {
						memNum : selectMemNum,
						subCode : modalSelSub
					},
					success : function(lecturePlanInfoND) {
						//이름과 강의명, 강의계획Id, 강의설명 가져오기
							$('tr#addSubTr').remove();
						for (i in lecturePlanInfoND) {
							numJ++;
							getPlanName = lecturePlanInfoND[i].PLANNAME;
							getPlanId = lecturePlanInfoND[i].PLANID;
							getPlanLectureContent = lecturePlanInfoND[i].PLANLECTURECONTENT;
							addTeacherSubTag = "<tr id=\"addSubTr\">"
									+ "<td>"
									+ numJ
									+ "</td>"
									+ "<td><input type=\"radio\" name=\"selectPlanId\" class=\"flat-red\" value=\""+getPlanId+"\"></td>"
									+ "<td>" + getPlanName + "</td>"
									+ "<td style=\"overflow:hidden\">"
									+ getPlanLectureContent + "</td>";
							+"<tr>"
							$("#lecInfoTeacher").append(addTeacherSubTag);
						}
						numJ = 0;
					}
				});
	};

	//# saveSub버튼 누르면 /lectureMng/openclassadd로 이동하면서 값 뿌려준다.
	//planId로 데이터 뽑아오기

	function selectLecPlanId() {
		$(document).on("click","#saveSub",function() {
							getPlId = $('input[name=selectPlanId]:checked').val();
							getSelSubName = $('#subId2 option:selected').text();
							//console.log('getSelSubName : ' + getSelSubName);
							$.ajax({
										type : "post",
										async : true,
										datatype : "json; charset=utf-8",
										url : "selectLecPlanId",
										data : {
											planId : getPlId
										},
										success : function(selectLecPlanId) {
											planIdLec = selectLecPlanId[0].PLANID; // 개설교과과정 ID
											planStartDateLec = selectLecPlanId[0].PLANSTARTDATE;//수업시작일
											planLectureContentLec = selectLecPlanId[0].PLANLECTURECONTENT;//과정개요
											planEndDateLec = selectLecPlanId[0].PLANENDDATE;//수업종료일
											planStartTimeLec = selectLecPlanId[0].PLANSTARTTIME;//수업시작시간
											planEndTimeLec = selectLecPlanId[0].PLANENDTIME;//수업종료시간
											planNameLec = selectLecPlanId[0].PLANNAME;//교육과목
											planCapacityLec = selectLecPlanId[0].PLANCAPACITY;//수용인원
											planCodeLec = selectLecPlanId[0].PLANCODE;//계획코드-히든
											memNumLec = selectLecPlanId[0].MEMNUM;//강사코드-->>>이값을 저장할때 사용 강사 번호
											//강사명 다시불러옴 
											reGetTeaName(memNumLec);
											subCodeLecFin = $("#subId2").val();
											$("#subName option").filter(function(){return this.text ==getSelSubName}).attr('selected',true);
											$("#titleLec").val(planNameLec);
											$("#getPlanId").val(planIdLec);
											$("#startDateLec").val(planStartDateLec);
											$("#endEndDateLec").val(planEndDateLec);
											$("#startTimeLec").val(planStartTimeLec);
											$("#endTimeLec").val(planEndTimeLec);
											$("#descLec").val(planLectureContentLec);
											$("#lecCapacity").val(planCapacityLec);
											//$("#descFileLec").val(planCapacityLec);
											/*  
											console.log( planIdLec) // 개설교과과정 ID
											console.log( planLectureContentLec) // 개설교과과정 ID
											console.log( planEndDateLec) // 개설교과과정 ID
											console.log( planStartTimeLec) // 개설교과과정 ID
											console.log( planEndTimeLec) // 개설교과과정 ID
											console.log( planNameLec) // 개설교과과정 ID
											console.log( planCapacityLec) // 개설교과과정 ID
											console.log( planCodeLec) // 개설교과과정 ID
											console.log( memNumLec) // 개설교과과정 ID */

											$('#modalPop').modal("hide");
										}
									});
						});
	};

	function reGetTeaName(memNumLec) {
		$.ajax({
			type : "post",
			async : true,
			datatype : "text; charset=utf-8",
			url : "reGetTeaName",
			data : {
				memNum : memNumLec
			},
			success : function(reGetTeaName) {
				//console.log(reGetTeaName);
				reGetTeacherA = reGetTeaName;
				$('input#teaLec').val(reGetTeacherA);//강사명 다시 불러와야함
			}
		});

	};
//강의실 추가, 
$(document).on('click','#classIdLec',function(){
	compareLec=[];
	$.ajax({
		type : "post",
		async : true,
		datatype : "json; charset=utf-8",
		url : "classIdLec",
		data : {},
		success : function(classIdLec) {
			for(i in classIdLec)
				{
					classBulIdSel = classIdLec[i].BULID;
					classNumLecSel = classIdLec[i].CLASSNUMBER;//클래스 넘버
					bulNameLec = classIdLec[i].BULNAME;//빌딩이름
					classCapaLec = classIdLec[i].CLASSCAPACITY;
					//console.log("classNumLecSel  : "+classNumLecSel);
					//console.log("classIdLec  : "+bulNameLec);
					
					if(!compareLec.includes(classBulIdSel))
						{
							compareLec.push(classBulIdSel);
							selectMenuLecCl = "<option class=\"selectMenuSub\" id=\"lecNameBul\" value=\""+classBulIdSel+"\">"
												+ bulNameLec + "</option>";
							$('select#bulSelLecOption').append(selectMenuLecCl);
						}
							$('#classModalPop').modal();
				}
		}
	});
});

//강의실 건물 선택시 작업
 $("select#bulSelLecOption").on( "change", function() {
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
					
				for(i in bulCodeLec){
					numK++;
					getclassIdLec = bulCodeLec[i].CLASSID;
					//console.log("getclassIdLec : " +getclassIdLec);
					classBulIdSelLec = bulCodeLec[i].BULID;
					classNumLecSelLec = bulCodeLec[i].CLASSNUMBER;//클래스 넘버
					bulNameLecLec = bulCodeLec[i].BULNAME;//빌딩이름
					classCapacityLec = bulCodeLec[i].CLASSCAPACITY;
					classNumLecTag = "<tr id=\"addClassLec\">"
										+ "<td id='a"+numK+"'>"
										+ numK
										+ "</td>"
										+ "<td  value=\""+numK+"\"><input id =\"classNumLecTagV\" type=\"radio\" name=\"selectClassLec\" class=\"flat-red\" value=\""+numK+"\"></td>"
										+ "<td id =\"bulNameLecLec\">" + bulNameLecLec + "</td>" + "<td id =\"classNumLecSelLec\">"
										+ classNumLecSelLec + "호</td>"
										+ "<input type=\"hidden\" value=\""+getclassIdLec+"\" id=\"classIdSelLec\"/>" 
										+ "<td id =\"classCapacityLec\">" + classCapacityLec + "명</td>" + 
										+"</tr>";
						$('#classNumLec').append(classNumLecTag);
				}
				numK=0;
					}
	});
 });

//강의실 선택 버튼 클릭 이벤트, 강의실 건물명, 호수 , 수용인원 저장 후 form에 다시 뿌려줌
  $(document).on( "click","#selBulCl", function() {
	//selBulName= //건물명
	// selClLecNum= //강의실 호수
	// selClLecCapa= //강의실 수용인원
	selBulName = $('input[name="selectClassLec"]:checked').val();
	//console.log('selBulName : '+selBulName);
	selBulNameB= $(eval('\'td#a'+selBulName+'\'')).nextAll('td#bulNameLecLec').text();
	selBulNameC= $(eval('\'td#a'+selBulName+'\'')).nextAll('td#classNumLecSelLec').text();
	selBulNameV= $(eval('\'td#a'+selBulName+'\'')).nextAll('input#classIdSelLec').val();
	selBulNameT= $(eval('\'td#a'+selBulName+'\'')).nextAll('td#classCapacityLec').text();
	//console.log("selBulNameB : "+selBulNameB);
	//console.log("selBulNameC : "+selBulNameC);
	//console.log("selBulNameT : "+selBulNameT);
	//console.log("selBulNameV : "+selBulNameV);//이걸 저장
	var bulText = "건물  : "+selBulNameB+" / 강의실  :  " +selBulNameC+" / 수용인원  :  " +selBulNameT;
	
	//수용인원 비교시   selBulNameT에서 명 빼서 사용
	selBulNameTSub = selBulNameT.substr(0, selBulNameT.length -1)*1;//강의실 수용인원
	//console.log("selBulNameTSub : " +selBulNameTSub);
	$('input#hiddenClassIdLec').val(selBulNameV);
	$('input#classIdLec').val(bulText);
	$('#classModalPop').modal("hide");
	var compareCap = $('input#lecCapacity').val()*1;
	//경고내용
/* 	if(compareCap==''){
		$('p#tempMessage').remove();
		var tempMessage ="<p id='tempMessage' style=\"color:red\">수강정원를 입력해 주세요</p>"
		$('input#lecCapacity').after(tempMessage);
	} 
	if(compareCap>selBulNameTSub){
			console.log("수업인원: "+ compareCap+", 강의실인원 : "+selBulNameTSub);
			var tempMessage ="<p id='tempMessageLess' style=\"color:red\">수강정원보다 수용인원이 적습니다.</p>";
			$('p#tempMessageLess').remove();
			$('input#classIdLec').after(tempMessage);
		}else{$('p#tempMessageLess').remove();}*/
	});
	
	

	
	
	//금액 콤마표기
	/* 
	 $(document).ready(function($){
	 $(document).on('focus','#costLec',function(){
	 var val = $('#inputPrice').val();
	 if(!isEmpty(val)){
	 val = val.replace(/,/g,'');
	 $('#costLec').val(val);
	 }
	 });
	
	 $(document).on('blur','#costLec', function(){
	 var val = $('#costLec').val();
	 if(!isEmpty(val) && isNumeric(val)){
	 val = currencyFormatter(val);
	 $('#costLec').val(val);
	 }
	 });
	 });	
	
	 function isEmpty(value){
	 if(value.length ==0 || value== null){
	 return true;
	 }else{
	 return false;
	 }
	
	 }
	 function isNumeric(value){
	 var regExp=/^[0-9]+$/g;
	 return regExp.test(value);
	 }
	 function currencyFormatter(amount){
	 return amount.toString().replace(/\B(?=(\d{3})+(?!\d))/g,',');
	 } */

	 //강사검색 버튼이벤트
	  $(document).on( "click","button#selectTeaName", function() { 
		  teaMemName=$('input#eventTitle').val();
		  teaSubCode= $('#subId2 option:selected').val();
		  //console.log("teaMemName : " +teaMemName);
		  //console.log("teaSubCode : " +teaSubCode);
		  compareLecTea=[];
	      $("tr#addTeacherTr").remove();
	      $("tr#addSubTr").remove();
		  $.ajax({
				type : "post",
				async : true,
				datatype : "json; charset=utf-8",
				url : "selectTeaName",
				data : {
						memName:teaMemName,
						subCode:teaSubCode
						},
				success : function(selectTeaName) {
					for(i in selectTeaName){
						numL++;
						memNameSecond = selectTeaName[i].MEMNAME;
						memNumSecond = selectTeaName[i].MEMNUM;
						if(!compareLecTea.includes(memNumSecond)){
							
						compareLecTea.push(memNumSecond);
						
						addTeacherTag = "<tr id=\"addTeacherTr\">"
								+ "<td>"
								+ numL
								+ "</td>"
								+ "<td><input type=\"radio\" name=\"selectTeacher\" class=\"flat-red\" value=\""+memNumSecond+"\"></td>"
								+ "<td>" + memNumSecond + "</td>" + "<td>"
								+ memNameSecond + "</td>";
						+"<tr>"
						$('table#lecInfoTable').append(addTeacherTag);
						}
					}
					
					numL=0;
				}
		  
				});
	  });
	//모달창 닫힐 때 셀렉트 메뉴 삭제
	$('#modalPop').on('hide.bs.modal', function(e) {
		modalClose();
		e.stopImmediatePropagation();
	});

	function modalClose() {
		$('.selectMenuSub').remove();
		$('tr#addTeacherTr').remove();
		$('tr#addSubTr').remove();
		compare = [];
		$('input#eventTitle').val('');
		compareLecTea=[];
	}
		
	
	
	
	//강의실모달창 닫힐 때 셀렉트 메뉴 삭제
	$('#classModalPop').on('hide.bs.modal', function(e) {
		modalCloseLec();
		e.stopImmediatePropagation();
	});
	
	function modalCloseLec() {
		$('option#lecNameBul').remove();
		$('tr#addClassLec').remove();
		compareLec = [];
		$('input#eventTitle').val('');
		compareLecTea=[];
	}
		
		
	</script>
	</body>
	</html>
