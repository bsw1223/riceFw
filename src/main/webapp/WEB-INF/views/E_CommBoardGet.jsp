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
			<c:out value="${commName}" />
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#"><c:out value="${commName}" /></a></li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box box-info">
					<div class="box-header">
						<h3 class="box-title">
							<c:out value="${commName}" />
						</h3>
					</div>
					<!-- /.box-header -->
					<input class="form-control" type="hidden" name="boNum"
						value='<c:out value ="${comm.boNum}"/>' readonly="readonly" />
						<input class="form-control" type="hidden" name="commURL"
						value='<c:out value ="${comm.boURL}"/>' readonly="readonly" />
					<!--title -->
					<div class="form-group">
						<label>제목</label> <input class="form-control" name="boTitle"
							value='<c:out value ="${comm.boTitle}"/>' readonly="readonly" />
					</div>

					<!-- content -->
					<div class="form-group">
						<label>내용</label> <input type="text" class="form-control"
							name="boContent" value='<c:out value ="${comm.boContent}"/>'
							readonly="readonly" />
					</div>

					<!-- content -->
					<div class="form-group">
						<label>작성자</label> <input type="text" class="form-control"
							name="memId" value='<c:out value ="${comm.memId}"/>'
							readonly="readonly" />
					</div>

					<!-- file -->
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
							<i class="fa fa-eye"></i> ${comm.boViews}
						</button>
						<button type="button" class="btn btn-default btn-xs" id="rec_update">
							<%-- <i class="fa fa-thumbs-o-up"></i>${comm.boLikes} --%>
						</button>
					</div>
					<button data-oper="submit" class="btn btn-primary"
						onclick="location.href='/comm/mdfyForm/${comm.boURL}?boNum=<c:out value="${comm.boNum}"/>'">수정</button>
					<button data-oper="submit" class="btn btn-primary"
						onclick="location.href='/comm/listdelete/${comm.boURL}?boNum=<c:out value="${comm.boNum}"/>'">삭제</button>
					<button data-oper="list" class="btn btn-default"
						onclick="location.href='/comm/${comm.boURL}'">뒤로가기</button>

					<!-- /.box-footer -->

					<div class="col-lg-12">
						<!-- PANEL -->
						<div class="box box-priamry">
							<div class="box-header with-border">
								<i class="fa fa-fw fa-comments"></i>
								<h3 class="box-title">댓글작성</h3>
							</div>
							<form>
								<input type="hidden" id='boNum' name='boNum'
									value='<c:out value ="${comm.boNum}"/>'>
								<div class="box-body">
									<div class="form-group">
										<label for="comtContent">댓글내용</label> <input
											class="form-control" id="comtContent" name="comtContent"
											placeholder="comment...">
									</div>
									<div class="form-group">
										<label for="userId">댓글 작성자</label> <input class="form-control"
											id="userId" name="userId" value='<c:out value ="${memId}"/>'
											readonly="readonly">
									</div>
									<input type="button" id="insertButton" value="전송"
										onclick="replysubmit()" />
								</div>
							</form>

						</div>
					</div>
					<div class='row'>
						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading">
									<i class="fa fa-comments fa-fw"></i>Reply
								</div>

								<div class="panel-body">
									<ul class='chat'>

									</ul>
								</div>
							</div>

						</div>
					</div>
					<!-- /.box -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
	</section>
	<!-- /.content -->
</div>

<script type="text/javascript"
	src="/resources/bower_components/bootstrap/comment.js"></script>
	
<script>
	$(document).ready(function(){
		 window.onload = function(){
			var boNum = '<c:out value="${comm.boNum}"/>';
			var btn = $('#rec_update');
			console.log(boNum);
			$.ajax({
				async : true,
				type : "POST",
				url : '/comm/likeCheck',
				data : boNum,
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					if (data == '1') { 
						btn.html("<i id = 'a' class='fa fa-thumbs-up' value='1'></i>${comm.boLikes}")
					} else if (data == '0') { 
						btn.html("<i id = 'a' class='fa fa-thumbs-o-up' value='0'></i>${comm.boLikes}")
					}
				},
				error : function(e) {
					console.log("error : " + e);
				}
		})
	}; 
	$(document).on('click', '#rec_update', function() {
		//만약에 i태그의 클래스 값이 빈 손이면 like 함수 꽉찬 손이면 delLike함수를 타도록 함.
		var boNum = '<c:out value="${comm.boNum}"/>';
		var likeVal = $("#a").attr("value");
		console.log("likeVal : "+likeVal)
		 if(likeVal == '0'){
			like_page(boNum);
		}else{
			delLike_page(boNum);
		} 

	});
	
	function like_page(boNum){
		
		var str = $(this);
		console.log("click");
		$.ajax({
			url : "/comm/like",
			method : "POST",
			data : boNum,
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				str.html("<i class='fa fa-thumbs-up'></i>${comm.boLikes}");
				location.reload();
			}

		});
	}
	function delLike_page(boNum){
		var str = $(this);
		console.log("delclick");
		$.ajax({
			url : "/comm/delLike",
			method : "POST",
			data :boNum,
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				console.log(data);
				str.html("<i class='fa fa-thumbs-o-up'></i>${comm.boLikes}")
				location.reload();
			}

		});
	}
});
</script>
<script type="text/javascript">
	$(document).ready(
					function() {
						console.log("==============");
						console.log("JS TEST!!");

						var memIdValue = '<c:out value="${memId}"/>';
						var boNumValue = '<c:out value="${comm.boNum}"/>';
						var replyUL = $(".chat");

						showList(1, 10);

						function showList(page, amount) {
							replyService.getList({
												boNum : boNumValue,
												memId : memIdValue,
												page : page || 1,
												amount : amount || 10},
											function(list) {
												var str = "";
												if (list == null|| list.length == 0) {
													replyUL.html("작성된 댓글이 없습니다.");

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
														str += '<a href="javascript:void(0)" onclick="fn_editReply('
																+ list[i].comtNum
																+ ', \''
																+ list[i].userId
																+ '\', \''
																+ list[i].comtContent
																+ '\' )" style="padding-right:5px">수정</a>';
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

	function replyremove() {
		var comtNum = $('input#comtNum').attr("value");
		replyService.remove(comtNum, function(result) {
			location.reload();
		});
	}

	function replymodify() {
		var comtNum = $('#comtNum').val();
		var userId = $('#userId').val();
		var comtContent = $('textarea#comtContent').val();
		replyService.update({
			comtNum : comtNum,
			userId : userId,
			comtContent : comtContent
		}, function(result) {
			alert("수정되었습니다.");
			location.reload();
		});
	}

	function fn_editReply(comtNum, userId, comtContent) {
		var str = "";

		str += '<div class="media text-muted pt-3" id="comtNum' + comtNum + '">';
		str += '<input type="hidden" value = "'+comtNum+'" name="comtNum" id="comtNum">';
		str += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
		str += '<span class="d-block">';
		str += '<strong class="text-gray-dark" id="userId" name="userId">'
				+ userId + '</strong>';
		str += '<span style="padding-left: 7px; font-size: 9pt">';
		str += '<a href="javascript:void(0)" onClick="replymodify()" style="padding-right:5px">저장</a>';
		str += '<a href="javascript:void(0)" onClick="showList(1, 10)">취소<a>';
		str += '</span>';
		str += '</span>';
		str += '<textarea name="comtContent" id="comtContent" class="form-control" rows="3">';
		str += comtContent;
		str += '</textarea>';
		str += '</p>';
		str += '</div>';
		$('#comtNum').replaceWith(str);

		$('#comtNum' + comtNum + ' #comtContent').focus();

	}
</script>


<script>
	$(document).ready(function() {
		(function() {
					var boNum = '<c:out value="${comm.boNum}"/>';
					$.getJSON("/comm/getAttachList",{
											boNum : boNum
											},
											function(arr) {
												var str = "";
												$(arr).each(function(i,attach) {
														str += "<li";
														str += " data-path='"+attach.filePath+"' data-classfilenum='"+attach.classFileNum+"'data-filename='"+attach.fileName+"' data-type='"+attach.fileCode;
														str +="' data-size='"+attach.fileSize+"' data-savefilename='"+attach.saveFileName+"' data-boNum=${list.boNum}><div>";
														str += "<span>"+ attach.fileName+ "</span>";
														str += "</div>"
														str += "</li>";
																});
												$(".uploadResult ul").html(str);
											});
						})();

						$(".uploadResult").on("click","li",function(e) {
											var liObj = $(this);
											var str = "";
											str += "<input type='hidden' name='fileName' value='"+ liObj.data("filename")+ "'>";
											str += "<input type='hidden' name='filePath' value='"+ liObj.data("path") + "'>";
											str += "<input type='hidden' name='classFileNum' value='"+ liObj.data("classfilenum")+ "'>";
											str += "<input type='hidden' name='bonum' value='"+ liObj.data("bonum")+ "'>";
											$(".uploadResult li").append(str).submit();

											var path = encodeURIComponent(liObj.data("path")+ "\\"+ liObj.data("classfilenum")+ "_"+ liObj.data("filename"));

											self.location = "/comm/download?fileName="+ path;

										});
					});
</script>

<%@ include file="footer.jsp"%>
</body>
</html>