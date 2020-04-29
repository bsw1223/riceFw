/*
 * riceFw chat process javascript file
 */
var wsocket;

var memNum;
var memId;
var authId;
var chatroomId;

var chatTitle = $('.chatTitle');
var direct_chat_messages = $(".direct-chat-messages");
var friendList = $('#friendList');
var btn_makeChat = $('#btn_makeChat');

var addBtnContainer = $('.modalBtnContainer-addEvent');
var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');
var makeChatModal = $('#makeChatModal');

var tbl_chatmemInfo = $('#chatmemInfo');
var ipt_chatroomName = $("input[name='chatroomName']");
var ipt_chatroomId = $("input[name='chatroomId']");

var btn_savechat = $('#save-chat');
var btn_exitchat = $('#exit-chat');
var btn_updatechat = $('#update-chat');
var btn_enterchat = $('#enter-chat');

var div_chatroomList = $('.chatroomList');

function setmemId(val) {
	memId = val;
}

function setmemNum(val) {
	memNum = val;
}

function setauthId(val) {
	authId = val;
}

function setChatroomId(val) {
	chatroomId = val;
}


//채팅방 목록 가져오기 function
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

function appendChatroomList(data) { // ajax 로 가져온 채팅방 목록 화면에 보여주고 이벤트 달아주기
	var str = '';
	for(var i = 0; i < data.length ; i++) {
		str += '<div class="btn btn-block btn-default btn-sm '+ data[i].chatroomId +'" val="'+ data[i].chatroomId +'">' + data[i].chatroomName + '</div>'
	}
	div_chatroomList.html(str);
	
	$('.chatroomList>div').click(function(e) {
		var chatroomId = e.target.getAttribute("val")
		getChatroomInfo(chatroomId, memNum);
	});
}

//친구 목록 가져오기 function
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



btn_makeChat.click(function() {	// 채팅방 만들기 버튼 눌렀을 경우 , 선택한 멤버 정보 가져와서 modal창을 통해 보여줌
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
					tbl_chatmemInfo.html('');
					var table_str = '';
					for(var i = 0; i < data.length ; i++) {
						table_str += '<tr><th>' + data[i].memName  + '</th></tr>';
					}
					tbl_chatmemInfo.html(table_str);
					ipt_chatroomName.attr("disabled",false);
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


btn_savechat.click(function(e) {	// 채팅방 생성 DB 저장
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
						var str = '<div class="btn btn-block btn-default btn-sm '+ data +'" val="'+ data +'">' + info.chatroomName + '</div>'
						div_chatroomList.append(str);
					
						$('.chatroomList>div:last').click(function(e) {
							var val = e.target.getAttribute("val")
							getChatroomInfo(val, memNum);
						});
					}
				},
		error: function(data) {
					console.log("fail");
				}
	});	// ajax end
});


//클릭한 채팅방 정보 가져오기, 방장일 경우 아닐 경우 구분하기
function getChatroomInfo(chatroomId, loginmemNum) {
	var info ={
		memNum : loginmemNum,
		chatroomId : chatroomId
	}	
	ipt_chatroomId.val(chatroomId);
	
	$.ajax({	// 클릭한 채팅방의 정보 가져오기
		type: "post",
		async: true,
		url: "/chat/getChatroomInfo",
		data: JSON.stringify(info),
		contentType: 'application/json',
		dataType: "json",
		success: function(data) {
					tbl_chatmemInfo.html('');						
					var table_str = '';
					for(var i = 0; i < data.chatroomInfo.length ; i++) {
						table_str += '<tr><th>' + data.chatroomInfo[i].memName  + '</th></tr>';
						if(data.chatroomInfo[i].memNum == memNum) {
							ipt_chatroomName.val(data.chatroomInfo[i].chatroomName);
						}
					}
					tbl_chatmemInfo.html(table_str);
					ipt_chatroomName.attr("disabled",false);
					addBtnContainer.hide();
					modifyBtnContainer.show();
					makeChatModal.modal();
				},
		error: function(data) {
					console.log("fail");
				}
	});	// ajax end
}

btn_updatechat.click(function (e) {	// 채팅방 정보 수정하기
	var info = {
		chatroomNickname : ipt_chatroomName.val(),
		chatroomId : ipt_chatroomId.val(),
		memNum : memNum				
	}
	var btn_this_chatroom = $('.chatroomList>.'+ipt_chatroomId.val());

	$.ajax({ // 정보 수정 ajax
		type: "post",
		async: true,
		url: "/chat/updateChatroomName",
		data: JSON.stringify(info),
		contentType: 'application/json',
		dataType: "json",
		success: function(data) {
					if(data.result_msg = "1") {
						btn_this_chatroom.html(info.chatroomNickname);
						alert("채팅방 이름이 변경되었습니다");
						makeChatModal.modal('hide');
					} else {
						alert("채팅방 이름 변경에 실패했습니다.");
					}
				},
		error: function(data) {
					console.log("fail");
				}
	});	// ajax end
});

btn_exitchat.click(function (e) {	// 채팅방 나가기
	var result = confirm("정말 채팅방을 나가시겠습니까?");
	if(!result) {
		return false;
	}
	
	var info = {
		chatroomId : ipt_chatroomId.val(),
		memNum : memNum				
	}
	var btn_this_chatroom = $('.chatroomList>.'+ipt_chatroomId.val());

	$.ajax({ // ajax
		type: "post",
		async: true,
		url: "/chat/deleteMemberChat",
		data: JSON.stringify(info),
		contentType: 'application/json',
		dataType: "json",
		success: function(data) {
					if(data.result_msg = "1") {
						btn_this_chatroom.remove()
						alert("채팅방을 나갔습니다");
						makeChatModal.modal('hide');
					} else {
						alert("채팅방 나가기에 실패했습니다.");
					}
				},
		error: function(data) {
					console.log("fail");
				}
	});	// ajax end
});

//////////////////// sockjs

// 채팅방 참여 버튼 event
btn_enterchat.click(function (e) {
	var btn_chatroom = $('.chatroomList>.btn');
	var btn_this_chatroom = $('.chatroomList>.'+ipt_chatroomId.val());
	
	btn_chatroom.removeClass('btn-warning');
	btn_chatroom.addClass('btn-default');
	btn_this_chatroom.removeClass('btn-default');
	btn_this_chatroom.addClass('btn-warning');

	setChatroomId(ipt_chatroomId.val());
	chatTitle.html(ipt_chatroomName.val());
	getpastMsg();
	makeChatModal.modal('hide');
	if(wsocket == undefined || wsocket == null) { // 연결이 안되어 있을 경우에만 연결
		connect();
	} else {
		onOpen();
	}
});

// 과거 채팅방 messgae 가져오기
function getpastMsg() {
	direct_chat_messages.html('');
	var info = {
		chatroomId : chatroomId
	}
	
	$.ajax({
		type: "post",
		async: true,
		url: "/chat/getpastMsg",
		data: JSON.stringify(info),
		contentType: 'application/json',
		success: function(data) {
					for(var i = 0; i < data.length; i++) {
						appendMessage(JSON.stringify(data[i]));
					}
				},
		error: function(data) {
					console.log("fail");
				}
	});	// ajax end
}
	
function connect(target) {	// 연결 시키기 함수
	wsocket = new SockJS("/echo");
	wsocket.onopen = onOpen;
	wsocket.onmessage = onMessage;
	wsocket.onclose = onClose;	
}

function disconnect() {	// 연결 끊기 함수
	wsocket.close();
}

function onOpen(evt) {	// 연결됨
//		direct_chat_messages.html('');
	var open_msg = {
		type : 'register',
		userid : memNum,
		send_memNum : '',
		send_name : '',
//			send_msg : memId + "님이 입장했습니다",
//			send_time : moment().format('YYYY[-]MM[-]DD HH:mm'),
		send_target : chatroomId
	}
	wsocket.send(JSON.stringify(open_msg));
}

function onClose(evt) {	// 끊어짐
	var close_msg = {
		type : 'close',
		send_memNum : '',
		send_name : '',
		send_msg : memId + "님이 나갔습니다",
		send_time : moment().format('YYYY[-]MM[-]DD HH:mm')
	}
	appendMessage(JSON.stringify(close_msg));
	wsocket = null;
	console.log("연결 끊김");
}

function onMessage(evt) {	// 받음
	var data = evt.data;
	var obj = JSON.parse( evt.data );
	if(obj.send_target == chatroomId) {
		appendMessage(data);
	}
}

function send() {		// 보냄
	var send_msg = {
		type : 'chat',
		send_memNum : memNum,
		send_name : memId,
		send_msg : $("#message").val(),
		send_time : moment().format('YYYY[-]MM[-]DD HH:mm'),
		send_target : chatroomId
	}
	wsocket.send(JSON.stringify(send_msg));
	$("#message").val("");
}

function appendMessage(msg) {	// 받은 메시지 화면에 보여주기 function 
	var obj = JSON.parse( msg );
	
	if(obj.send_memNum  == memNum) {
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
		
	direct_chat_messages.append(str);
	direct_chat_messages.scrollTop(direct_chat_messages[0].scrollHeight);
}