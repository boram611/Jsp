<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송 관리</title>
<script src="./js/jquery-3.3.1.min.js"></script>
<style>
#notice{
	width:700px;
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
<div id="notice">
<h2>&nbsp; 배송 목록</h2>
	<table>
		<tr>
			<th width="150px;">주문 번호</th>
			<th width="150px;">아이디</th> <!-- 제목 클릭시 수정은 불가능한 이벤트 내용과 당첨자 정보 띄우기  -->
			<th width="150px;">주문 날짜</th>
			<th width="150px;">배송 상태</th>
		</tr>
		<c:forEach items="${deliveryList}" var="dto">
			<tr>
			<td><a href="manageDeliveryView.five?ordNo=${dto.ordNo}&user_userId=${dto.user_userId}&ordDate=${dto.ordDate}
			&ordReceiver=${dto.ordReceiver}&ordRcvAddress=${dto.ordRcvAddress}&ordRcvPhone=${dto.ordRcvPhone}&ordPay=${dto.ordPay}
			&ordBank=${dto.ordBank }&ordCardNo=${dto.ordCardNo}&ordDelivery=${dto.ordDelivery}&ordDeliveryDate=${dto.ordDeliveryDate}">
			&nbsp;${dto.ordNo} &nbsp;[ 주문 상세 보기 ]</a></td><!-- 번호 -->
				<td>&nbsp;&nbsp;&nbsp;${dto.user_userId}</td>
				<td>&nbsp;${dto.ordDate}</td>
				<td>
				
			<form action="updateDelivery.five?ordNo=${dto.ordNo}&user_userId=${dto.user_userId}" method="post">
				<select id="status" name="status" title="배송상태">
	   				<option value="결제 완료" <c:if test="${dto.ordDelivery eq '결제 완료'}">selected</c:if>>결제 완료</option>
	    			<option value="상품 준비중" <c:if test="${dto.ordDelivery eq '상품 준비중'}">selected</c:if>>상품 준비중</option>
	  				<option value="배송중" <c:if test="${dto.ordDelivery eq '배송중'}">selected</c:if>>배송중</option>
	  				<option value="배송 완료" <c:if test="${dto.ordDelivery eq '배송 완료'}">selected</c:if>>배송 완료</option>
					<input type="submit" value="입력"><br>
				</select>
					${dto.ordDeliveryDate}
				</form>
			</td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<div id="table1">
	<table>
			<tr>
				<c:if test="${startPage!=1}">
					<a href="./manageDelivery.five?page=${startPage-1}">[이전]</a>
				</c:if>
				
			   <c:forEach var="i" begin="${startPage}" end="${endPage}" varStatus="cnt">
			       <a href="./manageDelivery.five?page=${i}">[
			        <font color="#000000" />
			          <c:if test="${currentPage == i}">
			          <font color="#bbbbbb" />
			        </c:if>
			        ${i} ]
			       </font>
			       </a>
			   </c:forEach> 
				<c:if test="${endPage!=totalPage}">
					<a href="./manageDelivery.five?page=${endPage+1}">다음 ▶</a>
				</c:if>
			</tr>
		</table>
		</div>
	</div>	
</body>
</html>