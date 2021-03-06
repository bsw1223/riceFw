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

h1{
	font-family: inherit;
	margin-left: 20px;
}
#banner{
border: 1px solid;
width: 200px;
float: left;
padding: 10px;
margin-left: 10px;
margin-top: 90px;
min-width:150px;
}

@media screen and (max-width: 1500px){
#banner{
	display: none;
}}


@media screen and (max-width: 1700px){
#banner_left2{
	display: none;

}
}

</style>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<body>


<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<section class="content-header">
			<h1 style="font-size: 40px;">
				<c:out value='${sjctName}' />
			</h1>
			<ol class="breadcrumb">
				<li class="active"><i class="fa fa-dashboard"></i> Home</li>
				<li class="active"><c:out value='${sjctName}' /></li>
				<li class="active">Q&A</li>
			</ol>
		</section>
	
		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-md-10">
					<div class="box box-warning">
						<div class="box-header">
							<h2 class="box-title" style="padding: 10px">Q&A</h2>
						</div>
						<div class="col-lg-12" style="height:100%;min-height:700px;">
							<div class="row">
									<div class="btn-group pull-right" style="margin-top:20px; margin-right:10px;">
		                 			<button type="button" class="btn btn-default btn-flat dropdown-toggle" data-toggle="dropdown" aria-expanded="false">게시물 개수 선택</button>
		                  			<button type="button" class="btn btn-default btn-flat dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
		                    			<span class="caret"></span>
		                    			<span class="sr-only">Toggle Dropdown</span>
		                		   </button>
		                  			<ul class="dropdown-menu" role="menu">
		                    			<li><a href="/mypage/board/${pageMaker.cri.boCode}/${pageMaker.cri.boURL}?page=1&amount=5">5개씩 보기</a></li>
			       						<li><a href="/mypage/board/${pageMaker.cri.boCode}/${pageMaker.cri.boURL}?page=1&amount=10">10개씩 보기</a></li>
		                   			    <li><a href="/mypage/board/${pageMaker.cri.boCode}/${pageMaker.cri.boURL}?page=1&amount=15">15개씩 보기</a></li>
		                   			    <li><a href="/mypage/board/${pageMaker.cri.boCode}/${pageMaker.cri.boURL}?page=1&amount=20">20개씩 보기</a></li>
		                 		 	</ul>
		                		</div>
                			</div>
                       		 <div class="card">
                           		 <div class="card-body">
                               		 <div class="table-responsive" style="height:100%; margin-top:20px">
                                  		  <table class="table">
                                        		<thead class="bg-warning text-white">
		                                            <tr>
		                                                <th style="width:110px;height: 35px; text-align:center">#</th>
		                                               	<th style="height: 35px; text-align:center">제목</th>
														<th style="width:110px;height: 35px; text-align:center">작성자</th>
														<th style="width:120px;height: 35px; text-align:center">작성날짜</th>
														<th style="width:100px;height: 35px; text-align:center">조회수</th>
		                                            </tr>
                                       		 </thead>
                                        <tbody class="border border-warning">
                                            <c:forEach var="listB" items='${listB}'>
												<tr style="text-align:center; height:36px">
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
                                </div>
                            </div>
                        </div>
                    </div>
					<div class="box-footer">
						<%-- <div class="row">
		        	      	<div class="offset-md-8" id="reg" style="margin-right:20px;">
								<form action="/mypage/board/regForm/${pageMaker.cri.boCode}/${pageMaker.cri.boURL}">
									<button id="btn-color" type="submit" class="btn pull-right btn-warning btn-fw">질문등록</button>
								</form>
							</div>
						</div> --%>
						<ul class="pagination pagination-sm no-margin">
		              		<c:if test="${pageMaker.prev}">
								<li class="paginate_button prev">
									<a href="/mypage/board/${pageMaker.cri.boCode}/${pageMaker.cri.boURL}?page=${pageMaker.startPage-1}&amount=${pageMaker.cri.amount}">prev</a>
								</li>
							</c:if>
	                	    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
								<li class="page-item ${pageMaker.cri.page==num?" active ":""}">
									<a href="/mypage/board/${pageMaker.cri.boCode}/${pageMaker.cri.boURL}?page=${num}&amount=${pageMaker.cri.amount}">${num}</a>
								</li>
							</c:forEach>
		           			<c:if test="${pageMaker.next}">
								<li class="paginate_button next">
									<a href="/mypage/board/${pageMaker.cri.boCode}/${pageMaker.cri.boURL}?page=${pageMaker.endPage+1}&amount=${pageMaker.cri.amount}">next</a>
								</li>
							</c:if>
	        	    	 </ul>
	        	     <!-- search -->
						<div id="search" class="pull-right" style="margin-top: 10px;">
							<form id='searchForm' action="/mypage/board/${pageMaker.cri.boCode}/${pageMaker.cri.boURL}" method ="get">
								<div class='select'>
				                  <select name='type' style="width:100px;height:30px;">
				                    <option value=""
				                    	<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
				                    <option value="T"
				                    	<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
				                    <option value="C"
				                    	<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
				                    <option value="W"
				                    	<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
				                    <option value="TWC"
				                    	<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>전체</option>
				                  </select>
				                  </div>
				                 <!-- /select option -->
				                <div class="input-group input-group-sm hidden-xs" >
				                    <input type="text" name='keyword'
				                    	value='<c:out value="${pageMaker.cri.keyword}"/>'class="form-control pull-right">
				                    <div class="input-group-btn">
				                    <button type="submit" class="btn btn-warning btn-flat"><i class="fa fa-search"></i></button>
				                  </div>
								</div>
							</form>
							<div class="offset-md-8" id="reg" style="margin-left:20px;">
								<form action="/mypage/board/regForm/${pageMaker.cri.boCode}/${pageMaker.cri.boURL}">
									<button id="btn-color" type="submit" class="btn pull-right btn-warning btn-fw">질문등록</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="banner">
					<%@ include file="banner.jsp"%>
				</div>
				<div id="banner_left2">
					<%@ include file="left_banner2.jsp"%>
				</div>
			</div>
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

		location.href = "/mypage/board/${pageMaker.cri.boCode}/${pageMaker.cri.boURL}?page="
				+ page + "&amount=" + sel;

	}
</script>
<%@ include file="footer.jsp"%>

</body>
</html>
