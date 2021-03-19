<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송 상세 정보</title>
<script src="./js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" language="javascript">
function openWin(){  
	self.close();
}
</script>
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
</style>
<body>

<%request.setCharacterEncoding("utf-8"); %>
<div id="notice">
<h2>&nbsp;배송 정보 상제보기</h2><br>
	<table>
		<tr>
			<th width="40px;">주문 번호</th>
			<th width="100px;">유저 아이디</th>
			<th width="100px;">상품 번호</th>
			<th width="30px;">주문 수량</th>
			<th width="450px;">리뷰</th>
			<th width="100px;">별점</th>
			<th width="120px;">환불 날짜</th>
		</tr>
		<c:forEach items="${OrderdetailView}" var="dto">
			<tr>
				<td>&nbsp;${dto.orderinfo_ordNo}</td>
				<td>&nbsp;${dto.user_userId}</a></td>
				<td>&nbsp;${dto.goods_prdNo}</td>
				<td>&nbsp;${dto.ordQty}</td>
				<td>&nbsp;${dto.ordReview}</td>
				<td>&nbsp;${dto.ordStar}</td>
				<td>&nbsp;${dto.ordRefund}</td>
			</tr>
		</c:forEach>
	</table>
	<br>
	</div>
</body>
</html>