<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<%@ include file = "header.jsp" %>

<div class="content-wrapper" style="min-height: 901px;">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>월매출</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">월 매출</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-md-10">
				<div class="box box-warning">
					<div class="box-body" style="min-height: 700px;">
						<div id="chartContainer" style="width: 100%;">
						</div>
						<!-- chart -->
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
<!-- moment -->
<script src="${contextPath}/resources/api/js/moment.min.js"></script>
<script src="${contextPath}/resources/api/js/ko.js"></script>
<!-- canvasjs / chart-->
<script src="${contextPath}/resources/api/js/canvasjs.min.js"></script>
<script src="${contextPath}/resources/js/rice_attendstatusjs.js"></script>
<script>
	$(document).ready(function() {
		getTchSales();
	});
	
	function getTchSales(){
		var info = {
			currentDate: moment().format('YYYY[-]MM')	// 현재 날짜		
		}
		
		console.log(info);
		
		$.ajax({
			type: "post",
			async: true,
			url: "/statis/getMonthSales",
			data: JSON.stringify(info),
			contentType: 'application/json',
			success: function(data) {
						chartRender(data);
					},
			error: function(data) {
						console.log("fail");
					}
		});	// ajax end
	}
	
	function chartRender(info) {
		var currentDate = moment().format('MM')
		
		var chart = new CanvasJS.Chart("chartContainer", {
			animationEnabled: true,
			theme: "light2",
			title: {
				text: currentDate + "월 매출 그래프"
			},
			axisX: {
				minimum: -1,
				maximum: 31
			},
			data: [{
				indexLabelFontColor: "darkSlateGray",
				name: "views",
				type: "area",
				toolTipContent: "<b>{x}일:</b> {y} (원)",
				dataPoints: info
			}]
		});
		chart.render();
	}
</script>
</body>
</html>