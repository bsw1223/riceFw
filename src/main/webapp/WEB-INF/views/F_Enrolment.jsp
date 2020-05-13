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
			<div class="col-md-10">
				<div class="box box-warning">
					<div class="box-body">
						<div id='timeline_cal'>
						<form class="form-horizontal">
							<div class="box-body">
							
								<div class="form-group  col-sm-12">
				                <label for="" class="col-sm-12" id="selectSubJsp">수업 종류</label>
				                  <select class="form-control" id="subIdJsp">
				                     <option class="" id="" value="">수업종류를 선택해 주세요</option>
				                  </select>
				                </div>
				                <div class="form-group  col-sm-12">
				                 <label for="" class="col-sm-12" id="searchTeacherJsp">강사선택</label>
										 <select class="form-control" id="teacherIdJsp">
				                     <option class="" id="teaINJsp" value="">강사를 선택해 주세요</option>
				                  </select>
								</div>
								<div class="form-group  col-sm-12">
				                 <label for="" class="col-sm-12" id="searchKeywordJsp">키워드검색</label>
										<input type="text" class="form-control" id="searchKeyword" placeholder="">
								</div>
								<button type="button" class="btn btn-primary col-sm-12" id="searchOpenClT">검색</button>
								</div>
							</form>	
						
						</div>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->

				<div class="box box-warning">
					<div class="box-header">
						<h3 class="box-title">강의 목록</h3>
						
						<div class="box-tools pull-right">
		              	</div>
					</div>
					<!-- /.box-header -->
					<div class="box-body table-responsive no-padding"  style="overflow: auto; height:550px">
						<table class="table table-hover">
							<tbody id="openClassList" >
								<tr class="sticky-header">
									<th>선택</th>
									<th>과정명</th>
									<th>강사명</th>
									<th>일 시</th>
									<th>강의 설명</th>
									<th>수강료</th>
									<th>정원</th>
								</tr>
							</tbody>
						</table>
						
					</div>
					<!-- /.box-body -->
					<div class="box-body ">
							<button id="cartButton" class="btn btn-primary pull-right"
								style="margin-right: 5px;">
								<i class=""></i> 장바구니
							</button>
							<button  id="insertSub"	class="btn btn-primary pull-right" style="margin-right: 5px;"
								onclick="">수강신청</button>
								<i></i> 
							
					</div>
				</div>
				<!-- /.box -->
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
	</section>
	<!-- /.content -->

<!-- 	수강신청 modal -->
	<div class="modal fade" id="enrolmentModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">수강 신청 내역</h4>
					
				</div>
<!-- 				/.modal-header -->
				<form class="form-horizontal" id = 'formAdd'  method="post" action="/kakaoPay" name="submitKakao">
						<input type="hidden" name="total_amount" id ="total_amount" >
						<input type="hidden" name="item_name" id="item_name">
						<input type="hidden" name="partner_order_id" id="partner_order_id">
						<input type="hidden" name="partner_user_id" id="partner_user_id"><!-- memnum -->
						<input type="hidden" name="classIdKakao" id="classIdKakao"><!-- 주문전체목록id -->
						<input type="hidden" name="memNum" id="memNum">
						<input type="hidden" name="classPriceS" id="classPriceS">
						<input type="hidden" name="openclassNameS" id="openclassNameS">
						<input type="hidden" name="wholeEnrol" id="wholeEnrol">
<!-- 				
<!-- 					/.modal-body -->
					<div class="modal-footer modalBtnContainer-addEvent">
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary" id="payClassNext">결제</button>
					</div>
				</form>
<!-- 				/.modal-footer -->
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	
	
	
	<!-- 	강의목록 클릭  modal -->
	<div class="modal fade" id="lecClickModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">강의정보</h4>
					
				</div>
<!-- 				/.modal-header -->
			 <div class="col-md-12">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">Bordered Table</h3>
            </div>
<!--             /.box-header -->
            <div class="box-body">
              <table class="table table-bordered" id ="clInfoTable">
              
                <tr>
                  <th>일수/시간</th>
                  <td>Task</td>
                  <th>장소</th>
                  <td>Label</td>
                </tr>
                <tr>
                  <th>강의실</th>
                  <td>Update software</td>
                  <th>강사</th>
                  <td>55%</td>
                </tr>
                <tr>
                  <th>인원</th>
                  <td>Clean database</td>
                  <th>가격</th>
                  <td>70%</td>
                </tr>
               
              </table>
            </div>
<!--             /.box-body -->
          
          </div>
<!--           /.box -->

			          <div class="box">
			            <div class="box-header">
			              <h3 class="box-title">교육 과정  & 일정</h3>
			            </div>
			<!--             /.box-header -->
			            <div class="box-body no-padding">
				          <div class="box-body">
				            <!-- /.box-header -->
				              
				                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
				              
				            <!-- /.box-body -->
				          </div>
					          <!-- /.box -->
			            </div>
			<!--             /.box-body -->
			          </div>
			<!--           /.box -->
			        </div>
			<!--         /.col -->
					<div class="modal-footer modalBtnContainer-addEvent">
						<button id="cartButtonModal" class="btn btn-primary pull-right"
							style="margin-right: 5px;">
							<i class=""></i> 장바구니
						</button>
						<button  id="insertSubModal"	class="btn btn-primary pull-right" style="margin-right: 5px;" onclick="">수강신청</button>
							<i></i> 
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



//결제정보 전송
var classNameKakao = new Array();
var classPriceKakao = new Array();
var classIdKakao = new Array();
var classTeaNameKakao = new Array();
var classTeaIdKakao = new Array();
var classDateKakao = new Array();
var wholeEnrol = null;
var wholeEnrolMap = null;
var wholeEnrolT= new Array();

var payClassTag =null;
var totalCharge =0;
var payTotal ='';
var memnum = "${loginMem.memNum}";
//console.log("memnum : "+memnum);



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
					startList(enrolmentInfo);
				} 
	});
});

function startList(enrolmentInfo){
	console.log(enrolmentInfo);
	for(i in enrolmentInfo){
	
		getMemName = enrolmentInfo[i].MEMNAME;
		getOpenClassName = enrolmentInfo[i].OPENCLASSNAME;
		getClassCapacity = enrolmentInfo[i].CLASSCAPACITY;
		getClassdesc = enrolmentInfo[i].CLASSDESC;
		getSubid = enrolmentInfo[i].SUBID;
		getMemNum = enrolmentInfo[i].MEMNUM;
		getOpenclassId = enrolmentInfo[i].OPENCLASSID;
		
		getOpenStartTime = enrolmentInfo[i].OPENSTARTTIME;
		getOpenEndTime = enrolmentInfo[i].OPENENDTIME;
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

		if(classSun=='y'){dayArray.push(" 일  ");}
		if(classMon=='y'){dayArray.push(" 월  ");}
		if(classTue=='y'){dayArray.push(" 화  ");}
		if(classWed=='y'){dayArray.push(" 수  ");}
		if(classThur=='y'){dayArray.push(" 목  ");}
		if(classFri=='y'){dayArray.push(" 금  ");}
		if(classSat=='y'){dayArray.push(" 토  ");}
		var tempString =''; 
		//console.log("dayArray : "+dayArray);
	for(j in dayArray)(
						tempString += dayArray[j]
						)
	//selectCountCapa(getOpenclassId);//강의실 수 세기
	//getClassDescFile = conrolmentInfo[i].CLASSDESCFILE;
	addTagEnrolTable = "<tr id=\'a"+getOpenclassId+"\' style=\"cursor:pointer;\">"
						+"<td><input onclick=\"event.cancelBubble=true\" type=\"checkbox\" name=\"radioTagEnrol\" class=\"flat-red\" value=\""+ getOpenclassId +"\"></td>"
						+"<td>"+ getOpenClassName + "</td>"
						+"<input type=\"hidden\" value=\""+getOpenclassId+"\" class=\"hiddenId\">"
						+"<td value=\'"+getMemNum+"\' calss=\"classMemName\">"+ getMemName + "</td>"
						+"<td>"+ getOpenStartDate+"~"+ getOpenEndDate +", "+getOpenStartTime+"~"+getOpenEndTime+" , "+ tempString+ "</td>"
						+"<td>"+ getClassdesc + "</td>"
						+"<td value=\'"+getClassPrice+"\ class=\"classPrice\"'>"+ getClassPrice + "</td>"
						+"<td>"+ getClassCapacity + "</td>"
						+"</tr>"
	
	$("tbody#openClassList").append(addTagEnrolTable);		
	//console.log("tempString : "+tempString);		
	delSubReg();
	dayArray = [];
	tempString = '';
	}
	dayArray=[];
	
	getMemName = null;
	getOpenClassName = null;
	getClassCapacity = null;
	getClassdesc  = null;
	getSubid =  null;
	getMemNum =  null;
	getOpenclassId = null;
	
	getOpenStartTime = null;
	getOpenEndTime = null;
	getOpenStartDate = null;
	getOpenEndDate = null;
	
	getClassPrice = null;
	getClassId = null;
	
};


//강의인원 추가

// function selectCountCapa(getOpenclassId){
// 	getOpenclassId=eval(getOpenclassId);
// 	console.log("getOpenclassId:"+getOpenclassId);
// 	var getOpenclassIdJ = {
// 			openclassId:getOpenclassId
// 	};
// 	//getOpenclassIdJ=eval(getOpenclassIdJ);
// 	console.log(getOpenclassIdJ);
// 	$.ajax({
// 		type : "post",
// 		async : true,
// 		contentType: 'application/json',
// 		url : "selectCountCapa",
// 		data : JSON.stringify(getOpenclassIdJ),
// 		success : function(selectCountCapa) 
// 				{
// 					console.log("selectCountCapa : "+selectCountCapa);
// 				} 
// 	});
// }

//체크된 값 추출
$(document).on('click','#insertSub',function(){
	holdDel();
	payClassTag =null;
	// 체크 되어 있는 값 추출
	for (var i = 1; i < $('table tr').length; i++) {
	// table 중 tr이 i번째 있는 자식중에 체크박스가 체크중이면
	//#openClassList > tr:nth-child(18) > td:nth-child(1) > input
	var chk = $('table tr').eq(i).children().find('input[type="checkbox"]').is(':checked');
	//console.log(chk);
	
	if (chk == true) {
	// 그 i 번째 input text의 값을 가져온다.
	//강의 id
	classIdKakao.push($('table tr').eq(i).find('input[type="checkbox"]').val());
	//강의이름
	classNameKakao.push($('table tr').eq(i).find('td:eq(1)').text());
	//강의가격
	classPriceKakao.push($('table tr').eq(i).find('td:eq(5)').text());
	//강사이름
	classTeaNameKakao.push($('table tr').eq(i).find('td:eq(2)').text());
	//classTeaIdKakao.push($('table tr').eq(i).find('td:eq(2)').text());
	//강의 날짜
	classDateKakao.push($('table tr').eq(i).find('td:eq(3)').text());
	
	var cIdM =$('table tr').eq(i).find('input[type="checkbox"]').val();
	var cNameM =$('table tr').eq(i).find('td:eq(1)').text();
	var cPriceM =$('table tr').eq(i).find('td:eq(5)').text();
	
// 	wholeEnrolMap.set("cId",$('table tr').eq(i).find('input[type="checkbox"]').val());
// 	wholeEnrolMap.set("cName",$('table tr').eq(i).find('td:eq(1)').text());
// 	wholeEnrolMap.set("cPrice",$('table tr').eq(i).find('td:eq(5)').text());
	
	wholeEnrolMap= {
					cId:cIdM,
					cName:cNameM,
					cPrice: cPriceM
				}
	console.log(wholeEnrolMap);
	
	wholeEnrolT.push(wholeEnrolMap);
	
	
	wholeEnrol=JSON.stringify(wholeEnrolT);
	console.log(wholeEnrol);
	}
	
	
		//console.log("classIdKakao : "+ classIdKakao);//과목id
		//console.log("classNameKakao : "+ classNameKakao);//과목 이름
		//console.log("classPriceKakao : "+ classPriceKakao);//과목 가격
		//console.log("classTeaNameKakao : "+ classTeaNameKakao);//과목 이름
		//console.log("classTeaIdKakao : "+ classTeaIdKakao);//선생id
		//console.log("classDateKakao : "+ classDateKakao);//과목 요일
	}
	
 $('form#formAdd').prepend("<div class=\"col-xs-12\" id=\"addPayClass\" style=\"margin-left: 10%\"></div>");
		payClassTag =null;
	for(var i=0; i<classIdKakao.length; i++ ){
		totalCharge +=Number(classPriceKakao[i]);		
		payClassTag      =     "<br><h5 id=\"titleSub\">[수강신청과목 "+ (i+1) + "]</h5>"
						 +"<div class=\"table-responsive\">"
						 +"<table class=\"payClassList\">"
						 +"       <tr>"
						 +"         <th style=\"\">과 정 명 :</th>"
						 +"         <td style=\"float:left;width:100%;padding-left: 15px;\">"+classNameKakao[i]+"</td>"
						 +"         <input type=\"hidden\" value=\""+classIdKakao[i]+"\">"
						 +"      </tr>"
						 +"       <tr>"
						 +"         <th>선 생 님 :</th>"
						 +"         <td style=\"float:left;width:100%;padding-left: 15px;\">"+classTeaNameKakao[i]+"</td>"
						 +"       </tr>"
						 +"       <tr>"
						 +"        <th>일   시 :</th>"
						 +"        <td style=\"float:left;width:100%;padding-left: 15px;\">"+classDateKakao[i]+"</td>"
						 +"       </tr>"
						 +"       <tr>"
						 +"         <th>수 강 료 :</th>"
						 +"        <td style=\"float:left;width:100%;padding-left: 15px;\">"+classPriceKakao[i]+"원</td>"
						 +"         <input type=\"hidden\" value=\""+classPriceKakao[i]+"\">"
						 +"       </tr>"
						 +"     </table>"
						 +"   </div>"
		$('div#addPayClass').append(payClassTag);
	}
	
	payTotal = "<p>-----------------------------------------------------------------------------------------------<p>"
				  +"<p>총 금액 : "+totalCharge+"원<p>"
				  +"<input type=\"hidden\" class = \"totalChargeSub\"value=\""+totalCharge+"\">";
				  
		//console.log("classIdKakao : "+classIdKakao[i]+",classPriceKakao : "+classPriceKakao[i]);				
		$('div#addPayClass').append(payTotal);
		
	if(payClassTag==null||payClassTag==''){
			alert("선택한 강의가 없습니다.");
			location.reload();
	}else{
			$('#enrolmentModal').modal();
			}
});				
		


$(document).on('click','#payClassNext',function(){
//classIdKakao:과목코드전체
//classIdKakao.lelngth-1 :주결제과목 외 과목 수
//totalCharge: 총금액
var classNameSub = classNameKakao[0]; 
var lengthLength = Number(classIdKakao.length)-1;
if(isNaN(lengthLength))
		{
			lengthLength=0;
		}
var calssNameSubKa= classNameSub;
if(lengthLength!=0){
					calssNameSubKa +=" 외"+lengthLength+"건";
					}
/* params.add("item_name", "갤럭시S9");
params.add("quantity", "1");
params.add("total_amount", "2100"); */
console.log("calssNameSubKa : "+calssNameSubKa);	
console.log("classIdKakao : "+classIdKakao);	
console.log("classIdKakao.length-1 : "+lengthLength);	
console.log("totalCharge : "+totalCharge);	
console.log("classPriceKakao : "+classPriceKakao);	
console.log("classNameKakao : "+classNameKakao);	
	
$('input#item_name').val(calssNameSubKa);
$('input#total_amount').val(totalCharge);

partnerOrderId();

	});


//주문id받아옴
function partnerOrderId(){
	$(document).ready(function(){
		$.ajax({
			type : "post",
			async : true,
			datatype : "json; charset=utf-8",
			url : "partnerOrderId",
			data : {},
			success : function(partnerOrderId) 
					{
				 		var partnerOrderId = partnerOrderId.ENRID
						//console.log("받아온 id : "+partnerOrderId);
						$('input#partner_order_id').val(partnerOrderId);
						//console.log("저장된 id : "+$('#partner_order_id').val());
						$('input#partner_user_id').val(memnum);//memid넘김
						$('input#classIdKakao').val(classIdKakao);//classid 전체
						$('input#memNum').val(memnum);//classid 전체
						$('input#classPriceS').val(classPriceKakao);//class가격 전체
						$('input#openclassNameS').val(classNameKakao);//class이름 전체
						//var val= JSON.stringify(wholeEnrol);
						$('input#wholeEnrol').val(wholeEnrol);//class이름 전체
						
						
					/* 	wholeEnrolMap.put("cId",classIdKakao);
						wholeEnrolMap.put("cName",classNameKakao);
						wholeEnrolMap.put("cPrice",classPriceKakao);
						wholeEnrol.add(wholeEnrolMap); */
						
						submitKakao.submit();//submit실행
					}
	    });
	});
};




//------------------검색-----------------------------
//검색 과목명 & id
$(document).ready(function(){
	$.ajax({
		type : "post",
		async : true,
		datatype : "json; charset=utf-8",
		url : "searchClassIdName",
		data : {},
		success : function(searchClassIdName) 
				{
					for(i in searchClassIdName){
					//console.log("searchClassIdName : "+ searchClassIdName);
					var searchClassName = searchClassIdName[i].CODENAME;//강의명
					var searchClassId = searchClassIdName[i].CODEID;//강의 아이디
					//console.log("searchClassName : "+searchClassName);
					//console.log("searchClassId : "+searchClassId);
					var searchClassIdNameS = "<option class=\"\" id=\"searchClassIN\" value=\""+searchClassId+"\">"
					+ searchClassName + "</option>";
					$('select#subIdJsp').append(searchClassIdNameS);
					}
				}
    });
});


$(document).ready(function(){
	//보류삭제
	holdDel();
	//검색 강사선택(기본값)
	teaBasic();
	teacherClick();
});

	
function teaBasic(){
	//체크된 값이 없을 때 아래 전체 실행됨
	var getSubIdJsp = $("#subIdJsp option:checked").val();//subid
	if(!getSubIdJsp){
	//console.log("체크된 값 없음");
	$('#teacherIdJsp > option').remove();
	var tempMassage = "<option class=\"\" id=\"teaINJsp\" value=\"\">강사를 선택해 주세요</option>";
	$('#teacherIdJsp').append(tempMassage);
	//console.log("getSubIdJsp : "+getSubIdJsp);
	$.ajax({
		type : "post",
		async : true,
		datatype : "json; charset=utf-8",
		url : "searchClassTea",
		data : {},
		success : function(searchClassTea) 
				{
					var teaIdSearch =new Array;
					var teaNameSearch =new Array;
					var searchCMemNum = null;
					var searchCMemName  = null;
					var getSubIdJsp = $("#subIdJsp option:checked").text();
					//console.log(getSubIdJsp);
						for(i in searchClassTea){
						//console.log("searchClassTea : "+ searchClassTea[i].MEMNUM)
						searchCMemNum = searchClassTea[i].MEMNUM;
						searchCMemName = searchClassTea[i].MEMNAME;
						//console.log("searchCMemNum : "+ searchCMemNum);
						//console.log("searchCMemName : "+ searchCMemName);
							if(!teaIdSearch.includes(searchCMemNum)){
								teaIdSearch.push(searchCMemNum);
								teaNameSearch.push(searchCMemName);
							}
						}//for문 종료
					for(i in teaIdSearch){
						var searchTeaIdNameS = "<option class=\"\" id=\"\" value=\""+teaIdSearch[i]+"\">"
						+ teaNameSearch[i] + "</option>";
						$('#teacherIdJsp').append(searchTeaIdNameS); 
					}
					}//success종료
    });
	};
};


//강사선택 클릭 이벤트
function teacherClick(){
	var getSubIdJsp = $("#subIdJsp option:checked").val();//subid
	//체크된 값이 있을 때 아래 전체 실행됨
	if(getSubIdJsp){
	//console.log("체크된 값 있음");
	$('#teacherIdJsp > option').remove();
	var tempMassage = "<option class=\"\" id=\"teaINJsp\" value=\"\">강사를 선택해 주세요</option>";
	$('#teacherIdJsp').append(tempMassage);
	//console.log(getSubIdJsp);
	$.ajax({
		type : "post",
		async : true,
		datatype : "json; charset=utf-8",
		url : "getSubIdJspC",
		data : {
			subId:getSubIdJsp
		},
		success : function(getSubIdJspC) {
			console.log(getSubIdJspC);
			var teaIdSearch =new Array;
			var teaNameSearch =new Array;
			var searchCMemNum = null;
			var searchCMemName  = null;
			var getSubIdJsp = $("#subIdJsp option:checked").text();
			//console.log(getSubIdJsp);
				for(i in getSubIdJspC){
				//console.log("searchClassTea : "+ searchClassTea[i].MEMNUM)
				searchCMemNum = getSubIdJspC[i].MEMNUM;
				searchCMemName = getSubIdJspC[i].MEMNAME;
				//console.log("searchCMemNum : "+ searchCMemNum);
				//console.log("searchCMemName : "+ searchCMemName);
					if(!teaIdSearch.includes(searchCMemNum)){
						teaIdSearch.push(searchCMemNum);
						teaNameSearch.push(searchCMemName);
					}
				}//for문 종료
				
				$('#teacherIdJsp > option').remove();
				var tempMassage = "<option class=\"\" id=\"teaINJsp\" value=\"\">강사를 선택해 주세요</option>";
				$('#teacherIdJsp').append(tempMassage);
			for(i in teaIdSearch){
				var searchTeaIdNameS = "<option class=\"\" id=\"\" value=\""+teaIdSearch[i]+"\">"
				+ teaNameSearch[i] + "</option>";
				$('#teacherIdJsp').append(searchTeaIdNameS); 
			}
	}
	});
	}

};

//수업종류 클릭 이벤트
$(document).on("mouseout","#subIdJsp",function(){
	//console.log("mouseout");
	var getSubIdJsp = $("#subIdJsp option:checked").val();//subid
	if(!getSubIdJsp){
		teaBasic();
	}else{
		teacherClick();
	}
	
});


//수강중인과목 표기하지 않기
function delSubReg(){
	$.ajax({
		type : "post",
		async : true,
		datatype : "json; charset=utf-8",
		url : "delRegL",
		data : {memNum:memnum},
		success : function(delRegL) 
				{
					for(i in delRegL){
					//console.log("delReg : "+delRegL[i].OPENCLASSID);
					var temp = '\'tr#a' +delRegL[i].OPENCLASSID+'\'';
					//console.log("temp : "+temp);
					$(eval(temp)).remove();
					}
				}
    });
};

function holdDel(){
	$.ajax({
		type : "post",
		async : true,
		datatype : "json; charset=utf-8",
		url : "holdDel",
		data : {memNum:memnum},
		success : function() 
				{
					
					}
				
    });
};

var subCartOrderId = null;
var classIdCart = new Array();
var classNameCart = new Array();
var classPriceCart = new Array();
var classTeaNameCart = new Array();
var classDateCart = new Array();
var wholeCartMap= null;
var wholeCartT= new Array();
var wholeCartA = null;
var holeCartMap = null;
//장바구니 버튼 
$(document).on("click","#cartButton",function(){
	subCartOrderId = null;
	classIdCart = [];
	classNameCart = [];
	classPriceCart = [];
	classTeaNameCart = [];
	classDateCart = [];
	wholeCartMap= null;
	wholeCartT= [];
	wholeCartA = null;
	holeCartMap = null;
	var tempLength = 0;
	var nullCheck = 0;
	// 체크 되어 있는 값 추출
	
	for (var i = 1; i < $('table tr').length; i++) {
	// table 중 tr이 i번째 있는 자식중에 체크박스가 체크중이면
	//#openClassList > tr:nth-child(18) > td:nth-child(1) > input
	var chk = $('table tr').eq(i).children().find('input[type="checkbox"]').is(':checked');
	//console.log(chk);
	
	
	if (chk == true) {
	nullCheck++
	// 그 i 번째 input text의 값을 가져온다.
	//강의 id
	classIdCart.push($('table tr').eq(i).find('input[type="checkbox"]').val());
	//강의이름
	classNameCart.push($('table tr').eq(i).find('td:eq(1)').text());
	//강의가격
	classPriceCart.push($('table tr').eq(i).find('td:eq(5)').text());
	//강사이름
	classTeaNameCart.push($('table tr').eq(i).find('td:eq(2)').text());
	//강의 날짜
	classDateCart.push($('table tr').eq(i).find('td:eq(3)').text());
	
	var cIdM =$('table tr').eq(i).find('input[type="checkbox"]').val();
	var cNameM =$('table tr').eq(i).find('td:eq(1)').text();
	var cPriceM =$('table tr').eq(i).find('td:eq(5)').text();
	
	
	orderIdGet(subCartOrderId,cIdM,cNameM,cPriceM,memnum,wholeCartT,tempLength);//오더넘버 받아오기
	//console.log("subCartOrderId(1) :"+subCartOrderId);
		
	}//if문 끝
	
	}//for문 끝


	
	if(nullCheck==0){
		alert("선택된 강의가 없습니다.");
		location.reload();
	}else{
		alert("장바구니에 추가되었습니다.");
		location.reload();
		tempLength=0;
	}
	
});


//주문번호 받기
function orderIdGet(subCartOrderId,cIdM,cNameM,cPriceM,memnum,wholeCartT,tempLength){
$.ajax({
	type : "post",
	async : true,
	contentType: 'application/json',
	url : "partnerOrderId",
	data : {},
	success : function(partnerOrderId) 
			{
				//console.log("orderid : "+partnerOrderId.ENRID);
				subCartOrderId = partnerOrderId.ENRID;	
				wholeCartMap= {
						cId:cIdM,
						cName:cNameM,
						cPrice: cPriceM,
						memNum:memnum,
						cartOrderId:subCartOrderId
					}
				wholeCartT.push(wholeCartMap);
				var wholeCartMapA=JSON.stringify(wholeCartMap);
				wholeCartA=JSON.stringify(wholeCartT);
				//console.log(wholeCartA);
				//컨트롤러로 전송
					insertCart(wholeCartMapA,tempLength);
				}
});
};

//데이터 넣기
function insertCart(wholeCartT,tempLength){
	console.log(wholeCartT);
	$.ajax({
		type : "post",
		async : true,
		contentType: 'application/json',
		url : "insertCart",
		data : wholeCartT,
		traditional : true,
		success : function() 
				{
					console.log("성공");
					}
    });
};



//모달 달힐 때 초기화					
$('#enrolmentModal').on('hide.bs.modal', function(e) {
	modalCloseLec();
	e.stopImmediatePropagation();
});

function modalCloseLec() {
	classIdKakao=[];
	classNameKakao = [];
	classTeaNameKakao = [];
	classDateKakao = [];
	classPriceKakao = [];
	classTeaIdKakao = [];
	wholeEnrolMap='';
	wholeEnrol='';
	totalCharge=0;
	payClassTag ='';
	wholeEnrolT=[];
	payTotal =0;
// 	$('div#allAdd').remove();
// 	$('div#table-responsive').remove();
 	$('h5#titleSub').remove();
	$('#addPayClass').remove();
	$('#partner_order_id').val();
	$('input#classPriceS').val();
	$('input#openclassNameS').val();
	$('input#wholeEnrol').val();
}					
var cIdHidden = null;
//강의목록 클릭 이벤트
//:gt(0) 0보다큰 인덱스
$(document).on('click',"#openClassList > tr:gt(0)", function(){     
	//$("#openClassList > tr:gt(0) > td:eq(0)").off();
    var str = ""
    var trArr = new Array();    // 배열 선언
    var tr = $(this);
    var td = tr.children();
  
    // 현재 클릭된 Row(<tr>)
    td.each(function(i){
    	trArr.push(td.eq(i).text());
    });
    //var classId = td.eq(0).$('input[name=radioTagEnrol]').attr("value");
    //$("input[name=jmnote]").attr("value")

    console.log("trArr : " + trArr);
	//강의id
    cIdHidden = tr.find('.hiddenId').val();
	console.log(typeof(cIdHidden));
	var cIdHiddenE = eval(cIdHidden);
	var openclassIdGet = {
		openclassId:cIdHiddenE
	}
    console.log("cIdHidden : "+ cIdHidden);
    //강의명
    var titleCl = trArr[1];
    //강사명
    var nameTea = trArr[3];
    //일 시
    var timeCl = trArr[4];
    //설 명 
    var descCl = trArr[5];
    //가 격 
    var priceCl = trArr[6];
    //인원수
    var capaCl = trArr[7];
//     console.log("titleCl : "+titleCl);
//     console.log("nameTea : "+nameTea);
//     console.log("timeCl : "+timeCl);
//     console.log("descCl : "+descCl);
    //강의실정보 받아와야함
   $('#clInfoTable > tbody > tr:nth-child(1) > td:nth-child(2)').text(timeCl);
   $('#clInfoTable > tbody > tr:nth-child(2) > td:nth-child(4)').text(nameTea);
   $('#lecClickModal > div > div > div.col-md-12 > div:nth-child(2) > div.box-body.no-padding > div > p').text(descCl);
   $('#clInfoTable > tbody > tr:nth-child(3) > td:nth-child(4)').text(priceCl);
   $('#clInfoTable > tbody > tr:nth-child(3) > td:nth-child(2)').text(capaCl);
   $('#lecClickModal > div > div > div.col-md-12 > div:nth-child(1) > div.box-header.with-border > h3').text(titleCl);
//강의실 정보받아오기
   $.ajax({
		type : "post",
		async : true,
		contentType: 'application/json',
		url : "selectBulCl",
		data : JSON.stringify(openclassIdGet),
		traditional : true,
		success : function(selectBulCl) 
				{
					console.log(selectBulCl);
					var clBulName = selectBulCl.BULNAME;
					var clNum = selectBulCl.CLASSNUMBER;
					console.log("clBulName : "+clBulName);
					console.log("clNum : "+clNum);
					 $('#clInfoTable > tbody > tr:nth-child(1) > td:nth-child(4)').text(clBulName);
					 $('#clInfoTable > tbody > tr:nth-child(2) > td:nth-child(2)').text(clNum+" 호");
  				     $('#lecClickModal').modal();
				}
  	 });
});

//결제 클릭하면 모든 클릭 제거 후 openclassId에 해당하는 체크박스만 체크하여 결제 실행
$(document).on('click','#insertSubModal',function(){
	 $("input[name=radioTagEnrol]").prop("checked", false);
	 var checkCheckbox = "a"+cIdHidden;
	 $(eval('\"tr#'+checkCheckbox+' > td > input\"')).prop("checked", true);//결제할 체크박스에 체크
	 $('#lecClickModal').modal("hide");
	 $('#insertSub').trigger("click");
});

//결제 클릭하면 모든 클릭 제거 후 openclassId에 해당하는 체크박스만 체크하여 장바구니 실행
$(document).on('click','#cartButtonModal',function(){
	 $("input[name=radioTagEnrol]").prop("checked", false);
	 var checkCheckbox = "a"+cIdHidden;
	 $(eval('\"tr#'+checkCheckbox+' > td > input\"')).prop("checked", true);//결제할 체크박스에 체크
	 $('#lecClickModal').modal("hide");
	 $('#cartButton').trigger("click");
});

//셀렉트 박스 
	
	
	$(document).on('click','#searchOpenClT',function(){
		//$("#셀렉트박스ID option:selected").val();
		//subcode,memnum, searchKey 전송 
// 		var subCode = JSON.stringify($("#subIdJsp option:selected").val());
		
// 		var number = subCode;
// 		var length = 2;

// 		number=number+"";//number를 문자열로 변환하는 작업
// 		var str="";
// 		for(var i=0;i<length-number.length;i++){
// 		  str=str+"0";
// 		}
// 		str=str+number;
// 		console.log(str);
		
// 		if(!subCode){subCode=' ';}
// 		console.log("subcode : "+subCode);
		
// 		var memNum = JSON.stringify(eval($("#teacherIdJsp option:selected").val()));
// 		if(!memNum){memNum=' ';}
// 		console.log("memNum : "+memNum);
		
// 		var searchKey = eval(JSON.stringify($("#searchKeyword").val()));
// 		console.log("searchKey : "+searchKey);
// 		var submitData = {
// 				subCode:str,
// 				memNum:memNum,
// 				searchKey:searchKey
// 		}
		var submitData = {
				subCode: $("#subIdJsp option:selected").val(),
				memNum: $("#teacherIdJsp option:selected").val(),
				searchKey: $("#searchKeyword").val()
		}
		var submitData =JSON.stringify(submitData);
		
		$.ajax({
				type : "post",
				async : true,
				contentType: 'application/json',
				url : "searchOpenClT",
				data : submitData,
				traditional : true,
				success : function(enrolmentInfo) 
						{
							$('#openClassList > tr:gt(0)').remove();
							startList(enrolmentInfo);

						}
		  	
		});
		
		
	})



</script>
<style>

.sticky-header th { position: sticky; top: -1px; left:0; background-color:white;} 
</style>
</html>

