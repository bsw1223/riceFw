<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script>
	//페이지 값 넘겨서 상세 글 보기
	function pageMove(number){
		
	var value=number;
		console.log(value);	
		
		location.href="boardContents.do?value="+value;
		
	}
	
	
</script>


  
<style>
<!-- 말줄임-->
.textReduce {
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  width: 300px;
  height: 20px;
  display: inline-bloSck; 
}

</style>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Data Tables
        <small>advanced tables</small>
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
              		
              		

			<c:forEach var="listB" items="${listB}" >
			  
				 <tr>
	                  <td><c:out value="${listB.bno}"/></td>
	                  <td><a href='/get.do?bno=<c:out value="${listB.bno}"/>'>
	                  <c:out value="${listB.title}"/></a></td>
	                  <td><c:out value="${listB.content}"/></td>
	                  <td><c:out value="${listB.writer}"/></td>
	                  <td><c:out value="${listB.regdate}"/></td>
	                  <td><c:out value="${listB.updateDate}"/></td>
			</c:forEach>
 			<c:forEach var="listB" items="${listB}" >   
			 <tr class="boardContents" onClick="pageMove('${listB.bno}')"  style="cursor:pointer;">
	 		      <td>${listB.bno}</td>
                  <td><p class="textReduce">${listB.title}</p></td>
                  <td><p class="textReduce">${listB.content}</p></td>
                  <td>${listB.writer}</td>
                  <td>${listB.regdate}</td>
                  <td>${ listB.updateDate}</td>

                </tr>
  			</c:forEach>   
          
                </tbody>
              </table>
              
               <div>
                 <ul class="pagination">
                
                     <c:if test="${pageMaker.prev}">
                         <li class="page-item"><a class="page-link" href="/board.do?page=${pageMaker.start-1 }&amount=${ pageMaker.cri.amount}">Previous</a></li>
                     </c:if>
                      
                     <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pnum">
                      	<li class="page-item ${pageMaker.cri.page == pnum ?"active":""}"><a class="page-link" href="/board.do?page=${pnum }&amount=${ pageMaker.cri.amount}">${pnum}</a></li>
               		 </c:forEach>
               		
                     <c:if test="${pageMaker.next}">
                       <li class="page-item"><a class="page-link" href="/board.do?page=${pageMaker.endPage+1 }&amount=${ pageMaker.cri.amount}">Next</a></li>
                     </c:if>

				 </ul>
               </div>   
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
          <form action="/register.do">
 				<td>
                    <button type="submit" class="btn btn-block btn-default">게시글 작성</button>
                 </td>
     	  </form>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
 
<!-- modal 추가 -->
        <div class="modal fade" id="mymodal">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Modal title</h4>
              </div>
              <div class="modal-body">
                <p>처리가 완료되었습니다.</p>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal --> 
 
<form id="actionForm" action="/board.do" method='get'>
	<input type="hidden" name="page" value='${pageMaker.cri.page}' >
	<input type="hidden" name="amount" value='${pageMaker.cri.amount}' >
</form>  
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	/* 	var result ='<c:out value="${result}"/>';
		
		checkModal(result);
		
		function checkModal(result){
			
			if(result === ''){
				return;
			}
			if(parseInt(result) > 0){
				$(".modal-body").html("게시글"+parseInt(result)+"번이 등록되었습니다.");
			}
			$("#mymodal").modal("show");
		} */
		
		var actionForm =$("actionForm");
		
		$(".page-item").on("click",function(e){
			e.preventDafault();
			
			console.log('click');
			actionForm.find("input[name='page']").val($(this).attr("href"));
			actionForm.submit();
		});
		
	})
</script>
<%@ include file = "footer.jsp" %>

</body>
</html>
