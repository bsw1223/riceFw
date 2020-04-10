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
						<h3 class="box-title">
							글보기 <small>커뮤니티명</small>
						</h3>

					</div>
					<!-- /.box-header -->

					<!-- bno -->
					<div class="form-group">
						<label>bno</label> <input class="form-control" name="bno"
							value='<c:out value ="${board.bno}"/>' readonly="readonly" />
					</div>

					<!-- title -->
					<div class="form-group">
						<label>Title</label> <input type="text" class="form-control"
							name="title" value='<c:out value ="${board.title}"/>'
							readonly="readonly" />
					</div>

					<!-- contents -->
					<div class="form-group">
						<label>Content</label>
						<textarea class="form-control" rows="3" name="content"
							readonly="readonly">
						<c:out value="${board.content}" escapeXml="false" />
						</textarea>
					</div>

					<!-- writer -->
					<div class="form-group">
						<label>Writer</label><input class="form-control" name="writer"
							value='<c:out value ="${board.writer}"/>' readonly="readonly" />
					</div>

					<button data-oper="submit" class="btn btn-primary"
						onclick="location.href='/update.do?bno=<c:out value="${board.bno}"/>'">수정</button>

					<button data-oper="list" class="btn btn-default"
						onclick="location.href='/board.do'">뒤로가기</button>

					<!-- /.box-footer -->
				</div>
				<div class="col-md-12">
					<!-- Box Comment -->
					<div class="box box-widget">
						<div class="box-header with-border">

							<div class="box-tools">
								<button type="button" class="btn btn-box-tool"
									data-toggle="tooltip" title="Mark as read">
									<i class="fa fa-circle-o"></i>
								</button>
								<button type="button" class="btn btn-box-tool"
									data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
								<button type="button" class="btn btn-box-tool"
									data-widget="remove">
									<i class="fa fa-times"></i>
								</button>
							</div>
							<!-- /.box-tools -->
						</div>
						<!-- /.box-header -->
						<div class="box-body"></div>
						<!-- /.box-body -->

						<div class="col-lg-12">
							<!-- PANEL -->
							<div class="box box-priamry">
								<div class="box-header with-border">
									<i class="fa fa-fw fa-comments"></i>
									<h3 class="box-title">댓글작성</h3>
								</div>
								<form>
									 <input type="hidden" id='bno' name='bno' value='<c:out value ="${board.bno}"/>'>
									<div class="box-body">
										<div class="form-group">
											<label for="reply">댓글내용</label> <input class="form-control"
												id="reply" name="reply" placeholder="reply...">
										</div>
										<div class="form-group">
											<label for="replyer">댓글 작성자</label> <input
												class="form-control" id="replyer" name="replyer"
												placeholder="replyer">
										</div>
										<input type="button" id="insertButton" value="전송" onclick="replysubmit()">
								</form>

							</div>
							<div class="box-footer">
								<ul id="replies">

								</ul>
							</div>
							<div class="box-footer">
								<div class="text-center">
									<ul class="pagination pagination-sm no-margin">

									</ul>
								</div>
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
<form id='openForm' action="/modify.do" method="get">
	<input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
	<input type='hidden' id='page' name='page' value='<c:out value="${cri.page}"/>'>
	<input type='hidden' id='amount' name='amount' value='<c:out value="${cri.amount}"/>'>
	<input type='hidden' id='keyword' name='keyword' value='<c:out value="${cri.keyword}"/>'>
	<input type='hidden' id='type' name='type' value='<c:out value="${cri.type}"/>'>
</form>

<script type="text/javascript"
	src="/resources/bower_components/bootstrap/reply.js"></script>
<script type="text/javascript">
	$(document).ready(
					function() {
						console.log("==============");
						console.log("JS TEST!!");

						var bnoValue = '<c:out value="${board.bno}"/>';
						var replyUL =$(".chat");
						
						showList(1,10);
						
						function showList(page, amount){
							replyService.getList({bno:bnoValue, page: page||1, amount: amount||10}, function(list){
								var str="";
								if(list==null||list.length==0){
									replyUL.html("");
									
									return "";
								}
								for(var i=0, len=list.length||0; i <len ; i++){
									str+="<li class='left clearfix' data-rno='"+list[i].rno+"'name='rno' id='rno'>";
									str+="<div><div class='header'><strong class='primary-font' id='replyer'>"+list[i].replyer+"</strong>";
									str+="<small class='pull-right text-muted' id='replyDate'>"+list[i].replyDate+"</small></div>";
									str+="<p id='reply'>"+list[i].reply+"</p>";
									str+="<div class='col-md-3'><td><input type='button' style='width:40pt;height:20pt;display:inline-block;' class='btn btn-block btn-primary' value='수정' id='modify' onclick='replymodify()'></td>";
				                	str+="<td><input type='button' style='width:40pt;height:20pt;display:inline-block;' class='btn btn-block btn-default' value='삭제' id='remove' onclick='replyremove()'></td></div></div></li>"
								};
								replyUL.html(str);
							})
						}
						
					}); 	
function replysubmit(){
	replyService.add(
			
			{reply:$('input#reply').val(),replyer:$('input#replyer').val(),bno:$('input#bno').val()},
			function(result){
			location.reload();
	});
	
};

function replyremove(){
	var rno = $('li#rno').data("rno");
	replyService.remove(rno,function(result){
		location.reload();
	});
}

function replymodify(){
	var str="";
	var rno = $('li#rno').data("rno");
 	replyService.get(rno, function(result){
 	})
}

</script>
<%@ include file="footer.jsp"%>
</body>
</html>