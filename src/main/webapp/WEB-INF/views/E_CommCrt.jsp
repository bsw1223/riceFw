<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>

<!-- ckeditor cdn -->
<script src="https://cdn.ckeditor.com/4.14.0/standard/ckeditor.js"></script>
<c:if test="${param.signupMsg eq 'false'}">
	<script>
		alert("커뮤니티 만들기에 실패했습니다");
	</script>
</c:if>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>커뮤니티 만들기</h1>
		<ol class="breadcrumb">
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
						<h3 class="box-title">커뮤니티 만들기</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">		
						<form action="/comm/commRegister" method='post' onsubmit="return commCheck()">
							<div class="form-group">
								<label>커뮤니티 이름</label> <input type="text" class="form-control"
									name='commName' id='commName' placeholder="커뮤니티 명을 입력하여주세요">
							</div>
							<div class="font-weight-bold" id="name_check"></div>

							<div class="form-group">
								<label>커뮤니티 URL</label> <input type="text" class="form-control"
									name='commURL' id='commURL' placeholder="커뮤니티 URL을 입력하여주세요">
							</div>
							
							<div class="font-weight-bold" id="url_check"></div>
							
							<!-- boContent -->
							<div class="form-group">
								<label>커뮤니티 설명</label>
								<textarea class="form-control" id="commDesc" rows="3"
									name='commDesc'></textarea>
							</div>

							<div class="form-group">
								<label>작성자</label> <input type="text" class="form-control" value="${memId}"
									name='memId' id='memId' readonly="readonly">
							</div>

							<!-- /.box-body -->
							<div class="box-footer">
								<button id="regBtn" data-oper="submit" class="btn btn-primary">등록</button>
								<button id="listBtn" data-oper="list" class="btn btn-default">뒤로가기</button>
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
	
	var comm_result = false;
	var commName_result = false;
	
	function urlCheck() {
		var commURL = $("input[name='commURL']").val();
		var url_re = RegExp(/^[a-zA-Z]{5,10}$/);	// 아이디 정규식, 영어 숫자만 입력가능 5~15 자리
		var url_check = $("#url_check");

		if(url_re.test(commURL)) {
			$.ajax({
				async : true,
				type : "POST",
				url : '/comm/urlCheck',
				data : commURL,
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					if (data == '1') { 
						url_check.removeClass("text-success");
						url_check.addClass("text-danger");
						url_check.text("이미 가입된 URL 입니다");
						$("input[name='commURL']").focus();
						
						comm_result = false;
					} else if (data == '0') { 
						url_check.removeClass("text-danger");
						url_check.addClass("text-success");
						url_check.text("사용가능한 URL입니다");
						
						comm_result = true;
					}
				},
				error : function(e) {
					console.log("error : " + e);
				}
			});
		} else {
			url_check.removeClass("text-success");
			url_check.addClass("text-danger");
			url_check.text("5~10글자에 영어만 사용 가능합니다");				
			comm_result = false;
		}			
	};
	
	function nameCheck() {
		var commName = $("input[name='commName']").val();
		var name_re = RegExp(/^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*]{2,15}$/);
		var name_check = $("#name_check");

		if(name_re.test(commName)) {
			$.ajax({
				async : true,
				type : "POST",
				url : '/comm/nameCheck',
				data : commName,
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					if (data == '1') { // 중복 url이 있는 경우
						name_check.removeClass("text-success");
						name_check.addClass("text-danger");
						name_check.text("이미 가입된 이름 입니다");
						$("input[name='commName']").focus();
						
						commName_result=false;
					} else if (data == '0') { // 중복 url이 없는 경우
						name_check.removeClass("text-danger");
						name_check.addClass("text-success");
						name_check.text("사용가능한 이름입니다");
						
						commName_result=true;

					}
				},
				error : function(e) {
					console.log("error : " + e);
				}
			});
		} else {
			name_check.removeClass("text-success");
			name_check.addClass("text-danger");
			name_check.text("5~10글자에 영어, 숫자, 한글만 사용 가능합니다");				
			commName_result=false;
		}			
	}
	$("input[name='commURL']").blur(function() {
		urlCheck();
	});
	$("input[name='commName']").blur(function() {
		nameCheck();
	});
	
	function commCheck() {
		if(commName_result && comm_result) {
			return true;
		}
		else {
			return false;
		}
	}
	
</script>
<%@ include file="footer.jsp"%>

</body>
</html>
