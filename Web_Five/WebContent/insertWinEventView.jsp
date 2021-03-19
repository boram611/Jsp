<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새로운 당첨자 작성</title>
<script src="./js/jquery-3.3.1.min.js"></script>
<style>
#notice{
	width:550px;
	margin:0 auto;
	margin-top:50px;
}
tr{
height: 5px;
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
width:170px;
line-height:50px;
height: 50px;
margin-left:190px;
 margin-bottom:10px;
 background-color:#fff;
	border:2px solid purple;
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
	color:red;
}
#home{
width:150px;
line-height:36px;
height: 36px;
 background-color:#fff;
	border:2px solid pink;
	text-align:center;
	border-radius:2px;
}

#home a {
	text-decoration:none;
	display:block;
	color:black;
	font-family:midnight;
	font-size:18px;
}

#home a:hover {
	color:grey;
}
</style>
</head>
<%@include file="manaMain.jsp" %>
<body>
<div id="notice">
<h2>&nbsp;이벤트 당첨자 입력</h2>
<div id="home"><a href="manageEvent.five">목록</a></div><hr>
<%
	session.setAttribute("eSeqno", request.getParameter("eSeqno"));
%>
	<form action="insertWinEvent.five" method="post">
		<table>
			<tr>
				<div id="home3">
				<a href="insertWinEvent.five?eSeqno="<%=request.getParameter("eSeqno")%>>당첨자 추첨하기</a>
				</div><!-- 버튼 클릭시 랜덤으로 10명의 유저만 불러와서 저장하기 -->
			</tr>
			<tr>
				<td>event_eSeqno</td> <!-- 이벤트 번호 불러오기 -->
				<td><input type="text" name="event_eSeqno" size="30" readonly="readonly"></td>
			</tr>
			<tr>
			<th colspan="2">당첨자 결과</th> <!--  참여한 유저 정보 불러오기 -->
		</tr>
	</table>
	</form>
		<table>
		<tr>
			<td><input type="hidden" name="eSeqno" size="10" value="<%=request.getParameter("eSeqno") %>" readonly="readonly"></td>
		</tr>
		
		<tr colspan="2">
				<c:forEach items="${eventView}" var="dto">
				<h4 style="margin-top: 10px; margin-bottom:10px; margin-left: 190px;">
				당첨 아이디 :&nbsp;[  ${dto.user_userId}  ]</h4><!-- 번호 -->
		</c:forEach>
		</tr>
		</form>
	</table>
	</div>
</body>
</html>