<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%@ include file="header.jsp"%>
<div class="content-wrapper" style="min-height: 901px;">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1> Chatting </h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li class="active"> 채팅</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-md-3">
				<div class="box box-warning">
					<div class="box-header with-border">
						<h3 class="box-title">채팅방목록</h3>
					</div>
					<!-- /.box-header -->

					<div class="box-body chatroomList">
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
			</div>
			<!-- /.col -->		
	
			<div class="col-md-6">
				<!-- DIRECT CHAT WARNING -->
				<div class="box box-warning direct-chat direct-chat-warning">
					<div class="box-header with-border">
						<h3 class="box-title chatTitle"></h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<!-- Conversations are loaded here -->
						<div class="direct-chat-messages">							
						</div>
						<!--/.direct-chat-messages-->
					</div>
					<!-- /.box-body -->
					
					<div class="box-footer">
						<div class="input-group">
							<input type="text" name="message" placeholder="Type Message ..." class="form-control" id="message"> 
							<span class="input-group-btn">
								<input type="button" class="btn btn-warning btn-flat" id="sendBtn" value="전송">Send</button>
							</span>
						</div>
						<!-- ./input-group -->
					</div>
					<!-- /.box-footer-->
				</div>
				<!--/.direct-chat -->
			</div>
			<!-- /.col -->

			<div class="col-md-3">
				<div class="box box-warning">
					<div class="box-header with-border">
						<h3 class="box-title">친구 목록</h3>
					</div>
					<!-- /.box-header -->

					<div class="box-body">
						<ul class="tree" data-widget="tree" id='friendList'>
					        
					    </ul>
					</div>
					
					<div class="box-footer">
			          <button class="btn btn-block btn-warning" id="btn_makeChat">채팅방 만들기</button>
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
	
	
	<!-- 채팅방 만들고/ 방장의 경우 수정 MODAL -->
	<div class="modal fade" id="makeChatModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">채팅방</h4>
				</div>
				<!-- /.modal-header -->
				
				<div class="modal-body">
					<div class="form-group">
						<label class="col-sm-2 control-label" for="chatroomName">채팅방명</label>
						<div class="col-sm-10">
							<input class="form-control" type="text" name="chatroomName"/> 
							<input type="hidden" name="chatroomId"/> <!-- 채팅방 번호 -->
						</div>
					</div><br/><br/><br/>
					<div class="form-group">
						<label class="col-sm-2 control-label">참여자</label>
						<div class="col-sm-10">
							<table class="table table-condensed">
								<tbody id="chatmemInfo"></tbody>
							</table>
						</div>
					</div>
					
				</div>
				<!-- /.modal-body -->
				
				<div class="modal-footer modalBtnContainer-addEvent">
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-warning" id="save-chat">만들기</button>
				</div>
				<div class="modal-footer modalBtnContainer-modifyEvent">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-danger" id="exit-chat">채팅방 나가기</button>
					<button type="button" class="btn btn-info" id="update-chat">채팅방 이름변경</button>
					<button type="button" class="btn btn-warning" id="enter-chat">채팅하기</button>
				</div>
				<!-- /.modal-footer -->
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	
</div>
<!-- /.content-wrapper -->
<%@ include file="footer.jsp"%>
<link href='${contextPath}/resources/css/rice_chatcss.css' rel='stylesheet' />

<script src="${contextPath}/resources/api/js/moment.min.js"></script>
<script src="${contextPath}/resources/api/js/sockjs-0.3.4.js"></script>
<script src="${contextPath}/resources/js/rice_chatjs.js"></script>
<script type="text/javascript">
	$(document).ready(function() {	
		setmemNum('${loginMem.memNum}');
		setauthId('${loginMem.authId}');
		setmemId('${loginMem.memId}')
		
		getFriendList(memNum, authId);	// 친구목록 가져오기 ajax
		getChatroomList(memNum);		// 채팅방 목록 가져오기 ajax
		
		$('#message').keypress(function(event){
			var keycode = (event.keyCode ? event.keyCode : event.which);
			if(keycode == '13'){
				send();	
			}
			event.stopPropagation();
		});
		
		$('#sendBtn').click(function() { send(); });
// 		$('#enterBtn').click(function() { connect(); });
// 		$('#exitBtn').click(function() { disconnect(); });
	});
	
</script>
</html>