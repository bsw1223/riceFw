<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>


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
			<form name="updateForm" role="form" method="post" action="/mypage/board/qna/modify">
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
                  <textarea class="form-control"  rows="3" id ='boContent' name ='boContent'><c:out value ="${update.boContent}"/></textarea>
                </div>
				<!--memNum-->
				<div class ="form-group">
             	 	<label>작성자</label>
              		<input class ="form-control" id="memNum"name ="memNum" value ="${update.memNum}" readonly="readonly"/>
              	</div>
	       	    <!-- /.box-body -->  
	            <div class="box-footer">
                	<button data-oper="modify" class="btn btn-primary">저장</button>
             		<button data-oper="cancel" class="btn btn-primary">취소</button>
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
 
 
 
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#modify").on("click",function(){
	
			formObj.attr("action","/mypage/board/qna/modify");
			formObj.attr("method","post");
			formObj.submit();
		})	
		$("#cancel").on("click",function(){
			event.preventDefault();
			location.href="/mypage/board/qna/list"
		})
	})
	
</script>
<%@ include file = "footer.jsp" %>

</body>
</html>
