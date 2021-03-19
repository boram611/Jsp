<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새로운 이벤트 작성</title>
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
#home3{
width:150px;
line-height:36px;
height: 36px;
margin-bottom:10px;
 background-color:#fff;
	border:2px solid pink;
	text-align:center;
	border-radius:2px;
}

#home3 a {
	text-decoration:none;
	display:block;
	color:black;
	font-family:midnight;
	font-size:18px;
}

#home3 a:hover {
	color:grey;
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
	function openWin(){  
		window.open("eventFileup.jsp", "첨부파일", "width=1050, height=1050, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
	}  
</script>
<%@include file="manaMain.jsp" %>
<body>
<div id="notice">
<h2>&nbsp;이벤트 입력</h2>
<div id="home3"><a href="manageEvent.five">목록</a></div>
	<table>
		<form action="insertEvent.five" method="post">
			<tr>
				<td>이벤트 시작 날짜</td>
				<td><input type = "text" name = "startDate" id = "startDate" size = "50"></td>
			</tr>
			<tr>
				<td>이벤트 종료 날짜</td>
				<td><input type = "text" name = "endDate" id = "endDate" size = "50"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type = "text" name = "eTitle" id = "eTitle" size = "50"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="10" cols="50" name="eContent" id = "eContent"></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><a href = "" onclick="openWin();">첨부파일 업로드</a>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
				<button type="submit" value="입력">입력</button>&nbsp;&nbsp;
			</tr>
			
		</form>
	</table>
	</div>
</body>
</html>