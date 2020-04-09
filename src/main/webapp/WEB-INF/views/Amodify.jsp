<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<c:if test="${param.modifyMsg eq 'false'}">
	<script>
		alert("회원정보 수정에 실패했습니다")
	</script>
</c:if>
<c:if test="${param.modifyMsg eq 'info'}">
	<script>
		alert("회원정보가 변경되었습니다")
	</script>
</c:if>
<c:if test="${param.modifyMsg eq 'pwd'}">
	<script>
		alert("비밀번호가 변경되었습니다")
	</script>
</c:if>
<c:if test="${param.modifyMsg eq 'auth'}">
	<script>
		alert("권한이 변경되었습니다")
	</script>
</c:if>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        User Profile
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Examples</a></li>
        <li class="active">User profile</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <div class="row">
        
        <div class="col-md-7">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#info" data-toggle="tab">회원정보 수정</a></li>
              <c:if test="${member.snsId eq null || member.snsId == ''}">
				<li><a href="#pwd" data-toggle="tab">비밀번호 변경</a></li>
              </c:if>
              <li><a href="#auth" data-toggle="tab">권한 변경</a></li>
            </ul>
            
            <!-- form  -->
            <div class="tab-content">
              <div class="active tab-pane" id="info">
              	<form class="form-horizontal" action="/member/modify/info" method="post" onsubmit="return modifyCheck()">
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">이름</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" name="memName" placeholder="이름을 입력하여주세요" value="${memInfo.memName}">
<!--                       <input type="text" class="form-control" id="inputName" placeholder="Name"> -->
                    </div>
                  </div>
                  <div class="col-sm-offset-2 col-sm-10 font-weight-bold text-danger" id="name_check"> </div>
                  <!-- 이름 -->	
                  <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 control-label">Tel</label>
                    <div class="col-sm-10">
                      <input type="tel" class="form-control" name="memTel" placeholder="숫자만 입력해주세요" value="${memInfo.memTel}">
<!--                       <input type="email" class="form-control" id="inputEmail" placeholder="Email"> -->
                    </div>
                  </div>
                  <div class="col-sm-offset-2 col-sm-10 font-weight-bold text-danger" id="tel_check"> </div>
                  <!-- 전화번호 -->
                  <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 control-label">Email</label>
                    <div class="col-sm-10">
                      <input type="email" class="form-control" name="memEmail" placeholder="Email" value="${memInfo.memEmail}">
<!--                       <input type="email" class="form-control" id="inputEmail" placeholder="Email"> -->
                    </div>
                  </div>
                  <div class="col-sm-offset-2 col-sm-10 font-weight-bold text-danger" id="email_check"> </div>
                  <!-- 전화번호 -->
                  <input type="hidden" name="memNum" value="${member.memNum}">    <!-- 회원 번호 -->       
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                      <button type="submit" class="btn btn-danger">회원정보 번경</button>
                    </div>
                  </div>
                </form>
              </div>
              <!-- /.tab-pane 회원정보 변경 -->

              <div class="tab-pane" id="pwd">
                <form class="form-horizontal" action="/member/modify/pwd" method="post" onsubmit="return modifyPwd()">
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">비밀번호</label>
                    <div class="col-sm-10">
                      <input type="password" class="form-control" name="memPwd" placeholder="8-20자의 영문 대,소문자,숫자,특수문자를 조합">
<!--                       <input type="email" class="form-control" id="inputName" placeholder="Name"> -->
                    </div>
                  </div>
                  <div class="col-sm-offset-2 col-sm-10 font-weight-bold text-danger" id="pwd_check1"> </div>
                  <!-- 비밀번호 입력  -->
                  <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 control-label">비밀번호 확인</label>
                    <div class="col-sm-10">
                      <input type="password" class="form-control" name="memPwdCheck" placeholder="비밀번호를 동일하게 한번 더 입력하여주세요">
<!--                       <input type="email" class="form-control" id="inputEmail" placeholder="Email"> -->
                    </div>
                  </div>
                  <div class="col-sm-offset-2 col-sm-10 font-weight-bold" id="pwd_check2"> </div>
                  <!-- 비밀번호 확인 -->
                  <input type="hidden" name="memNum" value="${member.memNum}">    <!-- 회원 번호 --> 
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                      <button type="submit" class="btn btn-danger">비밀번호 변경</button>
                    </div>
                  </div>
                </form>
              </div>
              <!-- /.tab-pane 비밀번호 변경 -->
              
              <div class="tab-pane" id="auth">
                <form class="form-horizontal" action="/member/modify/auth" method="post" onsubmit="return modifyAuth()">
                  <input type="hidden" name="memNum" value="${member.memNum}">    <!-- 회원 번호 --> 
                  <input type="hidden" name="authId" value="1002">    <!-- 변경 권한 강사 --> 
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                      <button type="submit" class="btn btn-danger">강사로 변경</button>
                    </div>
                  </div>
                </form>
              </div>
              <!-- /.tab-pane 강사로 변경 -->
            </div>
            <!-- /.tab-content -->
          </div>
          <!-- /.nav-tabs-custom -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

    </section>
    <!-- /.content -->
  </div>

<%@ include file = "footer.jsp" %>

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
	
	$("input[name='memName']").blur(function() {
		nameCheck();
	});
	
	$("input[name='memTel']").blur(function() {
		telCheck();
	});
	$("input[name='memEmail']").blur(function() {
		emailCheck();
	});

	$("input[name='memPwd']").blur(function() {
		pwdCheck1();
	});
	$("input[name='memPwdCheck']").blur(function() {
		pwdCheck2();
	});
	
	function modifyCheck() {
		if (nameCheck() && telCheck() && emailCheck()) {
			if(confirm("회원정보를 변경하시겠습니까?")) {
				return true;
			}else {
				return false;
			}
		} else {
			return false;
		}
	}
	
	function modifyPwd() {
		if (pwdCheck1() && pwdCheck2()) {
			if(confirm("비밀번호를 변경하시겠습니까?")) {
				return true;
			}else {
				return false;
			}
		} else {
			return false;
		}
	}
	
	function modifyAuth() {
		if(confirm("정말 강사로 권한을 변경하시겠습니까?")) {
			return true;
		}else {
			return false;
		}
	}
</script>
</body>
</html>