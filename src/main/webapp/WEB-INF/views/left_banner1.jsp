<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>


</body>
</html>
<script language="javascript">

var obTimeOut; // clearTimeout() 함수를 이용하여 Timeout 을 취소하기위해 사용됨


var ObjectArray = new Array ();

ObjectArray[1] = "https://postfiles.pstatic.net/MjAyMDA1MTBfODcg/MDAxNTg5MDc4NTE2MjYx.mWPNFbwG_igTA5VPkt0yBN8-aEHmwDgIcyJH7ndFV1kg.mtK2ETIRKS5rUpaevlfuBSXNTt-wfB9gfVzA5oxzA9sg.PNG.heeee154/left1.png?type=w773";
ObjectArray[2] = "https://postfiles.pstatic.net/MjAyMDA1MTBfMjg2/MDAxNTg5MDc4NTE2MjYw.YH9iPUMjWZpIihna3pb7lw3i-quz7EpCf_6-weiXSA0g.xjy2ru7s2SJcVdUJebWFPqJSHvUAI7F84YqKPPmdZp0g.PNG.heeee154/left2.png?type=w773";
ObjectArray[3] = "https://postfiles.pstatic.net/MjAyMDA1MTBfMTI5/MDAxNTg5MDc4NTE2MjY1.BdFbc5PhkhlhFfPrEvsjeve7K4KZyY5XBJxUkj_WbF0g.kbTAo8hUvPsuPhEmRMH_RokwwkH3ou5pa7EzDn58FTgg.PNG.heeee154/left3.png?type=w773";


var nObjectCnt = 0;	



function ShowDefaultRotate() // 스스로 자신을 호출하는 재귀함수 (Recursive Function)

{
	nObjectCnt++;
	if( nObjectCnt < ObjectArray.length )  // 배열의 갯수 이내일때만 실행
	{
		document.getElementById("pp").src = ObjectArray[nObjectCnt];		 
		obTimeOut = setTimeout("ShowDefaultRotate()",1100);  // 1초후에 자기자신을 호출 
	}
	else
	{
		nObjectCnt = 0;
		ShowDefaultRotate();
	}		
}

function startAnimation()
{
      obTimeOut = window.setTimeout(ShowDefaultRotate,100); // 윈도우 로드 후 0.1초 후에 반복함수를 호출합니다.
}

window.onload = startAnimation;



</script>
