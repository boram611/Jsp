<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 상품 입력</title>
<script src="./js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" language="javascript">
	function openPro1(){  
		window.open("proFileup1.jsp", "첨부파일", "menubar=no, scrollbars=no, resizable=yes" );  
	} 
</script>
</head>
<style>
#notice{
	width:650px;
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
a:hover {
	color:red;
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
	margin-bottom: 10px;
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
<%@include file="manaMain.jsp" %>
<body>
<%request.setCharacterEncoding("utf-8"); %>
<% session.setAttribute("prdFilename", null);%>
<% session.setAttribute("prdDFilename", null);%>
<div id="notice">
<h2>&nbsp;상품 입력</h2>

	<div id="home3"><a href="manageProduct.five">목록</a></div>
	<table>
		<form action="insertProduct.five" method="post">
			
			<tr>
				<td>상품 유형</td>
				<td><select name = "ctgType">
					<option value="생활/주방" selected="selected">생활/주방</option>
					<option value="화장품">화장품</option>
					<option value="유아/완구">유아/완구</option>
					<option value="태블릿/휴대폰">태블릿/휴대폰</option>
				</select></td></tr>
			<tr>
				<td>상품 이름</td>
				<td><input type = "text" name = "prdName" size = "50"></td>
			</tr>
			<tr>
				<td>상품 가격</td>
				<td><input type = "text" name = "prdPrice" size = "50"></td>
			</tr>
			<tr>
				<td>재고 수량</td>
				<td><input type = "text" name = "prdStock" size = "50"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="10" cols="50" name="prdContent"></textarea></td>
			</tr>
			<tr>
				<td>상품&설명 사진 등록 </td><td><a href = "" onclick="openPro1();">상품 사진 업로드</a>
				</td>
			</tr>
			<tr>
				<td colspan="2"><button type="submit">입력</button>
			</tr>
		</form>
	</table>
	</div>
</body>
</html>