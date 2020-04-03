<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script
      src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>

	<script>
	
	var sideList = new Array();
	var sideList =["마이페이지","스터디실예약","나의출석","커뮤니티","채팅","수강신청"];
	var sideListDetailMenu0 = ["과목1","과목2","dddd"];
	var sideListDetailMenu1 = ["과목3","과목4"];
	var sideListDetailMenu2 = ["과목5","과목6"];
	var sideListDetailMenu3 = ["과목7","과목8"];
	var sideListDetailMenu4 = ["과목9","과목10","11","22"];
	var sideListDetailMenu5 = ["과목11","과목12"];
	var detailForm="<li><a href=\"resources/pages/layout/top-nav.html\"><i class=\"fa fa-circle-o\"></i> Top Navigation</a></li>"
	
	var repeatWordings =" <ul class=\"sidebar-menu\" data-widget=\"tree\"><li class=\"treeview\">"
					     +" <a href=\"#\"><i class=\"fa fa-files-o\"></i>     <span class=\"side\">  </span>      <span class=\"pull-right-container\">"
					     +" <span class=\"label label-primary pull-right\"></span>     </span>"
					     +" </a> <ul class=\"treeview-menu\"> "
					     +" </ul>"
	
	
	//반복해서 메뉴 추가
	$(document).ready(function(){
		console.log(repeatWordings);
		for(var i =0; i<sideList.length-1;i++){
			$(".multi").append(repeatWordings);
			
		}
		
	});
	//반복한 메뉴에 메뉴명 추가
	$(document).ready(function(){
	var tagLength = $(".side").length;//생성한 메뉴 개수
	console.log(tagLength);
	
	for(var i=0; i<tagLength;i++){
		var temp = ".side:eq("+i+")";
		$(temp).text(sideList[i]);	//생성한 메뉴 리스트에 배열의 값을 넣는다.
		
	}
		
	});
	
	//클래스 동적순서대로 추가
	//detailForm을 sideListDetailMenu0의 길이만큼 넣는다.
	//.treeview-menu:eq(i)뒤에 넣기
	//sideListDetailMenu0~부터 넣는다
	$(document).ready(function(){
	for(var i=0; i<sideList.length;i++){
	var detailString ="sideListDetailMenu"+i;
		console.log("detailString :"+eval(detailString));//datailString을 콘솔에 찍는다.
			for(var j =0; j<eval(detailString).length;j++){
				var temp = "ul.treeview-menu:eq("+i+")";
				$(temp).append(detailForm);
			
				 
		}
		}
	});
	
	//.treeview-menu:eq(i)뒤에 넣기
	//sideListDetailMenu0~부터 넣는다
		$(document).ready(function(){
	
	for(var i=0; i<sideList.length;i++){//메인배열만큼 반복한다.
		var detailString ="sideListDetailMenu"+i;//클래스 변수에 있는 배열명 생성
		console.log("eval(detailString).length :"+eval(detailString).length);
		var evalDetail= eval(detailString)[i];
			for(var j=0; j<eval(detailString).length;j++){
				var evalDetailJ= eval(detailString)[j];
				var ulCount = "ul.treeview-menu:eq("+i+")";
				var aCount = "a:eq("+j+")";
				$(ulCount+" > li >" +aCount).text(evalDetailJ);	
				}
	}
	});
	
	</script>


  <aside class="main-sidebar">
      <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="resources/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>Alexander Pierce</p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
      <!-- search form -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
          <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu multi" data-widget="tree">
     
        <li class="treeview">
          <a href="#">
            <i class="fa fa-files-o"></i>
            <span class="side">  </span>
            <span class="pull-right-container">
              <span class="label label-primary pull-right"></span>
            </span>
          </a>
          <ul class="treeview-menu">
          <!-- -------------여기에 세부리스트 추가---------------------  -->
            <!-- <li><a href="resources/pages/layout/top-nav.html"><i class="fa fa-circle-o"></i> Top Navigation</a></li>
            <li><a href="resources/pages/layout/boxed.html"><i class="fa fa-circle-o"></i> Boxed</a></li>
            <li><a href="resources/pages/layout/fixed.html"><i class="fa fa-circle-o"></i> Fixed</a></li>
            <li><a href="resources/pages/layout/collapsed-sidebar.html"><i class="fa fa-circle-o"></i> Collapsed Sidebar</a></li> -->
          </ul>
        </li>
        
      </ul>
      <!--  여기에 반복 추가 -->
      
      
    </section>
    <!-- /.sidebar -->
  </aside>
