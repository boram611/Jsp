<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mana 이벤트 리스트</title>
<script src="./js/jquery-3.3.1.min.js"></script>
</head>
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
#home3{
width:200px;
line-height:50px;
height: 50px;
margin-left:780px;
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
<h2>&nbsp;이벤트 목록</h2>

<div id="home3"><a href="insertEventView.five">새로운 이벤트 등록</a></div>

<form action="#">
			&nbsp;&nbsp;&nbsp;검색 :
			<select name="select">
				<option value="eTitle" selected="selected">제목</option>
				<option value="startDate">시작 날짜</option>
				<option value="endDate">종료 날짜</option>
			</select>&nbsp;&nbsp;&nbsp;
			<input type="text" name="nContent" size="30" />
			<input type="submit" value="검색">
		</form>
		<br>
	<table>
		<tr>
			<th width="30px;">번호</th>
			<th width="250px;">제목</th> <!-- 제목 클릭시 수정은 불가능한 이벤트 내용과 당첨자 정보 띄우기  -->
			<th width="130px;">시작 날짜</th>
			<th width="130px;">종료 날짜</th>
			<th width="80px;">이벤트 내용<br>수정</th>
			<th width="80px;">이벤트 당첨자<br>등록</th>
			<th width="35px;">이벤트<br>삭제</th>
		</tr>
		<c:forEach items="${eventList}" var="dto">
			<tr>
			<td>&nbsp;&nbsp;&nbsp;${dto.eSeqno}</td><!-- 번호 -->
				<td>&nbsp;${dto.eTitle}</td><!-- 제목 --> 
				<td>&nbsp;${dto.startDate}</td><!-- 이벤트 시작 날짜 -->
				<td>&nbsp;${dto.endDate}</td><!-- 이벤트 종료 날짜 -->
				<td><a href = "eventViewAdmin.five?eSeqno=${dto.eSeqno}&eTitle=${dto.eTitle}
				&eContent=${dto.eContent}&startDate=${dto.startDate}&endDate=${dto.endDate}">&nbsp;&nbsp;&nbsp;내용 수정</a></td><!-- 이벤트 내용 수정 -->
				<td><a href="insertWinEventView.five?eSeqno=${dto.eSeqno}">&nbsp;&nbsp;당첨자 등록</a></td><!-- 이벤트 당첨자 등록 -->
				<td><a href="deleteEvent.five?eSeqno=${dto.eSeqno}">&nbsp;&nbsp;&nbsp; X </a></td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<div id="table1">
	<table>
			<tr>
				<c:if test="${startPage!=1}">
					<a href="./manageEvent.five?page=${startPage-1}">[이전]</a>
				</c:if>
				
			   <c:forEach var="i" begin="${startPage}" end="${endPage}" varStatus="cnt">
			       <a href="./manageEvent.five?page=${i}">[
			        <font color="#000000" />
			          <c:if test="${currentPage == i}">
			          <font color="#bbbbbb" />
			        </c:if>
			        ${i} ]
			       </font>
			       </a>
			   </c:forEach> 
				<c:if test="${endPage!=totalPage}">
					<a href="./manageEvent.five?page=${endPage+1}">다음 ▶</a>
				</c:if>
			</tr>
		</table>
		</div>
		
	</div>
	
</body>
</html>