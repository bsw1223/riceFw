<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<%@ include file = "header.jsp" %>

<!-- <div class="content-wrapper" style="min-height: 901px;"> -->
<!-- 	<!-- Content Header (Page header) -->
<!-- 	<section class="content-header"> -->
<!-- 		<h1>결제 목록</h1> -->
<!-- 		<ol class="breadcrumb"> -->
<!-- 			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li> -->
<!-- 			<li class="active">결제목록</li> -->
<!-- 		</ol> -->
		
<!-- 	</section> -->

<!-- 	<!-- Main content -->
<!-- 	<section class="content"> -->
<!-- 		<div class="row"> -->
<!-- 			<div class="col-md-10"> -->
<!-- 				<div class="box box-success"> -->
<!-- 					<div class="box-body"> -->
<!-- 						<div id='timeline_cal'> -->
<!-- <!-- 						<form class="form-horizontal"> -->
<!-- <!-- 							<div class="box-body"> -->
							
<!-- <!-- 								<div class="form-group  col-sm-12"> -->
<!-- <!-- 				                <label for="" class="col-sm-12" id="selectSubJsp">수업 종류</label> -->
<!-- <!-- 				                  <select class="form-control" id="subIdJsp"> -->
<!-- <!-- 				                     <option class="" id="" value="">수업종류를 선택해 주세요</option> -->
<!-- <!-- 				                  </select> --> 
<!-- <!-- 				                </div> -->
<!-- <!-- 				                <div class="form-group  col-sm-12"> -->
<!-- <!-- 				                 <label for="" class="col-sm-12" id="searchTeacherJsp">강사선택</label> -->
<!-- <!-- 										 <select class="form-control" id="teacherIdJsp"> -->
<!-- <!-- 				                     <option class="" id="" value="teaINJsp">강사를 선택해 주세요</option> -->
<!-- <!-- 				                  </select> -->
<!-- <!-- 								</div> -->
<!-- <!-- 								<div class="form-group  col-sm-12"> -->
<!-- <!-- 				                 <label for="" class="col-sm-12" id="searchKeywordJsp">키워드검색</label> -->
<!-- <!-- 										<input type="text" class="form-control" id="searchKeyword" placeholder=""> -->
<!-- <!-- 								</div> -->
<!-- <!-- 								<button type="button" class="btn btn-primary col-sm-12" id="searchOpenClT">검색</button> -->
<!-- <!-- 								</div> -->
<!-- <!-- 							</form>	 -->
		
		
						
						
						
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					/.box-body -->
<!-- 				</div> -->
<!-- 				/.box -->

<!-- 				<div class="box box-success"> -->
<!-- 					<div class="box-header"> -->
<!-- 						<h3 class="box-title">강의 목록</h3> -->
						
<!-- 						<div class="box-tools pull-right"> -->
<!-- 		                	<button type="button" class="btn btn-box-tool" data-widget="collapse"> -->
<!-- 		                		<i class="fa fa-minus"></i> -->
<!-- 		                	</button> -->
<!-- 		              	</div> -->
<!-- 					</div> -->
<!-- 					/.box-header -->
<!-- 					<div class="box-body table-responsive no-padding"> -->
<!-- 						<table class="table table-hover"> -->
<!-- 							<tbody id="openClassList"> -->
<!-- 								<tr> -->
<!-- 									<th>선택</th> -->
<!-- 									<th>과정명</th> -->
<!-- 									<th>선생님</th> -->
<!-- 									<th>일 시</th> -->
<!-- 									<th>강의 설명</th> -->
<!-- 									<th>수강료</th> -->
<!-- 									<th>정원</th> -->
<!-- 								</tr> -->
<!-- 							</tbody> -->
<!-- 						</table> -->
<!-- 						<div class="form-group"> -->
<!-- 							<button type="reset" class="btn btn-primary pull-right" -->
<!-- 								style="margin-right: 5px;"> -->
<!-- 								<i class=""></i> 장바구니 -->
<!-- 							</button> -->
<!-- 							<button  id="insertSub"	class="btn btn-primary pull-right" style="margin-right: 5px;" -->
<!-- 								onclick="">수강신청</button> -->
<!-- 								<i></i>  -->
							
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					/.box-body -->
<!-- 				</div> -->
<!-- 				/.box -->
<!-- 			</div> -->
<!-- 			<!-- /.col -->
<!-- 		</div> -->
<!-- 		<!-- /.row -->
<!-- 	</section> -->
<!-- 	<!-- /.content -->

<!-- <!-- 	수강신청 modal -->
<!-- 	<div class="modal fade" id="enrolmentModal"> -->
<!-- 		<div class="modal-dialog"> -->
<!-- 			<div class="modal-content"> -->
<!-- 				<div class="modal-header"> -->
<!-- 					<button type="button" class="close" data-dismiss="modal" -->
<!-- 						aria-label="Close"> -->
<!-- 						<span aria-hidden="true">&times;</span> -->
<!-- 					</button> -->
<!-- 					<h4 class="modal-title">수강 신청 내역</h4> -->
					
<!-- 				</div> -->
<!-- <!-- 				/.modal-header -->
<!-- 				<form class="form-horizontal" id = 'formAdd'  method="post" action="/kakaoPay" name="submitKakao"> -->
<!-- 						<input type="hidden" name="total_amount" id ="total_amount" > -->
<!-- 						<input type="hidden" name="item_name" id="item_name"> -->
<!-- 						<input type="hidden" name="partner_order_id" id="partner_order_id"> -->
<!-- 						<input type="hidden" name="partner_user_id" id="partner_user_id">memnum -->
<!-- 						<input type="hidden" name="classIdKakao" id="classIdKakao">주문전체목록id -->
<!-- 						<input type="hidden" name="memNum" id="memNum"> -->
<!-- 						<input type="hidden" name="classPriceS" id="classPriceS"> -->
<!-- 						<input type="hidden" name="openclassNameS" id="openclassNameS"> -->
<!-- 						<input type="hidden" name="wholeEnrol" id="wholeEnrol"> -->
<!-- <!-- 				 -->
<!-- <!-- 					/.modal-body -->
<!-- 					<div class="modal-footer modalBtnContainer-addEvent"> -->
<!-- 						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button> -->
<!-- 						<button type="button" class="btn btn-primary" id="payClassNext">결제</button> -->
<!-- 					</div> -->
<!-- 				</form> -->
<!-- <!-- 				/.modal-footer -->
<!-- 			</div> -->
<!-- 			<!-- /.modal-content -->
<!-- 		</div> -->
<!-- 		<!-- /.modal-dialog -->
<!-- 	</div> -->
<!-- 	<!-- /.modal -->
<!-- </div> -->
<!-- <!-- /.content-wrapper --> 

<%@ include file = "footer.jsp" %>
<!-- 카카오페이 결제가 정상적으로 완료되었습니다. -->
 
<%-- 결제일시:     [[${info.approved_at}]]<br/> --%>
<%-- 대표주문번호:    [[${info.partner_order_id}]]<br/> --%>
<%-- 상품명:    [[${info.item_name}]]<br/> --%>
<%-- 상품수량:    [[${info.quantity}]]<br/> --%>
<%-- 결제금액:    [[${info.amount.total}]]<br/> --%>
<%-- 결제방법:    [[${info.payment_method_type}]]<br/> --%>
 
 
 
<%-- <h2>[[${info}]]</h2> --%>
 
</body>

<script>
$(document).ready(function(){
	alert("결제가 완료되었습니다.")
	nextPage();
	window.location = '../../../../../../lectureMng/paidlist/';
})
var approveTime = "${info.approved_at}";
var orderId = "${info.partner_order_id}";
var itemName = "${info.item_name}";
var quantity = "${info.quantity}";
var amountTotal = "${info.amount.total}";
var payment = "${info.payment_method_type}";
var memnum = "${loginMem.memNum}";
//console.log("memnum : "+memnum);

var totalClass = {
		approveTime:approveTime,
		orderId:orderId,
		itemName:itemName,
		amountTotal:amountTotal,
		paidMode:"1600",
		memNum:memnum
}
var totalClassS = JSON.stringify(totalClass);
console.log(approveTime);//결제시간
console.log(orderId);//대표오더 id
console.log(itemName);//아이템이름
console.log(quantity);//수량_ 안씀
console.log(amountTotal);//총 금액
console.log(payment);//지불방법_ 안씀

//페이지 이동
function nextPage(){
	$.ajax({
		type : "post",
		async : true,
		contentType: 'application/json',
		url : "/lectureMng/paid",
		data : totalClassS,
		success : function() 
				{
					console.log("success");
					}
	});
};



</script>
</html>
