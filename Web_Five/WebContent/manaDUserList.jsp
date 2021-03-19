<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자용 탈퇴 유저 목록</title>
<script src="./js/jquery-3.3.1.min.js"></script>
</head>
<style>
#user{
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
<div id="user">
<h2>&nbsp;탈퇴 사용자 목록</h2><br>
<br><br>
<a href="manageUser.five"><h3>유저 목록보기</h3></a>
<table>
		<tr>
		<th width="100px;">deluserId</th>
		<th width="80px;">deluserName</th>
		<th width="130px;">deluserTel</th>
		<th width="120px;">deluserEmail</th>
		<th width="190px;">가입날짜</th>
		<th width="190px;">탈퇴날짜</th>
		</tr>
		<c:forEach items="${manaDUser}" var="dto">
		<tr>
			<td>${dto.userId}</td> 
			<td>${dto.userName}</td>
			<td>${dto.userTel}</td>
			<td>${dto.userEmail}</td>
			<td>${dto.insertDate}</td>
			<td>${dto.deleteDate}</td>
		
		</tr>
		</c:forEach>
	</table>
	<br>
	<div id="table1">
	<table>
			<tr>
				<c:if test="${startPage!=1}">
					<a href="./manaDUserList.five?page=${startPage-1}">[이전]</a>
				</c:if>
				
			   <c:forEach var="i" begin="${startPage}" end="${endPage}" varStatus="cnt">
			       <a href="./manaDUserList.five?page=${i}">[
			        <font color="#000000" />
			          <c:if test="${currentPage == i}">
			          <font color="#bbbbbb" />
			        </c:if>
			        ${i} ]
			       </font>
			       </a>
			   </c:forEach> 
				<c:if test="${endPage!=totalPage}">
					<a href="./manaDUserList.five?page=${endPage+1}">다음 ▶</a>
				</c:if>
			</tr>
		</table>
		</div>
	</div>
</body>
</html>