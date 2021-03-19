<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 이벤트 수정</title>
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

	function openWin(){  
		window.open("eventFileup.jsp", "첨부파일", "width=1050, height=1050, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
	}  
</script>
<%@include file="manaMain.jsp" %>
<body>
<div id="notice">
<h2>&nbsp;이벤트 수정</h2>

	<div id="home3"><a href="manageEvent.five">목록</a></div>

	<table>
		<form action="updateEvent.five" method="post">
				<tr>
				<th>번호</th>
				<td><input type="text" name="eSeqno" size="10" value="${eventView.eSeqno}" readonly="readonly"></td>
			</tr>
			<tr>
				<th>이벤트 시작 날짜</th>
				<td><input type="text" name="startDate" size="30" value="${eventView.startDate}"></td>
			</tr>
			<tr>
				<th>이벤트 종료 날짜</th>
				<td><input type="text" name="endDate" size="50" value="${eventView.endDate}"></td> 
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="eTitle" value="${eventView.eTitle}"></td> 
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="50" name="eContent">${eventView.eContent}</textarea></td> 
			</tr>
			<tr>
				<td colspan="2"><a href = "" onclick="openWin();">첨부파일 업로드</a>
				</td>
			</tr>
			<tr>
			<td colspan="2">
			
			<button type="submit" value="수정">수정</button>&nbsp;&nbsp;
			</tr>
			
		</form>
	</table>
	</div>
</body>
</html>