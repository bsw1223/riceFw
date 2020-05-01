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
      <ol class="breadcrumb" >
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
		<li><a href="#"><c:out value='${sjctName}' /></a></li>
		<li class="active">성적 입력</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="col-md-10">
        <div class="box">
		 <div class="box-body">
		   <div class="box-header">
				<h2 class="box-title">성적 입력 </h2>
			 <div class="box-tools pull-right">
			 <label>과제명 :</label>
				<form id='searchForm' action="/mypage/board/${pageMaker.cri.boCode}/${pageMaker.cri.boURL}" method ="get">
					<div class='select'>
	                  <select name='type' style="width:150px;height:20px;">
	                    <option value=""
	                    	<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>-----</option>
	                    <option value="T"
	                    	<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>과제1</option>
	                    <option value="C"
	                    	<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>과제2</option>
	                    <option value="W"
	                    	<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>과제3<option>
	                    <option value="TWC"
	                    	<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>과제4</option>
	                  </select>
	                  </div>
	                  <!-- /select option -->
	                <%-- <div class="input-group input-group-sm hidden-xs" >
	                    <input type="text" name='keyword'
	                    	value='<c:out value="${pageMaker.cri.keyword}"/>'class="form-control pull-right">
	                    <div class="input-group-btn">
	                    <button type="submit" class="btn btn-primary btn-flat"><i class="fa fa-search"></i></button>
	                  </div>
				</div> --%>
				</form>
            </div>
            </div>
			<!-- /search-->
			<!-- table -->
              <table class="table table-bordered">
                <tr>
                  <th style="width: 20px">No.</th>
                  <th>학생이름</th>
                  <th style="width: 100px">제출여부</th>
                  <th style="width: 100px">첨부파일</th>
                  <th style="width: 100px">점수</th>
                </tr>
                <c:forEach var="list" items="${studentList}">
	                <tr>
	                  <td><c:out value="${list.memNum}"/></td>
	                  <td>
	                  	<a class='move' href="/mypage/board/${pageMaker.cri.boCode}/view?boNum=<c:out value='${list.boNum}'/>"><c:out value="${list.memName}"/></a>
	                  </td>
	                  <td><c:out value="${list.memNum}"/></td>
	                  <td><div class="col-md-3 col-sm-4"><i class="fa fa-fw fa-download"></i> fa-download</div>
	                  <c:out value="${list.boRegDate}"/></td>
	                  <td><c:out value="${list.boRegDate}"/></td>
	                </tr>
                </c:forEach>
              </table>
              <!-- /table -->
           		<div class="box-footer pull-right">
					 <form action="/mypage/board/${pageMaker.cri.boCode}/${pageMaker.cri.boURL}" method="get"> 
						<div class="buttons">
						<!-- 입력버튼을 누르면 점수를 입력할수 있는 칸 나옴 -->
							<button class="btn btn-warning">입력</button>
							<!-- 등록버튼을 누르면 입력한 정수를 저장하고 더이상 입력할수 없게 readonly로 변함 -->
					      	<button class="btn btn-primary">등록</button>
					     </div>
				    </form>  
				</div> 
	            <!-- pagination -->
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
     		</div>
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
		console.log(boURL);

		location.href = "/mypage/board/${pageMaker.cri.boCode}/${pageMaker.cri.boURL}?page=" + page + "&amount=" + sel;

	}
</script>


<%@ include file="footer.jsp"%>

</body>
</html>