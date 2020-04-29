<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
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
        <c:out value='${sjctName}' />
       
      </h1>
      <ol class="breadcrumb" >
        <li><a href="#"><i class="fa fa-dashboard"></i> 마이페이지</a></li>
        <li><a href="#"><c:out value='${sjctName}' /></a></li>
        <li class="active">스터디 게시판 </li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <!-- left column -->
        <div class="col-md-12">
          <!-- general form elements -->
          <div class="box box-primary">
   			 <!-- box body -->
			<div class="box-body">
			<!-- search -->
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
			<!-- /search-->
			<!-- table -->
              <table class="table table-bordered">
                <tr>
                  <th style="width: 20px">No.</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>조회수</th>
                  <th>답변여부</th>
                </tr>
                <c:forEach var="list" items="${boardList}">
	                <tr>
	                  <td><c:out value="${list.boNum}"/></td>
	                  <td>
	                  	<a class='move' href="/mypage/board/qna/view?boNum=<c:out value='${list.boNum}'/>"><c:out value="${list.boTitle}"/></a>
	                  </td>
	                  <td><c:out value="${list.memNum}"/></td>
	                  <td><c:out value="${list.boView}"/></td>
	                  <!--답변상태로 수정해야함-->
	                  <td><c:out value="${list.boUpdateDate}"/></td>
	                </tr>
                </c:forEach>
              </table>
              <!-- /table -->
           		<div class="pull-right" style="padding:10px;">
					<form action="/mypage/board/qna/writeView" method="get">
				      	<button id='regBtn' type="button" class="btn btn-block btn-primary">등록</button>
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
 

 <form id="actionForm" action="/qna/list" method="post">
	<input type='hidden' name='page' value='${cri.page}'>
	<input type='hidden' name='amount' value='${cri.amount}'>
	<%-- <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
	<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'> --%>
</form>   
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var searchForm=$("#searchForm");
		
		$("#searchForm button").on("click",function(e){
			
			if(!searchForm.find("option:selected").val()){
				alert("검색종류를 선택하세요");
				return false;
			}
			
			if(!searchForm.find("input[name='keyword']").val()){
				alert("키워드를 입력하세요");
				return false;
			}
			searchForm.find("input[name='page']").val("1");
				e.preventDefault();
				searchForm.submit();
		});
		var actionForm =$("#actionForm");
		
		$(".move").on("click",function(){
			e.preventDefault();
			actionForm.append("<input type='hidden' name='boNum' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action","/mypage/board/qna/view");
			actionForm.submit();
		})
		
		$(".pageBtn a").on("click",function(e){
			e.preventDefault();
			actionForm.find("input[name='page']").val($(this).attr("href"));
			actionForm.attr("action","/mypage/board/qna/list")
			actionForm.submit();
		})
		 
		$("#regBtn").on("click",function(){
		 	location.href="writeView";
		 }); 
	});
	
</script>

<%@ include file = "footer.jsp" %>

</body>
</html>
