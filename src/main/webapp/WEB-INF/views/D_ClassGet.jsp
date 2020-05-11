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
			<li><a href="#">Forms</a></li>
			<li class="active">Editors</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box box-warning">
					<div class="box-header">
						<h3 class="box-title">
							교실상세보기 <small>교실정보</small>
						</h3>

					</div>
					<!-- /.box-header -->
					<!-- bulName -->
					<div class="form-group">
						<label>ClassCode</label> <input class="form-control"
							name="ClassCode" value='<c:out value ="${class.classCode}"/>'
							readonly="readonly" />
					</div>

					<!-- bulMgr -->
					<div class="form-group">
						<label>classNumber</label> <input type="text" class="form-control"
							name=classNumber value='<c:out value ="${class.classNumber}"/>'
							readonly="readonly" />
					</div>

					<!-- bulPhoneNum -->
					<div class="form-group">
						<label>classFloorNum</label> <input type="text"
							class="form-control" name="classFloorNum"
							value='<c:out value ="${class.classFloorNum}"/>'
							readonly="readonly" />
					</div>

					<!-- bulAddress -->
					<div class="form-group">
						<label>classCapacity</label> <input type="text"
							class="form-control" name="classCapacity"
							value='<c:out value ="${class.classCapacity}"/>'
							readonly="readonly" />
					</div>

					<!-- bulClassNum -->
					<div class="form-group">
						<label>bulId</label> <input type="text" class="form-control"
							name="bulId" value='<c:out value ="${class.bulId}"/>'
							readonly="readonly" />
					</div>

					<!-- bulId -->
					<div class="form-group">
						<label>classId</label> <input type="text" class="form-control"
							name="classId" value='<c:out value ="${class.classId}"/>'
							readonly="readonly" />
					</div>

					<!-- bulRemark -->
					<div class="form-group">
						<label>classRemark</label> <input type="text" class="form-control"
							name="classRemark" value='<c:out value ="${class.classRemark}"/>'
							readonly="readonly" />
					</div>

					<button data-oper="submit" class="btn btn-primary"
						onclick="location.href='/update.do?bno=<c:out value="${class.bulId}"/>'">수정</button>

					<button data-oper="list" class="btn btn-default"
						onclick="location.href='/classMng/MngBld/classr'">뒤로가기</button>

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
</form>

<%@ include file="footer.jsp"%>
</body>
</html>