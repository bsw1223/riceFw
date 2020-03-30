<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
              	<label>bno</label>
              	<input class ="form-control" name ="bno" value ='<c:out value ="${board.bno}"/>' readonly="readonly"/>
              </div>
              
              <!-- title -->
              <div class="form-group">
                  <label>Title</label>
                  <input type="text" class="form-control" name ="title" value ='<c:out value ="${board.title}"/>' readonly="readonly"/>
                </div>

           		  <!-- contents -->
                <div class="form-group">
                  <label>Content</label>
                  <textarea class="form-control" rows="3" name ="content" readonly="readonly"/>
                  	<c:out value ="${board.content}"/>
                  </textarea>
                </div>
				
				<!-- writer -->
			   <div class ="form-group">
              	 <label>Writer</label><input class ="form-control" name ="writer" value ='<c:out value ="${board.writer}"/>' readonly="readonly"/>
               </div>

                	<button data-oper="submit" class="btn btn-primary" onclick="location.href='/update.do?bno=<c:out value="${board.bno}"/>'">수정</button>

                    <button data-oper="list" class="btn btn-default" onclick="location.href='/board.do'">뒤로가기</button>

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
 </form>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="resources/bower_components/ckeditor/ckeditor.js"></script>


<%@ include file = "footer.jsp" %>
</body>
</html>