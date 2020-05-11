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
				                     <option class="" id="" value="teaINJsp">강사를 선택해 주세요</option>
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
							<button id="cartButton" class="btn btn-primary pull-right"
								style="margin-right: 5px;">
								<i class=""></i> 장바구니
							</button>
							<button  id="insertSub"	class="btn btn-primary pull-right" style="margin-right: 5px;"
								onclick="">수강신청</button>
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
					//getClassDescFile = conrolmentInfo[i].CLASSDESCFILE;
					addTagEnrolTable = "<tr id=\'a"+getOpenclassId+"\'>"
										+"<td><input type=\"checkbox\" name=\"radioTagEnrol\" class=\"flat-red\" value=\""+ getOpenclassId +"\"></td>"
										+"<td>"+ getOpenClassName + "</td>"
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
				} 
	});
});

//체크된 값 추출
$(document).on('click','#insertSub',function(){
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
	var tempMassage = "<option class=\"\" id=\"\" value=\"teaINJsp\">강사를 선택해 주세요</option>";
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
	var tempMassage = "<option class=\"\" id=\"\" value=\"teaINJsp\">강사를 선택해 주세요</option>";
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
				var tempMassage = "<option class=\"\" id=\"\" value=\"teaINJsp\">강사를 선택해 주세요</option>";
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
	
	// 체크 되어 있는 값 추출
	for (var i = 1; i < $('table tr').length; i++) {
	// table 중 tr이 i번째 있는 자식중에 체크박스가 체크중이면
	//#openClassList > tr:nth-child(18) > td:nth-child(1) > input
	var chk = $('table tr').eq(i).children().find('input[type="checkbox"]').is(':checked');
	//console.log(chk);
	
	
	if (chk == true) {
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
	
	
	orderIdGet(subCartOrderId,cIdM,cNameM,cPriceM,memnum,wholeCartT);//오더넘버 받아오기
	//console.log("subCartOrderId(1) :"+subCartOrderId);
		
	}//if문 끝	
	}//for문 끝
	//console.log(wholeCartMap);
	//console.log("wholeCartT type : "+typeof(wholeCartT));
	//console.log(wholeCartA);
	//console.log(wholeCartT.pop());
	//for문 끝나고 실행
	//console.log("wholeCartA22222 : "+wholeCartA);//값안들어옴
	//insertCart(wholeCartA);
});


//주문번호 받기
function orderIdGet(subCartOrderId,cIdM,cNameM,cPriceM,memnum,wholeCartT){
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
				
					insertCart(wholeCartMapA);
				
				}
			
});
};

//데이터 넣기
function insertCart(wholeCartT){
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
	totalCharge=0;
	payClassTag ='';
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
					
					
					



</script>
</html>