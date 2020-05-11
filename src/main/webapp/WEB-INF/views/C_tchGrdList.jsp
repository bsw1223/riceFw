<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<%@ include file = "header.jsp" %>

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
	margin-left: 10px;
}

.input-group {
	float: left;
	width: 170px;
}
</style>

<div class="content-wrapper">
	<section class="content-header">
		<h1>
			<c:out value='${sjctName}' />
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#"><c:out value='${sjctName}' /></a></li>
			<li class="active">성적 입력</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="box">
					<div class="box-header">
						<h2 class="box-title">성적 입력</h2>
						<div class="pull-right">
							<label class="control-label" for="evalList" style="margin-right: 10px;">평가명 :</label>
							<div class="pull-right">
								<select name='evalList' class="form-control">
									<option value="">-----</option>
								</select>
							</div>
							<!-- /.select -->
						</div>
					</div>
					<!-- /. box-header -->
					<div class="box-body">
						<table class="table table-bordered">
							<tr>
								<th style="width: 20px">No.</th>
								<th style="width: 50%">학생이름</th>
								<th>점수</th>
							</tr>
							<tbody id="scoreList">
							</tbody>
						</table>
					</div>
					<!-- /.box-body -->
					<div class="box-footer">
						<div class="buttons">
							<button class="btn btn-primary" id="add-eval">평가 생성</button>
							<button class="btn btn-primary pull-right" id="save-score" style="display: none;">점수 저장</button>
						</div>
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
	
	<!-- 평가 추가 MODAL -->
	<div class="modal fade" id="evalModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">평가 생성</h4>
					<!-- 스터디실 예약  -->
				</div>
				<!-- /.modal-header -->
				<form class="form-horizontal">
					<div class="modal-body">
						<div class="form-group">
							<label class="col-sm-2 control-label" for="evalTitle">평가명</label>
							<div class="col-sm-10">
								<input class="form-control" type="text" name="evalTitle"/> 
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label" for="evalCode">평가방법</label>
							<div class="col-sm-10">
								<select class="form-control" name='evalCode'>
									<option value="">----------</option>
									<option value="1500">시험</option>
									<option value="1501">과제</option>
									<option value="1502">출석</option>
									<option value="1503">기타</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="evalDate">평가일</label>
							<div class="col-sm-10">
								<input class="form-control" type="text" name="evalDate" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="evalRatio">평가비율</label>
							<div class="col-sm-10 " id="ipt_ratio" >
								<input class="form-control" type="text" name="evalRatio" placeholder="숫자만 입력해주세요"/>
								<span class="input-group-addon">%</span>	
							</div>	
						</div>
						<div class="form-group row">
							<label class="col-sm-2 control-label" for="evalDesc">설명</label>
							<div class="col-sm-10">
								<textarea class="form-control" rows="4" cols="50" name="evalDesc" id="evalDesc"></textarea>
							</div>
						</div>
					</div>
					<!-- /.modal-body -->
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary" id="save-eval">평가 생성</button>
					</div>
				</form>
				<!-- /.modal-footer -->
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
</div>
<!-- /.content-wrapper -->


<%@ include file="footer.jsp"%>
<link href='${contextPath}/resources/css/rice_evalcss.css' rel='stylesheet' />
<!-- bootstrap datepicker -->
<link rel="stylesheet" href="${contextPath}/resources/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
<!-- bootstrap datepicker -->
<script src="${contextPath}/resources/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<script src="${contextPath}/resources/api/js/moment.min.js"></script>
<script src="${contextPath}/resources/api/js/ko.js"></script>
<!-- InputMask -->
<script src="${contextPath}/resources/plugins/input-mask/jquery.inputmask.js"></script>
<script src="${contextPath}/resources/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="${contextPath}/resources/plugins/input-mask/jquery.inputmask.extensions.js"></script>

<script src="${contextPath}/resources/js/rice_tchevaljs.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		setboCode('${pageMaker.cri.boCode}');
		setboURL('${pageMaker.cri.boURL}');
		
		ipt_evalDate.datepicker({
			autoclose: true,
			locale: 'ko',
		    format: 'yyyy-mm-dd'
		});
		
		getEvalList();
		
		ipt_evalList.change(function() {
			getEvalScore(ipt_evalList.val());
		})
	});

</script>
</body>
</html>