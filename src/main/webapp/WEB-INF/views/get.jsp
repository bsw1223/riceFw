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
										<input type="submit" id="insertButton" value="전송">
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
					<!-- /end row -->
					<!-- /.box-footer -->
					<div class="box-footer">
						<form action="#" method="post">
							<img class="img-responsive img-circle img-sm"
								src="/resources/dist/img/user4-128x128.jpg" alt="Alt Text">
							<!-- .img-push is used to add margin to elements next to floating images -->
							<div class="img-push">
								<input type="text" class="form-control input-sm"
									placeholder="reply">
							</div>
						</form>
					</div>
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
									str+="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
									str+="<div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>";
									str+="<small class='pull-right text-muted'>"+list[i].replyDate+"</small></div>";
									str+="<p>"+list[i].reply+"</p>";
									str+="<div class='col-md-3'><td><input type='button' style='width:40pt;height:20pt;display:inline-block;' class='btn btn-block btn-primary' value='수정'></td>";
				                	str+="<td><input type='button' style='width:40pt;height:20pt;display:inline-block;' class='btn btn-block btn-default' value='삭제'></td></div></div></li>"
								};
								replyUL.html(str);
							})
						}

						/* 	replyService.getList({bno:bnoValue, page:1, amount: 3}, function(list){
								
								for(var i = 0, len = list.length||0; i <len; i++){
									console.log(list[i]);
								}
							}) */

						/*  replyService.remove(2, function(count){
							console.log(count);
							if(count=="success"){
								alert("remove!!!!!");
							}
						},function(err){
							alert('Error!!!!');
						});  */
						/* 
						replyService.update({
							rno:2,
							bno: bnoValue,
							reply: "Modified Reply!"
						}, function(result){
							alert("수정완료");
						}); */
						
						
						$("#insertButton").on("click",function(e){
							console.log("hi");
							var reply = {
									reply: reply.val(),
									replyer: replyer.val(),
									bno: bnoValue
							};
							replyerService.add(reply, function(result){
								console.log("success");
							})
						});
						
						
					}); 	
	/* 		});
		};
	 */

</script>
<%@ include file="footer.jsp"%>
</body>
</html>