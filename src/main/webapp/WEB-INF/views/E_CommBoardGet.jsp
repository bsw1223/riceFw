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
				<div class="box box-info">
					<div class="box-header">
						<h3 class="box-title">커뮤니티명</h3>

					</div>
					<!-- /.box-header -->
					<!-- bulName -->
					<div class="form-group">
						<label>제목</label> <input class="form-control" name="boTitle"
							value='<c:out value ="${comm.boTitle}"/>' readonly="readonly" />
					</div>

					<!-- bulMgr -->
					<div class="form-group">
						<label>내용</label> <input type="text" class="boContent"
							name=boContent value='<c:out value ="${comm.boContent}"/>'
							readonly="readonly" />
					</div>

					<!-- bulPhoneNum -->
					<div class="form-group">
						<label>boViews</label> <input type="text" class="form-control"
							name="boViews" value='<c:out value ="${comm.boViews}"/>'
							readonly="readonly" />
					</div>

					<!-- bulAddress -->
					<div class="form-group">
						<label>boLikes</label> <input type="text" class="form-control"
							name="boLikes" value='<c:out value ="${comm.boLikes}"/>'
							readonly="readonly" />
					</div>

					<button data-oper="submit" class="btn btn-primary"
						onclick="location.href='/viewupdate?boNum=<c:out value="${comm.boNum}"/>'">수정</button>

					<button data-oper="list" class="btn btn-default"
						onclick="location.href='/comm/writingslist'">뒤로가기</button>

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