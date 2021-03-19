<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품에 대한 리뷰 띄우기</title>
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
<script src="./js/jquery-3.3.1.min.js"></script>
<%@include file="Header.jsp" %>
<body>

<%request.setCharacterEncoding("utf-8"); %>
<div id="notice">

<div id="home3"><a href="javascript:history.back();">목 록</a></div>
<h2>&nbsp;<% %> 상품 리뷰 목록</h2><br>

	<table>
	<tr>
	<th width="100px;">리뷰 별점 <%=request.getAttribute("strAvgOrdStar") %>(<%=request.getAttribute("avgOrdStar") %>/5)</th>
	</tr>
		<tr>
			<th width="70px;">작성자(ID)</th>
			<th width="70px;">별점</th>
			<th width="350px;">내용</th>
		</tr>
		<c:forEach items="${reviewList}" var="dto">
			<tr>
				<td>&nbsp;${dto.user_userId}</td>  <!-- 작성자 -->
				<td>&nbsp;${dto.ordStar}</td>  <!-- 별점 -->
				<td>&nbsp;${dto.ordReview}</td>  <!-- 내용 -->
			</tr>
		</c:forEach>
	</table>
	<br>
	<div id="table1">
	<table>
			<tr>
				<c:if test="${startPage!=1}">
					<a href="./review.five?page=${startPage-1}">[이전]</a>
				</c:if>
				
			   <c:forEach var="i" begin="${startPage}" end="${endPage}" varStatus="cnt">
			       <a href="./review.five?page=${i}">[
			        <font color="#000000" />
			          <c:if test="${currentPage == i}">
			          <font color="#bbbbbb" />
			        </c:if>
			        ${i} ]
			       </font>
			       </a>
			   </c:forEach> 
				<c:if test="${endPage!=totalPage}">
					<a href="./review.five?page=${endPage+1}">다음 ▶</a>
				</c:if>
			</tr>
		</table>
		</div>
		
	</div>
	
</body>
<%@include file="Footer.jsp" %>
</html>