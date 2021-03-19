<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 목록</title>
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
<%@include file="Header.jsp" %>
<body>

<%request.setCharacterEncoding("utf-8"); %>
<div id="notice">
<h2>&nbsp; 이벤트</h2><br>

	<table>
		<tr>
			<th width="60px;">번호</th>
			<th width="370px;">제목</th> <!-- 제목 클릭시 수정은 불가능한 이벤트 내용과 당첨자 정보 띄우기  -->
			<th width="100px;">시작 날짜</th>
			<th width="100px;">종료 날짜</th>
		</tr>
		<c:forEach items="${eventList}" var="dto">
			<tr>
			<td>${dto.eSeqno}</td><!-- 번호 -->
				<td><a href = "eventViewUser.five?eTitle=${dto.eTitle}&eSeqno=${dto.eSeqno}&eFilename=${dto.eFilename}&eContent=${dto.eContent}&startDate=${dto.startDate}&endDate=${dto.endDate}">${dto.eTitle}</a></td><!-- 제목 --> 
				<td>${dto.startDate}</td><!-- 이벤트 시작 날짜 -->
				<td>${dto.endDate}</td><!-- 이벤트 종료 날짜 -->
			</tr>
		</c:forEach>
	</table>
	<br>
	<div id="table1">
	<table>
			<tr>
				<c:if test="${startPage!=1}">
					<a href="./eventList.five?page=${startPage-1}">[이전]</a>
				</c:if>
				
			   <c:forEach var="i" begin="${startPage}" end="${endPage}" varStatus="cnt">
			       <a href="./eventList.five?page=${i}">[
			        <font color="#000000" />
			          <c:if test="${currentPage == i}">
			          <font color="#bbbbbb" />
			        </c:if>
			        ${i} ]
			       </font>
			       </a>
			   </c:forEach> 
				<c:if test="${endPage!=totalPage}">
					<a href="./eventList.five?page=${endPage+1}">다음 ▶</a>
				</c:if>
			</tr>
		</table>
		</div>
	</div>	
</body>
<%@include file="Footer.jsp" %>
</html>