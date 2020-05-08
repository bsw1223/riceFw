<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>

<html>

<style>
.box-body{
	background-color: white;
}
#search{
	margin:auto;
	display:flex;
}
.select{
	float:left;
	margin-left:10px;
	
}
.input-group{
	float:left;
	width: 170px;
}
.buttons{
	float:left;
	display:flex;
	
}

</style>
<body>
	
	<div class="content-wrapper">
		<section class="content-header"style="width:83%">
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
			<div class="col-md-2"></div>
				<div class="col-xs-8">
					<div class="box box-primary">
						<div class="box-header">
							<h2 class="box-title">공지사항게시판</h2>
						</div>
					<!-- /.box-header -->
					<div class="box-body">
					<form role="form">
						<!--title -->
							<div class="form-group">
								<label>제목</label> <h4><c:out value ="${list.boTitle}"/></h4>
							</div>
						<div class="form-group">
								<!-- 작성자 -->
								<span style="margin-right:20px;">
									<label>작성자 </label><span>&nbsp;&nbsp;&nbsp;<c:out value ="${list.memId}"/></span>
								</span>
								<!-- 작성일 -->
								<span style="margin:20px;">
									<label>작성일</label><span>&nbsp;&nbsp;&nbsp;<c:out value ="${list.boRegdate}"/></span>
								</span>
								<span style="margin:20px;">
									<label>조회수</label> <span>&nbsp;&nbsp;&nbsp;${list.boViews}</span>
								</span>
							</div>
							<!-- content -->
							<div class="form-group">
								<label>내용</label>
								 <textarea  class="form-control" name="boContent" rows='15' style="resize: none;"
														readonly="readonly" ><c:out value ="${list.boContent}"/></textarea>
							</div>
							<!-- content -->
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
	
						<div class="box-footer pull-right">
							<%-- <button type="button" class="btn btn-default btn-xs">
								<i class="fa fa-eye"></i> ${list.boViews}
							</button> --%>
							<button type="button" class="btn btn-default btn-xs">
								<i class="fa fa-thumbs-o-up"></i>${list.boLikes}
							</button>
							
						</div>
					</form>
					<button data-oper="list" class="btn btn-default"
						onclick="location.href='/mypage/board/${list.boCode}/${list.boURL}'">뒤로가기</button>
			<!-- /.box-footer -->
				</div>
			</div>
		</div>
		</div>
	</section>
</div>
</body>
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