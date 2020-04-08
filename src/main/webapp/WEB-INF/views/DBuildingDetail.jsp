<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%-- <%@ include file = "header.jsp" %> --%>
<script
  src="https://code.jquery.com/jquery-2.2.4.js"
  integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
  crossorigin="anonymous"></script>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

	<script>
	var infoList = new Array();
	/* var bulId  = ${build.bulId }; */
	var bulId  = 'AA';
	
	$(document).ready(function(){
		$.ajax({
		type : "post",
		async: true,
		datatype:"text; charset=utf-8",
		url: "/mngbld/blddesc",
		data: {bulId:bulId},
		success: function(mapList)
					{
						console.log("success");			
						//newMapList : 자바스크립트 객체를 담은 배열
						 var DBuildingDetail = JSON.parse(mapList);//전체 리스트
					   
				/* 			console.log(DBuildingDetail[0].bulPhoneNum);
							console.log(DBuildingDetail[0].bulName);
							console.log(DBuildingDetail[0].bulAddress);
							console.log(DBuildingDetail[0].bulId);
							console.log(DBuildingDetail[0].bulClassNum); 
							console.log(DBuildingDetail[0].bulMgr); 
							console.log(DBuildingDetail[0].bulFloor); 
							console.log(DBuildingDetail[0].bulRemark);  */
							
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
						
						addText="<table class=\"table table-striped \"><thead><tr><th>항 목</th><th>내 용 </th>"
					         +"</tr></thead><tbody><tr><td>건 물 명</td><td>"+bulName+"</td></tr><tr>"
					         +"<td>층 수</td><td>"+bulFloor+"</td></tr><tr><td>강의실 수</td><td>"+bulClassNum+"</td>"
					         +"</tr><tr><td>주소</td><td>"+bulAddress+"</td></tr><tr><td>관리자</td><td>"+bulMgr+"</td>"
					         +"</tr><tr><td>관리자 번호</td><td>"+bulPhoneNum+"</td></tr><tr><td>비고</td><td>"+bulRemark+"</td>"
					         +"</tr></tbody></table>"
							
							$('div.add').append(addText);
					},
		});
		
	});
	
	

	function delete_one(){
		$.ajax({
			type : "post",
			async: true,
			datatype:"text; charset=utf-8",
			url: "/classrMng/MngBld/Blddesc",
			data: {bulId:bulId},
			success: function(mapList)
						{
						}
				});
			}
		
	
	</script>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Invoice</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="${contextPath}/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${contextPath}/resources/bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="${contextPath}/resources/bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${contextPath}/resources/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="${contextPath}/resources/dist/css/skins/_all-skins.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">	
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
        <div class="col-xs-12">
          <h2 class="page-header">
            <i class="fa fa-globe"></i> 건물상세 보기
            <small class="pull-right">Date: 2/10/2014</small>
          </h2>
        </div>
        <!-- /.col -->


      <!-- Table row -->
      <div class="row">
        <div class="col-xs-12 table-responsive add">
         
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

  

      <!-- this row will not appear when printing -->
      <div class="row no-print">
        <div class="col-xs-12">
          
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
    </section>
    <!-- /.content -->
    <div class="clearfix"></div>
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer no-print">
    <div class="pull-right hidden-xs">
      <b>Version</b> 2.4.18
    </div>
    <strong>Copyright &copy; 2014-2019 <a href="https://adminlte.io">AdminLTE</a>.</strong> All rights
    reserved.
  </footer>

  
<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="${contextPath}/resources/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="${contextPath}/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="${contextPath}/resources/bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="${contextPath}/resources/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${contextPath}/resources/dist/js/demo.js"></script>
</body>
</html>
