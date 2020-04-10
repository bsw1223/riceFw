<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>RiceLMS | 회원가입 </title>
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
<c:if test="${param.signupMsg eq 'false'}">
	<script>
		alert("회원가입에 실패했습니다")
	</script>
</c:if>
<div class="register-box">
  <div class="register-logo">
    <a href="/"><b>Rice</b>LMS</a>
  </div>

  <div class="register-box-body">
    <p class="login-box-msg">간편하게 가입</p>

    <form action="/member/signup" method="post" onsubmit="return signupCheck()">
      <div class="form-group has-feedback">
        <input type="radio" class="form-control" name="authId" value="1001" checked="checked">
        <label for="1001">학생</label>
        <input type="radio" class="form-control" name="authId" value="1002">
        <label for="1002">강사</label>
      </div>
      <!-- 강사 / 학생 구분 radio button -->
      
      <div class="form-group has-feedback">
        <input type="text" class="form-control" name="memName" placeholder="이름을 입력하여주세요">
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
      <div class="font-weight-bold text-danger" id="name_check"> </div>
      <!-- 이름 -->
      
      <div class="form-group has-feedback">
        <input type="text" class="form-control" name="memId" placeholder="아이디를 입력하여주세요">
      </div>   
      <div class="font-weight-bold" id="id_check"> </div>
      <!-- ID -->
      
      <div class="form-group has-feedback">
        <input type="password" class="form-control" name="memPwd" placeholder="8-20자의 영문 대,소문자,숫자,특수문자를 조합">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="font-weight-bold text-danger" id="pwd_check1"> </div>
      <!-- 비밀번호  -->
      <div class="form-group has-feedback">
        <input type="password" class="form-control" name="memPwdCheck" placeholder="비밀번호를 동일하게 한번 더 입력하여주세요">
        <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
      </div>
      <div class="font-weight-bold" id="pwd_check2"> </div>
      <!-- 비밀번호 check -->
      
      <div class="form-group has-feedback">
        <input type="tel" class="form-control" name="memTel" placeholder="전화번호는 숫자만 입력해주세요">
        <span class="glyphicon glyphicon-earphone form-control-feedback"></span>
      </div>
      <div class="font-weight-bold text-danger" id="tel_check"> </div>
      <!-- 전화번호  -->
      <div class="form-group has-feedback">
        <input type="email" class="form-control" name="memEmail" placeholder="Email">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="font-weight-bold text-danger" id="email_check"> </div>
      <!-- 이메일  -->
      
      <div class="row">        
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-block btn-flat">Register</button>
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
		var id_result = false;
	
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
		
		function idCheck() {
			var memId = $("input[name='memId']").val();
			var id_re = RegExp(/^[a-zA-Z0-9]{5,15}$/);	// 아이디 정규식, 영어 숫자만 입력가능 5~15 자리
			var id_check = $("#id_check");

			if(id_re.test(memId)) {
				$.ajax({
					async : true,
					type : "POST",
					url : '/member/idCheck',
					data : memId,
					contentType : "application/json; charset=UTF-8",
					success : function(data) {
						if (data == '1') { // 중복 id가 있는 경우
							id_check.removeClass("text-success");
							id_check.addClass("text-danger");
							id_check.text("이미 가입된 ID 입니다");
							$("input[name='memId']").focus();
							
							id_result = false;
						} else if (data == '0') { // 중복 id가 없는 경우
							id_check.removeClass("text-danger");
							id_check.addClass("text-success");
							id_check.text("사용가능한 아이디입니다");
							
							id_result = true;
						}
					},
					error : function(e) {
						console.log("error : " + e);
					}
				});
			} else {
				id_check.removeClass("text-success");
				id_check.addClass("text-danger");
				id_check.text("5~15글자에 영어 숫자만 사용 가능합니다");				
				id_result = false;
			}			
		}
		
		function pwdCheck1() {
			var pwd_check1 = $("#pwd_check1");
			var memPwd = $("input[name='memPwd']");
			var memPwd_val = memPwd.val();
			var password_re = RegExp(/^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/);
			// 비밀번호 정규식, 영어 대소문자 숫자 특수문자
			
			if(password_re.test(memPwd_val)) {
				pwd_check1.text("");
				return true;
			} else {
				$("#pwd_check2").text("");
				pwd_check1.text("사용할 수 없는 비밀번호 입니다");				
				return false;
			}
		}
		
		function pwdCheck2() {
			var memPwd = $("input[name='memPwd']");
			var memPwd_val = memPwd.val();
			var memPwdCheck = $("input[name='memPwdCheck']");
			var memPwdCheck_val = memPwdCheck.val();
			var pwd_check2 = $("#pwd_check2");
			
			var password_re = RegExp(/^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/);
			// 비밀번호 정규식, 영어 대소문자 숫자 특수문자
			
			if(password_re.test(memPwd_val)) {
				$("#pwd_check1").text("");
				if(memPwd_val != memPwdCheck_val) {
					if(memPwdCheck_val != '') {
						pwd_check2.removeClass("text-success");
						pwd_check2.addClass("text-danger");
						pwd_check2.text("비밀번호가 일치하지 않습니다");
						
						return false;
					}
				} else {
					pwd_check2.removeClass("text-danger");
					pwd_check2.addClass("text-success");
					pwd_check2.text("비밀번호가 일치합니다");
					
					return true;
				}
			} else {
				$("#pwd_check1").text("사용할 수 없는 비밀번호 입니다");
				memPwd.focus();
				
				return false;
			}
		}
	
		function telCheck() {
			var memTel = $("input[name='memTel']").val();
			var tel_re = RegExp(/^01[0-9]{8,9}$/); 	// 전화번호 정규식
			var tel_check = $("#tel_check");
			
			if(tel_re.test(memTel)) {
				tel_check.text("");
				return true;
			} else{
				tel_check.text("전화번호를 제대로 입력해주세요");				
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
		$("input[name='memId']").blur(function() {
			idCheck();
		});
		$("input[name='memPwd']").blur(function() {
			pwdCheck1();
		});
		$("input[name='memPwdCheck']").blur(function() {
			pwdCheck2();
		});
		$("input[name='memTel']").blur(function() {
			telCheck();
		});
		$("input[name='memEmail']").blur(function() {
			emailCheck();
		});
		
		function signupCheck() {			
			if(nameCheck() && id_result && pwdCheck1() && pwdCheck2() && telCheck() && emailCheck()) {
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
