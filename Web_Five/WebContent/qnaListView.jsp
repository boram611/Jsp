<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저용 QnA</title>
</head>
<style>
#notice{
	width:800px;
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
#home3{
width:200px;
line-height:50px;
height: 50px;
margin-left:300px;
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
	color:pink;
}
h2{
margin-bottom: 10px;
}
</style>
<script src="./js/jquery-3.3.1.min.js"></script>
<%@include file="Header.jsp" %>
<body>

<%request.setCharacterEncoding("utf-8"); %>
<div id="notice">
<h2>&nbsp;나의 1 : 1 문의 내역</h2>

<div id="home3"><a href="qnaInsertView.five">새로운 1:1문의 글 등록</a></div>
	<table>
		<tr>
			<th width="30px;">번호</th>
			<th width="60px;">답변 여부</th>
			<th width="90px;">문의 종류</th>
			<th width="250px;">제목</th>
			<th width="80px">아이디</th>
			<th width="130px;">날짜</th>
		</tr>
		<c:forEach items="${qnalist}" var="dto">
			<tr>
				<td>${dto.qSeqno}</td><!-- 번호 -->
				<td>${dto.qComment}</td><!-- 답변 여부 -->
				<td>${dto.qChapter}</td><!-- 문의 종류 -->
				<td><a href = "qnaView.five?qSeqno=${dto.qSeqno}">${dto.qTitle}</a></td><!-- 제목 -->
				<td>${dto.user_userId}</td><!-- 아이디 -->
				<td>${dto.qUserDate}</td><!-- 날짜 -->
			</tr>
		</c:forEach>
	</table>
	<br>
	<div id="table1">
	
	<table>
			<tr>
				<c:if test="${startPage!=1}">
					<a href="./qnaListView.five?page=${startPage-1}">[이전]</a>
				</c:if>
				
			   <c:forEach var="i" begin="${startPage}" end="${endPage}" varStatus="cnt">
			       <a href="./qnaListView.five?page=${i}">[
			        <font color="#000000" />
			          <c:if test="${currentPage == i}">
			          <font color="#bbbbbb" />
			        </c:if>
			        ${i}
			       </font>]
			       </a>
			   </c:forEach>
			
				<c:if test="${endPage!=totalPage}">
					<a href="./qnaListView.five?page=${endPage+1}">다음 ▶</a>
				</c:if>
			</tr>
		
		</table>
		</div>
		</div>
</body>
<%@include file="Footer.jsp" %>
</html>