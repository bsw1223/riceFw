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
		<h1>공지사항</h1>
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
						<h3 class="box-title">과목명</h3>

					</div>
					<!-- /.box-header -->
					<!-- bulName -->
					<div class="form-group">
						<label>boTitle</label> <input class="form-control" name="boTitle"
							value='<c:out value ="${docBoard.boTitle}"/>' readonly="readonly" />
					</div>

					<!-- bulMgr -->
					<div class="form-group">
						<label>boContent</label> <input type="text" class="form-control"
							name="boContent" value='<c:out value ="${docBoard.boContent}"/>'
							readonly="readonly" />
					</div>

					<!-- bulPhoneNum -->
					<div class="form-group">
						<label>boUpdateDate</label> <input type="text"
							class="form-control" name="bulPhoneNum"
							value='<c:out value ="${docBoard.boUpdateDate}"/>'
							readonly="readonly" />
					</div>
					<div class="box-body">

						<button type="button" class="btn btn-default btn-xs">
							<i class="fa fa-eye"></i>${docBoard.boViews}
						</button>
						<span class="pull-right text-muted">127 likes - 200 views</span>
					</div>

					<button data-oper="list" class="btn btn-default"
						onclick="location.href='/mypage/board/${docBoard.boCode}/${docBoard.boURL}'">뒤로가기</button>

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