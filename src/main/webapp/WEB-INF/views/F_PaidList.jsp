<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<%@ include file = "header.jsp" %>

<div class="content-wrapper" style="min-height: 901px;">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>결제목록</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">수강신청</li>
			<li class="active">결제목록</li>
		</ol>
		
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-md-10">
				<div class="box box-warning">
						<div class="box-header">
						<h3 class="box-title">결제 강의 목록</h3>
						
						<div class="box-tools pull-right">
		              	</div>
					</div>
					<!-- /.box-header -->
					<div class="box-body table-responsive no-padding">
						<table class="table table-hover">
							<tbody id="paidClassList">
								<tr>
									<th>주문번호</th>
									<th>결제일</th>
									<th>과목명</th>
									<th>결제금액</th>
								</tr>
								<tr>
								<td colspan="4" style="text-align: center;">결제목록이 없습니다.</td>
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
<!-- 	결제내역 modal -->
	<div class="modal fade" id="paidModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">결제 내역</h4>
					
				</div>
<!-- 				/.modal-header -->
				<form class="form-horizontal" id = 'formAdd'  method="post" action="/kakaoPay" name="submitKakao">
						<div class="col-xs-12" id="addPayClass" style="margin-left: 10%"></div>
<!-- 				
<!-- 					/.modal-body -->
					<div class="modal-footer modalBtnContainer-addEvent">
						<button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
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
var memNum = eval(memnum);
var memNumN = {memNum:eval(memnum)};


$(document).ready(function(){
	paidListBase();
	
});

function paidListBase(){
	$.ajax({
		type : "post",
		async : true,
		contentType: 'application/json',
		url : "/lectureMng/paidList",
		data : JSON.stringify(memNumN),
		success : function(paidList) 
				{
					$('#paidClassList').text('');
					var addTagBase ="<tr><th>주문번호</th><th>결제일</th><th>과목명</th><th>결제금액</th></tr>"
					$('#paidClassList').append(addTagBase);
					for(i=0; i<paidList.length;i++){
						var	countOrderCode = 0; 
						countOrderCode = parseInt(paidList[i].COUNTORDERCODE);
						//console.log("countOrderCode : " + typeof(countOrderCode)+(countOrderCode-1));
						var countMOne = countOrderCode-1;
						var	orderNum = paidList[i].ORDERCODE;
						var orderDate = paidList[i].ORDERDATE;
						var openClassName = paidList[i].OPENCLASSNAME;
						var classPrice = paidList[i].TOTALPAYAMT;
						if(countMOne!=0){
							var addTag ="<tr class=\"paidClassListDetail\" value="+orderNum+" style=\"cursor:pointer;\"><td>"+orderNum+"</td>"
										+"<td>"+orderDate+"</td>"
										+ "<td>"+openClassName+" 외 "+countMOne+"건</td>"
										+"<td>"+classPrice+"</td></tr>";
						}else{
							var addTag ="<tr class=\"paidClassListDetail\" value="+orderNum+" style=\"cursor:pointer;\"><td>"+orderNum+"</td>"
										+"<td>"+orderDate+"</td>"
										+ "<td>"+openClassName+"</td>"
										+"<td>"+classPrice+"</td></tr>";
						}
						
						$('#paidClassList').append(addTag);
					}
				}
	});
};

//목록 tr 클릭 시
$(document).on('click','.paidClassListDetail',function(){
	var tr = $(this);
	var td = tr.children();
	var trVal=td.eq(0).text();
	console.log("$(this).val()  : "+trVal);
	paidListDetail(trVal);
});

function paidListDetail(trVal){
	var subInfoDetail = {
			buyer :memNum,
			cartNum : trVal	
	}
	$.ajax({
		type : "post",
		async : true,
		contentType: 'application/json',
		url : "/lectureMng/paidListDetail",
		data : JSON.stringify(subInfoDetail),
		success : function(paidListDetail) 
				{
					console.log(paidListDetail);
					var dayArray = new Array();
					var totalCharge = 0;	
					var tempNum = 0;
					var payClassTag ='';
					for(i in paidListDetail){
					var tempString =''; 
						//[{CLASSDESC=rc part 4 강의입니다, MEMNUM=142, OPENENDDATE=2020-08-01, 
						//OPENSTARTDATE=2020-06-01, CLASSFRI=y, ORDERDATE=2020.05.10. 04:38:24, 
						//CLASSWED=y, OPENSTARTTIME=09:00, CLASSPRICE=152200, ORDERCODE=982, 
						//OPENCLASSNAME=[RC] RC PART4, CLASSID=43, MEMNAME=이윤정, OPENENDTIME=15:00, CLASSMON=y}	 
						var paidClassName = paidListDetail[i].OPENCLASSNAME;
						var paidOrderCode = paidListDetail[i].ORDERCODE;
						var paidOrderDate = paidListDetail[i].ORDERDATE;
						var paidClassPrice = paidListDetail[i].CLASSPRICE;
						var paidClassMemName = paidListDetail[i].MEMNAME;
						
						
						var getOpenStartTime = paidListDetail[i].OPENSTARTTIME
						var getOpenEndTime = paidListDetail[i].OPENENDTIME
						var getOpenStartDate = paidListDetail[i].OPENSTARTDATE;
						var getOpenEndDate = paidListDetail[i].OPENENDDATE;
						
						
						var classMon = paidListDetail[i].CLASSMON;
						var classTue = paidListDetail[i].CLASSTUE;
						var classWed = paidListDetail[i].CLASSWED;
						var classThur = paidListDetail[i].CLASSTHUR;
						var classFri = paidListDetail[i].CLASSFRI;
						var classSat = paidListDetail[i].CLASSSAT;
						var classSun = paidListDetail[i].CLASSSUN;
						dayArray=[];
						if(classSun=='y'){dayArray.push(" 일  ");}
						if(classMon=='y'){dayArray.push(" 월  ");}
						if(classTue=='y'){dayArray.push(" 화  ");}
						if(classWed=='y'){dayArray.push(" 수  ");}
						if(classThur=='y'){dayArray.push(" 목  ");}
						if(classFri=='y'){dayArray.push(" 금  ");}
						if(classSat=='y'){dayArray.push(" 토  ");}
						
						//console.log("dayArray : "+dayArray);
						for(j in dayArray)(
										tempString += dayArray[j]
										)
						//$('form#formAdd').prepend("<div class=\"col-xs-12\" id=\"addPayClass\" style=\"margin-left: 10%\"></div>");
							
						totalCharge +=Number(paidListDetail[i].CLASSPRICE);		
						payClassTag      =     "<br><h5 id=\"titleSub\">[결제 과목 "+ (tempNum+1) + "]</h5>"
										 +"<div class=\"table-responsive\">"
										 +"<table class=\"payClassList\">"
										 +"       <tr>"
										 +"         <th style=\"\">과 정 명 :</th>"
										 +"         <td style=\"float:left;width:100%;padding-left: 15px;\">"+paidClassName+"</td>"
										 //+"         <input type=\"hidden\" value=\""+classIdKakao[i]+"\">"
										 +"      </tr>"
										 +"       <tr>"
										 +"         <th>선 생 님 :</th>"
										 +"         <td style=\"float:left;width:100%;padding-left: 15px;\">"+paidClassMemName+"</td>"
										 +"       </tr>"
										 +"       <tr>"
										 +"        <th>일   시 :</th>"
										 +			"<td style=\"float:left;width:100%;padding-left: 15px;\">"+ getOpenStartDate+"~"+ getOpenEndDate +", "+getOpenStartTime+"~"+getOpenEndTime+" , "+ tempString+ "</td>"
										 //+"        <td style=\"float:left;width:100%;padding-left: 15px;\">"+classDateKakao[i]+"</td>"
										 +"       </tr>"
										 +"       <tr>"
										 +"         <th>수 강 료 :</th>"
										 +"        <td style=\"float:left;width:100%;padding-left: 15px;\">"+paidClassPrice+"원</td>"
										 //+"         <input type=\"hidden\" value=\""+classPriceKakao[i]+"\">"
										 +"       </tr>"
										 +"     </table>"
										 +"   </div>"
						
						
					
										 $('div#addPayClass').append(payClassTag);  
					
					
						tempNum++;			
					}
					payTotal = "<p>-----------------------------------------------------------------------------------------------<p>"
						  +"<p>총 금액 : "+totalCharge+"원<p>"
						  +"<input type=\"hidden\" class = \"totalChargeSub\"value=\""+totalCharge+"\">";
					
					$('div#addPayClass').append(payTotal);
					$('#paidModal').modal();
					//$('div#addPayClass').remove();
				}
	});
	
	
}

$('#paidModal').on('hide.bs.modal', function(e) {
	modalCloseLec();
	e.stopImmediatePropagation();
});

function modalCloseLec() {
	$('#addPayClass').empty();
	dayArray=[];
	tempString='';
}					
					


</script>

</html>
