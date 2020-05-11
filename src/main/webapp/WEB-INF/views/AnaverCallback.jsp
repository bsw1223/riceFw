<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />  
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>NaverLoginSDK</title>
</head>

<body>
	<!-- (1) LoginWithNaverId Javscript SDK -->
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
 	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

	<!-- (2) LoginWithNaverId Javscript 설정 정보 및 초기화 -->
	<script>
		var naverLogin = new naver.LoginWithNaverId({
			clientId : "KGTXKoI7gwy_zGWcbPAH",
			callbackUrl : "http://"+ window.location.hostname+((location.port == "" || location.port == undefined) ? "" : ":"
				+ location.port)+ "/member/naverlogin",
			isPopup : false,
			callbackHandle : true
		/* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */
		});

		var naver_id_login = new naver_id_login("KGTXKoI7gwy_zGWcbPAH", "http://"+ window.location.hostname+((location.port == "" || location.port == undefined) ? "" : ":"
			+ location.port)+ "/member/naverlogin");
		// 접근 토큰 값 출력
// 		alert(naver_id_login.oauthParams.access_token);

		// 네이버 사용자 프로필 조회
		naver_id_login.get_naver_userprofile("naverSignInCallback()");

		/* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
		naverLogin.init();

		/* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */
		window.addEventListener('load', function() {
			naverLogin.getLoginStatus(function(status) {
				if (status) { 
					var snsId = naver_id_login.getProfileData('id');	//	snsId number
					var memName = naver_id_login.getProfileData('name');
					var memEmail = naver_id_login.getProfileData('email');
					
					/* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
					if (memName == undefined || memName == null) {
						alert("이름은 필수정보입니다. 정보제공을 동의해주세요.");
						/* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
						naverLogin.reprompt();
						return;
					} else if (memEmail == undefined || memEmail == null) {
						alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
						naverLogin.reprompt();
						return;
					} else {		// 필수 정보가 모두 입력됐을 경우
						$.ajax({
							async : true,
							type : "POST",
							url : '/member/naverlogin',
							data : JSON.stringify({
									snsId : snsId,
									memEmail : memEmail,
									memName : memName,
									memId : snsId+'@n',
									snsType: "naver",
									authId: '1001'
	                        		}),
							contentType : "application/json; charset=UTF-8",
							dataType : "json",
							success : function(data) {
								if(data == 'false') {
									window.close();
	                                top.opener.location="/member/login";
								} else {
									console.log("success");
									window.close();
	                                top.opener.location="/";
								}
							},	// success end
							error : function(e) {
								console.log(e);
								window.close();
								top.opener.location="/member/login";
							}
						});		// naverlogin ajax end
					}
				} else {
					console.log("callback 처리에 실패하였습니다.");
				}
			});
		});
	</script>
</body>
</html>