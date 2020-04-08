<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<html>
<head>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			Text Editors <small>Advanced form element</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#">건물</a></li>
			<li class="active">건물관리</li>
		</ol>
	</section>


	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box box-info">
					<div class="box-header">
						<h3 class="box-title">
							건물상세보기 <small>건물정보</small>
						</h3>

					</div>
					<!-- /.box-header -->
					<!-- bulName -->
					<div class="form-group">
						<label>bulName</label> <input class="form-control" name="bulName"
							value='<c:out value ="${building.bulName}"/>' readonly="readonly" />
					</div>

					<!-- bulMgr -->
					<div class="form-group">
						<label>bulMgr</label> <input type="text" class="form-control"
							name="bulMgr" value='<c:out value ="${building.bulMgr}"/>'
							readonly="readonly" />
					</div>

					<!-- bulPhoneNum -->
					<div class="form-group">
						<label>bulPhoneNum</label> <input type="text" class="form-control"
							name="bulPhoneNum"
							value='<c:out value ="${building.bulPhoneNum}"/>'
							readonly="readonly" />
					</div>

					<!-- bulAddress -->
					<div class="form-group">
						<label>bulAddress</label> <input type="text" class="form-control"
							name="bulAddress"
							value='<c:out value ="${building.bulAddress}"/>'
							readonly="readonly" />
					</div>

					<!-- bulClassNum -->
					<div class="form-group">
						<label>bulClassNum</label> <input type="text" class="form-control"
							name="bulClassNum"
							value='<c:out value ="${building.bulClassNum}"/>'
							readonly="readonly" />
					</div>

					<!-- bulId -->
					<div class="form-group">
						<label>bulClassNum</label> <input type="text" class="form-control"
							name="bulId" value='<c:out value ="${building.bulId}"/>'
							readonly="readonly" />
					</div>

					<!-- bulRemark -->
					<div class="form-group">
						<label>bulRemark</label> <input type="text" class="form-control"
							name="bulRemark" value='<c:out value ="${building.bulRemark}"/>'
							readonly="readonly" />
					</div>

					<button data-oper="submit" class="btn btn-primary"
						onclick="location.href='/update.do?bno=<c:out value="${building.bulId}"/>'">수정</button>

					<button data-oper="list" class="btn btn-default"
						onclick="location.href='/classMng/MngBld/Bld'">뒤로가기</button>

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
</head>



<%@ include file="footer.jsp"%>
</body>
</html>