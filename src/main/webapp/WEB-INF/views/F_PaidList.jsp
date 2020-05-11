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
		                	<button type="button" class="btn btn-box-tool" data-widget="collapse">
		                		<i class="fa fa-minus"></i>
		                	</button>
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
								<td colspan="4" style="text-align: center;">장바구니가 비었습니다.</td>
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
	console.log(memnum);
	$.ajax({
		type : "post",
		async : true,
		contentType: 'application/json',
		url : "/lectureMng/selectPaidListR",
		data : memnum,
		success : function(selectPaidList) 
				{
					$('#paidClassList').text('');
					var orderDateT = selectPaidList[0].ORDERDATE;
					var orderDateD = new Date()
					var addTagBase ="<tr><th>주문번호</th><th>결제일</th><th>과목명</th><th>결제금액</th></tr>"
					$('#paidClassList').append(addTagBase);
					console.log(selectPaidList);
					
					for(i=0; i<selectPaidList.length;i++){
					var	orderNum = selectPaidList[i].ORDERNUM;
					var orderDate = selectPaidList[i].ORDERDATE;
					var openClassName = selectPaidList[i].OPENCLASSNAME;
					var classPrice = selectPaidList[i].CLASSPRICE;
						
					var addTag ="<tr><td>"+orderNum+"</td>"
								+"<td>"+orderDate+"</td>"
								+ "<td>"+openClassName+"</td>"
								+"<td>"+classPrice+"</td></tr>";
					$('#paidClassList').append(addTag);
					
					}
					
				}
	
	});
});
</script>
</html>