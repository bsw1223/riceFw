<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>


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

</style>

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
			<li class="active">커뮤니티 게시판</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">커뮤니티 게시판</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<%-- <div style="float: right;">
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
						</div> --%>
						
						<!-- 옵션선택 끝 -->
						<!-- top -->
						<div id="top">
			 				<div class="pull-left" style="padding:10px;">
								<form action="/mypage/board/qna/writeView" method="get">
							      	<button id='regBtn' type="button" class="btn btn-block btn-primary">게시판 만들기</button>
							     </form> 
							</div> 
		<%-- 				<table id="example2" class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>글번호</th>
									<th>제목</th>
									<th>내용</th>
									<th>작성자</th>
									<th>작성날짜</th>
									<th>조회수</th>
									<th>좋아요수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="commboardlist" items="${commboardlist}">
									<tr>
										<td><c:out value="${commboardlist.boNum}" /></td>
										<td><a
											href='/comm/viewwritings?boNum=<c:out value="${commboardlist.boNum}"/>'>
												<c:out value="${commboardlist.boTitle}" />
										</a></td>
										<td><c:out value="${commboardlist.boContent}" /></td>
										<td><c:out value="${commboardlist.memNum}" /></td>
										<td><c:out value="${commboardlist.boRegDate}" /></td>
										<td><c:out value="${commboardlist.boViews}" /></td>
										<td><c:out value="${commboardlist.boLikes}" /></td>
										
									</tr>
								</c:forEach>
							</tbody>
						</table> --%>
						<div class="box-tools pull-right">
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
			           <!-- /top -->
						<div>
						<!-- Main row -->
					      <div class="row">
					        <!-- Left col -->
					        <section class="col-lg-7 connectedSortable">
					          <!-- Custom tabs (Charts with tabs)-->
					          <div class="nav-tabs-custom">
					            <!-- Tabs within a box -->
					            <ul class="nav nav-tabs pull-right">
					              <li class="active"><a href="#popular" data-toggle="tab">최신글/인기글</a></li>
					              <li><a href="#wholecomm" data-toggle="tab"></a>전체커뮤니티</li>
					            </ul>
					            <div class="tab-content no-padding">
					              <!-- Morris chart - Sales -->
					              <div class="chart tab-pane active" id="popular" style="position: relative; height: 300px;"></div>
					              <div class="chart tab-pane" id="wholecomm" style="position: relative; height: 300px;"></div>
					            </div>
					          </div>
					          <!-- /.nav-tabs-custom -->
							</section>
							</div>
							</div>
						</div>
						<!-- /main -->		
						<!-- /.box-body -->
					</div>
					<!-- /.box -->
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->
	</section>
	<!-- /.content -->
</div>

<form id="actionForm" action="/board.do" method='get'>
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
		location.href = "board.do?page=" + page + "&amount=" + sel;

	}
</script>


<%@ include file="footer.jsp"%>

</body>
</html>
