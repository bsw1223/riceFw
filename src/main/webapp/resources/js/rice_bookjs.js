/*
 * riceFw booking process javascript file
 */

var memNum;
var classList = null;
var bookingList = null;

var addBtnContainer = $('.modalBtnContainer-addEvent');
var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');

var bookingModal = $('#bookingModal');
var bookInfoModal = $('#bookInfoModal');
var bookInfoBody = $("#bookInfoBody");

var ipt_className = $("input[name='className']");
var ipt_classId = $("input[name='classId']");
var ipt_bookNum = $("input[name='bookNum']");
var ipt_bookTitle = $("input[name='bookTitle']");
var ipt_bookStartTime = $("input[name='bookStartTime']");
var ipt_bookEndTime = $("input[name='bookEndTime']");
var ipt_bookPurpose = $("#bookPurpose");

var save_event_btn = $('#save-event');
var delete_event_btn = $('#delete-event');
var update_event_btn = $('#update-event');

var mybookList = $('#mybookList');

function setmemNum(val) {
	memNum = val;
}

function eventClick(num) {		
	var bookNum = num;
	
	$.ajax({
		type : "post",
		async: true,
		url: "/booking/getBookingInfo",
		data: {"bookNum" : bookNum},
		success: function(data) {						
					bookStartTimeVal = moment(data.bookStartTime).format('YYYY-MM-DD HH:mm');
					bookEndTimeVal = moment(data.bookEndTime).format('YYYY-MM-DD HH:mm');
										
					if(data.modalMsg == '1') {
						
						ipt_bookNum.val(data.bookNum);
						ipt_classId.val(data.classId);
						ipt_className.val(data.className);
						ipt_bookTitle.val(data.bookTitle);
						ipt_bookStartTime.val(bookStartTimeVal);
						ipt_bookEndTime.val(bookEndTimeVal);
						ipt_bookPurpose.val(data.bookPurpose);
						
						bookInfoModal.modal("hide");
						addBtnContainer.hide();
						modifyBtnContainer.show();
						bookingModal.modal();
					} else {
						bookingModal.modal("hide");
						bookInfoModal.modal();
						var htmlStr = "<tr><td>예약명</td><td>" + data.bookTitle + "</td></tr>"
									+ "<tr><td>시작시간</td><td>" + bookStartTimeVal + "</td></tr>"
									+ "<tr><td>종료시간</td><td>" + bookEndTimeVal + "</td></tr>"
									+ "<tr><td>예약자</td><td>" + data.memName + "</td></tr>";
						bookInfoBody.html(htmlStr);
					}
					
				},
		error: function(data) {
					console.log("fail");
				}
	});	// ajax end
}

function selectDate(info) {
	var classId = info.resource.id;
	var startStr = moment(info.startStr).format('YYYY-MM-DD HH:mm');
	var endStr = moment(info.endStr).format('YYYY-MM-DD HH:mm');
	
	$.ajax({
		type : "post",
		async: true,
		url: "/booking/getClassInfo",
		data: {"classId" : classId},
		success: function(data) {
					ipt_bookNum.val('');
					ipt_bookTitle.val('');
					ipt_bookPurpose.val('');
					ipt_classId.val(data.classId);
					ipt_className.val(data.className);
					ipt_bookStartTime.val(startStr);
					ipt_bookEndTime.val(endStr);
					addBtnContainer.show();
					modifyBtnContainer.hide();
					bookingModal.modal();
				},
		error: function(data) {
					alert("fail");
				}
	}); // ajax end
}



save_event_btn.click(function () {		// 예약 등록 버튼 click
	var eventData = {
		classId: ipt_classId.val(),
		bookTitle: ipt_bookTitle.val(),
		bookStartTime: moment(ipt_bookStartTime.val()).format('YYYY-MM-DDTHH:mm'),
		bookEndTime: moment(ipt_bookEndTime.val()).format('YYYY-MM-DDTHH:mm'),
		bookPurpose: ipt_bookPurpose.val(),
		memNum: memNum
	}
	
	if(eventData.memNum === '') {
		alert('로그인이 필요합니다');
		return false;
	}
	
	if(eventData.bookStartTime >= eventData.bookEndTime) {
		alert('끝나는 날짜가 앞설 수 없습니다.');
		return false;
	}
	
	if(eventData.bookTitle === '') {
		alert('예약명은 필수입니다.');
		return false;
	}
	
	// 새로운 예약 생성
	$.ajax({
		type : "post",
		async: true,
		url: "/booking/insertBooking",
		data: JSON.stringify(eventData),
		contentType: 'application/json',
		success: function(data) {
					if(data == '1') {
						alert("스티디실 예약이 등록되었습니다");
						window.location.href = '/booking/bookstudyroom';
					} else {
						alert("예약 등록에 실패했습니다");
					}
				},
		error: function(data) {
					console.log("fail");
				}
	}); // ajax end
});

delete_event_btn.click(function () {	// 예약 삭제 버튼 click
	var con_result = confirm("예약은 취소하면 수정할 수 없습니다. 정말 취소하시겠습니까?")
	
	if(!con_result) {
		return false;
	}
	
	var eventData = {
			classId: ipt_classId.val(),
			bookNum: ipt_bookNum.val(),
			bookTitle: ipt_bookTitle.val(),
			bookStartTime: moment(ipt_bookStartTime.val()).format('YYYY-MM-DDTHH:mm'),
			bookEndTime: moment(ipt_bookEndTime.val()).format('YYYY-MM-DDTHH:mm'),
			bookPurpose: ipt_bookPurpose.val(),
			memNum: memNum
		}
	
	// 예약 삭제 처리
	$.ajax({
		type : "post",
		async: true,
		url: "/booking/deleteBooking",
		data: JSON.stringify(eventData),
		contentType: 'application/json',
		success: function(data) {
					if(data == '1') {
						alert("스티디실 예약이 취소되었습니다");
						window.location.href = '/booking/bookstudyroom';
					} else {
						alert("예약 취소에 실패했습니다");
					}
				},
		error: function(data) {
					console.log("fail");
				}
	}); // ajax end
});

update_event_btn.click(function () {	// 예약 수정 버튼 click
	var con_result = confirm("예약 정보를 수정하시겠습니까?")
	
	if(!con_result) {
		return false;
	}
	
	var eventData = {
		classId: ipt_classId.val(),
		bookNum: ipt_bookNum.val(),
		bookTitle: ipt_bookTitle.val(),
		bookStartTime: moment(ipt_bookStartTime.val()).format('YYYY-MM-DDTHH:mm'),
		bookEndTime: moment(ipt_bookEndTime.val()).format('YYYY-MM-DDTHH:mm'),
		bookPurpose: ipt_bookPurpose.val(),
		memNum: memNum
	}
	
	
	if(eventData.bookStartTime >= eventData.bookEndTime) {
		alert('끝나는 날짜가 앞설 수 없습니다.');
		return false;
	}
	
	if(eventData.bookTitle === '') {
		alert('예약명은 필수입니다.');
		return false;
	}
	
	// 새로운 예약 생성
	$.ajax({
		type : "post",
		async: true,
		url: "/booking/updateBooking",
		data: JSON.stringify(eventData),
		contentType: 'application/json',
		success: function(data) {
					if(data == '1') {
						alert("스티디실 예약 정보가 수정되었습니다");
						window.location.href = '/booking/bookstudyroom';
					} else {
						alert("예약 수정에 실패했습니다");
					}
				},
		error: function(data) {
					console.log("fail");
				}
	}); // ajax end
});

function getClassList() {
	$.ajax({
		type : "post",
		async: true,
		url: "/booking/getClassList",
		success: function(mapList) {
					if(mapList != null) {
						classList = mapList;
					}
					getBookingList();
				},
		error: function(data) {
					console.log("fail");
				}	
	});	// ajax end
}

function getBookingList() {
	$.ajax({
		type : "post",
		async: true,
		url: "/booking/getBookingList",
		success: function(mapList) {
					if(mapList != null) {
						bookingList = mapList;
					}
					rendCal(classList, bookingList);
				},
		error: function(data) {
					console.log("fail");
				}
	});	// ajax end
}	

function getMybookList() {
	var info = {
		memNum: memNum
	}
	
	if(info.memNum == '') {
		mybookList.append("<tr><td colspan='6'>정보 없음</td></tr>");
	} else {
		$.ajax({
			type : "post",
			async: true,
			url: "/booking/getMybookList",
			data: JSON.stringify(info),
			contentType: 'application/json',
			success: function(mapList) {
						for(i = 0 ; i < mapList.length; i++) {
							var str = "<tr val='"+mapList[i].bookNum +"'>"
								+ "<td>" + mapList[i].bookNum + "</td>"
								+ "<td>" + mapList[i].className + "</td>"
								+ "<td>" + mapList[i].bookTitle + "</td>"
								+ "<td>" + mapList[i].bookStartTime + "</td>"
								+ "<td>" + mapList[i].bookEndTime + "</td>"
								+ "<td>" + mapList[i].bookState + "</td>"
							 + "</tr>";
							 mybookList.append(str);
						}
						
						mybookList.click(function(e) {
							var getval = $(e.target).parents("tr").attr("val")
							eventClick(getval);
						});
					},
			error: function(data) {
						console.log("fail");
					}
		});	// ajax end
	}
}

function rendCal(classList, bookingList) {
	var calendarEl = document.getElementById('timeline_cal');

	var calendar = new FullCalendar.Calendar(calendarEl, {
		locale: 'ko',
	    timezone: "local",
	    selectable: true,
	    minTime: "09:00:00",
	    maxTime: "20:00:00",	
	    aspectRatio: 2,
	    slotWidth: "5%",
	    height: 600,
	    resourceAreaWidth: "20%",
		plugins : [ 'interaction', 'resourceTimeline' ],
		header: {
		      left: 'today prev,next',
		      center: 'title',
		      right: 'resourceTimelineDay,resourceTimelineWeek,resourceTimelineMonth'
		    },
		defaultView: 'resourceTimelineDay',
		resourceColumns: [
		      {
		        labelText: '강의실',
		        field: 'title'
		      },
		      {
		        labelText: '수용인원',
		        field: 'occupancy'
		      }
		    ],
		resourceGroupField: 'building',
		resources: classList,
		events: bookingList,
	    select: function(info) {
				    	selectDate(info);			      	
				    },
	    eventClick: function(info){
	    				eventClick(info.event.id);
				    }
	});	// calendar end
	calendar.render();
}

