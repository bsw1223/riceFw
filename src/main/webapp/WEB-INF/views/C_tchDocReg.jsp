<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>

<!-- ckeditor cdn -->
<script src="https://cdn.ckeditor.com/4.14.0/standard/ckeditor.js"></script>
<style>
#banner{
border: 1px solid;
width: 200px;
float: left;
padding: 10px;
margin-left: 30px;
margin-top: 90px;
min-width:150px;
}

@media screen and (max-width: 1500px){
#banner{
	display: none;
}}

#banner_left{
width: 193px;
float: right;
margin: auto;
padding-top: 90px;
vertical-align: middle;
min-width:150px;
}

@media screen and (max-width: 1300px){
#banner_left{
	display: none;
}
#banner_left2{
	display: none;

}
}
</style>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
	<div class="col-md-2" style="margin: 20px;"></div>
		<h1>
			<c:out value='${sjctName}' />
		</h1>
		<ol class="breadcrumb">
			<li class="active"><i class="fa fa-dashboard"></i> 마이페이지</li>
			<li class="active"><c:out value='${sjctName}'/></li>
			<li class="active"><c:out value='${pageTitle}'/></li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<!-- left column -->
			<div class="col-md-2">
				<div id="banner_left">
					<img id="pp" src="">
					<%@ include file="left_banner1.jsp"%>
				</div>
				<div>
					<%@ include file="left_banner2.jsp"%>
				</div>
			</div>
				<div class="col-md-8">
				<!-- general form elements -->
				<div class="box box-warning">
					<div class="box-header">
						<h3 class="box-title"><c:out value='${pageTitle}' /></h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<form role="form" name="writeForm" action="/mypage/board/reg/${boCode}/${boURL}" method='get'>
							<div class="form-group">
								<label>제목</label> <input type="text" class="form-control"
									name='boTitle'>
							</div>
							<!-- boContent -->
							<div class="form-group">
								<label>내용</label>
								<textarea class="form-control" id="editor" rows="3"
									name='boContent'></textarea>
							</div>

							<div class="form-group">
								<label>작성자</label> <input type="text" class="form-control"
									value="${memId}" readonly="readonly">
							</div>

							<input type="hidden" class="form-control" name='memNum' value="${memNum}"> 
							<input type="hidden" class="form-control" name='boViews' value="0"> 
							<input type="hidden" class="form-control" name='boLikes' value="0">

							<div class="row">
								<div class="col-lg-12">
									<div class="panel panel-default">
										<div class="panel-heading">파일첨부</div>
										<div class="panel-body">
											<div class="form-group uploadDiv">
												<input type="file" name="uploadFile" multiple>
											</div>
											
											<div class='uploadResult'>
												<ul>
												
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- /.box-body -->
							<div class="box-footer">
								<button type="submit" id="regBtn" class="btn btn-primary" name="regBtn">등록</button>
								<button id="listBtn" data-oper="list" class="btn btn-default">뒤로가기</button>
							</div>
							<!-- /.box-footer -->
						</form>
						<!--  </form> -->
					</div>
					<!-- /.box -->
				</div>
				<!-- /.col-->
			</div>
			<div id="banner">
					<%@ include file="banner.jsp"%>
			</div>
		</div>
		<!-- ./row -->
	</section>
	<!-- /.content -->
</div>


<form id="actionForm" action="/mypage/board/${boCode}/${boURL}"
	method='get'>
	<input type="hidden" name="boCode" value='${boCode}'> <input
		type="hidden" name="boURL" value='${boURL}'>
</form>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
						var formObj = $("form[role='form']");
						
						$("button[type='submit']").on("click",function(e){
							e.preventDefault();
							console.log("submit check");
							var str ="";
						$(".uploadResult ul li").each(function(i, obj){
								var jobj = $(obj);
								str += "<input type='hidden' name='filelist["+i+"].fileName' value='"+jobj.data("filename")+"'>";
								str += "<input type='hidden' name='filelist["+i+"].classFileNum' value='"+jobj.data("classfilenum")+"'>";
								str += "<input type='hidden' name='filelist["+i+"].filePath' value='"+jobj.data("path")+"'>";
								str += "<input type='hidden' name='filelist["+i+"].fileCode' value='"+jobj.data("type")+"'>";
								str += "<input type='hidden' name='filelist["+i+"].fileSize' value='"+jobj.data("size")+"'>";
								str += "<input type='hidden' name='filelist["+i+"].saveFileName' value='"+jobj.data("savefilename")+"'>";
								str += "<input type='hidden' name='filelist["+i+"].memId' value='${memId}'>";
								console.log(str);
						});
						formObj.append(str).submit();
					});
						
						
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
						
						var gallery_files = [];
						var index =gallery_files.length;
						
						$(document).on('change',$("input[type='file']"),function(e) {
											var formData = new FormData();

											var inputFile = $("input[name='uploadFile']");
											var files = inputFile[0].files;
											var filesArr= Array.prototype.slice.call(files);
											
											filesArr.forEach(function(f){
												gallery_files.push(f);
												
											});											

											for (var i = 0; i < gallery_files.length; i++) {

												if (!checkExtension(gallery_files[i].name,gallery_files[i].size)) {
													return false;
												}

												formData.append("uploadFile",gallery_files[i]);
											}
											
											if(filesArr==""){
											}else{
												
												$.ajax({
													url : '/mypage/board/uploadAction',
													contentType : false,
													processData : false,
													data : formData,
													type : 'Post',
													dataType : 'json',
													success : function(result) {
														console.log("result"+result);
														showUploadedFile(result);
														$(".uploadDiv").html(cloneObj.html());
													}
												}); //$ajax up
												
											}
										});
						
						//파일 리스트
						function showUploadedFile(gallery_files) {
							
							if (!gallery_files || gallery_files.length == 0) {
								return false;
							}

							var uploadUL = $(".uploadResult ul");

							var str = "";

							$(gallery_files).each(
											function(i, obj) {
												
												var fileCallPath = encodeURIComponent(obj.filePath+ "/"+ obj.classFileNum+ "_"+ obj.fileName);
												var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
												str += "<li";
												str += " data-path='"+obj.filePath+"' data-classfilenum='"+obj.classFileNum+"'data-filename='"+obj.fileName+"' data-type='"+obj.fileCode+"' data-size='"+obj.fileSize+"' data-savefilename='"+obj.saveFileName+"'><div>";
												str += "<span>" + obj.fileName+ "  </span>";
												str += "<a data-file=\'"+fileCallPath+"\' data-type='file' data-filename='"+obj.fileName+"' class='fa fa-times'></a><br>";
												str += "</div>"
												str + "</li>";
											});;
							uploadUL.html(str);
						}
						
						//파일삭제

						$(".uploadResult").on("click", "a", function(e) {

							console.log("delete");
							console.log($(this));
							var targetFile = $(this).data("file");
							var type = $(this).data("type");
							var targetLi = $(this).closest("li");
							var filename = $(this).data("filename");
						
							for(var i = 0; i < gallery_files.length; i++){

								if(gallery_files[i].name.toString() == filename){
									gallery_files.splice(i, 1);	// 삭제
									break;
								}
							}

							$.ajax({
								url : '/mypage/board/deleteFile',
								data : {
									fileName : targetFile,
									type : type
								},
								dataType : 'Text',
								type : 'Post',
								success : function(result) {
									targetLi.remove();
								}

							});
						});

						$("#regBtn").on("click", function() {

							self.location="/mypage/board/${boCode}/${boURL}";
							formObj.submit();
						});
						 $("#listBtn").on("click",function(){
						 	self.location="/mypage/board/${boCode}/${boURL}";
						 });
						 
						 
					});

	CKEDITOR.replace('editor', {
		enterMode : CKEDITOR.ENTER_BR,
	});
</script>
<%@ include file="footer.jsp"%>

</body>
</html>
