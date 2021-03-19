<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 공지 내용 보기 & 수정하기 </title>
<script src="./js/jquery-3.3.1.min.js"></script>
<style>
#notice{
	width:550px;
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
<%@include file="manaMain.jsp" %>
<body>
<div id="notice">
<h2>&nbsp;관리자용 공지사항 수정</h2>

	<div id="home3"><a href="manageNotice.five">목록</a></div>
	<table>
		<form action="updateNotice.five" method="post">
			<tr>
				<td>번호</td>
				<td><input type="text" name="nSeqno" size="10" value="${noticeView.nSeqno}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="admin_adminId" size="30" value="${noticeView.admin_adminId}"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="nTitle" size="50" value="${noticeView.nTitle}"></td> 
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="10" cols="50" name="nContent">${noticeView.nContent}</textarea></td> 
			</tr>
			<tr>
			<td colspan="2">
			
			<button type="submit" value="수정">수정</button>&nbsp;&nbsp;</td>
			</tr>
		</form>
	</table><br>
	</div>
</body>
</html>