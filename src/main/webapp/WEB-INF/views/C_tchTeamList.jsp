<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous">
	
</script>

<style>
.box-body{
	background-color: white;
}
.box-tools{
	margin:auto;
	display:flex;
}
.select{
	float:left;
	
}
.input-group{
	float:left;
	width: 170px;
}
.amount{
float: right;
}

</style>

<body>
  <div class="content-wrapper">
	<section class="content-header"style="width:83%">
		<h1>
			<c:out value='${sjctName}' />
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#"><c:out value='${sjctName}' /></a></li>
			<li class="active">스터디 </li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="box box-warning">
					<div class="box-header">
						<h3 class="box-title">스터디 게시판</h3>
							<div class="amount">
								<select id="getListWithPaging" name="sel" onchange="selChange()">
								<option value="5"
										<c:if test="${pageMaker.cri.amount == 5}">selected</c:if>>5개씩보기</option>
								<option value="10"
									<c:if test="${pageMaker.cri.amount == 10}">selected</c:if>>10개씩보기</option>
								<option value="15"
									<c:if test="${pageMaker.cri.amount == 15}">selected</c:if>>15개씩보기</option>
								<option value="20"
									<c:if test="${pageMaker.cri.amount == 20}">selected</c:if>>20개씩보기</option>
								</select>
							</div>
					</div>
					<div class="box-body">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th style="width:30px;">No.</th>
									<th>제목</th>
									<th style="width:100px;">작성자</th>
									<th style="width:150px;">작성날짜</th>
									<th style="width:100px;">조회수</th>
								</tr>
							</thead>
								<tbody>
									<c:forEach var="listB" items='${listB}'>
										<tr>
											<td><c:out value='${listB.boNum}' /></td>
											<td><a
												href="/mypage/board/get/${pageMaker.cri.boCode}/${pageMaker.cri.boURL}?boNum=<c:out value='${listB.boNum}'/>">
													<c:out value='${listB.boTitle}' />
											</a></td>
											<td><c:out value='${listB.memId}' /></td>
											<td><c:out value='${listB.boRegdate}' /></td>
											<td><c:out value='${listB.boViews}' /></td>
										</tr>	
									</c:forEach>
								</tbody>
							</table>
						<div class = "box-footer">
							<ul class="pagination">
								<c:if test='${pageMaker.prev}'>
									<li class="page-item"><a class="page-link"
										href="/mypage/board/${pageMaker.cri.boCode}/${pageMaker.cri.boURL}?page=${pnum}&amount=${pageMaker.cri.amount}page=${pageMaker.startPage-1}&amount=${pageMaker.cri.amount}">Previous</a></li>
								</c:if>

								<c:forEach begin="${pageMaker.startPage }"
									end="${pageMaker.endPage}" var="pnum">
									<li class="page-item ${pnum == pageMaker.cri.page? "active":"" }">
										<a class="page-link"
										href="/mypage/board/${pageMaker.cri.boCode}/${pageMaker.cri.boURL}?page=${pnum }&amount=${ pageMaker.cri.amount}">${pnum}</a>
									</li>

								</c:forEach>
								<c:if test="${pageMaker.next}">
									<li class="page-item"><a class="page-link"
										href="/mypage/board/${pageMaker.cri.boCode}/${pageMaker.cri.boURL}?page=${pnum }&amount=${ pageMaker.cri.amount}">Next</a></li>
								</c:if>
							</ul>
							<form action="/mypage/board/regForm/${pageMaker.cri.boCode}/${pageMaker.cri.boURL}">
								<button type="submit" class="btn pull-right">게시물등록</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
<!-- 		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="box">
					<div class="box-header"> header</div>
					<div class="box-body">
						<table>
							<tr>
							<td>no.</td>
							</tr>
						</table>
					</div>
				
				</div>
			</div>
		</div> -->
	</section>
</div>

</body>

<form id="actionForm" action="/mypage/board/${pageMaker.cri.boCode}/${pageMaker.cri.boURL}" method='get'>
	<input type="hidden" name="page" value='${pageMaker.cri.page}'>
	<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
</form>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		var actionForm = $("actionForm");

		$(".page-item").on("click", function(e) {
			e.preventDafault();

			console.log('click');
			actionForm.find("input[name='page']").val($(this).attr("href"));
			actionForm.submit();
		});
	});

	function selChange() {
		var sel = document.getElementById('getListWithPaging').value;
		var page = 1;

		location.href = "/mypage/board/${pageMaker.cri.boCode}/${pageMaker.cri.boURL}?page="+ page + "&amount=" + sel;
	}
</script>


<%@ include file="footer.jsp"%>

</body>
</html>