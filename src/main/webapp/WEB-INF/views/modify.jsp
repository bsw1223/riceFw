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
              <h3 class="box-title">글수정
                <small>커뮤니티명</small>
              </h3>	
            </div>
            <!-- /.box-header -->
              <!-- text input --> 
              <form action="/updateBoard.do" id="formBoard">
              
              	<div class="form-group">
                  <label>Bno</label>
                  <input type="text" class="form-control" name="bno" value ='<c:out value ="${board.bno}"/>' readonly ="readonly" >
                </div>
              
                <div class="form-group">
                  <label>Title</label>
                  <input type="text" class="form-control" name="title" value ='<c:out value ="${board.title}"/>'>
                </div>
            
                    	
                <div class="form-group">
					<label>Text area</label>
					<textarea class="form-control" rows="3" name="content"><c:out value ="${board.content}"/></textarea>
				</div>

          		 
          		<div class="form-group">
                  <label>Writer</label>
                  <input type="text" class="form-control" name="writer" value ='<c:out value ="${board.writer}"/>' >
                </div>
	          		 
	             <div class="form-group">
	                	  <label for="exampleInputFile">File input</label>
	                  <input type="file" id="exampleInputFile">
	              </div>
	               <div class="box-footer">
                		<button type="submit" data-oper="modify" class="btn btn-primary" >등록</button>
                		<button type = "submit" data-oper="delete" class="btn btn-primary">삭제</button>	
                		<button type="reset" class="btn btn-primary">Reset</button>
             	   </div>
             	   <input type="hidden" id='regdate' name='regdate' value='<c:out value ="${board.regdate}"/>'>
             	   <input type="hidden" id='updateDate' name='updateDate' value='<c:out value ="${board.updateDate}"/>'>
             	  </form>
             	
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col-->
      </div>
      <!-- ./row -->
    </section>
    <!-- /.content -->
  </div>
  </head>
  <body>
  </body>

<!-- CK Editor -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="resources/bower_components/ckeditor/ckeditor.js"></script>


<script type="text/javascript">
$(document).ready(function(){
	
	var formObj = $("form");
	
	$("button").on("click", function(e){
		
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if(operation==="delete"){
			formObj.attr("action","/delete.do");
		}else if(operation==="list"){
			self.location="/board.do";
			return;
		}
		formObj.submit();
	});
	
});

</script>
<%@ include file = "footer.jsp" %>
</body>
</html>