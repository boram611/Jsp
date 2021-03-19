<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색결과</title>
</head>
<style>
img{
	width: 100px;
	height: 100px;
	
}
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
    text-align: center;
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
<script src="./js/jquery-3.3.1.min.js"></script>
<body>
<%@include file="Header.jsp" %>
<%request.setCharacterEncoding("utf-8"); %>
<div id="notice">
<h2>&nbsp;검색 결과 입니다.</h2><br>

	<table>
		<tr>
			<th width="150px;">상품 유형</th>
			<th width="200px;">상품 사진</th>
			<th width="350px;">상품 이름</th>
			<th width="100px;">상품 가격</th>
			<th width="100px;">재고 수량</th>
		</tr>
		<c:forEach items="${search}" var="dto">
			<tr>
				<td>&nbsp;${dto.ctgType}</td>
				<td><a href = "productShowMain.five?prdNo=${dto.prdNo}&ctgType=${dto.ctgType}&prdName=${dto.prdName}&prdPrice=${dto.prdPrice}
				&prdFilename=${dto.prdFilename}">
				<img src="${pageContext.request.contextPath}/resources/image/${dto.prdFilename}"></a></td>
				<td>&nbsp;${dto.prdName}</td>
				<td>&nbsp;${dto.prdPrice}&nbsp;</td>
				<td>&nbsp;${dto.prdStock}</td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<div id="table1">
	<table>
			<tr>
				<c:if test="${startPage!=1}">
					<a href="./storeMain.five?page=${startPage-1}">[이전]</a>
				</c:if>
				
			   <c:forEach var="i" begin="${startPage}" end="${endPage}" varStatus="cnt">
			       <a href="./storeMain.five?page=${i}">[
			        <font color="#000000" />
			          <c:if test="${currentPage == i}">
			          <font color="#bbbbbb" />
			        </c:if>
			        ${i} ]
			       </font>
			       </a>
			   </c:forEach> 
				<c:if test="${endPage!=totalPage}">
					<a href="./storeMain.five?page=${endPage+1}">다음 ▶</a>
				</c:if>
			</tr>
		</table>
		</div>
	</div>
	<%@include file="Footer.jsp" %>
</body>
</html>