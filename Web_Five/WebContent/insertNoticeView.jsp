<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새로운 공지사항 작성</title>
<script src="./js/jquery-3.3.1.min.js"></script>
<style>
#notice{
	width:550px;
	margin:0 auto;
	margin-top:50px;
}
tr{
height: 10px;
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
a {
	color:black;
	text-decoration:none;
}
#button {
margin-bottom:15px;
margin-right:10px;
	width:150px;
	height:40px;
	line-height:40px;
	text-align:center;
	border-radius:3px;
	font-weight:bold; 
	background-color:#fff;
	border:2px solid #6fa168;
	float: right;
}

#button:hover {
	color:pink;
	background-color:#fff;
}

button {
	float:left;
	width:150px;
	height:40px;
	line-height:40px;
	text-align:center;
	border:1px solid #6fa168;
	border-radius:3px;
	font-weight:bold;
	background-color:#6fa168;
	margin-right: 20px;
}

button:hover {
	color:#000;
	background-color:#fff;
}
#home3{
width:150px;
line-height:36px;
height: 36px;
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
<h2>&nbsp;공지사항 입력</h2>

	<div id="home3"><a href="manageNotice.five">목록</a></div>
	<table>
		<form id="newListForm" action="insertNotice.five" method="post">
				<tr>
				<td>관리자 아이디</td>
				<td><input type="text" name="admin_adminId" size="20" autofocus="autofocus"></td>
				</tr>
				<tr>
				<td>제목</td>
				<td><input type="text" name="nTitle" size="58"></td> </tr>
				<tr>
				<td>내용</td>
				<td><textarea rows="20" cols="50" name="nContent"></textarea></td> <br>
			</tr>
			<tr>
				<td colspan="2">
				<button type="submit">입력</button>&nbsp;&nbsp;
				<button type="reset">취소</button>&nbsp;&nbsp;
			</tr>
		</form>
		
	</table><br>
	
	</div>
</body>
</html>