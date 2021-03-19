 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 사항</title>
</head>
<script src="./js/jquery-3.3.1.min.js"></script>
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
td {
  border-bottom: 1px solid #444444;
  padding: 10px;
}
th {
  border-bottom: 1px solid #444444;
  padding: 10px;
  text-align: center;
}
#table1{
margin: auto 0;
width: 100%;
text-align: center;
}
</style>
<body>
<%@include file="Header.jsp" %>

<%request.setCharacterEncoding("utf-8"); %>
<div id="notice">
<h2>&nbsp;공지사항</h2><br>
	<table>
		<tr>
			<th width="40px;">번호</th>
			<th width="450px;">제목</th>
			<th>날짜</th>
			<th width="100px;">작성자</th>
		</tr>
		<c:forEach items="${noticeList}" var="dto">
			<tr>
				<th style="text-align: center;">&nbsp;${dto.nSeqno}</th>
				<td ><a href = "noticeView.five?nSeqno=${dto.nSeqno}&bName=${dto.nTitle}&bTitle=${dto.nDate}&bContent=${dto.admin_adminId}">&nbsp;${dto.nTitle}</a></td>
				<td style="text-align: center;">&nbsp;${dto.nDate}&nbsp;</td>
				<td style="text-align: center;">&nbsp;${dto.admin_adminId}</td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<div id="table1">
	<table>
			<tr>
				<c:if test="${startPage!=1}">
					<a href="./noticeList.five?page=${startPage-1}">[이전]</a>
				</c:if>
				
			   <c:forEach var="i" begin="${startPage}" end="${endPage}" varStatus="cnt">
			       <a href="./noticeList.five?page=${i}">[
			        <font color="#000000" />
			          <c:if test="${currentPage == i}">
			          <font color="#bbbbbb" />
			        </c:if>
			        ${i} ]
			       </font>
			       </a>
			   </c:forEach> 
				<c:if test="${endPage!=totalPage}">
					<a href="./noticeList.five?page=${endPage+1}">다음 ▶</a>
				</c:if>
			</tr>
		
		</table>
		</div>
	</div>
	<%@include file="Footer.jsp" %>
</body>
</html>