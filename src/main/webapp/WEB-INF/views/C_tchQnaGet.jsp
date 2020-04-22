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
			<li class="active">Q&A</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box box-info">
					<div class="box-header">
						<h3 class="box-title">Q&A 게시판</h3>

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
							name="memId" value='<c:out value ="${list.memId}"/>'
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
						<button type="button" class="btn btn-default btn-xs">
							<i class="fa fa-thumbs-o-up"></i>${list.boLikes}
						</button>
					</div>

					<button data-oper="list" class="btn btn-default"
						onclick="location.href='/mypage/board/${list.boCode}/${list.boURL}'">뒤로가기</button>

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
								value='<c:out value ="${list.boNum}"/>'>
							<div class="box-body">
								<div class="form-group">
									<label for="comtContent">댓글내용</label> <input class="form-control" id="comtContent" 
									name="comtContent" placeholder="comment...">
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
</form>
<script type="text/javascript"
	src="/resources/bower_components/bootstrap/comment.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						console.log("==============");
						console.log("JS TEST!!");

						var memIdValue = '<c:out value="${memId}"/>';
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
		replyService.update({comtNum: comtNum, userId: userId, comtContent: comtContent},
				function(result) {
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
		str += '<strong class="text-gray-dark" id="userId" name="userId">' + userId + '</strong>';
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

<%@ include file="footer.jsp"%>
</body>
</html>