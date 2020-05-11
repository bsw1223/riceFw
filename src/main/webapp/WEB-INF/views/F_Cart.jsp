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
				<div class="box box-warning">
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
							<tbody id="cartClassList">
								<tr>
									<th>선 택</th>
									<th>일 시</th>
									<th>장 소</th>
									<th>강의명</th>
									<th>수강료</th>
								</tr>
								<tr>
								<td colspan="5" style="text-align: center;">장바구니가 비었습니다.</td>
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
		                	<button type="button" class="btn btn-box-tool" data-widget="collapse">
		                		<i class="fa fa-minus"></i>
		                	</button>
		              	</div>
					</div>
					<!-- /.box-header -->
					<div class="box-body table-responsive no-padding">
						<table class="table table-hover">
							<tbody id="cartPay">
								<tr>
									<th>총금액</th>
									<th>선택금액</th>
									<th>결제금액</th>
									
								</tr>
								<tr>
									<td colspan="3" style="text-align: center;">결제정보가 없습니다.</td>
								
								</tr>
							</tbody>
						</table>
						<div class="form-group">
							<button id="cartButton" class="btn btn-primary pull-right"
								style="margin-right: 5px;">
								<i class=""></i> 선택결제
							</button>
							<button  id="insertSub"	class="btn btn-primary pull-right" style="margin-right: 5px;"
								onclick="">전체결제</button>
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
var memnum = "${loginMem.memNum}";
$(document).ready(function(){

$.ajax({
		type : "post",
		async : true,
		contentType: 'application/json',
		url : "cartInfo",
		data : memnum,
		success : function(cartInfo) 
				{
					console.log("cart접속 성공");
					if(cartInfo){
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


		addTagCart = "<tr id=\'a"+getOpenclassId+"\'>"
					+"<td><input type=\"checkbox\" name=\"radioTagCart\" class=\"flat-red checkSub\" value=\""+ getOpenclassId +"\"></td>"
					+"<td>"+ getOpenStartDate+"~"+ getOpenEndDate +", "+getOpenStartTime+"~"+getOpenEndTime+" , "+ tempString+ "</td>"
					+"<td>"+ getOpenclassNumber + "</td>"
					+"<td>"+ getOpenClassName + "</td>"
		//			+"<td>"+ getClassdesc + "</td>"
					+"<td value=\'"+getClassPrice+"\" class=\"classPrice\"'>"+ getClassPrice + "</td>"
					+"</tr>";
		$("tbody#cartClassList").append(addTagCart);	
					}//for문 종료
					}else{
									
						$("tbody#cartClassList > tr:eq(1)").remove();
						$("tbody#cartClassList > tr:eq(1)").text(noPay);
						var noPay = "<tr><td colspan=\"3\" style=\"text-align: center;\">결제정보가 없습니다.</td></tr>";
					}//if문 종료
					//금액계산
					var totalCost = 0;
					var length = $('tbody#cartClassList > tr').length;
					console.log("length : "+length);
					for(var i =1 ; i< eval(length) ; i++){//for문 시작
					var tdText = $("tbody#cartClassList > tr:eq("+i+") > td:eq(4)").text();
					console.log("각각 금액" +i+": " +eval(tdText));
					
					totalCost+=eval(tdText);//총금액
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					}
					console.log("총금액 : " + totalCost);
					
					
					
					
				}			
		})
	});

	
	
	
	
	
	
	
	
	
$(document).on("click",".checkSub",function(){
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
});

	
	
</script>
</html>