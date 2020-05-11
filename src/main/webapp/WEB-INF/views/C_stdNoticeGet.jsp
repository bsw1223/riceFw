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

#nav{
	border:1px;
	border-left:0px;
	border-right:0px;
	border-color:#e0e0e0;
	border-style:solid;
	padding:5px;
	background-color:#f5f5f5;

}
#boContent{
	resize: none;
	background-color:#FFFFFF;
	border:0px;
}
#boTitle{
	font-size:1.4em;
	
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

@media screen and (max-width: 1700px){
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
<body>
	<div class="content-wrapper">
		<section class="content-header"style="width:83%">
			<div class="col-md-2" style="margin: 20px;"></div>
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
				<div class="col-md-2">
					<div id="banner_left">
						<img id="pp" src="">
						<%@ include file="left_banner1.jsp"%>
					</div>
					<div>
						<%@ include file="left_banner2.jsp"%>
					</div>
				</div>
				<div class="col-xs-8">
					<div class="box box-warning">
						<div class="box-header">
							<h2 class="box-title">공지사항게시판</h2>
						</div>
					<!-- /.box-header -->
					<div class="box-body">
					<form role="form">
						<!--title -->
						<div class="form-group" id='boTitle'>
							<c:out value ="${list.boTitle}"/>
						</div>
						<div class="form-group" id="nav">
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
							 <textarea  class="form-control" name="boContent" id="boContent"rows='15' 
										readonly="readonly" ><c:out value ="${list.boContent}"/></textarea>
						</div>
							<!-- /content -->
						<input type="hidden" value='<c:out value ="${list.boNum}"/>'>
						<div class="panel panel-default">
							<div class="panel-heading">Files</div>
								<div class="panel-body">
									<div class="uploadResult">
										<ul></ul>
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
			<div id="banner">
				<%@ include file="banner.jsp"%>
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