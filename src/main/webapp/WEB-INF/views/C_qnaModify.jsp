<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  
 <!-- ckeditor cdn -->
 <script src="https://cdn.ckeditor.com/4.14.0/standard/ckeditor.js"></script>


  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Q&A 게시판
        <small>과목명</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 마이페이지</a></li>
        <li><a href="#">과목명</a></li>
        <li class="active">Q&A 게시판 </li>
      </ol>
    </section>

     <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-12">
          <div class="box box-info">
            <div class="box-header">
              <h3 class="box-title">글보기
                <small>과목명</small>
              </h3>

            </div>
            <!-- /.box-header -->
			<div class="box-body">
			<form name="updateForm" role="form" method="post" action="/mypage/board/qna/modify"  enctype= "multipart/form-data">
              <!-- boNum -->
              <div class ="form-group">
              	<label>No.</label>
              	<input class ="form-control" id ='boNum'name ='boNum' value ="${update.boNum}" readonly="readonly"/>
              </div>
              
              <!-- boTitle -->
              <div class="form-group">
                  <label>제목</label>
                  <input class="form-control" id="boTitle" name ="boTitle" value ="${update.boTitle}"/>
                </div>
           		  <!-- boContent -->
                <div class="form-group">
                  <label>내용</label>
                  <textarea class="form-control"  rows="3" id="editor" name ='boContent'><c:out value ="${update.boContent}"/></textarea>
                </div>
				<!--memNum-->
				<div class ="form-group">
             	 	<label>작성자</label>
              		<input class ="form-control" id="memNum"name ="memNum" value ="${update.memNum}" readonly="readonly"/>
              	</div>
              	
              	<!-- file -->
              	<div class ="form-group" style="margin:15px;" >
	              	<c:forEach var="file" items="${file}" varStatus="var">
		              	<div>
	    	          		<input type='hidden' id="classfileNum" name="classfileNum_${var.index}" value="${file.CLASSFILENUM}"/>
		              		<input type='hidden' id="fileName" name="fileName" value="classfileNum_${var.index}">
		              		<a href ="#" id="fileName" onclick="return false;">${file.FILENAME}</a>(${file.FILESIZE}kb)
		              		<button id="fileDel" onclick="fn_del('${file.CLASSFILENUM}','${var.index}');" type="button" class="pull-right">삭제</button>
		              	</div>
	              	</c:forEach>
	             </div>
	             <div>
	           		<input type ='file'class ='form-control'name='file_"+(fileIndex++)+"'>
	           	 </div>
	       	    <!-- /.box-body -->  
	            <div class="box-footer">
                	<button data-oper="register" class="btn btn-primary">저장</button>
             		<button data-oper="cancel" class="btn">취소</button>
                </div>
               <!-- /.box-footer -->	
          	</form>
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col-->
      </div>
      </div>
      <!-- ./row -->
    </section>
    <!-- /.content -->
  </div>
 
<form role="form" action="/qna/modify" method='post'  enctype="multipart/form-data">
 	<input type='hidden' id='boNum' name="boNum" value='<c:out value="${list.boNum}"/>'>
	<input type='hidden' name='page' value='<c:out value="${cri.page}"/>'>
	<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
	<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
	<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
	<input type='text' id="fileNoDel" name="fileNoDel[]" value="">
	<input type='text' id="fileNameDel" name="fileNameDel[]" value="">
</form>   
 
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var formObj = $("form[name='updateForm']");
		
		$(document).on("click","#fileDel", function(){
			$(this).parent().remove();
		})
		
		fn_addFile();
		
		$(document).on("click","#register",function(){
	
			formObj.attr("action","/mypage/board/qna/modify");
			formObj.attr("method","post");
			formObj.submit();
			
			console.log("file:"+file);
		})	
		$("#cancel").on("click",function(){
			event.preventDefault();
			location.href="/mypage/board/qna/list"
		})
	});


	/*function fn_addFile(){
			var fileIndex = 1;
			//$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
			$(".fileAdd_btn").on("click", function(){
				$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
			});
			$(document).on("click","#fileDelBtn", function(){
				$(this).parent().remove();
				
			});
		}*/
	
	var fileNoArray = new Array();
	var fileNameArray = new Array();

	function fn_del(value,name){
		
		fileNoArray.push(value);
		fileNameArray.push(name);
		console.log("fileNoArray:"+fileNoArray);
		console.log("fileNameArray:"+fileNameArray);
		
		$("#fileNoDel").attr("value",fileNoArray);
		$("#fileNameDel").attr("value",fileNameArray);
	}
	
	CKEDITOR.replace( 'editor',{
     	enterMode : CKEDITOR.ENTER_BR
 	});
</script>
<%@ include file = "footer.jsp" %>

</body>
</html>
