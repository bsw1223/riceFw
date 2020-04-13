<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<head>
<script>
var infoList = new Array();
/* var bulId  = ${build.bulId}; */
var classId  = '';
$(document).ready(function(){
	$.ajax({
	type : "post",
	async: true,
	datatype:"text; charset=utf-8",
	url: "/classMng/MngBld/classroomadd/classrInfo",
	data: {classId:classId},
	success: function(mapList)
				{
					//강의실정보 불러오기
					//newMapList : 자바스크립트 객체를 담은 배열
					 var clRInfo = JSON.parse(mapList);//전체 리스트
					 for(i in clRInfo)
					 {
					 var clRKind = "<option>"+clRInfo[i].codeName+"</option>";
					 $('select.classCode ').append(clRKind);						 
					 } 
				},
	});
});
$(document).ready(function(){
	$.ajax({
	type : "get",
	async: true,
	datatype:"text; charset=utf-8",
	url: "/classMng/MngBld/classroomadd/getbullid",
	data: {classId:classId},
	success: function(mapList)
				{
					//건물명 불러오기
					 var bulName = JSON.parse(mapList);//전체 리스트
					 for(i in bulName)
					 {
						 var bulNameAdd = "<option VALUE=\""+ bulName[i].BULID+"\">"+bulName[i].BULNAME+"</option>";
						 $('select.bulId').append(bulNameAdd);						 
					 } 
				}						 
			});
		});
//강의실 등록
$(document).on("click","#building",function(){

		 $.ajax({
				type : "post",
				async: true,
				datatype:"text; charset=utf-8",
				url: "/classMng/MngBld/classroomMng/MngBld",
				data: {classCapacity:$("#classCapacity").val(),
					classCode:$("#classCode").val(),
					classNumber:$("#classNumber").val(), 
					bulId:$("#bulId").val(), 
					classRemark:$("#classRemark").val() 
					},
				success: function(bulName)
							{
								if(confirm("등록되었습니다.")) document.location = "/classMng/MngBld/classr";
							}
				});
		});
		
	</script>
<html>


</head>
<body>
<div class="content-wrapper">
<div class="wrapper">
  <header class="main-header">
          <!-- /.box -->
          <!-- general form elements disabled -->
          <div class="box box-warning">
            <div class="box-header with-border">
              <h3 class="box-title">강의실등록</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <form role="form">
                <!-- text input -->
                     <!-- select -->
                <div class="form-group">
                <div class="form-group">
                </div>
                  <label>건물명</label>
                  <select class="form-control bulId " id="bulId" >
                  </select>
                </div>
                <div class="form-group">
                  <label>호수</label>
                  <input type="text" class="form-control classNumber" placeholder="숫자만 입력해 주세요" id="classNumber">
                </div>
                    <label>종류</label>
                  <select class="form-control classCode " id="classCode">
                  </select>
                  <div class="form-group">
                  <label>수용인원</label>
                  <input type="text" class="form-control people classCapacity " placeholder="숫자만 입력해 주세요" id="classCapacity">
                <!-- textarea -->
                <div class="form-group">
                  <label>비고</label>
                  <textarea class="form-control classRemark" rows="3" placeholder="Enter ..." id="classRemark"></textarea>
                </div>
				<div class="form-group">
                 <button type="button" class="btn btn-primary pull-right" style="margin-right: 5px;">
		            <i class=""></i> 취소
		          </button>
                 <button type="button" id="building" class="btn btn-primary pull-right" style="margin-right: 5px;" onclick="">
		            <i ></i> 등록
		          </button>
                </div>
              </form>
     	</div>
     </div>
   </header>
  </div>
 </div>
     
<%@ include file = "footer.jsp" %>	
	
</body>
</html>

