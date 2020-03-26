<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
                  <td>${listB.bno}</td>
                  <td>${listB.title}</td>
                  <td>${listB.content}</td>
                  <td>${listB.writer}</td>
                  <td>${listB.regdate}</td>
                  <td>${ listB.updateDate}</td>
                </tr>
  				</c:forEach>   
          
                </tbody>
              </table>
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
