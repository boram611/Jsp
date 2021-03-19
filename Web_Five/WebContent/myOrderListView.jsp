<%@page import="com.web_five.dto.orderListDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 주문 조회</title>
<script src="./js/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>

	
$(document).ready(function(){
    
    $("#delivery").on("focusout", function() {
    	if( $('#delivery').val() == '구매 확정' ) {
  	      $('#deliveryOk').val('리뷰쓰기');
  	    }
  	    else {
  	      $('#deliveryOk').val('리뷰쓰기 완료');
  	      
  	    }
   });

});



	function change(){
		var test = document.getElementById('insertReview').value = '리뷰쓰기';
		var f = document.getElementById("insertReview");
		f.type= "submit";
	}

window.onload = function getInfo(){
		var delivery =  document.getElementById('delivery').value;
		var D = document.getElementById("deliveryOk").value;
		
		if(D == "배송 완료"){
			D.type= "button";
			document.getElementById('deliveryOk').value = "구매 확정";
		}
		if(D == "구매 확정"){
			D.type= "button";
			document.getElementById('deliveryOk').value = "리뷰 쓰기";
		}
		
}
</script>

<style>
#Main{
width: 1000px;
margin-left: auto;
margin-right: auto;
margin-bottom: 20px;
}
a {
	text-decoration:none;
	display:block;
	color:navy;
	font-family:midnight;
	font-size:18px;
}

a:hover {
	color:red;
}
h2{
margin-bottom: 15px;
}
tr{
	border-bottom: solid 1px red;
	height: 35px;
}
td{
text-align: center;
}
</style>


</head>
<%@include file="myPageView.jsp" %>
<body>
<%request.setCharacterEncoding("utf-8"); %>
<%
	orderListDto dto = new orderListDto();
	String prdNo = dto.getPrdNo();
	session.setAttribute("prdNo", prdNo);
%>
<div id="Main">
<h2>&nbsp;주문 조회</h2>
	<table>
		<tr>
			<th width="40px;">주문번호</th>
			<th width="300px;">상품명</th>
			<th width="80px;">상품가격</th>
			<th width="80px;">주문수량</th>
			<th width="150px;">주문날짜</th>
			<th width="200px;">총 주문금액</th>
			<th width="100px;">배송상태</th>
			<th width="10px;"></th>
		</tr>
		<c:forEach items="${myOrderList}" var="dto">
			<tr>
				<th>${dto.ordNo}</th>
				<td><a href = "productShowMain.five?prdNo=${dto.prdNo}">${dto.prdName}(상품 상세보기)</a></td>
				<td>${dto.prdPrice}원</td>
				<td>${dto.ordQty}개</td>
				<td>${dto.ordDate}</td>
				<td><a href = "myOrderView.five?ordNo=${dto.ordNo}&prdNo=${dto.prdNo}">${dto.total}원(주문 상세보기)</a></td>
				<td><input type="text" name="delivery" id="delivery" value="${dto.ordDelivery}" readonly="readonly" size="10" style = "text-align:center;"></td>
				  

			</tr>
		</c:forEach>
	</table>

	</form>

</div>

</body>
<%@include file="Footer.jsp" %>
</html>