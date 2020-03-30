<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>

<html>
<head>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Text Editors
        <small>Advanced form element</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Forms</a></li>
        <li class="active">Editors</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-12">
          <div class="box box-info">
            <div class="box-header">
              <h3 class="box-title">글보기
                <small>커뮤니티명</small>
              </h3>

            </div>
            <!-- /.box-header -->

              <!-- bno -->
              <div class ="form-group">
              	<label>bno</label><input class ="form-control"name ="bno" value ="'<c:out value ="${listB.bno}"/>' readonly ="readonly">
              </div>
              
              <!-- title -->
              <div class="form-group">
                  <label>제목</label>
                  <input type="text" class="form-control" name ="title" value ="'<c:out value ="${listB.title}"/>' readonly ="readonly">
                </div>

           		  <!-- contents -->
                <div class="form-group">
                  <label>내용</label>
                  <textarea class="form-control" rows="3" name ="content" value ="'<c:out value ="${listB.content}"/>' readonly ="readonly"></textarea>
                </div>
				
				<!-- writer -->
				<div class ="form-group">
              	<label>bno</label><input class ="form-control"name ="writer" value ="'<c:out value ="${listB.writer}"/>' readonly ="readonly">
              </div>
              

	          		 <!-- 
	             <div class="form-group">
	                	  <label for="exampleInputFile">File input</label>
	                  <input type="file" id="exampleInputFile">
	              </div> -->
	             <!-- /.box-body -->  
	            <div class="box-footer">
                	<button data-oper="submit" class="btn btn-primary"
                		onclick="location.href='/board/modify?bno=<c:out value="${listB.bno}"/>'">수정</button>
             	</div> 
                <div class="box-footer">
                    <button data-oper="list" class="btn btn-default"
                    	onclick="location.href='/board/list'">뒤로가기</button>
                </div>
               <!-- /.box-footer -->	
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col-->
      </div>
      <!-- ./row -->
    </section>
    <!-- /.content -->
  </div>

<!-- CK Editor -->
<script src="resources/bower_components/ckeditor/ckeditor.js"></script>


<%@ include file = "footer.jsp" %>
</body>
</html>