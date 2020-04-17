<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>


<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			Data Tables <small>advanced tables</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#">Tables</a></li>
			<li class="active">Data tables</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">Hover Data Table</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<div style="float: right;">
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
						<!-- 옵션선택 끝 -->


						<table id="example2" class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>글번호</th>
									<th>제목</th>
									<th>내용</th>
									<th>작성자</th>
									<th>작성날짜</th>
									<th>업데이트날짜</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="listB" items="${listB}">

									<tr>
										<td><c:out value="${listB.bno}" /></td>
										<td><a href='/get.do?bno=<c:out value="${listB.bno}"/>'>
												<c:out value="${listB.title}" />
										</a></td>
										<td><c:out value="${listB.content}" /></td>
										<td><c:out value="${listB.writer}" /></td>
										<td><c:out value="${listB.regdate}" /></td>
										<td><c:out value="${listB.updateDate}" /></td>
								</c:forEach>

							</tbody>
						</table>

						<div>
							<ul class="pagination">

								<c:if test="${pageMaker.prev}">
									<li class="page-item"><a class="page-link"
										href="/board.do?page=${pageMaker.startPage-1 }&amount=${ pageMaker.cri.amount}">Previous</a></li>
								</c:if>

								<c:forEach begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }" var="pnum">
									<li class="page-item ${pnum == pageMaker.cri.page? "active":"" }">
										<a class="page-link"
										href="/board.do?page=${pnum }&amount=${ pageMaker.cri.amount}">${pnum}</a>
									</li>
								</c:forEach>
								<c:if test="${pageMaker.next}">
									<li class="page-item"><a class="page-link"
										href="/board.do?page=${pageMaker.endPage+1 }&amount=${ pageMaker.cri.amount}">Next</a></li>
								</c:if>


							</ul>
						</div>
						<form action="/register.do">
							<div>
								<button type="submit" class="btn btn-block btn-default">게시글 작성</button>
							</div>
						</form>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
			</div>
			<!-- /.box-body -->
		</div>
		
<div class='row'>
	<div class='col-lg-12'>
		<form id='searchForm' action="/board.do" method='get'>
			<select name='type'>
				<option value="TCW" <c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>전체</option>
				<option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
				<option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
				<option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
			</select> 
			<input type='text' name='keyword'> 
			<input type="hidden" name="page" value='<c:out value="${pageMaker.cri.page}"/>'> 
			<input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount}"/>'>
			<button class='btn btn-default'>Search</button>
		</form>
	</div>
</div>
		<!-- /.box -->
	</section>
	<!-- /.content -->
</div>


<form id="actionForm" action="/board.do" method='get'>
	<input type="hidden" name="page" value='${pageMaker.cri.page}'>
	<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
	<input type="hidden" name="type" value="<c:out value='${pageMaker.cri.type}'/>">
	<input type="hidden" name="keyword" value="<c:out value='${pageMaker.cri.keyword}'/>">
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
		
		var searchForm =$("searchForm");

		$("#searchForm button").on("click", function(e){
			if(!searchForm.find("input[name='keyword']").val()){
				alert("키워드를 입력하세요");
				return false;
			}
			searchForm.find("input[name='page']").val("1");
			e.preventDafault();
			searchForm.submit();
			
		});
	});

	function selChange() {
		var sel = document.getElementById('getListWithPaging').value;
		var page = 1;
		location.href = "board.do?page=" + page + "&amount=" + sel;

	}
	

</script>


<%@ include file="footer.jsp"%>

</body>
</html>
