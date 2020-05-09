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

ObjectArray[1] = "https://postfiles.pstatic.net/MjAyMDA1MDhfODkg/MDAxNTg4OTA5MDQ1Mzc0.tQqeCOGmQ7UWeUifZQTkdwBOvck1hWTQisT6MxR-npkg.hAlWgJJrrffxoXRlZPY_hC-ph_Hc3WA0IQw42GxIFDAg.PNG.heeee154/banner_left1.png?type=w773";
ObjectArray[2] = "https://postfiles.pstatic.net/MjAyMDA1MDhfMTI4/MDAxNTg4OTA4MzA4NDg2.AQPRu9Ui9-aBK3RNwjcqVGxnSpFbdI0AKtyRl0t53aYg.tqk9R7veJQg3wZHmXxs12nAyXUTRb0YNnxqVnXCaKxwg.PNG.heeee154/banner_left2.png?type=w773";
/* ObjectArray[3] = "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRdsTBpQRNoF3TNpoaxI47rcjjDKvWrAstYcmySSkcLSqytHyDd&usqp=CAU";
ObjectArray[4] = "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR9W7GfVhFV158Qy4oG77ZvnbKYB51Xr166rVrKl4zJbs313FMm&usqp=CAU";
ObjectArray[5] = "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRdsTBpQRNoF3TNpoaxI47rcjjDKvWrAstYcmySSkcLSqytHyDd&usqp=CAU";
ObjectArray[6] = "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR9W7GfVhFV158Qy4oG77ZvnbKYB51Xr166rVrKl4zJbs313FMm&usqp=CAU";

 */


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
