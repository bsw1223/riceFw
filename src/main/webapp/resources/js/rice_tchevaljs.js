/**
 * riceFw tch_eval process javascript file
 */

var boCode;
var boURL;

var evalModal = $('#evalModal');
var btn_addEval = $('#add-eval');
var btn_saveEval = $('#save-eval');
var ipt_evalTitle = $("input[name='evalTitle']");
var ipt_evalCode = $("select[name='evalCode']");
var ipt_evalDate = $("input[name='evalDate']");
var ipt_evalRatio = $("input[name='evalRatio']");
var ipt_evalDesc = $("#evalDesc");

var ipt_evalList = $("select[name='evalList']");
var tbl_scoreList = $('#scoreList');

var btn_saveScore = $('#save-score');

function setboCode(val) {
	boCode = val;
}

function setboURL(val) {
	boURL = val;
}

function getEvalScore(id) {		// 선택된 평가 점수 입력 학생 리스트 불러오기
	var info = {
		openclassId: boURL,
		evalId: id
	}
	
	$.ajax({
		type: "post",
		async: true,
		url: "/eval/getEvalScore",
		data: JSON.stringify(info),
		contentType: 'application/json',
		success: function(data) {
					appendScore(data);
				},
		error: function(data) {
					console.log("fail");
				}
	});	// ajax end
}

function appendScore(data) {	// 학생 점수 리스트 데이터 화면에 보여주기
	tbl_scoreList.html('');
	var str;
	for(var i = 0 ; i < data.length; i++) {
		str = '<tr><td>' + data[i].memNum +'</td>'
			+ '<td>'+ data[i].memName + '</td>'
			+ '<td><input type="text" name="score" value="' +data[i].evalScore +'"/></td>'
			+ '<input type="hidden" name="enrId" value="'+data[i].enrId +'"/>'
			+ '<input type="hidden" name="evalId" value="'+data[i].evalId +'"/>'
		tbl_scoreList.append(str);
	}
	
	if(data.length == 0) {
		btn_saveScore.hide();
	} else {
		btn_saveScore.show();
	}
}

btn_saveScore.click(function() {	// 입력한 점수 화면에 보여주기 버튼
	var ratio_re = RegExp(/^([0-9]{1}|[0-9]{2}|100)$/);

	var ipt_scorelist = $('input[name="score"]');
	var ipt_enrIdlist = $('input[name="enrId"]');
	var ipt_evalIdlist = $('input[name="evalId"]');
	var info = [];
	
	for(var i = 0 ; i < ipt_scorelist.length; i++) {
		var tmp_map = {
			evalScore : ipt_scorelist.eq(i).val(),
			enrId: ipt_enrIdlist.eq(i).val(),
			evalId: ipt_evalIdlist.eq(i).val()
		}
		
		if( !(ratio_re.test(tmp_map.evalScore)) ) {
			alert('점수는 0~100 숫자로 입력해주세요');
			return false;
		}
		
		info.push(tmp_map);
	}

	$.ajax({
		type: "post",
		async: true,
		url: "/eval/updateScore",
		data: JSON.stringify(info),
		contentType: 'application/json',
		success: function(data) {
					if(data.update_msg == '1') {
						alert('점수가 저장되었습니다');
					} else if(data.update_msg == '0') {
						alert("점수 저장에 실패했습니다");
					}
				},
		error: function(data) {
					console.log("fail");
				}
	});	// ajax end
});

btn_addEval.click(function () {		// 평가추가 버튼
	$("input").val('');
	ipt_evalCode.val('');
	ipt_evalDesc.val('');
	
	evalModal.modal();
});

btn_saveEval.click(function() {		// 평가 생성 모달 버튼
	var ratio_re = RegExp(/^([0-9]{1}|[0-9]{2}|100)$/);	// 0~100 숫자
	var info = {
		evalTitle: ipt_evalTitle.val(),
		evalCode: ipt_evalCode.val(),
		evalDate: ipt_evalDate.val(),
		evalRatio: ipt_evalRatio.val(),
		evalDesc: ipt_evalDesc.val(),
		openclassId: boURL
	}
	
	if(info.evalTitle == '') {
		alert('평가명을 입력해주세요');
		return false;
	}
	
	if(info.evalCode == '' || info.evalCode == undefined) {
		alert('평가방법을 선택해주세요');
		return false;
	}
	
	if( !(ratio_re.test(info.evalRatio)) ) {
		alert('평가비율은 0~100 숫자로 입력해주세요');
		return false;
	}
	
	$.ajax({
		type: "post",
		async: true,
		url: "/eval/insertEval",
		data: JSON.stringify(info),
		contentType: 'application/json',
		success: function(data) {
					if(data.insert_msg == '1') {
						alert('새로운 평가가 등록되었습니다');
						window.location.href = '/mypage/board/'+boCode+'/'+boURL;
					} else if(data.insert_msg == '0') {
						alert("평가 등록에 실패했습니다");
					}
				},
		error: function(data) {
					console.log("fail");
				}
	});	// ajax end
});

function getEvalList() {		// 평가 list 불러오기
	var info = {
		openclassId : boURL
	}
	
	$.ajax({
		type: "post",
		async: true,
		url: "/eval/getEvalList",
		data: JSON.stringify(info),
		contentType: 'application/json',
		success: function(data) {
					for(var i = 0 ; i < data.length; i++) {
						var str = '<option value="'+ data[i].evalId +'">'+ data[i].evalTitle +'</option>'
						ipt_evalList.append(str);
					}
				},
		error: function(data) {
					console.log("fail");
				}
	});	// ajax end
}