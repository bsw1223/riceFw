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
      <ol class="breadcrumb" >
        <li><a href="#"><i class="fa fa-dashboard"></i> 마이페이지</a></li>
        <li><a href="#">과목명</a></li>
        <li class="active">Q&A 게시판 </li>
      </ol>
    </section>
    
    <!-- Main content -->
    <section class="content">
      <div class="row">
        <!-- left column -->
        <div class="col-md-12">
          <!-- general form elements -->
          <div class="box box-info">
            <div class="box-header">
              <h3 class="box-title">글쓰기
              </h3>
            </div>
            <!-- /.box-header -->
             <div class="box-body">
              <!-- boTitle -->
              <form role="form" name="writeForm"action ="/mypage/board/qna/write" method='post'>
             	<div class="form-group">
                  <label>제목</label>
                  <input type="text" class="form-control" name ='boTitle'>
                </div>
           		  <!-- boContent -->
                <div class="form-group">
                  <label>내용</label>
                  <textarea class="form-control" id="editor" rows="3" name ='boContent'></textarea>
                </div>
				<!--memNum-->
				<div class ="form-group">
              		<label>작성자</label><input class ="form-control"name ='memNum'>
              	</div>
	       	    <!-- /.box-body -->  
	            <div class="box-footer">
                	<button id="regBtn"data-oper="submit" class="btn btn-primary" >등록</button>
                    <button id="listBtn"data-oper="list" class="btn btn-default">뒤로가기</button>
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
 
 
<form id="actionForm" action="/board.do" method='get'>
	<input type="hidden" name="page" value='${pageMaker.cri.page}' >
	<input type="hidden" name="amount" value='${pageMaker.cri.amount}' >
</form>  
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var formObj =$("form[name='writeForm']");
		
		$("#regBtn").on("click",function(){
			self.location="/qna/list";
			formObj.submit();
		 });
		 $("#listBtn").on("click",function(){
		 	self.location="/qna/list";
		 });
	});
	
	CKEDITOR.replace( 'editor',{
     	enterMode : CKEDITOR.ENTER_BR,
 	});
	
</script>
<%@ include file = "footer.jsp" %>

</body>
</html>
