/**
 * riceFw attend status process javascript file
 */

var memNum;
var div_attendChart = $("#attendChart");
var tbl_myAttendList = $("#myAttendList");
var h3_attendTitle = $("#attendTitle");

function setmemNum(val) {
	memNum = val;
}

function getAttendList(id){
	var info = {
		openclassId: id,
		memNum: memNum
	}
	
	$.ajax({
		type: "post",
		async: true,
		url: "/attend/getAttendList",
		data: JSON.stringify(info),
		contentType: 'application/json',
		success: function(attendList) {
					tbl_myAttendList.html('');
					h3_attendTitle.html('');
					if(attendList.length != 0 ) {
						var str = '<tr><th>일자 및 시간</th><th>출결 정보</th></tr>'
						tbl_myAttendList.append(str);
						for(i = 0 ; i < attendList.length; i++) {
							var str = "<tr>"
								+ "<td>" + moment(attendList[i].atdDate).format('MM/DD(dd)') + " "
								+ attendList[i].openStartTime +"~"+ attendList[i].openEndTime +"</td>"
								+ "<td>" + attendList[i].atdState + "  " ;
							if(attendList[i].atdTime != null) {
								str += attendList[i].atdTime + "</td>";
							}	
							else {
								str +="</td>";
							}
							str += "</tr>";
							 tbl_myAttendList.append(str);
							 h3_attendTitle.html(attendList[i].openclassName);
						}
					} else {
						var str = '<tr><th>출결 정보가 없습니다</th></tr>'
						tbl_myAttendList.append(str);
					}
				},
		error: function(data) {
					console.log("fail");
				}
	});	// ajax end
}

function getAttendInfo() {
	var info = {
		memNum : memNum
	}
	
	$.ajax({
		type: "post",
		async: true,
		url: "/attend/getAttendData",
		data: JSON.stringify(info),
		contentType: 'application/json',
		success: function(data) {
					for(var i = 0 ; i < data.length ; i++) {
						chartRender(data[i]);
					}
					
					$('#attendChart>div').click(function(e) {
						var openclassId = e.delegateTarget.getAttribute("val")
						getAttendList(openclassId);
					});
				},
		error: function(data) {
					console.log("fail");
				}
	});	// ajax end
}

function chartRender(info) {
	div_attendChart.append('<div id="'+info.openclassName+info.openclassId+'" val="'+ info.openclassId +'" ></div>');
	
	var chart = new CanvasJS.Chart(info.openclassName+info.openclassId, {
		theme: "light2",
		title : {
			text : info.openclassName,
			horizontalAlign : "center"
		},
		data : [ {
			type : "doughnut",
			startAngle : 60,
			//innerRadius : 30,
			indexLabelFontSize : 10,
			indexLabel : "{y}",
			toolTipContent : "<b>{label}:</b> {y} (#percent%)",
			dataPoints : [ {
				color: "green",
				y : Number(info.attCount),
				label : "출석",
				exploded : true
			}, {
				color: "yellow",
				y : Number(info.lateCount),
				label : "지각"
			}, {
				color: "red",
				y : Number(info.absentCount),
				label : "결석"
			}, {
				color: "gray",
				y : Number(info.remainCount),
				label : "남은수업"
			}, ]
		} ]
	});
	chart.render();
}