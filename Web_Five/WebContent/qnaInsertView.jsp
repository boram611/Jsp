<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 입력</title>
<script type="text/javascript" language="javascript">
	window.onload = function(){
		document.getElementById('writeview').onsubmit = function() {
			var qName = document.getElementById('qName');
			if(qName.value == ""){
				alert("이름을 입력하세요.");
				qName.focus();
				return false;
			}
			var qTitle = document.getElementById('qTitle');
			if(qTitle.value == ""){
				alert("제목을 입력하세요.");
				qTitle.focus();
				return false;
			}
			var qContent = document.getElementById('qContent');
			if(qContent.value == ""){
				alert("내용을 입력하세요.");
				qName.focus();
				return false;
			}
			var bResult = document.getElementById('qResult');
			if(<%=request.getAttribute("result")%> == false){
				alert("입력에 실패하셨습니다.");
				qName.focus();
				return false;
			}else{
				alert("입력에 성공하셨습니다.");
				qName.focus();
				return true;
			}
		}
	};
	function openWin(){  
		window.open("qnafileup.jsp", "첨부파일", "menubar=no, scrollbars=no, resizable=yes" );  
	}  
</script>
<style>
#notice{
	width:550px;
	margin:0 auto;
	margin-top:50px;
	margin-bottom: 50px;
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

#home2{
width:150px;
line-height:36px;
height: 36px;
 margin-bottom:10px;
 background-color:#fff;
	border:2px solid purple;
	text-align:center;
	border-radius:2px;
	margin-left: 150px;
}

#home2 a {
	text-decoration:none;
	display:block;
	color:black;
	font-family:midnight;
	font-size:18px;
}

#home2 a:hover {
	color:red;
}

</style>
</head>
<%@include file="Header.jsp" %>
<body>

<%request.setCharacterEncoding("utf-8"); %>
<% session.setAttribute("filename", null);%>
<div id="notice">
<div id="home3"><a href="qnaListView.five">뒤로 가기</a></div><br>
<h2>&nbsp;Q&A 입력</h2><br>
	<table>
	
		<form id = "writeview" action="qnaInsert.five" method="post">
			<tr>
				<td colspan="2">
				<div id="home2"><a href = "" onclick="openWin();">첨부파일 업로드</a></div>
				</td>
			</tr>
			<tr>
				<td>문의 유형</td>
				<td><select name = "qChapter">
					<option value="회원정보 관련" selected="selected">회원정보 관련</option>
					<option value="배송 관련">배송 관련</option>
					<option value="결제 관련">결제 관련</option>
					<option value="상품 관련">상품 관련</option>
				</select></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type = "text" name = "qTitle" id = "qTitle" size = "50"></td>
				</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="10" cols="50" name="qContent" id = "qContent"></textarea></td>
				</tr>
			<tr>
				<td colspan="2"><button type="submit" id = "bResult">입력</button>
				</td>
			</tr>
		</form>
	</table>
	</div>
	<%@include file="Footer.jsp" %>
</body>
</html>