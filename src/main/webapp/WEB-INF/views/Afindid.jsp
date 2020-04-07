<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>RiceLMS | 아이디찾기</title>
<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet" href="${contextPath}/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="${contextPath}/resources/bower_components/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="${contextPath}/resources/bower_components/Ionicons/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="${contextPath}/resources/dist/css/AdminLTE.min.css">
<!-- iCheck -->
<link rel="stylesheet" href="${contextPath}/resources/plugins/iCheck/square/blue.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

<!-- Google Font -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition register-page">
<div class="register-box">
  <div class="register-logo">
    <a href="/"><b>Rice</b>LMS</a>
  </div>

  <div class="register-box-body">
    <p class="login-box-msg">아이디 찾기</p>

    <form action="/member/find/id" method="post" onsubmit="return findidCheck()">
      <div class="form-group has-feedback">
        <input type="text" class="form-control" name="memName" placeholder="이름을 입력하여주세요">
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
      <div class="font-weight-bold text-danger" id="name_check"> </div>
      <!-- 이름 -->
      
      <div class="form-group has-feedback">
        <input type="email" class="form-control" name="memEmail" placeholder="Email">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="font-weight-bold text-danger" id="email_check"> </div>
      <!-- 이메일  -->
      
      <div class="row">        
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-flat">아이디 찾기</button>
        </div>
        <!-- /.col -->
      </div>
    </form>
  </div>
  <!-- /.form-box -->
</div>
<!-- /.register-box -->

	<!-- jQuery 3 -->
	<script src="${contextPath}/resources/bower_components/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script src="${contextPath}/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- iCheck -->
	<script src="${contextPath}/resources/plugins/iCheck/icheck.min.js"></script>
	<script>			
		function nameCheck() {
			var memName = $("input[name='memName']").val();
			var name_re = RegExp(/^[가-힣]{2,10}$/); 	// 이름 정규식, 한글만 입력 2~6 글자
			var name_check = $("#name_check");
			
			if(name_re.test(memName)) {
				name_check.text("");
				return true;
			} else{
				name_check.text("이름을 제대로 입력해주세요");				
				return false;
			}
		}
		
		function emailCheck() {
			var memEmail = $("input[name='memEmail']").val();
			var email_re = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/); 	// email 정규식
			var email_check = $("#email_check");
			
			if(email_re.test(memEmail)) {
				email_check.text("");
				return true;
			} else{
				email_check.text("이메일을 제대로 입력해주세요");				
				return false;
			}
		}		
		
		$("input[name='memName']").blur(function() {
			nameCheck();
		});
		$("input[name='memEmail']").blur(function() {
			emailCheck();
		});
		
		function findidCheck() {			
			if(nameCheck() && emailCheck()) {
				return true;
			}
			else {
				return false;
			}
		}
		
		$(function() {
			$('input').iCheck({
				checkboxClass : 'icheckbox_square-blue',
				radioClass : 'iradio_square-blue',
				increaseArea : '20%' /* optional */
			});
		});
	</script>
</body>
</html>
