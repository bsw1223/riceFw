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
						<h3 class="box-title" id="attendTitle"></h3>
					</div>
					<!-- /.box-header -->
					
					<div class="box-body table-responsive no-padding">
						<table class="table table-hover">
							<tbody id="myAttendList">
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

<link href='${contextPath}/resources/css/rice_attendcss.css' rel='stylesheet' />
<!-- moment -->
<script src="${contextPath}/resources/api/js/moment.min.js"></script>
<script src="${contextPath}/resources/api/js/ko.js"></script>
<!-- canvasjs / chart-->
<script src="${contextPath}/resources/api/js/canvasjs.min.js"></script>
<script src="${contextPath}/resources/js/rice_attendstatusjs.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		setmemNum('${loginMem.memNum}');

		getAttendInfo();
	});
	
	
</script>
</body>
</html>