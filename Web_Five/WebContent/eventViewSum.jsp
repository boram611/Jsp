<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 이벤트 + 당첨자 보기</title>
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
<body>
<div id="notice">
<h2>&nbsp;관리자용 이벤트 보기</h2><br>
	<table>
		<tr>
			<td>번호</td>
			<td><input type="text" name="eSeqno" size="10" value="${eventView.eSeqno}" readonly="readonly"></td>
		</tr>
		<tr>
			<td>이벤트 시작 날짜</td>
			<td><input type="text" name="startDate" size="30" value="${eventView.startDate}"></td>
		</tr>
		<tr>
			<td>이벤트 종료 날짜</td>
			<td><input type="text" name="endDate" size="50" value="${eventView.endDate}"></td> 
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" name="eTitle" value="${eventView.eTitle}"></td> 
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea rows="10" cols="50" name="eContent">${eventView.eContent}</textarea></td> 
		</tr>
		<tr>
			<td colspan="2">${eventView.eFilename}</td>
		</tr>
	</table><br>
	<h2>&nbsp;관리자용 당첨자 보기</h2><br>
		<table>
		<tr>
			<td>번호</td>
			<td><input type="text" name="eSeqno" size="10" value="${eventView.eSeqno}" readonly="readonly"></td>
		</tr>
		<tr>
			<td>당첨결과</td>
			<td><input type="text" name="win" size="30" value="${eventView.win}"></td>
		</tr>
		<tr>
		<td colspan="2">
		<a href="manageEvent.five"><button>목록보기</button></a>&nbsp;&nbsp;
		</tr>
	</table>
	</div>
</body>
</html>