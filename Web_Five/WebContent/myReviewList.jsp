<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품에 대한 리뷰 띄우기</title>
</head>
<script src="./js/jquery-3.3.1.min.js"></script>
<style>
#notice{
	width:850px;
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
    #table1{
margin: auto 0;
width: 100%;
text-align: center;
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
#insert{
width: 100%;
margin-bottom: 10px;
padding-bottom: 70px;
}
/*취소버튼*/
#home3{
	width:200px;
	line-height:50px;
	height: 50px;
	margin-right:170px;
	margin-top:20px;
	background-color:#fff;
	border:2px solid #6fa168;
	text-align:center;
	border-radius:2px;
	float: right;
}

/*확인버튼*/
#home2{
	width:200px;
	line-height:50px;
	height: 50px;
	margin-left:170px;
	margin-top:21px;
	background-color:#fff;
	border:2px solid #6fa168;
	text-align:center;
	border-radius:2px;
	float: left;
} 
</style>
 <%@include file="myPageView.jsp" %>
<body>

<%request.setCharacterEncoding("utf-8"); %>
<div id="notice">


<div id="insert">
  <a href="myQnaList.five"><div id="home2">내가 쓴 문의글</div></a>
  <a href="myReviewList.five"><div id="home3">내가 쓴 리뷰</div></a>
  </div>

<br>
<h2>&nbsp;<% %> 상품 리뷰 목록</h2><br>

	<table>
		<tr>
			<th width="70px;">작성자(ID)</th>
			<th width="70px;">별점</th>
			<th width="350px;">내용</th>
		</tr>
		<c:forEach items="${myReviewList}" var="dto">
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