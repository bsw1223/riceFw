<!DOCTYPE html>
<html>
<head>
 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <script
	  src="https://code.jquery.com/jquery-2.2.4.js"
	  integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
	  crossorigin="anonymous">
 </script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <c:set var="contextPath" value="${pageContext.request.contextPath}" />
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>RiceLMS | Log in</title>
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
  
  <!-- Naver Login  -->
  <!-- Bootstrap -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
  integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <!-- Optional theme -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
  integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
	 
</head>
<body class="hold-transition login-page">
<c:if test="${param.loginMsg eq 'false'}">
	<script>
		alert("잘못된 아이디 패스워드 입니다")
	</script>
</c:if>
<c:if test="${param.signupMsg eq 'true'}">
	<script>
		alert("회원가입 성공했습니다")
	</script>
</c:if>
<c:if test="${param.findpwdMsg eq 'true'}">
	<script>
		alert("임시비밀번호를 발급했습니다")
	</script>
</c:if>
<div class="login-box">
  <div class="login-logo">
    <a href="/"><b>Rice</b>LMS</a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Rice 계정으로 로그인</p>
    <form action="/member/loginPost" method="post">
      <div class="form-group has-feedback">
        <input name="memId" type="text" class="form-control" placeholder="USER ID">
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input name="memPwd" type="password" class="form-control" placeholder="Password">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-block btn-flat">로그인</button>
        </div>
        <!-- /.col -->
      </div>
    </form>

    <div class="social-auth-links text-center">
      <p>- OR -</p>
      <!-- naver로그인 버튼 -->
      <div id="naverIdLogin">
      		<a class="btn btn-block" id="naver-login-btn" href="#" role="button"></a>
      </div>
      <div id="kakaoLogin" align="center">
    		<a class="btn btn-block" id="kakao-login-btn">
		    	<img src="//k.kakaocdn.net/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="80%"/>
		    </a>
	  </div>
    </div>
    <!-- /.social-auth-links -->

	<a href="/member/find/id">아이디찾기</a><br>
    <a href="/member/find/pwd">비밀번호 재설정</a><br>
    <a href="/member/account" class="text-center">회원가입</a>

  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 3 -->
<script src="${contextPath}/resources/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="${contextPath}/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="${contextPath}/resources/plugins/iCheck/icheck.min.js"></script>

<!-- KAKAO SDK -->
<script src="${contextPath}/resources/api/js/kakao.min.js"></script>

<!-- NAVER LOGIN -->
<!-- /container -->
<script src="https://code.jquery.com/jquery-1.12.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- (2) LoginWithNaverId Javscript SDK -->
<script src="${contextPath}/resources/api/js/naveridlogin_js_sdk_2.0.0.js"></script>

<!-- (3) LoginWithNaverId Javscript 설정 정보 및 초기화 -->
<script>
	$(function() {
		var naverLogin = new naver.LoginWithNaverId({
			clientId : "KGTXKoI7gwy_zGWcbPAH",
			callbackUrl : "http://"+ window.location.hostname+((location.port == "" || location.port == undefined) ? "" : ":"
				+ location.port)+ "/member/naverlogin",
			isPopup : true, /* 팝업을 통한 연동처리 여부 */
			loginButton: {color: "green", type: 3, height: 50} /* 로그인 버튼의 타입을 지정 */
		});	// 네이버 로그인

		/* 설정정보를 초기화하고 연동을 준비 */
		naverLogin.init();
		
		
		//////////////// kakao
		// SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('ef74bb20977f51965ba61e30b85eb616');

        // SDK 초기화 여부를 판단합니다.
        console.log(Kakao.isInitialized());
        
    	var snsId = null;
    	var memName = null;
    	
        $("#kakao-login-btn").on("click", function(){
            //1. 로그인 시도
            Kakao.Auth.login({
                  success: function(authObj) {	                
	                  // 2. 로그인 성공시, API를 호출합니다.
	                  Kakao.API.request({
	                	  url: '/v2/user/me',
	                	  success: function(res) {
							  $.ajax({
	                    	  	async : true,
								type : "POST",
								url : '/member/kakaologin',
								data : JSON.stringify({
									snsId : res.id,
									memName : res.properties.nickname,
									memId : res.id+'@k',
									snsType: "kakao",
									authId: '1001'
	                      			}),
	              			    contentType : "application/json; charset=UTF-8",
	                 			dataType : "json",
	                            success : function(data){
	                            	if(data == 'false') {
		                               location.href="/member/loginPost";
									} else {
										console.log("success");
										location.href="/";
									}
	                            }
		                      });   // ajax end
	                	  },
	                	  fail: function(error) {
	                		  alert(JSON.stringify(error));
	                	  }
			          });
                },
                fail: function(err) {
                  alert(JSON.stringify(err));
                }
           });            
        }); // kakao end
	})
</script>
</body>
</html>
