<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%@ include file="header.jsp"%>
<style>
a {
	color : #000000;
}
.treeview-menu>li>div {
	padding: 8px 5px 5px 15px;
	display: block;
	font-size:14px;
}
.treeview-menu>li>div>.fa {
	width:20px;
}
#friendList {
	list-style:none;
	padding: 5px;
}
#friendList>li {
	padding: 8px 5px 8px 5px;
}
#friendList>li>a>.fa{
	width: 20px;
}
</style>
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
						<h3 class="box-title">Direct Chat</h3>
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
			          <button class="btn btn-block btn-warning" id="makeChat">채팅방 만들기</button>
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
					<button type="button" class="btn btn-danger" id="delete-chat">채팅방삭제</button>
					<button type="button" class="btn btn-warning" id="update-chat">채팅방수정</button>
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
<script src="${contextPath}/resources/api/js/moment.min.js"></script>
<script src="${contextPath}/resources/api/js/sockjs-0.3.4.js"></script>
<script type="text/javascript">
	var memNum = '${loginMem.memNum}';
	var authId = '${loginMem.authId}';
	
	var wsocket;
	var send_target = '';
	
	var direct_chat_messages = $(".direct-chat-messages");
	var friendList = $('#friendList');
	var makeChat = $('#makeChat');
	var addBtnContainer = $('.modalBtnContainer-addEvent');
	var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');
	var makeChatModal = $('#makeChatModal');
	var tbl_chatmemInfo = $('#chatmemInfo');
	var ipt_chatroomName = $("input[name='chatroomName']");
	
	var btn_savechat = $('#save-chat');
	var btn_deletechat = $('#delete-chat');
	var btn_updatechat = $('#update-chat');
	
	var div_chatroomList = $('.chatroomList');
	
	$(document).ready(function() {	
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
	
	// 채팅방 목록 가져오기 function
	function getChatroomList(memNum) {
		if(memNum == '') {
			return false;
		}
		
		var memData = {
			memNum : memNum
		}
		
		$.ajax({
			type: "post",
			async: true,
			url: "/chat/getChatroomList",
			data: JSON.stringify(memData),
			contentType: 'application/json',
			success: function(data) {
						appendChatroomList(data);
					},
			error: function(data) {
						console.log("fail");
					}
		});	// ajax end
	}
	
	function appendChatroomList(data) {
		var str = '';
		for(var i = 0; i < data.length ; i++) {
			str += '<div class="btn btn-block btn-warning btn-sm" val="'+ data[i].chatroomId +'">' + data[i].chatroomName + '</div>'
		}
		div_chatroomList.html(str);
		
		$('.chatroomList>div').click(function(e) {
			var chatroomId = e.target.getAttribute("val")
			getChatroomInfo(chatroomId, memNum);
		});
	}
	
	// 친구 목록 가져오기 function
	function getFriendList(memNum, authId) {
		var memData = {
			memNum : memNum,
			authId: authId
		}
		
		$.ajax({
			type: "post",
			async: true,
			url: "/chat/getFriendList",
			data: JSON.stringify(memData),
			contentType: 'application/json',
			success: function(data) {
						appendFriendList(data);
					},
			error: function(data) {
						console.log("fail");
					}
		});	// ajax end
	}

	function appendFriendList(data) {	// 가져온 친구 목록 화면에 보여주기 function
		var last_classId = '';
		var str = '';
				
		for(var i = 0 ; i < data.length ; i++) {	
			if(i == 0 ) {	// 첫번째는 ul li 닫는 태그가 안들어감 
				last_classId = data[i].openclassId;
				str += '<li class="treeview"><a href="#"><i class="fa fa-book"></i><span>'
					+ data[i].openclassName + '</span></a><ul class="treeview-menu">'
					+ '<li><div><i class="fa fa-circle-o" val="'+ data[i].memNum +'"></i>'
					+ data[i].memName + '</div></li>';
			} else if(last_classId != data[i].openclassId) {	// class가 달라지는 지점
				last_classId = data[i].openclassId;
				str += '</ul></li><li class="treeview"><a href="#"><i class="fa fa-book"></i><span>'
					+ data[i].openclassName + '</span></a><ul class="treeview-menu">'
					+ '<li><div><i class="fa fa-circle-o" val="'+ data[i].memNum +'"></i>'
					+ data[i].memName + '</div></li>';
			} else{
				str += '<li><div><i class="fa fa-circle-o" val="'+ data[i].memNum +'"></i>'
					+ data[i].memName + '</div></li>';
			}	
		}
		str += '</ul></li>';
		friendList.append(str);
		
		$('.treeview-menu>li>div').click(function(event) {
			$(event.target).children().toggleClass("fa-circle-o");
			$(event.target).children().toggleClass("fa-check");
		});
	}
		
	makeChat.click(function() {	// 채팅방 만들기 버튼 눌렀을 경우 , 선택한 멤버 정보 가져와서 modal창을 통해 보여줌
		var clickDiv = $('.treeview-menu>li>div>.fa-check');
		
		if (clickDiv.length == 0) {
			alert("친구를 선택해주세요");
			return false;
		}
		var memList = [];
		var newList = [];
		var tmp;
		for(var i = 0 ; i < clickDiv.length; i++) {
			tmp = clickDiv[i].getAttribute("val");
			memList.push(tmp);
		}
		$.each(memList, function(i, el){
			if($.inArray(el, newList) === -1) newList.push(el);
		});
		
		var info = {
			memList : newList
		}
		
		$.ajax({
			type: "post",
			async: true,
			url: "/chat/getmemInfo",
			data: JSON.stringify(info),
			contentType: 'application/json',
			success: function(data) {
						var table_str = '';
						for(var i = 0; i < data.length ; i++) {
							table_str += '<tr><th>' + data[i].memName  + '</th></tr>';
						}
						tbl_chatmemInfo.html(table_str);
						ipt_chatroomName.val('');
						addBtnContainer.show();
						modifyBtnContainer.hide();
						makeChatModal.modal();
					},
			error: function(data) {
						console.log("fail");
					}
		});	// ajax end
	})
	
	btn_savechat.click(function(e) {
		var clickDiv = $('.treeview-menu>li>div>.fa-check');
		
		if (clickDiv.length == 0) {
			alert("친구를 선택해주세요");
			return false;
		}
		var memList = [];
		var newList = [];
		var tmp;
		for(var i = 0 ; i < clickDiv.length; i++) {
			tmp = clickDiv[i].getAttribute("val");
			memList.push(tmp);
		}
		$.each(memList, function(i, el){
			if($.inArray(el, newList) === -1) newList.push(el);
		});
		newList.push(memNum);	// 나도 가입 해야됨
		var info = {
			memList : newList,		// 채팅방에 추가할 멤버
			chatroomName : ipt_chatroomName.val(),
			makeMember: memNum
		}	
		
		if(info.chatroomName == '') {
			alert("채팅방명을 입력하세요");
			return false;
		}
		
		makeChatModal.modal('hide');
		
		$.ajax({	// 채팅방 생성 멤버 추가
			type: "post",
			async: true,
			url: "/chat/insertChatroom",
			data: JSON.stringify(info),
			contentType: 'application/json',
			success: function(data) {
						if(data == '0') {
							alert("채팅방 만들기에 실패했습니다.")
						} else {
							alert("새로운 채팅방을 만들었습니다.")
							var str = '<div class="btn btn-block btn-warning btn-sm" val="'+ data +'">' + info.chatroomName + '</div>'
							div_chatroomList.append(str);
						
							$('.chatroomList>div:last').click(function(e) {
								var chatroomId = e.target.getAttribute("val")
								getChatroomInfo(chatroomId, memNum);
							});
						}
					},
			error: function(data) {
						console.log("fail");
					}
		});	// ajax end
	});

	
	// 클릭한 채팅방 정보 가져오기, 방장일 경우 아닐 경우 구분하기
	function getChatroomInfo(chatroomId, memNum) {
		var info ={
			loginmemNum : memNum,
			chatroomId : chatroomId
		}
		
		$.ajax({	// 클릭한 채팅방의 정보 가져오기
			type: "post",
			async: true,
			url: "/chat/insertChatroom",
			data: JSON.stringify(info),
			contentType: 'application/json',
			success: function(data) {
						if(data == '0') {
							alert("채팅방 만들기에 실패했습니다.")
						} else {
							alert("새로운 채팅방을 만들었습니다.")
							var str = '<div class="btn btn-block btn-warning btn-sm" val="'+ data +'">' + info.chatroomName + '</div>'
							div_chatroomList.append(str);
						
							$('.chatroomList>div:last').click(function(e) {
								var chatroomId = e.target.getAttribute("val")
								getChatroomInfo(chatroomId, memNum);
							});
						}
					},
			error: function(data) {
						console.log("fail");
					}
		});	// ajax end
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	function ptopConnet(target) {	// 1:1 연결을 위해 다른 연결을 끊고 다시 연결 시키는 함수
		if(wsocket != '' && wsocket != null) {
			disconnect();
		}
		connect(target);
	}
	
	function connect(target) {	// 연결 시키기 함수
		wsocket = new SockJS("/echo");
		wsocket.onopen = onOpen;
		wsocket.onmessage = onMessage;
		wsocket.onclose = onClose;
		
		send_target = target;
	}
	
	function disconnect() {	// 연결 끊기 함수
		wsocket.close();
	}
	
	function onOpen(evt) {	// 연결됨
		direct_chat_messages.html('');
		var open_msg = {
			type : 'register',
			userid : '${loginMem.memNum}',
			send_memNum : '',
			send_name : '',
			send_msg : '${loginMem.memName}' + "님이 입장했습니다",
			send_time : moment().format('YYYY[-]MM[-]DD HH:mm')
		}
		wsocket.send(JSON.stringify(open_msg));
	}
	
	function onClose(evt) {	// 끊어짐
// 		var close_msg = {
// 			type : 'close',
// 			send_memNum : '',
// 			send_name : '',
// 			send_msg : "연결을 끊었습니다.",
// 			send_time : moment().format('YYYY[-]MM[-]DD HH:mm')
// 		}
// 		appendMessage(JSON.stringify(close_msg));
		console.log("연결 끊김");
	}
	
	function onMessage(evt) {	// 받음
		var data = evt.data;
		appendMessage(data);
		alert(data);
	}
	
	function send() {		// 보냄
		var send_msg = {
			type : 'chat',
			send_memNum : '${loginMem.memNum}',
			send_name : '${loginMem.memName}',
			send_msg : $("#message").val(),
			send_time : moment().format('YYYY[-]MM[-]DD HH:mm'),
			send_target : send_target
		}
		wsocket.send(JSON.stringify(send_msg));
		$("#message").val("");
	}
	
	function appendMessage(msg) {	// 받은 메시지 화면에 보여주기 function 
		var obj = JSON.parse( msg );
		
		if(obj.send_memNum  == '${loginMem.memNum}') {
			str = '<div class="direct-chat-msg right">'
		} else {
			str = '<div class="direct-chat-msg">'
		}
		str += '<div class="direct-chat-info clearfix">'
				+ '<span class="direct-chat-name pull-left">'
				+ obj.send_name + '</span>'
				+'<span class="direct-chat-timestamp pull-right">'
				+ obj.send_time + '</span></div>'
				+ '<div class="direct-chat-text">'
				+ obj.send_msg
				+ '</div></div>';
			
		var direct_chat_messages = $(".direct-chat-messages");
		direct_chat_messages.append(str);
		direct_chat_messages.scrollTop(direct_chat_messages[0].scrollHeight);
	}

</script>
</html>