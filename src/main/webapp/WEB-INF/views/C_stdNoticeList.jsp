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
#search{
	margin:auto;
	display:flex;
}
.select{
	float:left;
	margin-left:10px;
	
}
.input-group{
	float:left;
	width: 170px;
}
.buttons{
	float:left;
	display:flex;
	
}

</style>

<body>
	<%@ include file="F_Fixedsidebar.jsp"%>
	<div class="content-wrapper">
		<section class="content-header"style="width:83%">
			<h1>
				<c:out value='${sjctName}' />
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li><a href="#"><c:out value='${sjctName}' /></a></li>
				<li class="active">공지사항</li>
			</ol>
		</section>
	
		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-md-10">
					<div class="box box-primary">
						<div class="box-header">
							<h2 class="box-title">공지사항게시판</h2>
							<div style="float: right;" class="amount">
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
						<!-- /.box-header -->
					<div class="box-body">
						<table class="table table-bordered">
								<thead class="thead-dark">
									<tr>
										<th style="width:10px;">No.</th>
										<th>제목</th>
										<th style="width:100px;">작성자</th>
										<th style="width:100px;">작성날짜</th>
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
									</c:forEach>
								</tbody>
							</table>
					<!-- /.box-body -->
					</div>
					<div class="box-footer">
						<ul class="pagination pagination-sm no-margin">
	              		<c:if test="${pageMaker.prev}">
							<li class="paginate_button prev">
								<a href="/mypage/board/${pageMaker.cri.boCode}/${pageMaker.cri.boURL}?page=${pageMaker.startPage-1}&amount=${pageMaker.cri.amount}">prev</a>
							</li>
						</c:if>
                	    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
							<li class="page-item ${pageMaker.cri.page==num?" active ":""}">
								<a href="/mypage/board/${pageMaker.cri.boCode}/${pageMaker.cri.boURL}?page=${num}">${num}</a>
							</li>
						</c:forEach>
	           			<c:if test="${pageMaker.next}">
							<li class="paginate_button next">
								<a href="/mypage/board/${pageMaker.cri.boCode}/${pageMaker.cri.boURL}?page=${pageMaker.endPage+1}&amount=${pageMaker.cri.amount}">next</a>
							</li>
						</c:if>
	        	     </ul>
						<div id="search" class="pull-right">
							<form id='searchForm' action="/mypage/board/qna/list" method ="get">
								<div class='select'>
				                  <select name='type' style="width:100px;height:30px;">
				                    <option value=""
				                    	<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
				                    <option value="T"
				                    	<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
				                    <option value="C"
				                    	<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
				                    <option value="W"
				                    	<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자<option>
				                    <option value="TWC"
				                    	<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>전체</option>
				                  </select>
				                  </div> 
				                  <!-- /select option -->
				                <div class="input-group input-group-sm hidden-xs" >
				                    <input type="text" name='keyword'
				                    	value='<c:out value="${pageMaker.cri.keyword}"/>'class="form-control pull-right">
				                    <div class="input-group-btn">
				                    <button type="submit" class="btn btn-primary btn-flat"><i class="fa fa-search"></i></button>
				                  </div>
								</div>
							</form>
						</div>
					 </div>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>


<form id="actionForm"
	action="/mypage/board/${pageMaker.cri.boCode}/${pageMaker.cri.boURL}"
	method='get'>
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

		location.href = "/mypage/board/${pageMaker.cri.boCode}/${pageMaker.cri.boURL}?page="
				+ page + "&amount=" + sel;

	}
</script>


<%@ include file="footer.jsp"%>

</body>
</html>
