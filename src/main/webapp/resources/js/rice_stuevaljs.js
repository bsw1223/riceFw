/**
 * riceFw stu_eval process javascript file
 */

var boCode;
var boURL;
var memNum;

var tbl_stuScoreList = $('#stuScoreList');


function setmemNum(val) {
	memNum = val;
}

function setboCode(val) {
	boCode = val;
}

function setboURL(val) {	// openclassId
	boURL = val;
}

function getStuScoreList() {		// 선택된 평가 점수 입력 학생 리스트 불러오기
	var info = {
		openclassId: boURL,
		memNum: memNum
	}
		
	$.ajax({
		type: "post",
		async: true,
		url: "/eval/getStuScoreList",
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

function appendScore(val) {
	tbl_stuScoreList.html('');
	for(var i = 0 ; i < val.length ; i++) {
		var str = '<tr><td>'+val[i].evalTitle+'</td>'
				+ '<td>'+moment(val[i].evalDate).format('YYYY-MM-DD dd')+'</td>'
				+ '<td>'+val[i].evalScore+ '</td></tr>';
		tbl_stuScoreList.append(str);
	}
}

function getChartScore() {		// 차트 점수 불러오기
	var info = {
		openclassId: boURL,
		memNum: memNum
	}
		
	$.ajax({
		type: "post",
		async: true,
		url: "/eval/getChartScore",
		data: JSON.stringify(info),
		contentType: 'application/json',
		success: function(data) {
					chartRender(data);
				},
		error: function(data) {
					console.log("fail");
				}
	});	// ajax end
}

function chartRender(info) {
	var chart = new CanvasJS.Chart("chartContainer", {
	    theme: "light2",
	    height: 400,
		toolTip: {
			shared: true
		},
		data: [{
			type: "column",
	        color: "gray",
			name: "평균",
			legendText: "평균",
			showInLegend: true, 
			dataPoints: info.avgScore
		},
		{
			type: "column",	
	        color: "green",
			name: "내 점수",
			legendText: "내 점수",
			showInLegend: true,
			dataPoints: info.chartScore
		}]
	});
	chart.render();
}