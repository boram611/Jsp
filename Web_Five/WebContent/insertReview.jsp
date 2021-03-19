<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 쓰기</title>
<script src="./js/jquery-3.3.1.min.js"></script>
<style>
#notice{
	width:600px;
	margin:0 auto;
	margin-top:50px;
}
tr{
height: 30px;
}
table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
 th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
 }
 button a {
	color:#fff;
	text-decoration:none;
}
button {
	width:150px;
	height:40px;
	line-height:40px;
	text-align:center;
	border:1px solid #6fa168;
	border-radius:3px;
	font-weight:bold;
	background-color:#6fa168;
}

button:hover {
	color:#000;
	background-color:#fff;
}
</style>
</head>
<script type="text/javascript" language="javascript">
	window.onload = function(){
		document.getElementById('eventView').onsubmit = function() {
			var eTitle = document.getElementById('eTitle');
			if(eTitle.value == ""){
				alert("제목을 입력하세요.");
				eTitle.focus();
				return false;
			}
			var eContent = document.getElementById('eContent');
			if(qContent.value == ""){
				alert("내용을 입력하세요.");
				qContent.focus();
				return false;
			}
			var bResult = document.getElementById('eResult');
			if(<%=request.getAttribute("result")%> == false){
				alert("입력에 실패하셨습니다.");
				startDate.focus();
				return false;
			}else{
				alert("입력에 성공하셨습니다.");
				startDate.focus();
				return true;
			}
		}
	};
</script>
<body>
<div id="notice">
<h2>&nbsp;리뷰 쓰기</h2><br>
	<table>
		<form action="insertEvent.five" method="post">
			<tr>
				<td>제목</td>
				<td><input type = "text" name = "eTitle" id = "eTitle" size = "50"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="10" cols="50" name="eContent" id = "eContent"></textarea></td>
			</tr>
			
			<tr>
				<td colspan="2">
				<a href="manageEvent.five">목록보기</a>&nbsp;&nbsp;
				<button type="submit" value="입력">입력</button>&nbsp;&nbsp;
			</tr>
			
		</form>
	</table>
	</div>
</body>
</html>