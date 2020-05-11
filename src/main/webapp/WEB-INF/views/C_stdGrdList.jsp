<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ include file="header.jsp"%>

<style>
.box-body {
	background-color: white;
}

.box-tools {
	margin: auto;
	display: flex;
}

.select {
	float: left;
}

.input-group {
	float: left;
	width: 170px;
}

.amount {
	float: right;
}
#banner{
border: 1px solid;
width: 200px;
float: left;
padding: 10px;
margin-left: 30px;
margin-top: 90px;
min-width:150px;
}

@media screen and (max-width: 1500px){
#banner{
	display: none;
}}

#banner_left{
width: 193px;
float: right;
margin: auto;
padding-top: 90px;
vertical-align: middle;
min-width:150px;
}

@media screen and (max-width: 1300px){
#banner_left{
	display: none;
}
#banner_left2{
	display: none;

}
}
</style>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
	<div class="col-md-2" style="margin: 20px;"></div>
		<h1>
			<c:out value='${sjctName}' />
		</h1>
		<ol class="breadcrumb">
			<li class="active"><i class="fa fa-dashboard"></i> Home</li>
			<li class="active"><c:out value='${sjctName}' /></li>
			<li class="active">성적 조회</li>
		</ol>
	</section>
	<!-- /.content-header -->

	<!-- Main content -->
	<section class="content">
		<div class="row">
		<div class="col-md-2">
				<div id="banner_left">
				
					<img id="pp" src="">
					
					<%@ include file="left_banner1.jsp"%>
					
				</div>
				<div>
					<%@ include file="left_banner2.jsp"%>
				</div>
			</div>
			<div class="col-md-3">
				<div class="box box-warning">
					<div class="box-header">
						<h2 class="box-title">성적 조회</h2>
					</div>
					<div class="box-body">
						<table class="table table-bordered">
							<tr>
								<th>평가명</th>
								<th>평가 일자</th>
								<th>성적</th>
							</tr>
							<tbody id="stuScoreList">
							</tbody>
						</table>
					</div>
					<!-- /.main content -->
				</div>
			</div>
			<!-- /score table -->
			<!-- /.col -->
			
			<div class="col-md-5">
				<!-- general form elements -->
				<div class="box box-warning">
<!-- 					<div class="box-header"> -->
<!-- 						<h2 class="box-title">차트 넣는곳</h2> -->
<!-- 					</div> -->
					<!-- /.box-header -->
					<div class="box-body">
						<div id="chartContainer" style="height: 300px; width: 100%;">
						</div>
					</div>
					<!-- /.box-body -->
				</div>
			</div>
			<!-- chart -->
			<!-- /.col -->
			<div id="banner">
					<%@ include file="banner.jsp"%>
				</div>
		</div>
		<!-- /.row -->
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<%@ include file="footer.jsp"%>
<!-- moment -->
<script src="${contextPath}/resources/api/js/moment.min.js"></script>
<script src="${contextPath}/resources/api/js/ko.js"></script>
<!-- canvasjs / chart-->
<script src="${contextPath}/resources/api/js/canvasjs.min.js"></script>
<script src="${contextPath}/resources/js/rice_stuevaljs.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		setmemNum('${loginMem.memNum}');
		setboCode('${pageMaker.cri.boCode}');
		setboURL('${pageMaker.cri.boURL}');
		
		getStuScoreList();
		getChartScore();
	});

	
</script>
</body>
</html>