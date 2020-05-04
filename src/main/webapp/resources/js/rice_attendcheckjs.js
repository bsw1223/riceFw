/**
 * riceFw attend check process javascript file
 */

var memNum;
var currentTime;
var ipt_select = $('select');
var ipt_memEmail = $("input[name='memEmail']");
var ipt_memPwd = $("input[name='memPwd']");

var div_clock = $('#clock');
var btn_attend = $('#btn_attend');

function setmemNum(val) {
	memNum = val;
}

function printClock() {
	currentTime = moment().format('YYYY[-]MM[-]DD HH:mm:ss');
	div_clock.html("<h3>" + currentTime + "</h3>"); //날짜를 출력해 줌
    setTimeout("printClock()",500);         // 1초마다 printClock() 함수 호출
}	

//로그인 회원 수업 목록 가져오기
function getClassList( ) {
	var info = {
		memNum: memNum
	}
	
	$.ajax({
		type: "post",
		async: true,
		url: "/attend/getClassList",
		data: JSON.stringify(info),
		contentType: 'application/json',
		success: function(data) {
					if(data.ip_msg == 'false') {
						alert("출석체크를 할 수 없는 IP 입니다");
						window.location.href = '/';
					}
					var str = '';
					if(data.classList.length == 0) {
						str = '<option disabled="disabled">'+ '수강 중인 과목이 없습니다' +'</option>'
						ipt_select.append(str);
					}
					for(var i = 0 ; i < data.classList.length; i++) {
						str = '<option value="'+ data.classList[i].openclassId +'">'+ data.classList[i].openclassName +'</option>'
						ipt_select.append(str);
					}		
				},
		error: function(data) {
					console.log("fail");
				}
	});	// ajax end
}

btn_attend.click(function()  {		// 출석체크
	var info = {
		memNum : memNum,
		memEmail: ipt_memEmail.val(),
		memPwd: ipt_memPwd.val(),
		openclassId : ipt_select.val(),
		currentDate: moment().format('YYYY[-]MM[-]DD'),	// 현재 날짜
		currentTime: moment().format('HH:mm:ss'),	//	현재 시간
		currentDay: moment().day()					// 현재 요일 	0: 일, 1: 월, 2: 화. 3: 수, 4: 목, 5: 금, 6: 토
	}
	
	if(info.memEmail == '') {
		alert("이메일을 입력하세요");
		return false;
	}
	
	if(info.memPwd == '') {
		alert("비밀번호를 입력하세요");
		return false;
	}
	
	$.ajax({
		type: "post",
		async: true,
		url: "/attend/checkAttend",
		data: JSON.stringify(info),
		contentType: 'application/json',
		success: function(data) {
					if(data.check_msg == 'meminfo_false') {
						alert("잘못된 이메일, 패스워드 입니다");
					} else if(data.check_msg == 'time_false') {
						alert("해당과목 수업시간이 아닙니다.");
					} else if(data.check_msg == 'attend_false') {
						alert("출석입력 실패");
					} else {
						alert("출석입력 완료");
					}
				},
		error: function(data) {
					console.log("fail");
				}
	});	// ajax end
})