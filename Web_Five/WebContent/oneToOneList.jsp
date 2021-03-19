<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 관리</title>
<script src="./js/jquery-3.3.1.min.js"></script>
</head>
<style>
#notice{
	width:950px;
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
<h2>&nbsp;1:1 문의 목록</h2>
	<table>
		<tr>
			<th width="30px;">번호</th>
			<th width="60px;">답변 여부</th>
			<th width="90px;">문의 종류</th>
			<th width="250px;">제목</th>
			<th width="80px">아이디</th>
			<th width="150px">날짜</th>
			<th width="100px">답글 달기</th>
		</tr>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.qSeqno}</td><!-- 번호 -->
				<td>${dto.qComment}</td><!-- 답변 여부 -->
				<td>${dto.qChapter}</td><!-- 문의 종류 -->
				<td>${dto.qTitle}</td><!-- 제목 -->
				<td>${dto.user_userId}</td><!-- 아이디 -->
				<td>${dto.qUserDate}</td><!-- 날짜 -->
				<td><a href = "insertCommentView.five?qSeqno=${dto.qSeqno}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;답글 달기</a></td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<div id="table1">
	<table>
			<tr>
				<c:if test="${MstartPage!=1}">
					<a href="./oneToOneList.five?page=${MstartPage-1}">[이전]</a>
				</c:if>
				
			   <c:forEach var="i" begin="${MstartPage}" end="${MendPage}" varStatus="cnt">
			       <a href="./oneToOneList.five?page=${i}">[
			        <font color="#000000" />
			          <c:if test="${McurrentPage == i}">
			          <font color="#bbbbbb" />
			        </c:if>
			        ${i}
			       </font>]
			       </a>
			   </c:forEach>
				<c:if test="${MendPage!=totalPage}">
					<a href="./oneToOneList.five?page=${MendPage+1}">다음 ▶</a>
				</c:if>
			</tr>
		
		</table>
		</div>
		</div>
</body>
</html>