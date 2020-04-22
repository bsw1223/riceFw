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
      	커뮤니티 만들기
      </h1>
      <ol class="breadcrumb" >
        <li><a href="#"><i class="fa fa-dashboard"></i> 마이페이지</a></li>
        <li><a href="#">커뮤니티 메인</a></li>
        <li class="active">커뮤니티 생성</li>
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
              <h3 class="box-title">커뮤니티 만들기
              </h3>
            </div>
            <!-- /.box-header -->
             <div class="box-body">
              <!-- boTitle -->
              <form role="form" name="writeForm" action ="/comm/commRegister" method='get'>
             	<div class="form-group">
                  <label>커뮤니티 이름</label>
                  <input type="text" class="form-control" name ='commName' id='commName'>
                </div>
                
                <div class="form-group">
                  <label>커뮤니티 URL</label>
                   <input type="text" class="form-control" name ='commURL' id='commURL'>
                </div>
           		  <!-- boContent -->
                <div class="form-group">
                  <label>커뮤니티 설명</label>
                  <textarea class="form-control" id="commDesc" rows="3" name ='commDesc'></textarea>
                </div>

                <div class="form-group">
                  <label>작성자</label>
                  <input type="text" class="form-control" value="${memId}" name ='memId'  id='memId' readonly="readonly">
                </div>
                
                
                <div class="form-group">
                  <label>커뮤니티 레벨</label>
                  <input type="text" class="form-control" value="${memLevel}"   id ='commLevel' name ='commLevel' readonly="readonly">
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
 
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var formObj =$("form[name='writeForm']");
		
		$("#regBtn").on("click",function(){
			self.location="/comm/makecomm";
			formObj.submit();
		 });
		 $("#listBtn").on("click",function(){
		 	self.location="/comm/makecomm";
		 });
	});
	
	CKEDITOR.replace( 'editor',{
     	enterMode : CKEDITOR.ENTER_BR,
 	});
	
</script>
<%@ include file = "footer.jsp" %>

</body>
</html>
