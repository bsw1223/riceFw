<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<head>
<script>
	var infoList = new Array();
	/* var bulId  = ; */
	var bulId  = {bulId:"${building}"};
	console.log(bulId);
	$(document).ready(function(){
		$.ajax({
		type : "post",
		async: true,
		datatype:"text; charset=utf-8",
		url: "/classMng/MngBld/BlddescInfo",
		data: bulId,
		success: function(mapList)
					{
						console.log("success");			
						//newMapList : 자바스크립트 객체를 담은 배열
						 var DBuildingDetail = JSON.parse(mapList);//전체 리스트
							var bulPhoneNum = DBuildingDetail[0].bulPhoneNum;
							var bulName = DBuildingDetail[0].bulName;
							var bulAddress = DBuildingDetail[0].bulAddress;
							var bulId = DBuildingDetail[0].bulId;
							var bulClassNum = DBuildingDetail[0].bulClassNum; 
							var bulMgr = DBuildingDetail[0].bulMgr; 
							var bulFloor = DBuildingDetail[0].bulFloor; 
							var bulRemark = DBuildingDetail[0].bulRemark; 
							if(bulRemark==undefined)
								{
									bulRemark="없음";
								}
						
						addText="<table class=\"table table-striped \">"
								+"<thead><tr><th>항 목</th><th>내 용 </th>"
					            +"</tr></thead><tbody><tr><td>건 물 명</td>"
					            +"<td>"+bulName+"</td></tr>"
					        	+"<tr><td>층 수</td><td>"+bulFloor+"</td></tr>"
					            +"<tr><td>강의실 수</td>"
					            +"<td>"+bulClassNum+"</td>"
					         	+"</tr><tr><td>주소</td>"
					         	+"<td>"+bulAddress+"</td></tr>"
					         	+"<tr><td>관리자</td><td>"+bulMgr+"</td></tr>"
					         	+"<tr><td>관리자 번호</td><td>"+bulPhoneNum+"</td></tr>"
					         	+"<tr><td>비고</td><td>"+bulRemark+"</td></tr></tbody></table>"
							
							$('div.add').append(addText);
					},
		});
	});
	
	
	
	
	</script>
<html>


</head>
<body>
	 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        RICE LMS
        <small></small>
      </h1>
    </section>
    <div class="pad margin no-print">
    </div>
    <!-- Main content -->
    <section class="invoice">
      <!-- title row -->
      <div class="row">
        <div class="col-md-12">
          <h2 class="page-header">
            <i class="fa fa-globe"></i> 건물상세 보기
            <small class="pull-right"></small>
          </h2>
        </div>
        <!-- /.col -->
      <!-- Table row -->
      <div class="row">
        <div class="col-md-12 table-responsive add">
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
      <!-- this row will not appear when printing -->
      <div class="row no-print">
        <div class="col-md-12">
          <button type="button" class="btn btn-primary pull-right" style="margin-right: 5px;">
            <i class=""></i> 수정
          </button>
          <button type="button" class="btn btn-primary pull-right" style="margin-right: 5px;">
            <i class=""></i> 삭제
          </button>
          <button type="button" class="btn btn-primary pull-right" style="margin-right: 5px;">
            <i class=""></i> 취소
          </button>
        </div>
      </div>
      </div>
    </section>
    <!-- /.content -->
    <div class="clearfix"></div>
  </div>
  <!-- /.content-wrapper -->
<!-- ./wrapper -->
<%@ include file = "footer.jsp" %>
</body>
</html>
