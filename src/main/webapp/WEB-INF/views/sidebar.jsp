<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script
  src="https://code.jquery.com/jquery-2.2.4.js"
  integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
  crossorigin="anonymous"></script>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

	<script>
	/*1,1000/2,1001/3,1002*/
	var sideList = new Array();
	/* var authId = ${member.authId}; */
	var authId = "1001";
	console.log("authId : "+authId);
	var memnum = "2";
	 
	/* 	if(${member.authId}==1000)//관리자(1000),학생(1001),강사(1002) */
	/* var authId= ${member.authId}; */
	var newMapListSub = null;
	
	
	$(document).ready(function(){
		$.ajax({
			type : "post",
			async: false,
			datatype:"textd; charset=utf-8",
			url: "/sublist",
			data: {memnum:memnum},
			success: function(mapListSub){
					console.log("sucess sublist");
					newMapListSub = JSON.parse(mapListSub);
					console.log("mapList : " +mapListSub);
		
					}
				});
			});
	
	$(document).ready(function(){
		$.ajax({
		type : "post",
		async: true,
		datatype:"textd; charset=utf-8",
		url: "/main.do",
		data: {authId:authId},
		success: function(mapList){
						console.log("sucess");
						console.log(mapList);
						
						//newMapList : 자바스크립트 객체를 담은 배열
						var newMapList = JSON.parse(mapList);//전체 리스트
						var topMenu= new Array();
						var topMenuNon= new Array();
						var menuIdJ ="";
						var parentMenuIdJ = "";
						
						for(var i in newMapList){
							menuIdJ =newMapList[i].menuId;//메뉴아이디
								for(var j in newMapList){
									parentMenuIdJ=newMapList[j].parentMenuId;
										if(menuIdJ==parentMenuIdJ)
											{//페어런츠 아이디와 비교
												topMenu.push(menuIdJ);
																									
											}
												  }	
									 }//for문 종료
							
							//상위메뉴 없는 것 -top메뉴,
							for(var i in newMapList)
								{
									menuIdJ =newMapList[i].menuId;
									parentMenuIdJ=newMapList[i].parentMenuId;
								if(parentMenuIdJ==null)
									{
										topMenuNon.push(menuIdJ);
									}
										}
											 
					//-----------------------중복값 제거--------------------	 
							var topMenuT = topMenu.reduce(function(a,b){
							if (a.indexOf(b) < 0 ) a.push(b);
								return a;
								},[]);//부모 ID와 ID가 같은 리스트, TREE 있는 리스트?
								
							var topMenuN = topMenuNon.reduce(function(a,b){
									if (a.indexOf(b) < 0 ) a.push(b);
										return a;
										},[]);//상위메뉴가 없는 리스트(top메뉴)
					//-----------------------중복값 제거 끝--------------------	 
							
//--------------------------------메뉴추가-----------------------------------------
			//topMenuN --> top메뉴
			//topMenuN중  topMenuT에 있으면 treeTop2,Menu메뉴 사용 , 
			//menuId이 14이면 3단TREE사용
			//아니면nonTreeTopMenu 사용
	


							
//---------------------------------메뉴 종류(3단/tree형/nontree형)-----------------------------------------
//---------------------------------------3단계 폼--------------------------------------------------
var tree3TopMenuT =	"<li class=\"active treeview\">"
					+"<li class=\"treeview thirdone a14 a30\">"
					+"	<a href=\"#\">"
					+"	  <i class=\"fa fa-share\"></i> <span>3단 NAME1</span>"
					+"	    <span class=\"pull-right-container\">"
					+"	      <i class=\"fa fa-angle-left pull-right\"></i>"
					+"	    </span>"
					+"	 </a>"
					
						//----------------------<------여기에 2단계 붙이기
				
					+"</li>"//--------------------1단 마지막 li
					
						//---------------------------2/3단계--------------------------
var tree3TopMenuM =	" <ul class=\"treeview-menu thirdtwo\">"
					+	" <li class=\"treeview addtwo text\">"
					+"	       <a href=\"#\"><i class=\"fa fa-circle-o\"></i>3단 NAME2"//과목명
					+"	           <span class=\"pull-right-container\">"
					+"	              <i class=\"fa fa-angle-left pull-right\"></i>"
		            +"	               </span>"
				    +"	             </a>"
							//--------------------<---여기에 3단계 붙이기
					
					+"	    </li>"//--------------------3단붙는 2단의 마지막 li
					+" </ul>"//------------2단 마지막 ul

var tree3TopMenuMAdd =   " <li class=\"treeview addtwot text\">"
						+"	       <a href=\"#\"><i class=\"fa fa-circle-o\"></i>3단 NAME2"//과목명
						+"	           <span class=\"pull-right-container\">"
						+"	              <i class=\"fa fa-angle-left pull-right\"></i>"
			            +"	               </span>"
					    +"	             </a>"
					
				    //--------------------------------3/3단계------------------                 
var tree3TopMenuL =	"<ul class=\"treeview-menu thirdthree \">"
					+"  <li><a href=\"#\"><i class=\"fa fa-circle-o\"></i>3단 NAME3</a></li>"
					+"</ul>"//-----------------3단 마지막 ul
	       
var tree3TopMenuLO = " <li><a href=\"#\"><i class=\"fa fa-circle-o\"></i>3단 NAME3</a></li>"


//----------------------------------------2단 폼--------------------------------------------------------------------------		
var tree2TopMenu =	"<li class=\"treeview\">"
					+"<li class=\"treeview second\">"
					+"<a href=\"#\">"
					+"  <i class=\"fa fa-table\"></i> <span>2단 NAME1</span>"
					+" <span class=\"pull-right-container\">"
					+"   <i class=\"fa fa-angle-left pull-right\"></i>"
					+"  </span>"
					+"</a>"
					+"<ul class=\"treeview-menu\">"
					+" <li class=\"text\" ><a href=\"#\"><i class=\"fa fa-circle-o\"></i>2단 NAME2</a></li>" 
					
					//----------------<여기 2단 삽입
					+"</ul>"
					+"</li>"//--------------1단 li마지막
					
					
					
var tree2TopMenuM = " <li class=\"text\"><a href=\"#\"><i class=\"fa fa-circle-o\"></i>2단 NAME2</a></li>"
					
				


//-------------------------------------------1단 폼----------------------------------

 var tree1TopMenu= "<li class=\"first\"><a href=\"#\"><i class=\"fa fa-book\"></i> <span>1단 NAME1</span></a></li>"



//---------------------------------------------------메뉴 틀 추가--------------------------------------------------
//-----------3단중 1단------------
for(var i in newMapList)
	{
		 var checkMenId = newMapList[i].menuId;
		 if(checkMenId=="14"||checkMenId=="30")	
			{
			  $('.start').append(tree3TopMenuT); 
		
			}
	}
//-----------3단중 2단------------								 



//부모가 14번 인것 들 넣기 thirdone클래스에 li.thirdone > a













//newMapListSub[i].openClassname

for(var i in newMapListSub)
	{
		if($('li.a14').length > 0 || $('li.a30').length > 0)
			{
			  $('li.thirdone').append(tree3TopMenuM);
			break;
			}
	}
var tempCount = 0;
for(var i in newMapListSub)
{
	if($('li.a14').length > 0 || $('li.a30').length > 0)
		{
			tempCount++;
		}
}
for(var i =0 ; i< tempCount-1; i++)
{
	{
		$('.thirdtwo').append(tree3TopMenuMAdd);
	}
}







/* 
for(var i in newMapList)
	{
		var parentMenuId = newMapList[i].parentMenuId;
		if(parentMenuId=="14"||parentMenuId=="30")
			{
			  $('li.thirdone').append(tree3TopMenuM);
			break;
			}
	}
	
var tempCount = 0;
for(var i in newMapList)
{
	var parentMenuId = newMapList[i].parentMenuId;
	if(parentMenuId=="14"||parentMenuId=="30")
		{
			tempCount++;
		}
}

for(var i =0 ; i< tempCount-1; i++)
	{
		{
			$('.thirdtwo').append(tree3TopMenuMAdd);
		}
	} */
//-----------3단중 3단------------

for(var i in newMapList)
{
	var parentMenuId = newMapList[i].parentMenuId;
	if(parentMenuId=="1000after"||parentMenuId=="100after")
		{
		  $('li.addtwo > a').after(tree3TopMenuL);
		break;
		}
}

for(var i in newMapList)
{
	var parentMenuId = newMapList[i].parentMenuId;
	if(parentMenuId=="1000after"||parentMenuId=="100after")
		{
		  $('li.addtwot > a').after(tree3TopMenuL);
		break;
		}
}
var tempCount1 = 0;
for(var i in newMapList)
	{
		var parentMenuId = newMapList[i].parentMenuId;
		if(parentMenuId=="1000after"||parentMenuId=="100after")
			{
				tempCount1++;
			}
	}

for(var i =0 ; i< tempCount1-1; i++)
	{	
			var ulCount = "'.addtwo > ul'";
			$(eval(ulCount)).append(tree3TopMenuLO);
	}
	
for(var j =0 ; j<tempCount-1; j++)
	{
for(var i =0 ; i< tempCount1-1; i++)
		{
			{	
				var ulCount = "'.addtwot:eq("+j+") > ul'";
				$(eval(ulCount)).append(tree3TopMenuLO);
			}
		}
	}

//-----------------------------트리종류 구별-------------------------------------------
	 
for(var i in topMenuN)
{
 if(authId == "1001"||authId == "1000")
		 {
	var checkMenId = newMapList[i].menuId;
	 if(checkMenId!="14")
		 {
	  var check = false;
		for(var j in topMenuT)
			{
				if(topMenuN[i]==topMenuT[j])
					{
						check = true;	
					}
				
			}
		if(check ==true)
			{
				//tree메뉴
				$('.start').append(tree2TopMenu);
										
				}
									
		if(check ==false)
			{
				//nontree메뉴
				$('.start').append(tree1TopMenu);
			}
		}
	 }
 
if(authId == "1002")
	 {
	var checkMenId = newMapList[i].menuId;
		 if(checkMenId!="30")
			 {
		  var check = false;
			for(var j in topMenuT)
				{
					if(topMenuN[i]==topMenuT[j])
						{
							check = true;	
						}
					
				}
			if(check ==true)
				{
					//tree메뉴
					$('.start').append(tree2TopMenu);
											
					}
										
			if(check ==false)
				{
					//nontree메뉴
					$('.start').append(tree1TopMenu);
				}
			}
		 } 
}	 

	 
	 
/* for(var i in topMenuN)
{
 if(authId == "1001"||authId == "1000")
		 {
	var checkMenId = newMapList[i].menuId;
	 if(checkMenId!="14")
		 {
	  var check = false;
		for(var j in topMenuT)
			{
				if(topMenuN[i]==topMenuT[j])
					{
						check = true;	
					}
				
			}
		if(check ==true)
			{
				//tree메뉴
				$('.start').append(tree2TopMenu);
										
				}
									
		if(check ==false)
			{
				//nontree메뉴
				$('.start').append(tree1TopMenu);
			}
		}
	 }
 
if(authId == "1002")
	 {
	var checkMenId = newMapList[i].menuId;
		 if(checkMenId!="30")
			 {
		  var check = false;
			for(var j in topMenuT)
				{
					if(topMenuN[i]==topMenuT[j])
						{
							check = true;	
						}
					
				}
			if(check ==true)
				{
					//tree메뉴
					$('.start').append(tree2TopMenu);
											
					}
										
			if(check ==false)
				{
					//nontree메뉴
					$('.start').append(tree1TopMenu);
				}
			}
		 } 
}	 
	 */
//--------------------------클래스추가---------------------------
//배열의 id를 이용하여 클래스를 넣는다.TOP
var tempJ =0;
for(i in topMenuT)
	{
	 if(authId == "1001"||authId == "1000")
	 {
	 	var tempM=topMenuT[i];
		if(tempM!='14')
	  			{
					var classN = "a"+tempM;
					var secondC = "'.second:eq("+tempJ+")'";
					$(eval(secondC)).addClass(classN); 
					tempJ++;
	  			}	
	}
	if(authId == "1002")
	 {
	 	var tempM=topMenuT[i];
		if(tempM!='30')
	  			{
					var classN = "a"+tempM;
					var secondC = "'.second:eq("+tempJ+")'";
					$(eval(secondC)).addClass(classN); 
					tempJ++;
	  			}	
	  }
	
	
}
var remainTopMenu = $(topMenuN).not(topMenuT).get();//트리없는 TOP메뉴 리스트
var tempT = 0;
for(i in remainTopMenu)
	{
	 	var tempM=remainTopMenu[i];
		var classN = "a"+tempM;
		var secondC = "'li.first:eq("+tempT+")'";
		$(eval(secondC)).addClass(classN); 
		tempT++;
	  				
	}

//---------------------------top타이틀 추가-------------------------------------

for(i in newMapList)
	{
		var classId = "a"+newMapList[i].menuId;
		var name = newMapList[i].menuName;
		var path="'li."+classId+" > a > span:eq(0)'";
		if($('li').hasClass(classId))
			{
				$(eval(path)).text(name); 
			}
	 
	}
//----------------------2단 폼 넣기------------------
//클래스 네임 검색 후 맞으면 폼추가
 for(i in newMapList)
{
	 if(authId == "1001"||authId == "1000")
		{
			var classId = "a"+newMapList[i].parentMenuId;
			var path="'li."+classId+" > ul'";
			if(classId!="a14"&&$('li').hasClass(classId))
				{
					$(eval(path)).append(tree2TopMenuM); 
				}
		}
	 if(authId == "1002")
		{
			var classId = "a"+newMapList[i].parentMenuId;
			var path="'li."+classId+" > ul'";
			if(classId!="a30"&&$('li').hasClass(classId))
				{
					$(eval(path)).append(tree2TopMenuM); 
				}
		}
	 
 
}

	
//---------------------------sub타이틀 추가3단아닐때-------------------------------------
var tempC= 0;
var tempD= 1;
var tempE= 2;

for(i in newMapList)
{
	
	var classId = "a"+newMapList[i].parentMenuId;
	if(classId!='a14'||classId!='a30')
		{
			var path="'li."+classId+" > ul > li.text:eq("+tempC+") > a'";
			var path0="'li."+classId+" > ul > li.text:eq("+tempC+")'";
			var path1="'li."+classId+" > ul > li.text:eq("+tempD+")'";
			var path2="'li."+classId+" > ul > li.text:eq("+tempE+")'";
			var name = newMapList[i].menuName;
			if($('li').hasClass(classId))
				{
					$(eval(path)).text(name); 
					console.log("name : "+name);
					console.log("path : "+path);
					console.log("$(eval(path0)).length : "+ $(eval(path0)).length);
					console.log("$(eval(path2)).length : "+ $(eval(path2)).length);
					console.log("tempC : "+ tempC);
					console.log("tempD : "+ tempD);
					console.log("tempE : "+ tempE);
					
				
					 if($(eval(path0)).length>0)
						{
							tempC++;
							tempD++;
							tempE++;
						}
				
						if($(eval(path2)).length==0)
							{
							tempE=2;
							tempD=1;
							tempC=0;
							}
					 }
				 }
			}
	


//3단일때

//여기인듯 여기
//	newMapListSub[i].openClassname

 var tempZ= 0;
 var path= null;

for(i in newMapListSub)
{
	 if(authId == "1001"||authId == "1000")
		{
			path="'li.a14 > ul > li.text:eq("+tempZ+") > a'";
		}
	 if(authId == "1002")
		{
			path="'li.a30 > ul > li.text:eq("+tempZ+") > a'";
		}
			var name = newMapListSub[i].openClassname;
		
					$(eval(path)).text(name); 
					if(($(eval(path)).length)+1>0)
						{
							tempZ++;
						}else
						{
							tempZ=0;
						}
						
			
 }
			

 /* var tempZ= 0;

for(i in newMapList)
{
	var classId = "a"+newMapList[i].parentMenuId;
	if(classId=='a14'||classId=='a30')
		{
			var path="'li."+classId+" > ul > li.text:eq("+tempZ+") > a'";
			var name = newMapList[i].menuName;
			if($('li').hasClass(classId))
				{
					$(eval(path)).text(name); 
					if(($(eval(path)).length)+1>0)
						{
							tempZ++;
						}else
						{
							tempZ=0;
						}
						
			
				 }
			
		} 
 
} */


//----------마지막 하나 삭제------
 for(i in newMapList)
{
	 if(authId == "1001"||authId == "1000")
		{
			var classId = "a"+newMapList[i].parentMenuId;
			var path="'li."+classId+" > ul > li:last'";
			if(classId!="a14"&&$('li').hasClass(classId))
				{
					$(eval(path)).empty();; 
				}
		}
	 if(authId == "1002")
		{
			var classId = "a"+newMapList[i].parentMenuId;
			var path="'li."+classId+" > ul > li:last'";
			if(classId!="a30"&&$('li').hasClass(classId))
				{
					$(eval(path)).empty();; 
				}
		}
 
}	 

//-------------------------------3단 ul.thirdthree > li에 각자의 class명 넣기-------------------------------------
//과목 PARENTS 이용해서 class명 넣기
var tempD= 0;

for(i in newMapList)
{
	 if(authId == "1001"||authId == "1000")
		{
			var classId = "a"+newMapList[i].parentMenuId;
			if(classId=='a14')
				{
					var path="'li."+classId+" > ul > li.text:eq("+tempD+")'";
					 var className = "subject"; 
					if($('li').hasClass(classId))
						{
							$(eval(path)).addClass(className); 
							if(($(eval(path)).length)+1>0)
								{
									tempD++;
								 }else
								 {
									tempD=0;
								  }
					 	}
				}
		}
		if(authId == "1002")
		{
			var classId = "a"+newMapList[i].parentMenuId;
			if(classId=='a30')
				{
					var path="'li."+classId+" > ul > li.text:eq("+tempD+")'";
					 var className = "subject"; 
					if($('li').hasClass(classId))
						{
							$(eval(path)).addClass(className); 
							if(($(eval(path)).length)+1>0)
								{
									tempD++;
								 }else
								 {
									tempD=0;
								  }
					 	}
				}
		}
}

//------------------각각 메뉴 넣기--------------------
var tempD= 0;

for(i in newMapList)
{
	 if(authId == "1001"||authId == "1000")
		{
			var classId = "a"+newMapList[i].parentMenuId;
			if(classId=='a14')
				{
					var path="'li."+classId+" > ul > li.text:eq("+tempD+") > ul > li:eq("+i+")'";
					var name = newMapList[i].menuName;
					if($('li').hasClass("subject"))
					{
						$(eval(path)).append(name); 
						if(($(eval(path)).length)+1>0)
							{
								tempD++;
							}else
								{
									tempD=0;
								}
						}
					
				 }
	 }
	if(authId == "1002")
	{
		var classId = "a"+newMapList[i].parentMenuId;
		if(classId=='a30')
			{
				var path="'li."+classId+" > ul > li.text:eq("+tempD+") > ul > li:eq("+i+")'";
				var name = newMapList[i].menuName;
				if($('li').hasClass("subject"))
				{
					$(eval(path)).append(name); 
					if(($(eval(path)).length)+1>0)
						{
							tempD++;
						}else
							{
								tempD=0;
							}
					}
				
				}
	 }
 
}
//-------------------------------3단 클래스 넣기-------------------------------------
var tempF= 0;

for(i in newMapList)
{
	for(j in newMapList)
	{
		 if(authId == "1001"||authId == "1000")
			{
			var classId = "a"+newMapList[j].parentMenuId;
			var classIdM = "a"+newMapList[j].menuId;
			if(classId=='a100after'||classId=='a1000after')
				{
					var path="'li.a14 > ul > li.text:eq("+i+") > ul > li:eq("+tempF+")'";
					var pathCount="'li.a14 > ul > li.text:eq("+i+") > ul > li'";
					if($('li').hasClass("a14"))
						{
							$(eval(path)).addClass(classIdM); 
							if(($(eval(pathCount)).length)+2>0)
								{
										tempF++;
								}
							if($(eval(pathCount)).length-1==(tempF-1))//태그개수로 반복횟수 정함.
								{
										tempF=0;
								}
						}
					}
			}
		if(authId == "1002")
			{
				var classId = "a"+newMapList[j].parentMenuId;
				var classIdM = "a"+newMapList[j].menuId;
				if(classId=='a100after'||classId=='a1000after')
					{
						var path="'li.a30 > ul > li.text:eq("+i+") > ul > li:eq("+tempF+")'";
						var pathCount="'li.a30 > ul > li.text:eq("+i+") > ul > li'";
						if($('li').hasClass("a30"))
							{
								$(eval(path)).addClass(classIdM); 
								if(($(eval(pathCount)).length)+2>0)
									{
											tempF++;
									}
								if($(eval(pathCount)).length-1==(tempF-1))//태그개수로 반복횟수 정함.
									{
											tempF=0;
									}
							}
						}
		}
		
		
	}
}

//-----------------------------3단 title붙이기-------------------------

	var tempG= 0;

	for(i in newMapList)
	{
		for(j in newMapList)
		{
			 if(authId == "1001"||authId == "1000")
				{
					var classIdM = "a"+newMapList[j].menuId;
					var title = newMapList[j].menuName;
					var path="'li.a14 > ul > li.text:eq("+i+") > ul > li:eq("+tempG+") > a'";
					if($('li').hasClass(classIdM))
						{
							var pathCount="'li.a14 > ul > li.text:eq("+i+") > ul > li'";
							if($('li').hasClass("a14"))
								{
									$(eval(path)).text(title); 
									if(($(eval(pathCount)).length)+2>0)
										{
												tempG++;
										}
									if($(eval(pathCount)).length-1==(tempG-1))//태그개수로 반복횟수 정함.
										{
												tempG=0;
										}
										
								}
							}
				}
			if(authId == "1002")
			{
				var classIdM = "a"+newMapList[j].menuId;
				var title = newMapList[j].menuName;
				var path="'li.a30 > ul > li.text:eq("+i+") > ul > li:eq("+tempG+") > a'";
				if($('li').hasClass(classIdM))
					{
						var pathCount="'li.a30 > ul > li.text:eq("+i+") > ul > li'";
						if($('li').hasClass("a30"))
							{
								$(eval(path)).text(title); 
								if(($(eval(pathCount)).length)+2>0)
									{
											tempG++;
									}
								if($(eval(pathCount)).length-1==(tempG-1))//태그개수로 반복횟수 정함.
									{
											tempG=0;
									}
									
							}
						}
				}
		}
		
		
		
	}

//-------------------------------3단 링크 걸기--------------------------------------

	var tempH=0;

	for(i in newMapList)
	{
		for(j in newMapList)
		{
			 if(authId == "1001"||authId == "1000")
				{
					var classIdM = "a"+newMapList[j].menuId;
					var URL = newMapList[j].menuURL;
					var path="'li.a14 > ul > li.text:eq("+i+") > ul > li:eq("+tempH+") > a'";
					if($('li').hasClass(classIdM))
						{
							var pathCount="'li.a14 > ul > li.text:eq("+i+") > ul > li'";
							if($('li').hasClass("a14"))
								{
									console.log("classId : "+"i : "+i+" j : "+j+" "+" tempF : "+tempH+" "+classId);
									console.log(" path : "+ path); 
									$(eval(path)).attr('href',URL); 
									console.log("$(eval(path)).length : "+ $(eval(path)).length)
									if(($(eval(pathCount)).length)+2>0)
										{
												tempH++;
										}
									if($(eval(pathCount)).length-1==(tempH-1))//태그개수로 반복횟수 정함.
										{
												tempH=0;
										}
										
								}
							}
					}
			if(authId == "1002")
			{
				var classIdM = "a"+newMapList[j].menuId;
				var URL = newMapList[j].menuURL;
				var path="'li.a30 > ul > li.text:eq("+i+") > ul > li:eq("+tempH+") > a'";
				if($('li').hasClass(classIdM))
					{
						var pathCount="'li.a30 > ul > li.text:eq("+i+") > ul > li'";
						if($('li').hasClass("a30"))
							{
								console.log("classId : "+"i : "+i+" j : "+j+" "+" tempF : "+tempH+" "+classId);
								console.log(" path : "+ path); 
								$(eval(path)).attr('href',URL); 
								console.log("$(eval(path)).length : "+ $(eval(path)).length)
								if(($(eval(pathCount)).length)+2>0)
									{
											tempH++;
									}
								if($(eval(pathCount)).length-1==(tempH-1))//태그개수로 반복횟수 정함.
									{
											tempH=0;
									}
									
							}
						}
				}
		}
	}
//-------------------------------1단 URL 추가-------------------------------------

for(i in newMapList)
	{
	var classIdM = "a"+newMapList[i].menuId;
	var URL = newMapList[i].menuURL;
	var path = "'li."+classIdM+" > a'";
		if($('li').hasClass(classIdM))
			{
			$(eval(path)).attr('href',URL); 
			}
	}
//-------------------------------2단 클래스 추가-------------------------------------
var tempW =0;

for(i in newMapList)
{
	var classId = "a"+newMapList[i].parentMenuId;
	if(classId!='a14'||classId!='a30')
		{
			var path="'li."+classId+" > ul > li.text:eq("+tempW+") > a'";
			var URL = newMapList[i].menuURL;
			if($('li').hasClass(classId))
				{
					$(eval(path)).attr('href',URL); 
					if(($(eval(path)).length)+1>0)
						{
							tempW++;
						}
									
							
					if($(eval(path)).length==(tempW-1))//태그개수로 반복횟수 정함.
						{
							tempW=0;
						}
				 }
			}
}









for(i in newMapListSub)
	{
		console.log("newMapList : "+newMapListSub[i].openClassname);	
	
	}






											 
				 
											 
					}
		} );
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
      <ul class="sidebar-menu start" data-widget="tree">
        <li class="header">MAIN NAVIGATION</li>
       
        
      </ul>
      
      
    </section>
    <!-- /.sidebar -->
  </aside>
