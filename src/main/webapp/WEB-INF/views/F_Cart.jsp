<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<%@ include file = "header.jsp" %>

<div class="content-wrapper" style="min-height: 901px;">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>장바구니</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">수강신청</li>
			<li class="active">장바구니</li>
		</ol>
		
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-md-10">
				<div class="box box-success">
						<div class="box-header">
						<h3 class="box-title">강의 목록</h3>
						
						<div class="box-tools pull-right">
		              	</div>
					</div>
					<!-- /.box-header -->
					<div class="box-body table-responsive no-padding"  style="overflow: auto; height:450px">
						<table class="table table-hover">
							<tbody id="cartClassList">
								<tr  class="sticky-header">
									<th><input type="checkbox" name="checkAll" id="checkAll"> </th>
									<th>일 시</th>
									<th>장 소</th>
									<th>강의명</th>
									<th>강사명</th>
									<th>수강료</th>
								</tr>
								<tr>
								<td colspan="6" style="text-align: center;">장바구니가 비었습니다.</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- /.box-body -->
				
				
				
				
					
					
					<!-- /.box-body -->
				</div>
				<!-- /.box -->

				<div class="box box-success">
					<div class="box-header">
						<h3 class="box-title">결제 정보</h3>
						
						<div class="box-tools pull-right">
		              	</div>
					</div>
					<!-- /.box-header -->
					<div class="box-body table-responsive no-padding" style="width: 700px;margin: auto;">
						<table class="table table-hover">
							<tbody id="cartPay">
								<tr>
									<th>전체금액</th>
									<th>선택금액</th>
									<th>선택결제금액</th>
									
								</tr>
								<tr>
									<td colspan="3" style="text-align: center;" id="nonPay">결제정보가 없습니다.</td>
								</tr>
							</tbody>
						</table>
					
					</div>
						<div class="box-body ">
							<button  id="selDel"	class="btn btn-danger pull-right" style="margin-right: 5px;"
								onclick="">선택삭제</button>
								<i></i> 
							<button  id="wholeDel"	class="btn btn-danger pull-right" style="margin-right: 5px;"
								onclick="">전체삭제</button>
								<i></i> 
							<button id="selPay" class="btn btn-primary pull-right"
								style="margin-right: 5px;">
								<i class=""></i> 선택결제
							</button>
							<button  id="wholePay"	class="btn btn-primary pull-right" style="margin-right: 5px;"
								onclick="">전체결제</button>
								<i></i> 
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
var memnum = "${loginMem.memNum}";
var totalCost = 0;
var addCartPaySelInfoBase=0;
var classNameKakao = new Array();
var classPriceKakao = new Array();
var classIdKakao = new Array();
var classTeaNameKakao = new Array();
var classTeaIdKakao = new Array();
var classDateKakao = new Array();
var wholeEnrol = null;
var wholeEnrolMap = null;
var wholeEnrolT= new Array();

var noPay = "<tr><td colspan=\"3\" style=\"text-align: center;\">결제정보가 없습니다.</td></tr>";
var payClassTag =null;
var totalCharge =0;
var payTotal ='';
var memnum = "${loginMem.memNum}";

$(document).ready(function(){
	CartInfo();
	checkClick();
	holdDel();
	cAll();
	selectDelButton();
	wholeDelButton();
	wholePaidButton()
});

//보류삭제
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
	
function CartInfo(){
	$.ajax({
			type : "post",
			async : true,
			contentType: 'application/json',
			url : "cartInfo",
			data : memnum,
			success : function(cartInfo) 
					{
						var dayArray = new Array();
						//var totalCharge = 0;	
						//var tempNum = 0;
						//var payClassTag ='';
						totalCost=0;
						//console.log("cart접속 성공");
						if(cartInfo){
							var tempString =''; 
							$("tbody#cartClassList > tr:eq(1)").remove();
						for(i in cartInfo){//for문 시작
							var dayArray = new Array();
							var getMemName = cartInfo[i].MEMNAME;
							var getOpenClassName = cartInfo[i].OPENCLASSNAME;
							var getClassCapacity = cartInfo[i].CLASSCAPACITY;
							var getClassdesc = cartInfo[i].CLASSDESC;
							var getSubid = cartInfo[i].SUBID;
							var getMemNum = cartInfo[i].MEMNUM;
							var getOpenclassId = cartInfo[i].OPENCLASSID;
							var getOpenclassNumber = cartInfo[i].CLASSNUMBER
							var getOpenStartTime = cartInfo[i].OPENSTARTTIME
							var getOpenEndTime = cartInfo[i].OPENENDTIME
							var getOpenStartDate = cartInfo[i].OPENSTARTDATE;
							var getOpenEndDate = cartInfo[i].OPENENDDATE;
							
							var getClassPrice = cartInfo[i].CLASSPRICE;
							var getClassId = cartInfo[i].CLASSID;
							
							var classMon = cartInfo[i].CLASSMON;
							var classTue = cartInfo[i].CLASSTUE;
							var classWed = cartInfo[i].CLASSWED;
							var classThur = cartInfo[i].CLASSTHUR;
							var classFri = cartInfo[i].CLASSFRI;
							var classSat = cartInfo[i].CLASSSAT;
							var classSun = cartInfo[i].CLASSSUN;
							dayArray=[];
							if(classSun=='y'){dayArray.push(" 일  ");}
							if(classMon=='y'){dayArray.push(" 월  ");}
							if(classTue=='y'){dayArray.push(" 화  ");}
							if(classWed=='y'){dayArray.push(" 수  ");}
							if(classThur=='y'){dayArray.push(" 목  ");}
							if(classFri=='y'){dayArray.push(" 금  ");}
							if(classSat=='y'){dayArray.push(" 토  ");}
						
							tempString='';
							//console.log("dayArray : "+dayArray);
							for(j in dayArray)(
												tempString += dayArray[j]
												)
							addTagCart = "<tr id=\'a"+getOpenclassId+"\'>"
										+"<td><input type=\"checkbox\" name=\"radioTagCart\" class=\"flat-red checkSub\" value=\""+ getOpenclassId +"\"></td>"
										+"<td>"+ getOpenStartDate+"~"+ getOpenEndDate +", "+getOpenStartTime+"~"+getOpenEndTime+" , "+ tempString+ "</td>"
										+"<td>"+ getOpenclassNumber + " 호</td>"
										+"<td>"+ getOpenClassName + "</td>"
										+"<td value=\'"+getMemNum+"\' calss=\"classMemName\">"+ getMemName + "</td>"
										+"<td value=\'"+getClassPrice+"\" class=\"classPrice\"'>"+ getClassPrice + "</td>"
										+"</tr>";
							$("tbody#cartClassList").append(addTagCart);
							
						}//for문 종료
						}else{
							$("tbody#cartClassList > tr:eq(1)").remove();
							$("tbody#cartClassList > tr:eq(1)").text(noPay);
							
						}//if문 종료
						//금액계산
						var length = $('tbody#cartClassList > tr').length;
						//console.log("length : "+length);
						for(var i =1 ; i< eval(length) ; i++){//for문 시작
							var tdText = $("tbody#cartClassList > tr:eq("+i+") > td:eq(5)").text();
							//console.log("각각 금액" +i+": " +eval(tdText));
							totalCost+=eval(tdText);//총금액
						}
						//console.log("총금액 : " + totalCost);
						addCartPaySelInfoBase="<tr><td>"+totalCost+"</td>"
						 +"<td>-</td>"
						 +"<td>-</td></tr>"
						$('#cartPay > tr:nth-child(2)').remove();
						$('#cartPay').append(addCartPaySelInfoBase);
						delSubReg();
					}			
	})
};

	
//체크박스 클릭시 금액 추가 이벤트	
function checkClick(){
	var eventTarget = ["#checkAll",".checkSub"];//타겟 두개
	for(j in eventTarget){
	$(document).on("click",eval(j),function(){
		var cPriceM =0;
		var totalSelPrice = 0;
		var lengthPay = $('tbody#cartClassList > tr').length;
		// 체크 되어 있는 값 추출
		for (var i = 1; i < eval(lengthPay); i++) {
			// table 중 tr이 i번째 있는 자식중에 체크박스가 체크중이면
			var chk = $('tbody#cartClassList > tr').eq(i).children().find('input[type="checkbox"]').is(':checked');
			//console.log(chk);
			if (chk == true) {
				// 그 i 번째 input text의 값을 가져온다.
				cPriceM =eval($("tbody#cartClassList > tr:eq("+i+") > td:eq(5)").text());
				totalSelPrice += cPriceM;
				//console.log("cPriceM :"+cPriceM);
				//console.log("totalSelPrice :"+totalSelPrice);
				addCartPaySelInfo="<tr><td>"+totalCost+"</td>"
								 +"<td>"+totalSelPrice+"</td>"
								 +"<td>"+totalSelPrice+"</td></tr>"
				$('#cartPay > tr:nth-child(2)').remove();
				$('#cartPay').append(addCartPaySelInfo);
			}//if문 끝	
			//체크된 값이 없을 때  실행
			if($("input:checkbox[name=radioTagCart]:checked").length==0){
				addCartPaySelInfoN="<tr><td>"+totalCost+"</td>"
								  +"<td>-</td>"
								  +"<td>-</td></tr>";
				$('#cartPay > tr:nth-child(2)').remove();
				$('#cartPay').append(addCartPaySelInfoN);				 
				}
			
		}//for문 끝
	});
	}
}


//체크된 값 추출
$(document).on('click','#selPay',function(){
	holdDel();
	payClassTag =null;
	var lengthPay = $('tbody#cartClassList > tr').length;
	// 체크 되어 있는 값 추출
	for (var i = 1; i < eval(lengthPay); i++) {
	// table 중 tr이 i번째 있는 자식중에 체크박스가 체크중이면
	//#openClassList > tr:nth-child(18) > td:nth-child(1) > input
	var chk = $('tbody#cartClassList > tr').eq(i).children().find('input[type="checkbox"]').is(':checked');
	//console.log(chk);
	
	if (chk == true) {
	// 그 i 번째 input text의 값을 가져온다.
	//강의 id
	classIdKakao.push($('tbody#cartClassList > tr').eq(i).find('input[type="checkbox"]').val());
	//강의이름
	classNameKakao.push($('tbody#cartClassList > tr').eq(i).find('td:eq(3)').text());
	//강의가격
	classPriceKakao.push($('tbody#cartClassList > tr').eq(i).find('td:eq(5)').text());
	//강사이름
	classTeaNameKakao.push($('tbody#cartClassList > tr').eq(i).find('td:eq(4)').text());//차후 받아와야 하는지 확인 필요
	//classTeaIdKakao.push($('table tr').eq(i).find('td:eq(2)').text());
	//강의 날짜
	classDateKakao.push($('tbody#cartClassList > tr').eq(i).find('td:eq(1)').text());
	
	var cIdM =$('table tr').eq(i).find('input[type="checkbox"]').val();
	var cNameM =$('tbody#cartClassList > tr').eq(i).find('td:eq(3)').text();
	var cPriceM =$('tbody#cartClassList > tr').eq(i).find('td:eq(5)').text();
	
// 	wholeEnrolMap.set("cId",$('table tr').eq(i).find('input[type="checkbox"]').val());
// 	wholeEnrolMap.set("cName",$('table tr').eq(i).find('td:eq(1)').text());
// 	wholeEnrolMap.set("cPrice",$('table tr').eq(i).find('td:eq(5)').text());
	console.log("classPriceKakao :"+classPriceKakao);
	wholeEnrolMap= {
					cId:cIdM,
					cName:cNameM,
					cPrice: cPriceM
				}
	console.log(wholeEnrolMap);
	
	wholeEnrolT.push(wholeEnrolMap);
	
	
	wholeEnrol=JSON.stringify(wholeEnrolT);
	console.log(wholeEnrol);
	//classIdKakao=[];
	}
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
				 +"         <th>강 사 명 :</th>"
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

		
//최종결제 클릭
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
						console.log("받아온 id : "+partnerOrderId);
						$('input#partner_order_id').val(partnerOrderId);
						console.log("저장된 id : "+$('#partner_order_id').val());
						$('input#partner_user_id').val(memnum);//memid넘김
						$('input#classIdKakao').val(classIdKakao);//classid 전체
						$('input#memNum').val(memnum);//classid 전체
						$('input#classPriceS').val(classPriceKakao);//class가격 전체
						$('input#openclassNameS').val(classNameKakao);//class이름 전체
						var val= JSON.stringify(wholeEnrol);
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
$('#enrolmentModal').on('hide.bs.modal', function(e) {
	modalCloseLec();
	e.stopImmediatePropagation();
});


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
					var	delReg = delRegL[i].OPENCLASSID;
					var temp = '\'tr#a' +delRegL[i].OPENCLASSID+'\'';
					//console.log("temp : "+temp);
					$(eval(temp)).remove();
					var delList = {
							memNum:memnum,
							openclassId:delReg
					}	
					//console.log("delList : "+delList);
					delCartList(delList);
					}
					if(!$('#cartClassList > tr:nth-child(2)').length){
					var cartEmptyTag = "<td colspan=\"6\" style=\"text-align: center; id =\"emptyCartList\">장바구니가 비었습니다.</td>";
					$('#cartClassList').append(cartEmptyTag);
					if($('#emptyCartList')){
						$('#cartPay > tr:nth-child(2)').remove();
						$('#cartPay').append(noPay);
					}
					}
				}
    });
};

//delReg와 memnum이용하여 동시에 만족하면 cart에서 삭제
function delCartList(delList){
	//console.log("delCartList 시작");
	$.ajax({
		type : "post",
		async : true,
		contentType: 'application/json',
		url : "delCartList",
		data : JSON.stringify(delList),
		success : function(delCartList) 
				{
					//console.log("success");
				}
	});
};

//체크박스 전체 클릭버튼 옵션
function cAll() {
	$(document).on('click',"#checkAll",function(){
		if ($("#checkAll").is(':checked')) {
	        $("input[type=checkbox]").prop("checked", true);
	    } else {
	        $("input[type=checkbox]").prop("checked", false);
	      };
	});
};


//전체결제 클릭 이벤트
function wholePaidButton(){
	$(document).on('click','#wholePay',function(){
		holdDel();
		payClassTag =null;
		var lengthPay = $('tbody#cartClassList > tr').length;
		// 체크 되어 있는 값 추출
		for (var i = 1; i < eval(lengthPay); i++) {
			//강의 id
			classIdKakao.push($('tbody#cartClassList > tr').eq(i).find('input[type="checkbox"]').val());
			//강의이름
			classNameKakao.push($('tbody#cartClassList > tr').eq(i).find('td:eq(3)').text());
			//강의가격
			classPriceKakao.push($('tbody#cartClassList > tr').eq(i).find('td:eq(5)').text());
			//강사이름
			classTeaNameKakao.push($('tbody#cartClassList > tr').eq(i).find('td:eq(4)').text());//차후 받아와야 하는지 확인 필요
			//classTeaIdKakao.push($('table tr').eq(i).find('td:eq(2)').text());
			//강의 날짜
			classDateKakao.push($('tbody#cartClassList > tr').eq(i).find('td:eq(1)').text());
			
			var cIdM =$('table tr').eq(i).find('input[type="checkbox"]').val();
			var cNameM =$('tbody#cartClassList > tr').eq(i).find('td:eq(3)').text();
			var cPriceM =$('tbody#cartClassList > tr').eq(i).find('td:eq(5)').text();
			
			//console.log("classPriceKakao :"+classPriceKakao);
			wholeEnrolMap= {
							cId:cIdM,
							cName:cNameM,
							cPrice: cPriceM
						}
			//console.log(wholeEnrolMap);
			wholeEnrolT.push(wholeEnrolMap);
			
			
			wholeEnrol=JSON.stringify(wholeEnrolT);
			//console.log(wholeEnrol);
			//classIdKakao=[];
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
						 +"         <th>강 사 명 :</th>"
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
};

//장바구니 전체 삭제버튼 클릭한 반번호와 멤버네임으로 삭제
function wholeDelButton(){
	$(document).on('click','#wholeDel',function(){
		
		var lengthPay = $('tbody#cartClassList > tr').length;
		// 체크 되어 있는 값 추출
		for (var i = 1; i < eval(lengthPay); i++) {
			var wholeDelText = '';
			//강의 id
			wholeDelText=($('tbody#cartClassList > tr').eq(i).find('input[type="checkbox"]').val());
			wholeDelText={
					memNum:memnum,
					openclassId:wholeDelText
			}
			$.ajax({
				type : "post",
				async : true,
				contentType: 'application/json',
				url : "wholeDelButton",
				data : JSON.stringify(wholeDelText),
				success : function(wholeDelButton) 
						{
							//console.log("success");
						}
			});
		};
		})
};
		
//장바구니 선택 삭제버튼 클릭한 반번호와 멤버네임으로 삭제
function selectDelButton(){
	$(document).on('click','#selDel',function(){
		var lengthPay = $('tbody#cartClassList > tr').length;
		// 체크 되어 있는 값 추출
		for (var i = 1; i < eval(lengthPay); i++) {
			var chk = $('tbody#cartClassList > tr').eq(i).children().find('input[type="checkbox"]').is(':checked');
			//console.log(chk);
			if (chk == true) {
				// 그 i 번째 input text의 값을 가져온다.
				var selectDelText = '';
				//강의 id
				selectDelText=($('tbody#cartClassList > tr').eq(i).find('input[type="checkbox"]').val());
				selectDelText={
						memNum:memnum,
						openclassId:selectDelText
			}
			$.ajax({
				type : "post",
				async : true,
				contentType: 'application/json',
				url : "selectDelButton",
				data : JSON.stringify(selectDelText),
				success : function(selectDelButton) 
						{
						
						}
			});
			}
		};
		
	})
};
		
		






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
</script>
<style>

.sticky-header th { position: sticky; top: -1px; left:0; background-color:white;} 
</style>
</html>