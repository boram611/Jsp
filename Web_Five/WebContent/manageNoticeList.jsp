<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 사항</title>
<script src="./js/jquery-3.3.1.min.js"></script>
</head>
<style>
#notice{
	width:900px;
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

#home3{
width:200px;
line-height:50px;
height: 50px;
margin-left:680px;
 margin-bottom:10px;
 background-color:#fff;
	border:2px solid #6fa168;
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
	color:blue;
}
</style>
<%@include file="manaMain.jsp" %>
<body>

<%request.setCharacterEncoding("utf-8"); %>
<div id="notice">
<h2>&nbsp;공지사항 목록</h2>
<div id="home3"><a href="insertNoticeView.five">새로운 공지사항 등록</a></div>
<form action="searchNotice.five">
			검색 선택 :
			<select name="select">
				<option value="nTitle" selected="selected">제목</option>
				<option value="admin_adminId">관리자 아이디</option>
			</select>&nbsp;&nbsp;&nbsp;
			<input type="text" name="content" size="30" />
			<input type="submit" value="검색">
		</form>
		<br>


	<table>
		<tr>
			<th width="30px;">번호</th>
			<th width="260px;">제목</th>
			<th width="130px;">날짜</th>
			<th width="80px;">작성자</th>
			<th width="80px;">공지사항<br>수정</th>
			<th width="30px;">삭제</th>
		</tr>
		<c:forEach items="${manageNotice}" var="dto">
			<tr>
				<td>&nbsp;&nbsp;&nbsp;${dto.nSeqno}</td>
				<td>${dto.nTitle}</td>
				<td>&nbsp;${dto.nDate}</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${dto.admin_adminId}</td>
				<td><a href = "manaNoticeView.five?nSeqno=${dto.nSeqno}&nTitle=${dto.nTitle}&nDate=${dto.nDate}&admin_adminId=${dto.admin_adminId}">
				&nbsp;&nbsp;&nbsp;&nbsp;내용 수정</a></td>
				<td><a href="deleteNotice.five?nSeqno=${dto.nSeqno}"> &nbsp;&nbsp;&nbsp;&nbsp;X </a></td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<div id="table1">
	<table>
			<tr>
				<c:if test="${startPage!=1}">
					<a href="./manageNotice.five?page=${startPage-1}">[이전]</a>
				</c:if>
				
			   <c:forEach var="i" begin="${startPage}" end="${endPage}" varStatus="cnt">
			       <a href="./manageNotice.five?page=${i}">[
			        <font color="#000000" />
			          <c:if test="${currentPage == i}">
			          <font color="#bbbbbb" />
			        </c:if>
			        ${i} ]
			       </font>
			       </a>
			   </c:forEach> 
				<c:if test="${endPage!=totalPage}">
					<a href="./manageNotice.five?page=${endPage+1}">다음 ▶</a>
				</c:if>
			</tr>
		</table>
		</div>
		
	</div>
	
</body>
</html>
