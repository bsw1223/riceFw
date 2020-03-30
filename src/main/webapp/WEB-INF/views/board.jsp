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
                
                      <c:if test="${pageUtil.prev}">
                         <li class="page-item"><a class="page-link" href="/board.do?page=${pageUtil.start-1 }&amount=${ pageUtil.dto.amount}">Previous</a></li>
                      </c:if>
                      
                      <c:forEach begin="${pageUtil.start }" end="${pageUtil.end }" var="pnum">
                      		<li class="page-item ${pnum == pageUtil.dto.page? "active":"" }"><a class="page-link" href="/board/list?page=${pnum }&amount=${ pageUtil.dto.amount}">${pnum}</a></li>
               		</c:forEach>
               		
                   <c:if test="${pageUtil.next}">
                      <li class="page-item"><a class="page-link" href="/board.do?page=${pageUtil.end+1 }&amount=${ pageUtil.dto.amount}">Next</a></li>
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
<%@ include file = "footer.jsp" %>

</body>
</html>
