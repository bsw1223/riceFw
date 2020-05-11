<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<html>
<head>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<section class="content-header">
		<h1>
			<c:out value='${sjctName}' />
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#"><c:out value='${sjctName}' /></a></li>
			<li class="active">스터디</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-md-2"></div>
				<div class="col-md-8">
					<div class="box box-warning">
						<div class="box-body">
							<h3 class="box-title">스터디 게시판</h3>
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
							<!-- file -->				
							<div class="panel panel-default">
								<div class="panel-heading">Files</div>
									<div class="panel-body">
									<div class="uploadResult">
											<ul></ul>
										</div>
									</div>
							</div>
							<!-- box-footer -->
							<div class="box-footer">
							<button data-oper="list" class="btn btn-default"
									onclick="location.href='/mypage/board/${list.boCode}/${list.boURL}'">뒤로가기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
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
			console.log(str);
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
<!--댓글필요  -->
<%@ include file="footer.jsp"%>
</body>
</html>