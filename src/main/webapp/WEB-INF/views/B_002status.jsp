<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%@ include file="header.jsp"%>

<div class="content-wrapper" style="min-height: 901px;">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>출석 현황</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">출석 현황</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-md-6">
				<!-- Horizontal Form -->
				<div class="box box-default">
					<div class="form-horizontal">
						<div class="box-body" id="attendChart">
							
						</div>
						<!-- /.box-body -->
					</div>
					<!-- /.form-horizontal  -->
					<div class="box-footer"></div>
					<!-- /.box-footer -->
				</div>
				<!-- /.box -->
			</div>
			<!-- /.col -->
			<div class="col-md-6">
				<div class="box box-default">
					<div class="box-header">
						<h3 class="box-title" id="attendTitle">수업이름</h3>
					</div>
					<!-- /.box-header -->
					
					<div class="box-body table-responsive no-padding">
						<table class="table table-hover">
							<tbody id="myAttendList">
								<tr>
									<th>일자 및 시간</th>
									<th>출결 정보</th>
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

<%@ include file="footer.jsp"%>

<!-- moment / date type -->
<script src="${contextPath}/resources/api/js/canvasjs.min.js"></script>
<script type="text/javascript">
	var div_attendChart = $("#attendChart");
	
	$(document).ready(function() {
		div_attendChart.append('<div id="chartContainer" style="height: 150px; width: 50%;"></div>');
		
		charRender();
	});
	
	function charRender(data) {
		var chart = new CanvasJS.Chart("chartContainer", {
			animationEnabled : true,
			title : {
				text : "수업이름",
				horizontalAlign : "center"
			},
			data : [ {
				type : "doughnut",
				startAngle : 60,
				//innerRadius : 30,
				indexLabelFontSize : 10,
				indexLabel : "{y}",
				toolTipContent : "<b>{label}:</b> {y} (#percent%)",
				dataPoints : [ {
					y : 67,
					label : "출석",
					exploded : true
				}, {
					y : 3,
					label : "지각"
				}, {
					y : 3,
					label : "결석"
				}, {
					y : 10,
					label : "남은수업"
				}, ]
			} ]
		});
		chart.render();
	}
</script>
</body>
</html>