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
				<form role="form">
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
							name="memId" value='<c:out value ="${list.memId}"/>'
							readonly="readonly" />
					</div>
					<input type="hidden" value='<c:out value ="${list.boNum}"/>'>
					
					<div class="row">
						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading">Files</div>
								
								<div class="panel-body">
									<div class="uploadResult">
										<ul>
										
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="box-body">
						<button type="button" class="btn btn-default btn-xs">
							<i class="fa fa-eye"></i> ${list.boViews}
						</button>
						<button type="button" class="btn btn-default btn-xs">
							<i class="fa fa-thumbs-o-up"></i>${list.boLikes}
						</button>
					</div>
				</form>
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

<script>
$(document).ready(function(){

	(function(){
		var boNum = '<c:out value="${list.boNum}"/>';
		$.getJSON("/mypage/board/getAttachList",{boNum:boNum}, function(arr){
			console.log(arr);
			var str ="";
			
			$(arr).each(function(i,attach){
				str += "<li";
				str += " data-path='"+attach.filePath+"' data-classfilenum='"+attach.classFileNum+"'data-filename='"+attach.fileName+"' data-type='"+attach.fileCode;
				str +="' data-size='"+attach.fileSize+"' data-savefilename='"+attach.saveFileName+"' data-boNum=${list.boNum}><div>";
				str += "<span>" + attach.fileName+ "</span>";
				str += "</div>"
				str + "</li>";
			});
			$(".uploadResult ul").html(str);
		});
	})();	
	
	$(".uploadResult").on("click","li",function(e){
		
		console.log("view image");
		
		var liObj=$(this);
		
		 var str ="";
		str += "<input type='hidden' name='fileName' value='"+liObj.data("filename")+"'>";
		str += "<input type='hidden' name='filePath' value='"+liObj.data("path")+"'>";
		str += "<input type='hidden' name='classFileNum' value='"+liObj.data("classfilenum")+"'>";
		str += "<input type='hidden' name='bonum' value='"+liObj.data("bonum")+"'>";
		$(".uploadResult li").append(str).submit(); 
		
		var path = encodeURIComponent(liObj.data("path")+"\\"+liObj.data("classfilenum")+"_"+liObj.data("filename"));
		
		self.location="/mypage/board/download?fileName="+path;
		
	});
});
</script>
<%@ include file="footer.jsp"%>
</body>
</html>