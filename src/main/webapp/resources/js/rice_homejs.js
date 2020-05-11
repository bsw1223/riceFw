/**
 * riceFw home process javascript file
 */

var memNum;
var memName;
var authId;
var authName;

var eventStart = $("input#eventStart");
var eventEnd = $("input#eventEnd");
var eventAllday = $("input#eventAllday");
var iEventStart= $("input#iEventStart");
var iEventEnd= $("input#iEventEnd");

var ul_todayClass = $('#todayClass');

function setmemNum(val) {
	memNum = val;
}
function setmemName(val) {
	memName = val;
}
function setauthId(val) {
	authId = val;
}

function setauthName() {
	if(authId == 1000) {
		authName="관리자";
	} else if(authId == 1001) {
		authName="학생";
	} else {
		authName="강사";
	}
}

function readyView(map) {
	var Calendar = FullCalendar.Calendar;
	var containerEl = document.getElementById('external-events');
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		
		plugins : [ 'interaction', 'dayGrid', 'timeGrid' ],
		selectable : true,
		header : {
			left : 'prev,next today',
			center : 'title',
			right : 'dayGridMonth,timeGridWeek,timeGridDay'
		},
		events : map,
		eventResizableFromStart : false,
		//날짜 클릭시 적용
		dateClick : function(info) {
			dateClick(info)
		},
		//이벤트 클릭시 적용
		eventClick : function(info) {
			eventClick(info)
		},
		locale : 'ko'
	});
	
	dateFunction();
	dateFunctionE();
	calendar.render();
};

function dateFunction() {
	$("input#iEventStart").datetimepicker({
		format : 'YYYY-MM-DD HH:mm',
		stepping : 5
	});
	$("input#iEventEnd").datetimepicker({
		format : 'YYYY-MM-DD HH:mm',
		stepping : 5
	});
};

//시간 설정
function dateFunctionE() {
	$("input.eventStart").datetimepicker({
		format : 'YYYY-MM-DD HH:mm',
		stepping : 5
	});
	$("input.eventEnd").datetimepicker({
		format : 'YYYY-MM-DD HH:mm',
		stepping : 5
	});
};


//날짜 클릭
function dateClick(info) {
	//날짜 클릭 시 일정번호 받아옴
	$.ajax({
		type : "get",
		async : true,
		datatype : "textd; charset=utf-8",
		url : "selectSchSeqNo",
		data : {},
		success : function(map) {
			var dateTodayS = moment(info.dateStr).format('YYYY-MM-DD HH:mm');
			var dateTodayE = moment(info.dateStr).format('YYYY-MM-DD 01:00');
			$("input#iEventStart").val(dateTodayS);
			$("input#iEventEnd").val(dateTodayE);
			$("input#iEventId").prop('disabled', true);//편집 불가로 변경
			$("input#iEventTitle").val('');
			$("input#iEventDescription").val('');
			//id추가
			var id = map.id;
			$('input#iEventId').attr('value', id);
			$('#insertModalPop').modal();
		}
	}); // ajax end
};

//이벤트 클릭
function eventClick(info) {
	var eventTitle = info.event.title;
	var eventId = info.event.id;
	var eventAllday = null;
	if (info.event.allDay == 1) {
		$('input#eventAllday').prop("checked", true);
	} else {
		$('input#eventAllday').prop("checked", false);
	}
	var eventStartE = moment(info.event.start).format('YYYY-MM-DD HH:mm');
	var eventEndE = moment(info.event.end).format('YYYY-MM-DD HH:mm');
	$("input#eventStart").val(eventStartE);
	$("input#eventEnd").val(eventEndE);
	$('input#eventTitle').val(eventTitle);
	$('input#eventId').val(eventId);
	$("input#eventId").prop('disabled', true)

	//기존 이벤트 클릭 시 desc받아옴 ->정보 전체로 변경
	$.ajax({
		type : "get",
		async : true,
		datatype : "textd; charset=utf-8",
		url : "selectDesc",
		data : {
					memNum : memNum,
					schId : eventId
				},
		success : function(map) {
			if (map.allDay == 1) {
				eventAllday = "checked";
				$('input#eventAllday').prop('checked',false);
				$('input#eventAllday').prop('checked', true);
			} else {
				$('input#eventAllday').prop('checked',false);
			}
			var schDescription = map.schDescription;
			$('input.eventDescription').val(schDescription);
		}
	});
	dateFunctionE(info);
	//check박스 설정
	$('div#modalPop').modal();
};


//스케쥴 수정 saveScd
$("#saveScd").on("click", function() {
	   if ($("input#eventStart").val() > $("input#eventEnd").val()) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false;
        }
       if ($('input#eventTitle').val() === '') {
            alert('일정명은 필수입니다.')
           return false;
        }
		var con_result = confirm("정말 수정하시겠습니까?")
		if (!con_result) {
			return false;
		}
		//allDay일 때
		if ($("input#eventAllday").is(':checked')==true) {
			$("#eventStart").val(moment($("#eventStart").val()).format('YYYY-MM-DD'));
        //render시 날짜표기수정
        $("#eventEnd").val(moment($("#eventEnd").val()).add(1, 'days').format('YYYY-MM-DD'));
        }else{
			$("#eventStart").val(moment($("#eventStart").val()).format('YYYY-MM-DD HH:mm'));
	        //render시 날짜표기수정
	        $("#eventEnd").val(moment($("#eventEnd").val()).format('YYYY-MM-DD HH:mm'));
	        }
		
		
	$.ajax({
		type : "post",
		async : true,
		datatype : "textd; charset=utf-8",
		url : "schModify",
		data : {
			schId : $("#eventId").val(),
			schTitle : $("#eventTitle").val(),
			schStart : $("#eventStart").val(),
			schEnd : $("#eventEnd").val(),
			schAllDay : $("input#eventAllday").is(':checked'),
			schDescription : $("#eventDescription").val(),
			memNum : memNum,
		},
		success : function(data) {
			if (data == '1') {
				alert("수정 되었습니다");
				window.location.href = '/';
			} else {
				alert("수정에 실패했습니다");
			}
		},
	});	// ajax end
});

//insert 스케쥴
$("#iSave").on("click", function() {
	 if ($("input#iEventStart").val() > $("input#iEventEnd").val()) {
        alert('끝나는 날짜가 앞설 수 없습니다.');
        return false;
     }
     if ($('input#iEventTitle').val() === '') {
          alert('일정명은 필수입니다.')
          return false;
     }
   //allDay일 때
		if ($("input#iEventAllday").is(':checked')==true) {
			$("#iEventStart").val(moment($("#iEventStart").val()).format('YYYY-MM-DD'));
        //render시 날짜표기수정
        $("#iEventEnd").val(moment($("#iEventEnd").val()).add(1, 'days').format('YYYY-MM-DD'));
        }else{
			$("#iEventStart").val(moment($("#iEventStart").val()).format('YYYY-MM-DD HH:mm'));
	        //render시 날짜표기수정
	        $("#iEventEnd").val(moment($("#iEventEnd").val()).format('YYYY-MM-DD HH:mm'));
	        }

   $.ajax({
		type : "post",
		async : true,
		datatype : "textd; charset=utf-8",
		url : "schInsert",
		data : {
			schId : $("#iEventId").val(),
			schTitle : $("#iEventTitle").val(),
			schStart : $("#iEventStart").val(),
			schEnd : $("#iEventEnd").val(),
			schAllDay : $("input#iEventAllday").is(':checked'),
			schDescription : $("#iEventDescription").val(),
			memNum : memNum,
		},
		success : function(data) {
			if (data == '1') {
				alert("스케쥴이 등록되었습니다");
				window.location.href = '/';
			} else {
				alert("등록에 실패했습니다");
			}
		},
	});	// ajax end
});

//삭제
$("#eventDelete").on("click", function() {
	var con_result = confirm("정말 삭제하시겠습니까?")
	if (!con_result) {
		return false;
	}
	
	$.ajax({
		type : "post",
		async : true,
		datatype : "textd; charset=utf-8",
		url : "deleteSchInfo",
		data : {
			schId : $("#eventId").val(),
			memNum : memNum,
		},
		success : function(data) {
			if (data == '1') {
				alert("삭제 되었습니다.");
				window.location.href = '/';
			} else {
				alert("삭제에 실패했습니다");
			}
		},
	}); // ajax end
});

//모달 닫힐 때 실행(체크 박스 초기화)
$('div#modalPop').on('hide.bs.modal', function(e){
	modalClose();
	e.stopImmediatePropagation();
});
$('#insertModalPop').on('hide.bs.modal', function(e){
	modalClose();
	e.stopImmediatePropagation();
});
//체크박스 초기화
function modalClose() {
	$('input#eventAllday').prop("checked", false);
	$('input#iEventAllday').prop("checked", false);
}

//오늘 날짜 받기
function getToday() {
	$.ajax({
		type : "get",
		async : true,
		datatype : "json; charset=utf-8",
		url : "selectDateToday",
		data : {},
		success : function(selectDateToday) {
			console.log("selectDateToday : "+selectDateToday.selectDateToday);
		}
	}); // ajax end
}

function todayClass() {
	var info = {
		memNum: memNum,
		currentDate: moment().format('YYYY[-]MM[-]DD'),	// 현재 날짜
		currentDay: moment().day()					// 현재 요일 	0: 일, 1: 월, 2: 화. 3: 수, 4: 목, 5: 금, 6: 토
	}
	
	$.ajax({
		type: "post",
		async: true,
		url: "getTodayClass",
		data: JSON.stringify(info),
		contentType: 'application/json',
		success: function(data) {
					if(data.length != 0) {
						for(var i=0; i< data.length; i++) {
							var str = '<li><a href="/mypage/board/2000/'+data[i].openclassId+'">'+ data[i].openclassName +'</a></li>';
							ul_todayClass.append(str);					
						}
					} else {
						var str = '<li><a href="#">오늘 수업이 없습니다</a></li>';
						ul_todayClass.append(str);	
					}
				},
		error: function(data) {
					console.log("fail");
				}
	});	// ajax end
}