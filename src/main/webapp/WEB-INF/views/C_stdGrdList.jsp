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
	<%@ include file="F_Fixedsidebar.jsp"%>

	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header"style="width:83%">
			<h1><c:out value='${sjctName}' /></h1>
			<ol class="breadcrumb">
				<li class="active"><i class="fa fa-dashboard"></i> Home</li>
				<li class="active"><c:out value='${sjctName}' /></li>
				<li class="active">성적 조회</li>
			</ol>
		</section>
	
		 <!-- Main content -->
	    <section class="content">
	      <div class="row">
	        <!-- left column -->
	        <div class="col-md-5">
	          <!-- general form elements -->
	          <div class="box box-primary">
	         	 <div class="box-header">
					<h2 class="box-title">성적 조회</h2>
						<%-- <div class="amount">
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
				</div>			
	   			 <!-- box body -->
				<div class="box-body">
				<!-- table -->
	              <table class="table table-bordered">
	                <tr>
	                  <th>과제 명</th>
	                  <th>시험 일자</th>
	                  <th>성적</th>
	                </tr>
	                <c:forEach var="list" items="${boardList}">
		                <tr>
		                  <td><c:out value="${list.boNum}"/></td>
		                  <td><c:out value="${list.memNum}"/></td>
		                  <td><c:out value="${list.boUpdateDate}/총점"/></td>
		                </tr>
	                </c:forEach>
	              </table>
	              <!-- /table -->
	  <!--          		<div class="pull-right" style="padding:10px;">
						<form action="/mypage/board/qna/writeView" method="get">
					      	<button id='regBtn' type="button" class="btn btn-block btn-primary">등록</button>
					     </form> 
					</div>  -->
		            <!-- pagination -->
 	  <%--            <div class="box-footer">
		              <ul class="pagination pagination-sm no-margin">
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
		        	</div> --%> 
	        		 <!-- /pagination -->
	        		 
	        		 <!-- search -->
					<%--  <div class="box-tools center-block">
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
		            </div> --%>
				  <!-- /search-->  
	     		</div>
	    	` <!-- /.main content -->
	  		</div>  
			</div>
			<!-- /score table -->
			 <div class="col-md-5">
	          <!-- general form elements -->
	          <div class="box box-primary">
	         	 <div class="box-header">
					<h2 class="box-title">차트 넣는곳</h2>
				 </div>			
	   			 <!-- box body -->
				<div class="box-body">
				<!-- put your chart here -->
			
				</div>
			 </div>
			</div>
		<!-- chart -->
		</div>
		<!-- /section -->
	</section>
	<!-- /content wrapper -->
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

		location.href = "/mypage/board/${pageMaker.cri.boCode}/${pageMaker.cri.boURL}?page=" + page + "&amount=" + sel;

	}
</script>


<%@ include file="footer.jsp"%>

</body>
</html>