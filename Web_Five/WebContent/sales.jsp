<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출 현황</title>
<script src="./js/jquery-3.3.1.min.js"></script>
<style>
#notice{
	width:1000px;
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
#table1{
margin: auto 0;
width: 100%;
text-align: center;
}
button a {
	color:#fff;
	text-decoration:none;
}

button {
	width:250px;
	height:50px;
	line-height:50px;
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
<%@include file="manaMain.jsp" %>
<body>

<%request.setCharacterEncoding("utf-8"); %>
<div id="notice">
<h2>&nbsp; 매출 현황</h2><br>

	<table>
		<tr>
			<th width="360px;">날짜</th>
			<th width="60px;">매출 현황</th> <!-- 제목 클릭시 수정은 불가능한 이벤트 내용과 당첨자 정보 띄우기  -->
		</tr>
		<c:forEach items="${salesList}" var="dto">
			<tr>
			<td>${dto.ordDate}</td><!-- 번호 -->
				<td>${dto.ordPay}</td><!-- 이벤트 종료 날짜 -->
			</tr>
		</c:forEach>
	</table>
	<br>
</body>
</html>