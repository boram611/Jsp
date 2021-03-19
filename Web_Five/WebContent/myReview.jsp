<%@page import="sun.print.resources.serviceui"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새로운 리뷰 작성</title>
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
<%@include file="Header.jsp" %>
<body>
<%
	String ordNo = request.getParameter("ordNo");
	String prdNo = (String)request.getAttribute("PRDNO");
	
	request.setAttribute("ordNo", ordNo);
	request.setAttribute("PRDNO", prdNo);
	
%>
<div id="notice">
<div id="home3"><a href="myOrderList.five">뒤로 가기</a></div>
<h2>&nbsp;리뷰 입력</h2><br>
		<form id="newListForm" action="reviewInsert.five" method="post">
	<table>
		
			<tr>
				<td>유저 아이디</td>
				<td><input type="text" name="userId" size="30" value="<%=session.getAttribute("Log_userId") %>" readonly="readonly"></td>
				</tr>
				
			<tr>
				<td>별점</td>
				<td><select name = "starType">
					<option value="★★★★★" selected="selected">★★★★★</option>
					<option value="★★★★">★★★★</option>
					<option value="★★★">★★★</option>
					<option value="★★">★★</option>
					<option value="★">★</option>
				</select></td>
			</tr>
			<tr>
				<td>상품 이름</td>
				<td><input type="text" name="nTitle" size="50" value="<%=request.getParameter("prdName") %>" readonly="readonly"></td>
			</tr>
			<tr>
				<td>간단한 리뷰</td>
				<td><textarea rows="10" cols="50" name="nContent" autofocus="autofocus"></textarea></td> <br>
			</tr>
			<tr>
				<td colspan="2">
				<button type="submit" >리뷰 작성</button>
			</tr>
	</table>
		</form>
	</div>
</body>
<%@include file="Footer.jsp" %>
</html>