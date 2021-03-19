<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 배송 정보 보기</title>
<script src="./js/jquery-3.3.1.min.js"></script>
<style>
#notice{
	width:600px;
	margin:0 auto;
	margin-top:50px;
}
tr{
height: 30px;
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
	width:150px;
	height:40px;
	line-height:40px;
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
a{
	text-decoration: none;
	color:pink;

}
a:hover{
	text-decoration: none;
	color:red;

}
</style>
<script type="text/javascript" language="javascript">
function openWin(){  
		window.open("manageDeliveryViewDetail.five", "상세 배송 정보", "resizable=yes");
}
</script>
</head>
<body>
<%@include file="manaMain.jsp" %>
<div id="notice">
<h2>&nbsp;관리자 배송 정보 보기</h2><br>
<%
session.setAttribute("ordNo", request.getParameter("ordNo"));
session.setAttribute("user_userId", request.getParameter("user_userId"));
%>
	<form action="manageDeliveryList.five" method="post">
		<table>
			<tr>
				<td>배송 번호</td>
				<td><a href = "" onclick="openWin();"><%=request.getParameter("ordNo") %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[ 배송 상세 보기 ]</a></td>
			</tr>
			<tr>
				<td>유저 아이디</td>
				<td><%=request.getParameter("user_userId") %></td>
			</tr>
			<tr>
				<td>주문자 이름</td>
				<td><%=request.getParameter("ordReceiver") %></td> 
			</tr>
			<tr>
				<td>전화번호</td>
				<td><%=request.getParameter("ordRcvPhone") %></td> 
			</tr>
			<tr>
				<td>주소</td>
				<td><%=request.getParameter("ordRcvAddress") %></td> 
			</tr>
			<tr>
				<td>총 주문 금액</td>
				<td><%=request.getParameter("ordPay") %></td> 
			</tr>
			<tr>
				<td>카드 정보</td>
				<td><%=request.getParameter("ordBank") %></td> 
			</tr>
			<tr>
				<td>카드 번호</td>
				<td><%=request.getParameter("ordCardNo") %></td> 
			</tr>
			<tr>
				<td>주문 날짜</td>
				<td><%=request.getParameter("ordDate") %></td> 
			</tr>
			<tr>
				<td>배송 날짜</td>
				<td><%=request.getParameter("ordDeliveryDate") %></td> 
			</tr>
			<tr>
				<td>배송 상태</td>
				<td><%=request.getParameter("ordDelivery") %></td> 
			</tr>
			<tr>
			<td colspan="2">
			<a href="manageEvent.five"><button>목록보기</button></a>
			</tr>
			
		</table>
	</form>
	</div>
</body>
</html>