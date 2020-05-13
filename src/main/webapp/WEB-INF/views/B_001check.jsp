<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%@ include file="header.jsp"%>

<div class="content-wrapper" style="min-height: 901px;">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>출석 체크</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">출석 체크</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-md-3"></div>
			<!-- /.col -->
			<div class="col-md-6">
				<!-- Horizontal Form -->
				<div class="box box-warning">
					<div class="form-horizontal">
						<div class="box-body">
							<div class="form-group">
								<!-- 현재 시간 -->
								<div class="col-sm-12" id="clock"></div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">수업</label> 
								<div class="col-sm-7" >
									<select class="form-control select2" style="width: 100%;">
									</select>
								</div>
							</div>
							<!-- /.form-group" -->
						</div>
						<!-- /.box-body -->
	
						<div class="box-body">
							<div class="form-group">
								<!-- ID -->
								<label for="memEmail" class="col-sm-3 control-label">Email</label>
	
								<div class="col-sm-7">
									<input type="email" class="form-control" name="memEmail" placeholder="Email">
								</div>
							</div>
							<div class="form-group">
								<!-- Password -->
								<label for="memPwd" class="col-sm-3 control-label">Password</label>
	
								<div class="col-sm-7">
									<input type="password" class="form-control" name="memPwd" placeholder="Password">
								</div>
							</div>
						</div>
						<!-- /.box-body -->
					</div>
					<!-- /.form-horizontal  -->
					<div class="box-footer">
						<button type="submit" class="btn btn-info pull-right" id="btn_attend">출석</button>
					</div>
					<!-- /.box-footer -->
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
<!-- Select2 -->
<link rel="stylesheet" href="${contextPath}/resources/bower_components/select2/dist/css/select2.min.css">
<script src="${contextPath}/resources/bower_components/select2/dist/js/select2.full.min.js"></script>
<!-- moment / date type -->
<script src="${contextPath}/resources/api/js/moment.min.js"></script>
<script src="${contextPath}/resources/js/rice_attendcheckjs.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		setmemNum('${loginMem.memNum}');
		ipt_select.select2(); //Initialize Select2 Elements
		
		printClock();	// 현재시간 보여주기
		getClassList();	// 수업 목록 가져오기
	});

</script>
</body>
</html>