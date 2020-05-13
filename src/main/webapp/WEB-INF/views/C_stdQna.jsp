<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous">
</script>

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

</style>


<body>
	
	<div class="content-wrapper">
		<section class="content-header">
			<h1>
				<c:out value='${sjctName}' />
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li><a href="#"><c:out value='${sjctName}' /></a></li>
				<li class="active">QnA 게시판</li>
			</ol>
		</section>

		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-md-2"></div>
					<div class="col-md-8">
						<div class="box box-warning">
							<div class="box-header">
								<h2 class="box-title">QnA 게시판</h2>
							</div>
							<!-- /box-header -->
							<div class="box-body">
							<!--title -->
							<div class="form-group" id='boTitle'>
								<c:out value ="${list.boTitle}"/>
							</div>
							
							<div class="form-group"id="nav">
								<!-- 작성자 -->
								<span style="margin-right:20px;">
									<label>작성자 </label><span>&nbsp;&nbsp;&nbsp;<c:out value ="${list.memId}"/></span>
								</span>
								<!-- 작성일 -->
								<span style="margin:20px;">
									<label>작성일</label><span>&nbsp;&nbsp;&nbsp;<c:out value ="${list.boRegdate}"/></span>
								</span>
								<!-- 업데이트 날짜 -->
								<span style="margin:20px;">
									<label>업데이트 날짜</label><span>&nbsp;&nbsp;&nbsp;<c:out value ="${list.boUpdateDate}"/></span>
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
							<!-- files -->
							<div class="panel panel-default">
								<div class="panel-heading">Files</div>
									<div class="panel-body">
										<div class="uploadResult">
											<ul></ul>
										</div>
									</div>
							</div>
							<div class="box-footer">
								<button data-oper="list" class="btn btn-default"
										onclick="location.href='/mypage/board/${list.boCode}/${list.boURL}'">뒤로가기</button>
								<div class="panel-heading">
									<i class="fa fa-comments fa-fw"></i>Reply
								</div>
								<div class="panel-body">
									<ul class='chat'></ul>
								</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
</head>
<script type="text/javascript"
	src="/resources/bower_components/bootstrap/comment.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						console.log("==============");
						console.log("JS TEST!!");

						var memIdValue = '<c:out value="${list.memId}"/>';
						var boNumValue = '<c:out value="${list.boNum}"/>';
						var replyUL = $(".chat");

						showList(1, 10);

						function showList(page, amount) {
							replyService.getList(
											{
												boNum : boNumValue,
												memId : memIdValue,
												page : page || 1,
												amount : amount || 10
											},
											function(list) {
												var str = "";
												if (list == null
														|| list.length == 0) {
													replyUL
															.html("작성된 댓글이 없습니다.");

													return "";
												}
												for (var i = 0, len = list.length || 0; i < len; i++) {
													str += "<li class='left clearfix' data-comtNum='"+list[i].comtNum+"'name='comtNum' id='comtNum'>";
													str += "<div><div class='header'><strong class='primary-font' id='userId'>"
															+ list[i].userId
															+ "</strong>";
													str += "<small class='pull-right text-muted' id='comtRegdate'>"
															+ list[i].comtRegdate
															+ "</small></div>";
													str += "<p id='comtContent' name='comtContent'>"
															+ list[i].comtContent
															+ "</p>";
													if (list[i].userId == memIdValue) {
														str += "<input type = 'hidden' name='comtNum' id='comtNum' value='"+list[i].comtNum+"'>";												
														str += '<a href="javascript:void(0)" onclick="fn_editReply(' + list[i].comtNum + ', \'' + list[i].userId + '\', \'' + list[i].comtContent + '\' )" style="padding-right:5px">수정</a>';
														str += '<a href="javascript:void(0)" onclick="replyremove()" >삭제</a></div></div>';
													}
													str += "</li>";
												}
												;
												replyUL.html(str);
											})
						}

					});

	function replysubmit() {
		replyService.add({
			comtContent : $('input#comtContent').val(),
			userId : $('input#userId').val(),
			boNum : $('input#boNum').val()
		}, function(result) {
			if (comtContent == '') {
				return false;
			} else {
				location.reload();
			}
		});

	};

</script>
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


<%@ include file="footer.jsp"%>
</body>
</html>