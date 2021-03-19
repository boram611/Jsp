<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 관리</title>
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
text-align: center;
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
<h2>&nbsp;상품 목록</h2>

<div id="home3"><a href="insertProductView.five">새 상품 등록</a></div>

<form action="#">
			&nbsp;&nbsp;&nbsp;검색 :
			<select name="select">
				<option value="prdName" selected="selected">상품 이름</option>
				<option value="ctgType">상품 유형</option>
			</select>&nbsp;&nbsp;&nbsp;
			<input type="text" name="content" size="30" />
			<input type="submit" value="검색">
		</form>
		<br>
	<table>
		<tr>
			<th width="150px;">상품 유형</th>
			<th width="40px;">상품 번호</th>
			<th width="250px;">상품 이름</th>
			<th width="100px;">상품 가격</th>
			<th width="100px;">재고 수량</th>
			<th width="400px;">상품 사진</th>
			<th width="100px;">상품<br>수정</th>
			<th width="50px;">삭제</th>
		</tr>
		<c:forEach items="${manaProduct}" var="dto">
			<tr>
				<td>&nbsp;${dto.ctgType}</td>
				<td>&nbsp;${dto.prdNo}</td>
				<td>&nbsp;${dto.prdName}</td>
				<td>&nbsp;&nbsp;&nbsp;${dto.prdPrice}&nbsp;원</td>
				<td>&nbsp;&nbsp;${dto.prdStock}&nbsp;개</td>
				<td><img src="${pageContext.request.contextPath}/resources/image/${dto.prdAFilename}"></td>
				
				<td><a href = "showProduct.five?prdNo=${dto.prdNo}&ctgType=${dto.ctgType}&prdName=${dto.prdName}&prdPrice=${dto.prdPrice}
				&prdStock=${dto.prdStock}&prdFilename=${dto.prdFilename}&prdDFilename=${dto.prdDFilename}">&nbsp;상품 수정</a></td>
				<td><a href="deleteProduct.five?prdNo=${dto.prdNo}"> &nbsp;&nbsp;X </a></td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<div id="table1">
	<table>
			<tr>
				<c:if test="${startPage!=1}">
					<a href="./manageProduct.five?page=${startPage-1}">[이전]</a>
				</c:if>
				
			   <c:forEach var="i" begin="${startPage}" end="${endPage}" varStatus="cnt">
			       <a href="./manageProduct.five?page=${i}">[
			        <font color="#000000" />
			          <c:if test="${currentPage == i}">
			          <font color="#bbbbbb" />
			        </c:if>
			        ${i} ]
			       </font>
			       </a>
			   </c:forEach> 
				<c:if test="${endPage!=totalPage}">
					<a href="./manageProduct.five?page=${endPage+1}">다음 ▶</a>
				</c:if>
			</tr>
		</table>
		</div>
		
	</div>
	
</body>
</html>
