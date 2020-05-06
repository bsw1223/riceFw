<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>


<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			<c:out value='${commName}' />
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> 마이페이지</a></li>
			<li><a href="#"><c:out value='${commName}' /></a></li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box box-info">
					<div class="box-header">
						<h3 class="box-title">
							글 수정
						</h3>

					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<form name="updateForm" role="form" method="get">

							<!-- boTitle -->
							<div class="form-group">
								<label>제목</label> <input class="form-control" id="boTitle"
									name="boTitle" value="${comm.boTitle}" />
							</div>
							<!-- boContent -->
							<div class="form-group">
								<label>내용</label>
								<textarea class="form-control" rows="3" id='boContent'
									name='boContent'><c:out value="${comm.boContent}" /></textarea>
							</div>
							<!--memNum-->
							<div class="form-group">
								<label>작성자</label> <input class="form-control" id="memId"
									name="memId" value="${comm.memId}" readonly="readonly" />
							</div>
							<input type="hidden" class="form-control" name ='memNum' value="${comm.memNum}">
                			<input type="hidden" class="form-control" name ='boViews' value="${comm.boViews}">
                			<input type="hidden" class="form-control" name ='boLikes' value="${comm.boLikes}">
                			<input type="hidden" class="form-control" name ='boRegDate' value="${comm.boRegDate}">
                			<input type="hidden" class="form-control" name ='boNum' value="${comm.boNum}">
							<!-- /.box-body -->
					<div class="row">
						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading">Files</div>
								
								<div class="panel-body">
									<div class="form-group uploadDiv">
										<input type="file" name="uploadFile" multiple="multiple">
									</div>
									<div class="uploadResult">
										<ul>
										
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
							<div class="box-footer">
								<button data-oper="modify" class="btn btn-primary">저장</button>
								<button data-oper="cancel" class="btn btn-primary">취소</button>
							</div>
							<!-- /.box-footer -->
<!-- 						</form> -->
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
<script>
	$(document).ready(function() {
		
		(function(){
			var boNum = '<c:out value="${comm.boNum}"/>';
			console.log(boNum);
			
			//첨부파ㄹ 사이즈,종류확인
			$.getJSON("/comm/getAttachList",{boNum : boNum}, function(arr){
				console.log(arr);
				var str = "";

				
				$(arr).each(function(i, attach){
					
					var fileCallPath= encodeURIComponent(attach.filePath+"/s_"+attach.classFileNum+"_"+attach.fileName);
					
					str += "<li";
					str += " data-path='"+attach.filePath+"' data-classfilenum='"+attach.classFileNum+"'data-filename='"+attach.fileName+"' data-type='"+attach.fileCode+"' data-size='"+attach.fileSize+"' data-savefilename='"+attach.saveFileName+"'data-boNum='"+attach.boNum+"'><div>";
					str += "<span>" + attach.fileName+ "</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
					str += "</div>"
					str + "</li>";	
				});
				
				$(".uploadResult ul").html(str);
			});
		})();
		
		var cloneObj = $(".uploadDiv");
		var regex = new RegExp("(.*?)\.(exe|sh|alz)$");
		var maxSize = 7340032;

		function checkExtension(fileName, fileSize) {
			if (fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}
			if (regex.test(fileName)) {
				alert("해당 종류의 파일은 업로드할 수 없습니다.")
				return false;
			}
			return true;
		}

		
		$(".uploadResult").on("click","button",function(e){
			console.log("delete file");
			
			if(confirm("삭제하시겠습니까?")){
				var targetLi =$(this).closest("li");
				targetLi.remove();
			}
		});
		
		var gallery_files = [];
		var index =gallery_files.length;
		
		$(document).on('change',$("input[type='file']"),function(e) {
			var formData = new FormData();
			
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			var filesArr= Array.prototype.slice.call(files);
			console.log("fileArr"+filesArr);
			filesArr.forEach(function(f){
				gallery_files.push(f);
				
			});

			for (var i = 0; i < files.length; i++) {

				if (!checkExtension(files[i].name , files[i].size)) {
					return false;
				}

				formData.append("uploadFile",files[i]);
				
			}
			console.log("되나여"+ gallery_files);
			if(filesArr==""){
				console.log("없어");
			}else{

			$.ajax({
						url : '/comm/uploadAction',
						contentType : false,
						processData : false,
						data : formData,
						type : 'Post',
						dataType : 'json',
						success : function(result) {
							console.log(result);
							showUploadedFile(result);
							$(".uploadDiv").html(cloneObj.html());
						}
					}); //$ajax up
			}
		});

		function showUploadedFile(uploadResultArr) {
			var uploadResult = $(".uploadResult ul");
			if (!uploadResultArr || uploadResultArr.length == 0) {
				return false;
			}

			var uploadUL = $(".uploadResult ul");

			var str = "";

			$(uploadResultArr).each(
							function(i, obj) {
								
								var fileCallPath = encodeURIComponent(obj.filePath+ "/"+ obj.classFileNum+ "_"+ obj.fileName);
								var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
								str += "<li";
								str += " data-path='"+obj.filePath+"' data-classfilenum='"+obj.classFileNum+"'data-filename='"+obj.fileName+"' data-type='"+obj.fileCode+"' data-size='"+obj.fileSize+"' data-savefilename='"+obj.saveFileName+"'><div>";
								str += "<span>" + obj.fileName+ "</span>";
								str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
								str += "</div>";
								str + "</li>";
							});
			console.log(str);
			uploadResult.append(str);
		};
		

		 
		/* $("#modify").on("click", function() {
			var str ="";
			
			$(".uploadResult ul li").each(function(i,obj){
				var jobj=$(obj);
				
				str += "<input type='hidden' name='filelist["+i+"].fileName' value='"+jobj.data("filename")+"'>";
				str += "<input type='hidden' name='filelist["+i+"].classFileNum' value='"+jobj.data("classfilenum")+"'>";
				str += "<input type='hidden' name='filelist["+i+"].filePath' value='"+jobj.data("path")+"'>";
				str += "<input type='hidden' name='filelist["+i+"].fileCode' value='"+jobj.data("type")+"'>";
				str += "<input type='hidden' name='filelist["+i+"].fileSize' value='"+jobj.data("size")+"'>";
				str += "<input type='hidden' name='filelist["+i+"].saveFileName' value='"+jobj.data("saveFileName")+"'>";
				str += "<input type='hidden' name='filelist["+i+"].boNum' value='"+jobj.data("boNum")+"'>";
				str += "<input type='hidden' name='filelist["+i+"].memId' value='${list.memId}'>";
				console.log(str);
			});
			formObj.append(str).submit();
			formObj.attr("action", "/mypage/board/mdfy/${list.boCode}/${list.boURL}");
			formObj.attr("method", "get");
			formObj.submit();
		})
		$("#cancel").on("click", function() {
			event.preventDefault();
			location.href = "/mypage/board/${list.boCode}/${list.boURL}"
		}) */
	});
</script>

<script>
$(document).ready(function() {


	  var formObj = $("form");

	  $('button').on("click", function(e){
	    
	    e.preventDefault(); 
	    
	    var operation = $(this).data("oper");
	    
	    console.log(operation);
	    
	     if(operation === 'list'){
	      //move to list
	      formObj.attr("action", "/comm/${comm.boURL}");
		  formObj.attr("method", "get");
	      
	      var pageTag = $("input[name='page']").clone();
	      var amountTag = $("input[name='amount']").clone();
	      var keywordTag = $("input[name='keyword']").clone();
	      var typeTag = $("input[name='type']").clone();      
	      
	      formObj.empty();
	      
	      formObj.append(pageTag);
	      formObj.append(amountTag);
	      formObj.append(keywordTag);
	      formObj.append(typeTag);	  
	      
	    }else if(operation === 'modify'){
	        
	        console.log("submit clicked");
	        
	        var str = "";
	        
	        $(".uploadResult ul li").each(function(i, obj){
	          
	          var jobj = $(obj);
	          
	          console.dir(jobj);
	          
	          str += "<input type='hidden' name='filelist["+i+"].fileName' value='"+jobj.data("filename")+"'>";
				str += "<input type='hidden' name='filelist["+i+"].classFileNum' value='"+jobj.data("classfilenum")+"'>";
				str += "<input type='hidden' name='filelist["+i+"].filePath' value='"+jobj.data("path")+"'>";
				str += "<input type='hidden' name='filelist["+i+"].fileCode' value='"+jobj.data("type")+"'>";
				str += "<input type='hidden' name='filelist["+i+"].fileSize' value='"+jobj.data("size")+"'>";
				str += "<input type='hidden' name='filelist["+i+"].saveFileName' value='"+jobj.data("savefilename")+"'>";
				str += "<input type='hidden' name='filelist["+i+"].boNum' value='"+jobj.data("boNum")+"'>";
				str += "<input type='hidden' name='filelist["+i+"].memId' value='${list.memId}'>";
	          
	        });
	        formObj.append(str).submit();
	        formObj.attr("action", "/comm/mdfy/${comm.boURL}");
			formObj.attr("method", "get");
      }
  
	    formObj.submit();
	  });

});

</script>
<%@ include file="footer.jsp"%>

</body>
</html>
