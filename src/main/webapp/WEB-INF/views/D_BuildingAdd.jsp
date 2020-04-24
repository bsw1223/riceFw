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
<div class="wrapper">
  <header class="main-header">
          <!-- /.box -->
          <!-- general form elements disabled -->
          <div class="box box-warning">
            <div class="box-header with-border">
              <h3 class="box-title">건물 등록</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <form role="form">
                <!-- text input -->
                     <!-- select -->
               
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
                  <input type="text" class="form-control classNumber" placeholder="" id="bulPhoneNum">
                <div class="form-group">
                  <label>강의실수</label>
                  <input type="text" class="form-control people classCapacity " placeholder="숫자만 입력해 주세요" id="bulClassNum">
                </div>
                <!-- textarea -->
                <div class="form-group">
                  <label>층수</label>
                   <input type="text" class="form-control classNumber" placeholder="숫자만 입력해 주세요" id="bulFloor">
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
   </header>
  </div>
 </div>
     
<%@ include file = "footer.jsp" %>	
	
</body>
</html>

