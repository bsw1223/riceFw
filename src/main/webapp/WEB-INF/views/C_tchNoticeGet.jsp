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
			<c:out value='${sjctName}' />
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#"><c:out value='${sjctName}' /></a></li>
			<li class="active">공지사항</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box box-info">
					<div class="box-header">
						<h3 class="box-title">공지사항게시판</h3>

					</div>
					<!-- /.box-header -->

					<!--title -->
					<div class="form-group">
						<label>제목</label> <input class="form-control" name="boTitle"
							value='<c:out value ="${list.boTitle}"/>' readonly="readonly" />
					</div>

					<!-- content -->
					<div class="form-group">
						<label>내용</label> <input type="text" class="form-control"
							name="boContent" value='<c:out value ="${list.boContent}"/>'
							readonly="readonly" />
					</div>

					<!-- content -->
					<div class="form-group">
						<label>작성자</label> <input type="text" class="form-control"
							name="memName" value='<c:out value ="${list.memName}"/>'
							readonly="readonly" />
					</div>

					<!-- file -->
					<%-- 	<div class="form-group">
						<label>첨부파일</label> <input type="text" class="form-control" 
						name="classFloorNum" value='<c:out value ="${list.fileName}"/>'
							readonly="readonly" />
					</div> --%>

					<div class="box-body">
						<button type="button" class="btn btn-default btn-xs">
							<i class="fa fa-eye"></i> ${list.boViews}
						</button>
					</div>

					<button data-oper="submit" class="btn btn-primary"
						onclick="location.href='/mypage/board/mdfyForm/${list.boCode}/${list.boURL}?boNum=<c:out value="${list.boNum}"/>'">수정</button>
					<button data-oper="submit" class="btn btn-primary"
						onclick="location.href='/mypage/board/dlt/${list.boCode}/${list.boURL}?boNum=<c:out value="${list.boNum}"/>'">삭제</button>
					<button data-oper="list" class="btn btn-default"
						onclick="location.href='/mypage/board/${list.boCode}/${list.boURL}'">뒤로가기</button>

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