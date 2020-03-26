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
              <h3 class="box-title">글쓰기
                <small>커뮤니티명</small>
              </h3>

            </div>
            <!-- /.box-header -->
              <!-- text input -->
                <div class="form-group">
                  <label>Text</label>
                  <input type="text" class="form-control" placeholder="Enter ...">
                </div>
            
           		 <div class="box-body pad">
             	 	<form>
               	    	 <textarea id="editor1" name="editor1" rows="10" cols="80">
                                            This is my textarea to be replaced with CKEditor.
                    	</textarea>
              		</form>
          		 </div>
	          		 
	             <div class="form-group">
	                	  <label for="exampleInputFile">File input</label>
	                  <input type="file" id="exampleInputFile">
	              </div>
	              
	               <div class="box-footer">
                	<button type="submit" class="btn btn-primary">Submit</button>
             	</div> 
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