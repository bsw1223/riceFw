<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<head>
<script>
var infoList = new Array();
/* /* var bulId  = ${build.bulId}; */

//건물 등록
$(document).on("click","#buildingAdd",function(){
		 $.ajax({
				type : "post",
				async: true,
				datatype:"text; charset=utf-8",
				url: "/classMng/MngBld/BulAdd",
				data: {bulName:$("#bulName").val(),
					   bulMgr:$("#bulMgr").val(),
					   bulPhoneNum:$("#bulPhoneNum").val(), 
					   bulAddress:$("#bulAddress").val(), 
					   bulClassNum:$("#bulClassNum").val(), 
					   bulFloor:$("#bulFloor").val(),
					   bulRemark:$("#bulRemark").val() 
					},
				success: function(bulName)
							{
								if(confirm("등록되었습니다.")) document.location = "/classMng/MngBld/Bld";
							}
				});
		});
		
	</script>
<html>


</head>
<body>

<div class="content-wrapper">
	<section class="content-header">
		<h1>건물관리</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#">Tables</a></li>
			<li class="active">Data tables</li>
		</ol>
	</section>
	<section class="content">
		<div class ="row">
			<div class="col-md-10">
		          <div class="box box-warning">
		                <div class="box-header with-border">
		            	    <h3 class="box-title">건물 등록</h3>
		                </div>
			            <div class="box-body">
		           	        <form role="form">
				                <div class="form-group">
					                  <label>건물명</label>
					                  <input type="text" class="form-control classNumber" placeholder="" id="bulName">
				                </div>
				                <div class="form-group">
					                  <label>건물주소</label>
					                  <input type="text" class="form-control classNumber" placeholder="" id="bulAddress">
				                </div>
				                <div class="form-group">
					                  <label>관리자</label>
					                  <input type="text" class="form-control classNumber" placeholder="" id="bulMgr">
				                </div>
					                  <label>관리자 전화번호</label>
					                  <input type="number" class="form-control classNumber" placeholder="" id="bulPhoneNum">
				                <div class="form-group">
					                  <label>강의실수</label>
					                  <input type="number" class="form-control people classCapacity " placeholder="숫자만 입력해 주세요" id="bulClassNum">
				                </div>
				                <div class="form-group">
					                  <label>층수</label>
					                   <input type="number" class="form-control classNumber" placeholder="숫자만 입력해 주세요" id="bulFloor">
				                </div>
				                <div class="form-group">
					                  <label>건물비고</label>
					                  <textarea class="form-control classRemark" rows="3" placeholder="Enter ..." id="bulRemark"></textarea>
				                </div>
								<div class="form-group">
					                 <button type="button" class="btn btn-primary pull-right" style="margin-right: 5px;">
							            <i class=""></i> 취소
							         </button>
				                	 <button type="button" id="buildingAdd" class="btn btn-primary pull-right" style="margin-right: 5px;" onclick="">
							            <i ></i> 등록
							         </button>
				                </div>
			              </form>
			     	 </div>
				  </div>
			  </div>
	 	 </div>
	</section>  
</div>
     
<%@ include file = "footer.jsp" %>	
	
</body>
</html>

