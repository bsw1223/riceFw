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
	margin:auto;
	display:flex;
}

</style>


   <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <c:out value='${sjctName}' />
      </h1>
      <ol class="breadcrumb" >
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
		<li><a href="#"><c:out value='${sjctName}' /></a></li>
		<li class="active">성적</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <!-- left column -->
        <div class="col-md-9">
          <!-- general form elements -->
          <div class="box box-primary">
   			 <!-- box body -->
			<div class="box-body">
			<!-- search -->
			 <div class="box-tools pull-left">
			 <label>과목명 :</label>
				<form id='searchForm' action="/mypage/board/${pageMaker.cri.boCode}/${pageMaker.cri.boURL}" method ="get">
					<div class='select'>
	                  <select name='type' style="width:150px;height:20px;">
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
	                <%-- <div class="input-group input-group-sm hidden-xs" >
	                    <input type="text" name='keyword'
	                    	value='<c:out value="${pageMaker.cri.keyword}"/>'class="form-control pull-right">
	                    <div class="input-group-btn">
	                    <button type="submit" class="btn btn-primary btn-flat"><i class="fa fa-search"></i></button>
	                  </div>
				</div> --%>
				</form>
            </div>
			<!-- /search-->
			<!-- table -->
              <table class="table table-bordered">
                <tr>
                  <th style="width: 20px">No.</th>
                  <th>학생이름</th>
                  <th>제출여부</th>
                  <th>첨부파일</th>
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
           		<div class="pull-right">
					<form action="/mypage/board/${pageMaker.cri.boCode}/${pageMaker.cri.boURL}" method="get">
						<div class="buttons">
							<button class="btn btn-block btn-primary">입력</button>
					      	<button class="btn btn-block btn-primary">등록</button>
					     </div>
				     </form> 
				</div> 
	            <!-- pagination -->
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
	        	</div>
        		 <!-- /pagination -->  
     		</div>
    	 <!-- /.main content -->
  		</div>  
		</div>
	</div>
	<!-- /section -->
</section>
<!-- /content wrapper -->
</div>
 
 
 
 <!-- MODAL -->
 <div class="modal fade" id="modalPop">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">점수 입력창</h4>
				</div>
				<div class="modal-body">

						<form class="form-horizontal">
							<div class="box-body">
							
								<div class="form-group  col-sm-12">
				                <label for="" class="col-sm-6" id="selectSub">과목선택</label>
				                  <select class="form-control" id="subId2">
				                    
				                  </select>
				                </div>
				                <div class="form-group  col-sm-12">
				                 <label for="" class="col-sm-12" id="searchTeacher">강사검색</label>
										<input type="text" class="form-control" id="eventTitle" placeholder="이름을 입력해 주세요">
								</div>
								<button type="button" class="btn btn-primary col-sm-12" id="selectTeaName">검색</button>
								</div>
							</form>	
			<div class="box-header with-border">
            <div class="box-header">
              	
              <h3 class="box-title">강사 목록</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <table class="table table-condensed" id="lecInfoTable">
                <tr>
                  <th style="width: 5px">No</th>
                  <th style="width: 5px">선택</th>
                  <th style="width: 40px">강사번호</th>
                  <th style="width: 40px">강사이름</th>
                </tr>
 
              </table>
            </div>
            <!-- /.box-body -->
      	  </div>

		<div class="box-header with-border">
			<div class="box-header">
			<h3 class="box-title">강의 계획 목록</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body no-padding">
					<table class="table table-condensed" id="lecInfoTeacher">
						<tr>
							<th style="width: 5px">No</th>
							<th style="width: 5px">선택</th>
							<th style="width: 40px">강의 계획명</th>
							<th style="width: 40px">강의 내용</th>
						</tr>
	
					</table>
				</div>
				<!-- /.box-body -->
		</div>
			</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id="saveSub">선택</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
<!-- /.modal -->


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