<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous">
	
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>
  
<style>
.box-body{
	background-color: white;
}
.box-tools{
	margin:auto;
	display:flex;
}
.select{
	float:left;
	
}
.input-group{
	float:left;
	width: 170px;
}
.amount{
float: right;
}

</style>

<body>
	<%@ include file="F_Fixedsidebar.jsp"%>

	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header"style="width:83%">
			<h1><c:out value='${sjctName}' /></h1>
			<ol class="breadcrumb">
				<li class="active"><i class="fa fa-dashboard"></i> Home</li>
				<li class="active"><c:out value='${sjctName}' /></li>
				<li class="active">성적 조회</li>
			</ol>
		</section>
	
		 <!-- Main content -->
	    <section class="content">
	      <div class="row">
	        <!-- left column -->
	        <div class="col-md-5">
	          <!-- general form elements -->
	          <div class="box box-primary">
	         	 <div class="box-header">
					<h2 class="box-title">성적 조회</h2>
					<!-- 옵션선택 끝 -->
				</div>			
	   			 <!-- box body -->
				<div class="box-body">
				<!-- table -->
	              <table class="table table-bordered">
	                <tr>
	                  <th>과제 명</th>
	                  <th>시험 일자</th>
	                  <th>성적</th>
	                </tr>
	                <c:forEach var="list" items="${boardList}">
		                <tr>
		                  <td><c:out value="${list.boNum}"/></td>
		                  <td><c:out value="${list.memNum}"/></td>
		                  <td><c:out value="${list.boUpdateDate}/총점"/></td>
		                </tr>
	                </c:forEach>
	              </table>
	     		</div>
	    	` <!-- /.main content -->
	  		</div>  
			</div>
			<!-- /score table -->
			 <div class="col-md-5">
	          <!-- general form elements -->
	          <div class="box box-primary">
	         	 <div class="box-body" id="barChart">
							
				</div>
	   			 <!-- box body -->
				<div class="box-body">
				<!-- put your chart here -->
			
				</div>
			 </div>
			</div>
		<!-- chart -->
		</div>
		<!-- /section -->
	</section>
	<!-- /content wrapper -->
	</div>
</body>


<form id="actionForm" action="/mypage/board/${pageMaker.cri.boCode}/${pageMaker.cri.boURL}" method='get'>
	<input type="hidden" name="page" value='${pageMaker.cri.page}'>
	<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
</form>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		var actionForm = $("actionForm");

		$(".page-item").on("click", function(e) {
			e.preventDafault();

			console.log('click');
			actionForm.find("input[name='page']").val($(this).attr("href"));
			actionForm.submit();
		});
	});

	function selChange() {
		var sel = document.getElementById('getListWithPaging').value;
		var page = 1;

		location.href = "/mypage/board/${pageMaker.cri.boCode}/${pageMaker.cri.boURL}?page=" + page + "&amount=" + sel;

	}
</script>
<script src="${contextPath}/resources/api/js/canvasjs.min.js"></script>
<script>
		var chart = $("#barChart");
		
		$(document).ready(function() {
			chart.append('<div id="chartContainer" style="height: 300px; width: 400px;"></div>');
			
			charRender();
		});
		
		function charRender(data) {
			var chart = new CanvasJS.Chart("chartContainer", {
				animationEnabled: true,
				title:{
					text: "점수 그래프"
				},	
				axisY: {
					title: "Billions of Barrels",
					titleFontColor: "#4F81BC",
					lineColor: "#4F81BC",
					labelFontColor: "#4F81BC",
					tickColor: "#4F81BC"
				},
				axisY2: {
					title: "Millions of Barrels/day",
					titleFontColor: "#C0504E",
					lineColor: "#C0504E",
					labelFontColor: "#C0504E",
					tickColor: "#C0504E"
				},	
				toolTip: {
					shared: true
				},
				legend: {
					cursor:"pointer",
					itemclick: toggleDataSeries
				},
				data: [{
					type: "column",
					name: "내 점수",
					legendText: "Proven Oil Reserves",
					showInLegend: true, 
					dataPoints:[
						{ label: "Saudi", y: 266.21 },
						{ label: "Venezuela", y: 302.25 },
						{ label: "Iran", y: 157.20 },
						{ label: "Iraq", y: 148.77 },
						{ label: "Kuwait", y: 101.50 },
						{ label: "UAE", y: 97.8 }
					]
				},
				{
					type: "column",	
					name: "평균",
					legendText: "Oil Production",
					axisYType: "secondary",
					showInLegend: true,
					dataPoints:[
						{ label: "Saudi", y: 10.46 },
						{ label: "Venezuela", y: 2.27 },
						{ label: "Iran", y: 3.99 },
						{ label: "Iraq", y: 4.45 },
						{ label: "Kuwait", y: 2.92 },
						{ label: "UAE", y: 3.1 }
					]
				}]
			});
			chart.render();

		}

function toggleDataSeries(e) {
	if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
		e.dataSeries.visible = false;
	}
	else {
		e.dataSeries.visible = true;
	}
	chart.render();
}
</script>
</head>
<body>
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>

<%@ include file="footer.jsp"%>

</body>
</html>