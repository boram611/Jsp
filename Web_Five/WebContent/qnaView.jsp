<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 내용</title>
<script type="text/javascript" language="javascript">
function openWin(){  
		window.open("qnafileviewcheck.jsp", "첨부파일 확인", "scrollbars=no, resizable=yes" );  
	}
</script>
</head>
<style>
input{border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;}
input:focus {outline:none;}
textarea{border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;}
textarea:focus {outline:none;}
#notice{
	width:700px;
	margin:0 auto;
	margin-top:50px;
}
tr{
height: 30px;
}
a{
text-decoration: none;
}
a:link {
  color: black;
  background-color: transparent;
  text-decoration: none;
}

a:visited {
  color: black;
  background-color: transparent;
  text-decoration: none;
}

a:hover {
  color: #6fa168;
  background-color: transparent;
  text-decoration: none;
}

a:active {
  color: black;
  background-color: transparent;
  text-decoration: none;
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
<script src="./js/jquery-3.3.1.min.js"></script>
<%@include file="Header.jsp" %>
<body>
<div id="notice">
<h2>&nbsp;나의 1 : 1 문의내용 띄우기</h2><br>
<div id="home3"><a href="qnaListView.five">목 록</a></div>

<table>
			<tr>
				<th>번호</th>
				<td><input type = "text" name = "Id" size = "10" value="${content_view.qSeqno}" readonly="readonly"></td></tr>
			<tr>
				<th>아이디</th>
				<td><input type = "text" name = "qName" size = "30" value="${content_view.user_userId}" readonly="readonly"></td></tr>
			<tr>
				<th>문의 유형</th>
				<td><input type = "text" name = "qName" size = "30" value="${content_view.qChapter}" readonly="readonly"></td></tr>
			<tr>
				<th>제목</th>
				<td><input type = "text" name = "qnaTitle" id = "qnaTitle" size = "50" value="${content_view.qTitle}" readonly="readonly"></td></tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="50" id = "qnaContent" name="qnaContent" readonly="readonly">${content_view.qContent}</textarea></td></tr>
			<tr>
				<th>첨부 파일</th>
				<td><a href = "" onclick="openWin();">첨부 파일 보기</a></td>
			</tr>
			<tr>
				<th>문의 답글</th>
				<td><textarea rows="10" cols="50" id = "qnaResult" name="qnaContent" readonly="readonly">${content_view.qComment}</textarea>
				</td>
			</tr>
	</table><br>

	</div>
</body>
<%@include file="Footer.jsp" %>
</html>