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
<a href="/lectureMng/enrolment" id="top_banner"></a><br>
<a href="/chat" id="bottom_banner"></a>
</body>
</html>

<style>
a#top_banner {
	float: right;
	margin: auto;
	vertical-align: middle;
	width:185px;
	height:80px;
	margin-top: 20px;
	margin-right:80px;
  background:url('${contextPath}/resources/img/down.png') no-repeat;
}

a#top_banner:hover{
  background:url('${contextPath}/resources/img/down-color.png') no-repeat;
}

a#bottom_banner {
	float: right;
	margin: auto;
	vertical-align: middle;
	width:185px;
	height:80px;
	margin-right:80px;
  background:url('${contextPath}/resources/img/down2.png') no-repeat;
}

a#bottom_banner:hover{
  background:url('${contextPath}/resources/img/down2-color.png') no-repeat;
}
</style>
