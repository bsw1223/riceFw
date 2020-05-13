<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />	
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>    

<!-- ibsheet -->
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<!-- 라이선스 파일 -->
<script language="javascript" src="${contextPath}/resources/api/ibsheet/ibleaders.js"></script>
<!-- 제품 파일 -->
<script language="javascript" src="${contextPath}/resources/api/ibsheet/ibsheetinfo.js"></script>
<script language="javascript" src="${contextPath}/resources/api/ibsheet/ibsheet.js"></script>


<script language="javascript">
	//시트 높이 계산용
	var pageheightoffset = 500;
	
	/*Sheet 기본 설정 */
	function LoadPage() {
		mySheet.RemoveAll();
		//아이비시트 초기화
		var initSheet = {};
		initSheet.Cfg = {SearchMode:smLazyLoad,ToolTip:1};
		initSheet.HeaderMode = {Sort:1,ColMove:1,ColResize:1,HeaderCheck:1};
		initSheet.Cols = [
			{Header:"상태",Type:"Status",SaveName:"STATUS",MinWidth:50, Align:"Center"},
			{Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK",MinWidth:50},
			{Header:"회원번호",Type:"Text",SaveName:"memNum",MinWidth:60, Edit:0},
			{Header:"ID",Type:"Text",SaveName:"memId",MinWidth:200,Align:"Center",KeyField:1},		
			{Header:"이름",Type:"Text",SaveName:"memName",MinWidth:150,KeyField:1 ,MultiLineText:1, Wrap:1},
			{Header:"이메일",Type:"Text",SaveName:"memEmail",MinWidth:300,KeyField:1},
			{Header:"권한",Type:"Text",SaveName:"authId",MinWidth:100,KeyField:1},
			{Header:"가입일",Type:"Text",SaveName:"memJoinDate",MinWidth:200,Edit:0},
			{Header:"Level",Type:"Int",SaveName:"memLevel",MinWidth:60},
			{Header:"Point",Type:"Int",SaveName:"memPoint",MinWidth:60},
		];   
		IBS_InitSheet( mySheet , initSheet);

		mySheet.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
        //mySheet.ShowSubSum([{StdCol:"Release",SumCols:"price",Sort:"asc"}]);
		doAction('search');
	}
	
	/*Sheet 각종 처리*/
	function doAction(sAction) {
		switch(sAction) {
			case "search": //조회
			    var param = FormQueryStringEnc(document.frm);
				mySheet.DoSearch("/memMng/stMngadmin/search", param);
// 				"/memMng/tchMngadmin/search"
// 				mySheet.DoSearch("transaction_data2.json");
				break;
			case "reload": //초기화
				mySheet.RemoveAll();
				break;
			case "save": // 저장
				//var tempStr = mySheet.GetSaveString();
				//alert("서버로 전달되는 문자열 확인 :"+tempStr);
				mySheet.DoSave("/memMng/stMngadmin/save");
				break;			
			case "insert": //신규행 추가
				var row = mySheet.DataInsert();
				break;
		}
	}
	
	// 조회완료 후 처리할 작업
	function mySheet_OnSearchEnd() {
      
	}
	
	// 저장완료 후 처리할 작업
	// code: 0(저장성공), -1(저장실패)
	function mySheet_OnSaveEnd(code,msg){
		if(msg != ""){
			alert(msg);	
			//번호 다시 매기기
            //mySheet.ReNumberSeq();
		}	
	}	
	
	$(document).ready(function() {
		LoadPage();
	});
</script>   


<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>학생관리</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">학생관리</li>
		</ol>
	</section>
	
	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-md-10">
				<div class="box box-warning">
						<div class="box-header with-border">
							<h3 class="box-title">학생목록</h3>
			
							<form name='frm'>
<!-- 								<div class="box-tools pull-right"> -->
<!-- 									<div class="has-feedback"> -->
<!-- 										<input type="text" class="form-control input-sm" id="p_id" name="p_id" placeholder="search"> -->
<!-- 										<span class="glyphicon glyphicon-search form-control-feedback"></span> -->
<!-- 									</div> -->
<!-- 								</div> -->
								<!-- /.box-tools -->
			                </form>
			            </div>
			            <!-- /.box-header -->
				
					  <div class="box-body">
					  	<div class="col-md-12"> 
						    <div class="ib_function pull-right" style="margin: 0px 10px 10px 0px;">
						    	<a href="javascript:doAction('reload')" class="btn btn-primary btn-sm">초기화</a>
						    	<a href="javascript:doAction('insert')" class="btn btn-primary btn-sm">추가</a>
						    	<a href="javascript:doAction('search')" class="btn btn-primary btn-sm">조회</a>
						    	<a href="javascript:doAction('save')" class="btn btn-primary btn-sm">저장</a>
							</div>
						</div>
						<!-- /.col -->
						<div class="col-md-12"> 
							<div class="clear hidden"></div>
							<div class="ib_product" style="margin: auto">
								<script>createIBSheet("mySheet", "100%", "600px");</script>
							</div>
						</div>
						<!-- /.col -->
					 </div>
					 <!-- /.box-body -->
				</div>
				<!-- .box -->
			</div>
			<!-- .col -->
		</div>
		<!-- .row  -->
	</section>
	<!-- .content -->
</div>
<!-- .content-wrapper -->

<%@ include file="footer.jsp"%>
</body>
</html>
