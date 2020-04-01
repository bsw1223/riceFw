<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>RiceLMS | Registration </title>
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
    <p class="login-box-msg">간편하게 가입</p>

    <form action="/member/signup.do" method="post">
      <div class="form-group has-feedback">
        <input type="radio" class="form-control" name="authId" value="1001">
        <label for="1001">학생</label>
        <input type="radio" class="form-control" name="authId" value="1002">
        <label for="1002">강사</label>
      </div>
      <!-- 강사 / 학생 구분 radio button -->
      
      <div class="form-group has-feedback">
        <input type="text" class="form-control" name="memName" placeholder="이름을 입력하여주세요">
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
      <!-- 이름 -->
      
      <div class="form-group has-feedback">
        <input type="text" class="form-control" name="memId" placeholder="아이디를 입력하여주세요">
<!--         <span class="glyphicon glyphicon-user form-control-feedback"></span> -->
      </div>   
      <div class="font-weight-bold" id="id_check"> </div>
      <!-- ID -->
      
      <div class="form-group has-feedback">
        <input type="password" class="form-control" name="memPwd" placeholder="8-20자의 영문 대,소문자,숫자,특수문자를 조합">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <!-- 비밀번호  -->
      <div class="form-group has-feedback">
        <input type="password" class="form-control" name="memPwdCheck" placeholder="비밀번호를 동일하게 한번 더 입력하여주세요">
        <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
      </div>
      <div class="font-weight-bold" id="pwd_check"> </div>
      <!-- 비밀번호 check -->
      
      <div class="form-group has-feedback">
        <input type="tel" class="form-control" name="memTel" placeholder="숫자만 입력해주세요">
        <span class="glyphicon glyphicon-earphone form-control-feedback"></span>
      </div>
      <!-- 전화번호  -->
      <div class="form-group has-feedback">
        <input type="email" class="form-control" name="memEmail" placeholder="Email">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <!-- 이메일  -->
      
      <div class="row">
      
      	<!--  로그인 정보 저장 -->
      	<!--
        <div class="col-xs-8">
          <div class="checkbox icheck">
            <label>
              <input type="checkbox"> I agree to the <a href="#">terms</a>
            </label>
          </div>
        </div>
        -->
        <!--  로그인 정보 저장 -->
        
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-block btn-flat">Register</button>
        </div>
        <!-- /.col -->
      </div>
    </form>

    <a href="/member/login.do" class="text-center">I already have a membership</a>
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
		function idCheck() {
			var memId = $("input[name='memId']").val();

			$.ajax({
				async : true,
				type : "POST",
				url : '/member/idCheck.do',
				data : memId,
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					if (data == '1') { // 중복 id가 있는 경우
						
						$("#id_check").removeClass("text-success");
						$("#id_check").addClass("text-danger");
						$("#id_check").text("사용 불가능한 아이디입니다");
						$("input[name='memId']").focus();
					} else if (data == '0') { // 중복 id가 없는 경우
						$("#id_check").removeClass("text-danger");
						$("#id_check").addClass("text-success");
						$("#id_check").text("사용가능한 아이디입니다");
					}
				}
			});
		}
	
		$(function() {
			$('input').iCheck({
				checkboxClass : 'icheckbox_square-blue',
				radioClass : 'iradio_square-blue',
				increaseArea : '20%' /* optional */
			});
		});

		$("input[name='memId']").blur(function() {
			idCheck();
		});
		
		$("input[name='memPwdCheck']").blur(function() {
			var memPwd = $("input[name='memPwd']");
			var memPwd_val = memPwd.val();
			var memPwdCheck = $("input[name='memPwdCheck']");
			var memPwdCheck_val = memPwdCheck.val();
			if(memPwd_val != memPwdCheck_val) {
				if(memPwdCheck_val != '') {
					$("#pwd_check").removeClass("text-success");
					$("#pwd_check").addClass("text-danger");
					$("#pwd_check").text("비밀번호가 일치하지 않습니다");
					memPwdCheck.focus();
				}
			} else {
				$("#pwd_check").removeClass("text-danger");
				$("#pwd_check").addClass("text-success");
				$("#pwd_check").text("비밀번호가 일치합니다");
			}
		});
		
	</script>
</body>
</html>
