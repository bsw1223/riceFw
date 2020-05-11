<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>


</body>
<script >

var obTimeOut; // clearTimeout() 함수를 이용하여 Timeout 을 취소하기위해 사용됨


var ObjectArray = new Array();

ObjectArray[1] = "${contextPath}/resources/img/left1.png";
ObjectArray[2] = "${contextPath}/resources/img/left2.png";
ObjectArray[3] = "${contextPath}/resources/img/left3.png";
console.log(ObjectArray[3]);
var nObjectCnt = 0;	



function ShowDefaultRotate() // 스스로 자신을 호출하는 재귀함수 (Recursive Function)

{
	nObjectCnt++;
	if( nObjectCnt < ObjectArray.length )  // 배열의 갯수 이내일때만 실행
	{
		document.getElementById("pp").src = ObjectArray[nObjectCnt];		 
		obTimeOut = setTimeout("ShowDefaultRotate()",1100);  // 1초후에 자기자신을 호출 
	}
	else
	{
		nObjectCnt = 0;
		ShowDefaultRotate();
	}		
}

function startAnimation()
{
      obTimeOut = window.setTimeout(ShowDefaultRotate,100); // 윈도우 로드 후 0.1초 후에 반복함수를 호출합니다.
}

window.onload = startAnimation;



</script>

</html>
