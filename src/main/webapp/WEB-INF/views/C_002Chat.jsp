<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<style>
#chatArea {
	width: 200px;
	height: 100px;
	overflow-y: auto;
	border: 1px solid black;
}
</style>
<%@ include file="header.jsp"%>
<div class="content-wrapper" style="min-height: 901px;">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			Widgets <small>Preview page</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">Widgets</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">

		<div class="row">
			<div class="col-md-9">
				<!-- DIRECT CHAT WARNING -->
				<div class="box box-warning direct-chat direct-chat-warning">
					<div class="box-header with-border">
						<h3 class="box-title">Direct Chat</h3>

						<div class="box-tools pull-right">
							<span data-toggle="tooltip" title="" class="badge bg-yellow"
								data-original-title="3 New Messages">3</span>
							<button type="button" class="btn btn-box-tool"
								data-widget="collapse">
								<i class="fa fa-minus"></i>
							</button>
							<button type="button" class="btn btn-box-tool"
								data-toggle="tooltip" title="" data-widget="chat-pane-toggle"
								data-original-title="Contacts">
								<i class="fa fa-comments"></i>
							</button>
							<button type="button" class="btn btn-box-tool"
								data-widget="remove">
								<i class="fa fa-times"></i>
							</button>
						</div>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<!-- Conversations are loaded here -->
						<div class="direct-chat-messages">
							<!-- Message. Default to the left -->
							<div class="direct-chat-msg">
								<div class="direct-chat-info clearfix">
									<span class="direct-chat-name pull-left">Alexander
										Pierce</span> <span class="direct-chat-timestamp pull-right">23
										Jan 2:00 pm</span>
								</div>
								<!-- /.direct-chat-info -->
								<img class="direct-chat-img" src="../dist/img/user1-128x128.jpg"
									alt="Message User Image">
								<!-- /.direct-chat-img -->
								<div class="direct-chat-text">Is this template really for
									free? That's unbelievable!</div>
								<!-- /.direct-chat-text -->
							</div>
							<!-- /.direct-chat-msg -->

							<!-- Message to the right -->
							<div class="direct-chat-msg right">
								<div class="direct-chat-info clearfix">
									<span class="direct-chat-name pull-right">Sarah Bullock</span>
									<span class="direct-chat-timestamp pull-left">23 Jan
										2:05 pm</span>
								</div>
								<!-- /.direct-chat-info -->
								<img class="direct-chat-img" src="../dist/img/user3-128x128.jpg"
									alt="Message User Image">
								<!-- /.direct-chat-img -->
								<div class="direct-chat-text">You better believe it!</div>
								<!-- /.direct-chat-text -->
							</div>
							<!-- /.direct-chat-msg -->
						</div>
						<!--/.direct-chat-messages-->

						<!-- Contacts are loaded here -->
						<div class="direct-chat-contacts">
							<ul class="contacts-list">
								<li><a href="#"> <img class="contacts-list-img"
										src="../dist/img/user1-128x128.jpg" alt="User Image">

										<div class="contacts-list-info">
											<span class="contacts-list-name"> Count Dracula <small
												class="contacts-list-date pull-right">2/28/2015</small>
											</span> <span class="contacts-list-msg">How have you been? I
												was...</span>
										</div> <!-- /.contacts-list-info -->
								</a></li>
								<!-- End Contact Item -->
							</ul>
							<!-- /.contatcts-list -->
						</div>
						<!-- /.direct-chat-pane -->
					</div>
					<!-- /.box-body -->
					<div class="box-footer">
						<form action="#" method="post">
							<div class="input-group">
								<input type="text" name="message" placeholder="Type Message ..."
									class="form-control"> <span class="input-group-btn">
									<button type="submit" class="btn btn-warning btn-flat">Send</button>
								</span>
							</div>
						</form>
					</div>
					<!-- /.box-footer-->
				</div>
				<!--/.direct-chat -->
			</div>
			<!-- /.col -->

			<div class="col-md-3">
				<div class="box box-warning">
					<div class="box-header with-border">
						<h3 class="box-title">Collapsable</h3>

						<div class="box-tools pull-right">
							<button type="button" class="btn btn-box-tool"
								data-widget="collapse">
								<i class="fa fa-minus"></i>
							</button>
						</div>
						<!-- /.box-tools -->
					</div>
					<!-- /.box-header -->
					<div class="box-body">The body of the box</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
			</div>
			<!-- /.col -->

		</div>
		<!-- /.row -->

		<!-- =========================================================== -->

		이름:<input type="text" id="nickname"> <input type="button"
			id="enterBtn" value="입장"> <input type="button" id="exitBtn"
			value="나가기">

		<h1>대화 영역</h1>
		<div id="chatArea">
			<div id="chatMessageArea"></div>
		</div>
		<br /> <input type="text" id="message"> <input type="button"
			id="sendBtn" value="전송">

		<!-- =========================================================== -->


	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->
<%@ include file="footer.jsp"%>
<script src="${contextPath}/resources/api/js/sockjs-0.3.4.js"></script>
<script type="text/javascript">
	var wsocket;
	
	$(document).ready(function() {
		$('#message').keypress(function(event){
			var keycode = (event.keyCode ? event.keyCode : event.which);
			if(keycode == '13'){
				send();	
			}
			event.stopPropagation();
		});
		$('#sendBtn').click(function() { send(); });
		$('#enterBtn').click(function() { connect(); });
		$('#exitBtn').click(function() { disconnect(); });
	});
	
	function connect() {
		wsocket = new SockJS("http://localhost:8031/echo/");
		wsocket.onopen = onOpen;
		wsocket.onmessage = onMessage;
		wsocket.onclose = onClose;
	}
	
	function disconnect() {
		wsocket.close();
	}
	function onOpen(evt) {
		appendMessage("연결되었습니다.");
	}
	function onMessage(evt) {
		var data = evt.data;
		if (data.substring(0, 4) == "msg:") {
			appendMessage(data.substring(4));
		}
	}
	function onClose(evt) {
		appendMessage("연결을 끊었습니다.");
	}
	
	function send() {
		var nickname = $("#nickname").val();
		var msg = $("#message").val();
		wsocket.send("msg:"+nickname+":" + msg);
		$("#message").val("");
	}

	function appendMessage(msg) {
		$("#chatMessageArea").append(msg+"<br>");
		var chatAreaHeight = $("#chatArea").height();
		var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
		$("#chatArea").scrollTop(maxScroll);
	}

</script>
</html>