<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<script src="${contextPath}/resources/api/js/jquery.cookie.js"></script>
<script>
	/*1,1000/2,1001/3,1002*/
	var sideList = new Array();
	var authId = "${loginMem.authId}";
	/* var authId = "1001"; */
	var memnum = "${loginMem.memNum}";
	 /* var memnum = "2"; */
 	var authId ="${loginMem.authId}";
	var authName ='';


	if(authId==1000)
		{
			authName="愿由ъ옄";
		}else if(authId==1001)
			{
				authName="?숈깮";
			}else
				{
				 authName="媛뺤궗";
				}

		$("p#profile").text(authName);
	 
	/* 	if(${member.authId}==1000)//愿由ъ옄(1000),?숈깮(1001),媛뺤궗(1002) */
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
					newMapListSub = JSON.parse(mapListSub);
					}
		});
		
		viewMenubar();
		
		$("select[name=locale]").change(function(e) {
			console.log($("select[name=locale]").val());
		});
	});
	
	
	
// 	$(document).ready(function(){
	function viewMenubar(locale){	
		$.ajax({
		type : "post",
		async: true,
		datatype:"textd; charset=utf-8",
		url: "/main.do",
		data: {
			authId:authId
		},
		success:  function(mapList) {
										//newMapList : ?먮컮?ㅽ겕由쏀듃 媛앹껜瑜??댁? 諛곗뿴
										var newMapList = JSON.parse(mapList);//?꾩껜 由ъ뒪??
										var topMenu = new Array();
										var topMenuNon = new Array();
										var menuIdJ = "";
										var parentMenuIdJ = "";

										for ( var i in newMapList) {
											menuIdJ = newMapList[i].menuId;//硫붾돱?꾩씠??
											for ( var j in newMapList) {
												parentMenuIdJ = newMapList[j].parentMenuId;
												if (menuIdJ == parentMenuIdJ) {//?섏뼱?곗툩 ?꾩씠?붿? 鍮꾧탳
													topMenu.push(menuIdJ);

												}
											}
										}//for臾?醫낅즺

										//?곸쐞硫붾돱 ?녿뒗 寃?-top硫붾돱,
										for ( var i in newMapList) {
											menuIdJ = newMapList[i].menuId;
											parentMenuIdJ = newMapList[i].parentMenuId;
											if (parentMenuIdJ == null) {
												topMenuNon.push(menuIdJ);
											}
										}

										//-----------------------以묐났媛??쒓굅--------------------	 
										var topMenuT = topMenu.reduce(function(
												a, b) {
											if (a.indexOf(b) < 0)
												a.push(b);
											return a;
										}, []);//遺紐?ID? ID媛 媛숈? 由ъ뒪?? TREE ?덈뒗 由ъ뒪??

										var topMenuN = topMenuNon.reduce(
												function(a, b) {
													if (a.indexOf(b) < 0)
														a.push(b);
													return a;
												}, []);//?곸쐞硫붾돱媛 ?녿뒗 由ъ뒪??top硫붾돱)
										//-----------------------以묐났媛??쒓굅 ??-------------------	 

										//---------------------------------硫붾돱 醫낅쪟(3??tree??nontree??-----------------------------------------
										//---------------------------------------3?④퀎 ??-------------------------------------------------
										var tree3TopMenuT = "<li class=\"active treeview\">"
												+ "<li class=\"treeview thirdone a14 a30\" id=\"a14\">"
												+ "	<a href=\"#\">"
												+ "	  <i class=\"fa fa-share\"></i> <span>3??NAME1</span>"
												+ "	    <span class=\"pull-right-container\">"
												+ "	      <i class=\"fa fa-angle-left pull-right\"></i>"
												+ "	    </span>" + "	 </a>"

												//----------------------<------?ш린??2?④퀎 遺숈씠湲?

												+ "</li>"//--------------------1??留덉?留?li

												//---------------------------2/3?④퀎--------------------------
										var tree3TopMenuM = " <ul class=\"treeview-menu thirdtwo\">"
												+ " <li class=\"treeview addtwo text\">"
												+ "	       <a href=\"#\"><i class=\"fa fa-circle-o\"></i>3??NAME2"//怨쇰ぉ紐?
												+ "	           <span class=\"pull-right-container\">"
												+ "	              <i class=\"fa fa-angle-left pull-right\"></i>"
												+ "	               </span>"
												+ "	             </a>"
												//--------------------<---?ш린??3?④퀎 遺숈씠湲?

												+ "	    </li>"//--------------------3?⑤텤??2?⑥쓽 留덉?留?li
												+ " </ul>"//------------2??留덉?留?ul

										var tree3TopMenuMAdd = " <li class=\"treeview addtwot text\">"
												+ "	       <a href=\"#\"><i class=\"fa fa-circle-o\"></i>3??NAME2"//怨쇰ぉ紐?
												+ "	           <span class=\"pull-right-container\">"
												+ "	              <i class=\"fa fa-angle-left pull-right\"></i>"
												+ "	               </span>"
												+ "	             </a>"

										//--------------------------------3/3?④퀎------------------                 
										var tree3TopMenuL = "<ul class=\"treeview-menu thirdthree \">"
												+ "  <li><a href=\"#\"><i class=\"fa fa-circle-o\"></i>3??NAME3</a></li>"
												+ "</ul>"//-----------------3??留덉?留?ul

										var tree3TopMenuLO = " <li><a href=\"#\"><i class=\"fa fa-circle-o\"></i>3??NAME3</a></li>"

										//----------------------------------------2????-------------------------------------------------------------------------		
										var tree2TopMenu = "<li class=\"treeview\">"
												+ "<li class=\"treeview second\">"
												+ "<a href=\"#\">"
												+ "  <i class=\"fa fa-table\"></i> <span>2??NAME1</span>"
												+ " <span class=\"pull-right-container\">"
												+ "   <i class=\"fa fa-angle-left pull-right\"></i>"
												+ "  </span>"
												+ "</a>"
												+ "<ul class=\"treeview-menu thirdtwo\">"
												+ " <li class=\"text\" ><a href=\"#\"><i class=\"fa fa-circle-o\"></i>2??NAME2</a></li>"

												//----------------<?ш린 2???쎌엯
												+ "</ul>" + "</li>"//--------------1??li留덉?留?

										var tree2TopMenuM = " <li class=\"text\"><a href=\"#\"><i class=\"fa fa-circle-o\"></i>2??NAME2</a></li>"

										//-------------------------------------------1????---------------------------------

										var tree1TopMenu = "<li class=\"first\"><a href=\"#\"><i class=\"fa fa-book\"></i> <span>1??NAME1</span></a></li>"

										//---------------------------------------------------硫붾돱 ? 異붽?--------------------------------------------------
										//-----------3?⑥쨷 1??-----------
										for ( var i in newMapList) {
											var checkMenId = newMapList[i].menuId;
											if (checkMenId == "14"
													|| checkMenId == "30") {
												$('.start').append(
														tree3TopMenuT);

											}
										}
										//-----------3?⑥쨷 2??-----------								 

										//遺紐④? 14踰??멸쾬 ???ｊ린 thirdone?대옒?ㅼ뿉 li.thirdone > a
										//newMapListSub[i].openClassname

										for ( var i in newMapListSub) {
											if ($('li.a14').length > 0
													|| $('li.a30').length > 0) {
												$('li.thirdone').append(
														tree3TopMenuM);
												break;
											}
										}

										var tempCount = 0;
										for ( var i in newMapListSub) {
											if ($('li.a14').length > 0
													|| $('li.a30').length > 0) {
												tempCount++;
											}
										}
										for (var i = 0; i < tempCount - 1; i++) {
											{
												$('.thirdtwo').append(
														tree3TopMenuMAdd);
											}
										}

										//-----------3?⑥쨷 3??-----------

										for ( var i in newMapList) {
											var parentMenuId = newMapList[i].parentMenuId;
											if (parentMenuId == "1000"
													|| parentMenuId == "100") {
												$('li.addtwo > a').after(
														tree3TopMenuL);
												break;
											}
										}

										for ( var i in newMapList) {
											var parentMenuId = newMapList[i].parentMenuId;
											if (parentMenuId == "1000"
													|| parentMenuId == "100") {
												$('li.addtwot > a').after(
														tree3TopMenuL);
												break;
											}
										}
										var tempCount1 = 0;
										for ( var i in newMapList) {
											var parentMenuId = newMapList[i].parentMenuId;
											if (parentMenuId == "1000"
													|| parentMenuId == "100") {
												tempCount1++;
											}
										}

										for (var i = 0; i < tempCount1 - 1; i++) {
											var ulCount = "'.addtwo > ul'";
											$(eval(ulCount)).append(
													tree3TopMenuLO);
										}

										for (var j = 0; j < tempCount - 1; j++) {
											for (var i = 0; i < tempCount1 - 1; i++) {
												{
													var ulCount = "'.addtwot:eq("
															+ j + ") > ul'";
													$(eval(ulCount)).append(
															tree3TopMenuLO);
												}
											}
										}

										//-----------------------------?몃━醫낅쪟 援щ퀎 1&2??援щ퀎?-------------------------------------------

										for ( var i in topMenuN) {
											if (authId == "1001"
													|| authId == "1000") {
												var checkMenId = newMapList[i].menuId;
												if (checkMenId != "14") {
													var check = false;
													for ( var j in topMenuT) {
														if (topMenuN[i] == topMenuT[j]) {
															check = true;
														}

													}
													if (check == true) {
														//tree硫붾돱
														$('.start').append(
																tree2TopMenu);

													}

													if (check == false) {
														//nontree硫붾돱
														$('.start').append(
																tree1TopMenu);
													}
												}
											}

											if (authId == "1002") {
												var checkMenId = newMapList[i].menuId;
												if (checkMenId != "30") {
													var check = false;
													for ( var j in topMenuT) {
														if (topMenuN[i] == topMenuT[j]) {
															check = true;
														}

													}
													if (check == true) {
														//tree硫붾돱
														$('.start').append(
																tree2TopMenu);

													}

													if (check == false) {
														//nontree硫붾돱
														$('.start').append(
																tree1TopMenu);
													}
												}
											}
										}
										//--------------------------?대옒?ㅼ텛媛 14&30 ?꾨땺??top硫붾돱---------------------------
										//諛곗뿴??id瑜??댁슜?섏뿬 ?대옒?ㅻ? ?ｋ뒗??TOP
										//topMenuT ?꾩껜 硫붾돱?먯꽌 tree媛 ?덈뒗 由ъ뒪??
										var tempJ = 0;
										for (i in topMenuT) {
											if (authId == "1001"
													|| authId == "1000") {
												var tempM = topMenuT[i];
												if (tempM != '14') {
													var classN = "a" + tempM;
													var secondC = "'.second:eq("
															+ tempJ + ")'";//珥??⑥씤 硫붾돱??top硫붾돱???대옒??異붽?
													$(eval(secondC)).attr('id',
															classN);
													$(eval(secondC)).addClass(
															classN);
													tempJ++;
												}
											}
											if (authId == "1002") {
												var tempM = topMenuT[i];
												if (tempM != '30') {
													var classN = "a" + tempM;
													var secondC = "'.second:eq("
															+ tempJ + ")'";
													$(eval(secondC)).attr('id',
															classN);
													$(eval(secondC)).addClass(
															classN);
													tempJ++;
												}
											}
										}
										var remainTopMenu = $(topMenuN).not(
												topMenuT).get();//?몃━?녿뒗 TOP硫붾돱 由ъ뒪??
										if (authId == "1001"
												|| authId == "1000") {
											remainTopMenu.splice(remainTopMenu
													.indexOf("14"), 1); // "14"瑜?李얠븘????젣?쒕떎.
										}
										if (authId == "1002") {
											remainTopMenu.splice(remainTopMenu
													.indexOf("30"), 1); // "30"瑜?李얠븘????젣?쒕떎. */
										}

										var tempT = 0;
										for (i in remainTopMenu) {
											var tempM = remainTopMenu[i];
											var classN = "a" + tempM;
											var secondC = "'li.first:eq("
													+ tempT + ")'";
											$(eval(secondC)).attr('id', classN);
											$(eval(secondC)).addClass(classN);
											tempT++;

										}
										//------------ok-------------------
										//---------------------------top??댄? 異붽?-------------------------------------

										for (i in newMapList) {
											var classId = "a"
													+ newMapList[i].menuId;
											var name = newMapList[i].menuName;
											var path = "'li." + classId
													+ " > a > span:eq(0)'";
											if ($('li').hasClass(classId)) {
												$(eval(path)).text(name);
											}

										}
										//---------------ok

										//----------------------2?????ｊ린------------------
										//?대옒???ㅼ엫 寃????留욎쑝硫??쇱텛媛
										for (i in newMapList) {
											if (authId == "1001"
													|| authId == "1000") {
												var classId = "a"
														+ newMapList[i].parentMenuId;
												var path = "'li." + classId
														+ " > ul'";
												if (classId != "a14"
														&& $('li').hasClass(
																classId)) {
													$(eval(path)).append(
															tree2TopMenuM);
												}
											}
											if (authId == "1002") {
												var classId = "a"
														+ newMapList[i].parentMenuId;
												var path = "'li." + classId
														+ " > ul'";
												if (classId != "a30"
														&& $('li').hasClass(
																classId)) {
													$(eval(path)).append(
															tree2TopMenuM);
												}
											}

										}

										//---------------------------sub??댄? 異붽?3?⑥븘?먮븣-------------------------------------

										var tempC = 0;
										var tempD = 1;
										var tempE = 2;

										for (i in newMapList) {
											var classId = "a"
													+ newMapList[i].parentMenuId;
											if (classId != 'a14'
													|| classId != 'a30') {
												var path = "'li." + classId
														+ " > ul > li.text:eq("
														+ tempC + ") > a'";
												var path0 = "'li." + classId
														+ " > ul > li.text:eq("
														+ tempC + ")'";
												var path1 = "'li." + classId
														+ " > ul > li.text:eq("
														+ tempD + ")'";
												var path2 = "'li." + classId
														+ " > ul > li.text:eq("
														+ tempE + ")'";
												var name = newMapList[i].menuName;
												if ($('li').hasClass(classId)) {
													$(eval(path)).text(name);
													if ($(eval(path0)).length > 0) {
														tempC++;
														tempD++;
														tempE++;
													}
													if ($(eval(path2)).length == 0) {
														tempE = 2;
														tempD = 1;
														tempC = 0;
													}
												}
											}
										}
										//-------------------------ok

										//3?⑥씪?? 2???쒕ぉ 異붽??

										var tempZ = 0;
										var path = null;
										var paPath = null;
										for (i in newMapListSub) {
											if (authId == "1001"
													|| authId == "1000") {
												path = "'li.a14 > ul > li.text:eq("
														+ tempZ + ") > a'";
												paPath = "'li.a14 > ul > li.text:eq("
														+ tempZ + ")'";
											}
											if (authId == "1002") {
												path = "'li.a30 > ul > li.text:eq("
														+ tempZ + ") > a'";
												paPath = "'li.a30 > ul > li.text:eq("
														+ tempZ + ")'";
											}
											var name = newMapListSub[i].openClassname;
											var subId = newMapListSub[i].openClassId;
											$(eval(path)).text(name);
											$(eval(paPath)).attr('id', subId); //媛쒖꽕怨쇰ぉid瑜?怨쇰ぉli?쒓렇?쁦d濡?異붽?
											if (($(eval(path)).length) + 1 > 0) {
												tempZ++;
											} else {
												tempZ = 0;
											}
										}
										//------------------------ok

										//----------留덉?留??섎굹 ??젣------
										for (i in newMapList) {
											if (authId == "1001"
													|| authId == "1000") {
												var classId = "a"
														+ newMapList[i].parentMenuId;
												var path = "'li." + classId
														+ " > ul > li:last'";
												if (classId != "a14"
														&& $('li').hasClass(
																classId)) {
													$(eval(path)).empty();
													;
												}
											}
											if (authId == "1002") {
												var classId = "a"
														+ newMapList[i].parentMenuId;
												var path = "'li." + classId
														+ " > ul > li:last'";
												if (classId != "a30"
														&& $('li').hasClass(
																classId)) {
													$(eval(path)).empty();
													;
												}
											}
										}
										//--------------------ok

										//-------------------------------3??ul.thirdthree > li??媛곸옄??class紐??ｊ린-------------------------------------
										//怨쇰ぉ PARENTS ?댁슜?댁꽌 class紐??ｊ린, "subject" ?대옒??異붽?
										var tempD = 0;
										for (i in newMapList) {
											if (authId == "1001"
													|| authId == "1000") {
												var path = "'li.a14 > ul > li.text:eq("
														+ tempD + ")'";
											}
											if (authId == "1002") {
												var path = "'li.a30 > ul > li.text:eq("
														+ tempD + ")'";
											}
											var className = "subject";
											$(eval(path)).addClass(className);
											//$(eval(path)).attr('id',className);
											if (($(eval(path)).length) + 1 > 0) {
												tempD++;
											} else {
												tempD = 0;
											}
										}
										//----------------------ok

										//------------------媛곴컖 硫붾돱 ?ｊ린--------------------
										var tempD = 0;

										for (i in newMapList) {
											if (authId == "1001"
													|| authId == "1000") {
												var classId = "a"
														+ newMapList[i].parentMenuId;
												if (classId == 'a14') {
													var path = "'li."
															+ classId
															+ " > ul > li.text:eq("
															+ tempD
															+ ") > ul > li:eq("
															+ i + ")'";
													var name = newMapList[i].menuName;
													if ($('li').hasClass(
															"subject")) {
														$(eval(path)).append(
																name);
														if (($(eval(path)).length) + 1 > 0) {
															tempD++;
														} else {
															tempD = 0;
														}
													}
												}
											}
											if (authId == "1002") {
												var classId = "a"
														+ newMapList[i].parentMenuId;
												if (classId == 'a30') {
													var path = "'li."
															+ classId
															+ " > ul > li.text:eq("
															+ tempD
															+ ") > ul > li:eq("
															+ i + ")'";
													var name = newMapList[i].menuName;
													if ($('li').hasClass(
															"subject")) {
														$(eval(path)).append(
																name);
														if (($(eval(path)).length) + 1 > 0) {
															tempD++;
														} else {
															tempD = 0;
														}
													}

												}
											}

										}
										//------------------ok

										//-------------------------------3???대옒???ｊ린-------------------------------------
										var tempF = 0;

										for (i in newMapList) {
											for (j in newMapList) {
												if (authId == "1001"
														|| authId == "1000") {
													var classId = "a"
															+ newMapList[j].parentMenuId;
													var classIdM = "a"
															+ newMapList[j].menuId;
													if (classId == 'a100'
															|| classId == 'a1000') {
														var path = "'li.a14 > ul > li.text:eq("
																+ i
																+ ") > ul > li:eq("
																+ tempF + ")'";
														var pathCount = "'li.a14 > ul > li.text:eq("
																+ i
																+ ") > ul > li'";
														if ($('li').hasClass(
																"a14")) {
															$(eval(path))
																	.addClass(
																			classIdM);
															$(eval(path)).attr(
																	'id',
																	classIdM);
															if (($(eval(pathCount)).length) + 2 > 0) {
																tempF++;
															}
															if ($(eval(pathCount)).length - 1 == (tempF - 1))//?쒓렇媛쒖닔濡?諛섎났?잛닔 ?뺥븿.
															{
																tempF = 0;
															}
														}
													}
												}
												if (authId == "1002") {
													var classId = "a"
															+ newMapList[j].parentMenuId;
													var classIdM = "a"
															+ newMapList[j].menuId;
													if (classId == 'a100'
															|| classId == 'a1000') {
														var path = "'li.a30 > ul > li.text:eq("
																+ i
																+ ") > ul > li:eq("
																+ tempF + ")'";
														var pathCount = "'li.a30 > ul > li.text:eq("
																+ i
																+ ") > ul > li'";
														if ($('li').hasClass(
																"a30")) {
															$(eval(path))
																	.addClass(
																			classIdM);
															$(eval(path)).attr(
																	'id',
																	classIdM);
															if (($(eval(pathCount)).length) + 2 > 0) {
																tempF++;
															}
															if ($(eval(pathCount)).length - 1 == (tempF - 1))//?쒓렇媛쒖닔濡?諛섎났?잛닔 ?뺥븿.
															{
																tempF = 0;
															}
														}
													}
												}

											}
										}
										//----------------------------ok

										//-----------------------------3??title遺숈씠湲?------------------------

										for (i in newMapList) {
											var classIdM = "a"
													+ newMapList[i].menuId;
											var title = newMapList[i].menuName;
											var selectCl = '\'li[class^='
													+ classIdM + '] > a \'';
											$(eval(selectCl)).text(title);
										}
										//--------------------ok	

										//-------------------------------3??留곹겕 嫄멸린--------------------------------------
										for (i in newMapList) {
											var classIdM = "a"
													+ newMapList[i].menuId;
											var title = newMapList[i].menuURL;
											var selectCl = '\'li[class^='
													+ classIdM + '] > a \'';
											$(eval(selectCl)).attr('href',
													title);
										}
										//---------------------------------ok
										//-------------------------------1??URL 異붽?-------------------------------------

										for (i in newMapList) {
											var classIdM = "a"
													+ newMapList[i].menuId;
											var URL = newMapList[i].menuURL;
											var path = "'li." + classIdM
													+ " > a'";
											$(eval(path)).attr('href', URL);

										}
										//----------ok

										//-------------------------------2???대옒??異붽?-------------------------------------
										var tempC = 0;
										var parentsClP = null;
										for (var i = 0; i < newMapList.length; i++) {
											if (i < newMapList.length - 1) {
												var parentsClP = "a"
														+ newMapList[i + 1].parentMenuId;
											}
											var parentsCl = "a"
													+ newMapList[i].parentMenuId;//遺紐⑥븘?대뵒濡?寃??
											var compared = newMapList[i].menuId;
											var classIdM = "a"
													+ newMapList[i].menuId;
											var selectClC = '\'li.' + parentsCl
													+ ' > ul > li\'';
											var selectCl = '\'li.' + parentsCl
													+ ' > ul > li:eq(' + tempC
													+ ')\'';
											$(eval(selectCl))
													.addClass(classIdM);
											$(eval(selectCl)).attr('id',
													classIdM);
											if (parentsCl == parentsClP) {
												tempC++;
											} else {
												tempC = 0;
											}
											parentsClP = parentsCl;

										}
										//-------------------2??url異붽?
										for (i in newMapList) {
											for (j in newMapList) {
												var classIdT = "a"
														+ newMapList[i].menuId;
												var classIdM = newMapList[i].menuURL;
												var selectCl = '\'li.'
														+ classIdT + ':eq(' + j
														+ ') > a\'';
												$(eval(selectCl)).attr('href',
														classIdM);
											}

										}

										//-----------------3??異붽? url  URL??怨쇰ぉ肄붾뱶 異붽?
										if (authId == "1001"
												|| authId == "1000") {
											var firstPath = '\'li.a14 > ul:eq(0) > li.subject\'';
											var secondPath = '\'li.a14 > ul:eq(0) > li.subject > ul:eq(0) > li\'';
											for (var i = 0; i < $(eval(firstPath)).length; i++) {
												var firstPathR = '\'li.a14 > ul > li.subject:eq('
														+ i + ')\'';
												var firstPathId = $(
														eval(firstPathR)).attr(
														'id');
												for (var j = 0; j < $(eval(secondPath)).length; j++) {
													var thirdPath = '\'li.a14 > ul > li:eq('
															+ i
															+ ') > ul > li:eq('
															+ j + ') > a\'';
													var thirdPathURL = $(
															eval(thirdPath))
															.attr('href');
													var finalPathURL = thirdPathURL
															+ "/" + firstPathId;
													var finalPathURLS = $(
															eval(thirdPath))
															.attr('href',
																	finalPathURL);
												}

											}

										}
										if (authId == "1002") {
											var firstPath = '\'li.a30 > ul:eq(0) > li.subject\'';
											var secondPath = '\'li.a30 > ul:eq(0) > li.subject > ul:eq(0) > li\'';
											for (var i = 0; i < $(eval(firstPath)).length; i++) {
												var firstPathR = '\'li.a30 > ul > li.subject:eq('
														+ i + ')\'';
												var firstPathId = $(
														eval(firstPathR)).attr(
														'id');
												for (var j = 0; j < $(eval(secondPath)).length; j++) {
													var thirdPath = '\'li.a30 > ul > li:eq('
															+ i
															+ ') > ul > li:eq('
															+ j + ') > a\'';
													var thirdPathURL = $(
															eval(thirdPath))
															.attr('href');
													var finalPathURL = thirdPathURL
															+ "/" + firstPathId;
													var finalPathURLS = $(
															eval(thirdPath))
															.attr('href',
																	finalPathURL);
												}
											}
										}
										//-------------------3?쮞rl 異붽? ??
										$('ul.start > li.first:eq(-1)').remove();

										$(".sidebar-menu").click( function(e) {
											if ($(e.target).parents("ul").eq(0).hasClass("start")) {
												console.log("start");
												var mid = $(e.target).parents("li").eq(0).attr("id")
												
												setcookie("m1",mid);
											} else if ($(e.target).parents("ul").eq(0).hasClass("thirdtwo")) {
												console.log("thirdtwo");
												var mid = $(e.target).parents("li").eq(0).attr("id")

												setcookie("m2",mid);
											} else if ($(e.target).parents("ul").eq(0).hasClass("thirdthree")) {
												console.log("thirdthree");
												var mid = $(e.target).parents("li").eq(0).attr("id")

												setcookie("m3",mid);
											}
										}); // click event end

										getmenuCookie();
									} // success end
								}); // ajax end
					}

	function getmenuCookie() {
		var m1_id = getcookie('m1'); // 湲곗〈 ??λ맂 荑좏궎媛믪쓣 媛?몄삩??
		var m2_id = getcookie('m2'); // 湲곗〈 ??λ맂 荑좏궎媛믪쓣 媛?몄삩??
		var m3_id = getcookie('m3'); // 湲곗〈 ??λ맂 荑좏궎媛믪쓣 媛?몄삩??

		if (m1_id) { // 湲곗〈 ??λ맂 荑좏궎媛믪씠 ?덉쑝硫?洹?媛믪쑝濡?ch ?⑥닔 ?몄텧
			ch(m1_id);
		}

		if (m2_id) {
			ch(m2_id);
		}

		if (m3_id) {
			ch2(m3_id);
		}
	}

	function ch(num) { // ?대┃??li ????린??援ы쁽?⑥닔
		$(".sidebar-menu #" + num + "").addClass("menu-open");
// 		$(".sidebar-menu #" + num + "").addClass("active");
		$(".sidebar-menu #" + num + "").children("ul").attr("style", "display:block;")
	}

	function ch2(num) {
// 		$(".sidebar-menu #" + num + "").addClass("active");
	}

	function setcookie(aa, bb) { // 荑좏궎?앹꽦?⑥닔
		document.cookie = aa + "=" + bb + "; path=/;"
		return false;
	}

	function getcookie(Key) { // 荑좏궎?몄텧?⑥닔
		var cookies = document.cookie.split("; ");
		for (var i = 0; i < cookies.length; i++) {
			var coValues = cookies[i].split("=");

			if (coValues[0] == Key) {
				return unescape(coValues[1]);
			}
		}
		return false;
	}
	
	
</script>

  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar ">
      <!-- Sidebar user panel -->
     
      <!-- search form -->
      <form action="#" method="get" class="">
       <!--  <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
          <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div> -->
      </form>
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu start" data-widget="tree">
        <li class="header"></li>
      </ul>
      
    </section>
    <!-- /.sidebar -->

	<!-- locale -->
<!-- 	<div style="position: fixed; bottom: 0;"> -->
<!-- 		<select name='locale' class="form-control"> -->
<!-- 			<option value="ko" selected="selected">?쒓뎅??/option> -->
<!-- 			<option value="en">EN</option> -->
<!-- 			<option value="cn">CN</option> -->
<!-- 			<option value="jp">JP</option> -->
<!-- 			<option value="ep">EP</option> -->
<!-- 		</select> -->
<!-- 	</div> -->
	<!-- /.select -->
  </aside>