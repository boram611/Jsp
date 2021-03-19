<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답글 쓰기</title>
<script src="./js/jquery-3.3.1.min.js"></script>
<style>
input{border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;}
input:focus {outline:none;}
textarea{border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;}
/* textarea:focus {outline:none;} */ 
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
<script type="text/javascript" language="javascript">
function openWin(){  
		window.open("qnafileviewcheck.jsp", "첨부파일 확인", "scrollbars=no, resizable=yes" );  
	}
</script>
</head>
 <%@include file="manaMain.jsp" %>
<body>
<div id="notice">
<h2>&nbsp;1:1문의 답글 달기</h2>
<div id="home3"><a href="oneToOneList.five">목록</a></div>
<table>
	<form action="insertComment.five" method="post">
	<div id="Main">
		<tr>
			<td>번호</td>
			<td><input type = "text" name = "qnaSeqno" size = "10" value="${content_view.qSeqno}" readonly="readonly"></td></tr>
		<tr>
			<td>아이디</td>
			<td><input type = "text" name = "qName" size = "30" value="${content_view.user_userId}" readonly="readonly"></td></tr>
		<tr>
			<td>문의 유형</td>
			<td><input type = "text" name = "qName" size = "30" value="${content_view.qChapter}" readonly="readonly"></td></tr>
		<tr>
			<td>제목</td>
			<td><input type = "text" name = "qnaTitle" id = "qnaTitle" size = "50" value="${content_view.qTitle}" readonly="readonly"></td></tr>
		<tr>
			<td>내용</td>
			<td><textarea rows="10" cols="50" id = "qnaContent" name="qnaContent" readonly="readonly">${content_view.qContent}</textarea></td></tr>
		<tr>
			<td>첨부 파일</td>
			<td><a href = "" onclick="openWin();">첨부 파일 보기</a></td></tr>
	</div>
		<tr>
			<td>문의 결과</td>
			<td><textarea rows="10" cols="50" id = "qnaResult" name="qnaComment" placeholder="답글을 쓰려면 이곳을 클릭 후 작성해주세요.">${content_view.qComment}</textarea></td></tr>
			<tr>
			<td colspan="2">
			
			<button type="submit" value="입력">입력</button>&nbsp;&nbsp;</td>
			</tr>
	</form>
	</table><br>
	
	</div>
</body>
</html>