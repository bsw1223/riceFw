<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        커뮤니티이름
        <small>커뮤니티 설명</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Widgets</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <div class="row">

          <!-- Box Comment -->
          <div class="box box-widget">
          <input type="hidden" id='bno' name='bno' value='<c:out value ="${board.bno}"/>'>
            <div class="box-header with-border">
              <div class="user-block">
                <span class="title"><h2><c:out value ="${board.title}"/></h2></span>
                <span class="writer"><p><c:out value ="${board.writer}"/></p></span>
              </div>
              <!-- /.user-block -->
            </div>
            <!-- /.box-header -->
            <div class="box-body">

              <p><c:out value ="${board.content}"/></p>
              <button type="button" class="btn btn-default btn-xs"><i class="fa fa-eye"></i> View</button>
              <button type="button" class="btn btn-default btn-xs"><i class="fa fa-thumbs-o-up"></i> Like</button>
              <span class="pull-right text-muted">127 likes - 200 views</span>
            </div>
            <!-- /.box-body -->
            <div class="box-footer box-comments">
              <div class="box-comment">

              </div>
            </div>
            <!-- /.box-footer -->
            <div class="box-footer">
              <form action="#" method="post">

                <div class="img-push">
                  <input type="text" class="form-control input-sm" placeholder="Press enter to post comment">
                  <input type= "button" value="등록">
                </div>
              </form>
            </div>
            <!-- /.box-footer -->
          </div>
          <!-- /.box -->

        <!-- /.col -->
      </div>
      <!-- /.row -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->




<%@ include file="footer.jsp"%>