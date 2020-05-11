<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <p class="login-box-msg">간편하게 회원가입 </p>

	<div class="social-auth-links text-center">
      <a href="/member/signup" class="btn btn-block btn-primary"> Rice 회원가입</a>
    </div>
    
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

    <a href="/member/login" class="text-center">로그인하기</a>
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
									snsType: "kakao"
	                      			}),
	              			    contentType : "application/json; charset=UTF-8",
	                 			dataType : "json",
	                            success : function(data){
	                            	if(data == 'false') {
		                               location.href="/member/login";
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
