<%@page import="com.web_five.dto.CartDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 관리</title>
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
	color:white;
	text-decoration:none;
}

button {
	width:250px;
	height:50px;
	line-height:50px;
	text-align:center;
	border:1px solid #5B142A;
	border-radius:3px;
	font-weight:bold;
	background-color:#5B142A;
	color: white;
}

button:hover {
	color:black;
	background-color:white;
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
<script type="text/javascript">
function allChk(obj){
      var chkObj = document.getElementsByName("RowCheck");
      var rowCnt = chkObj.length - 1;
      var check = obj.checked;
      if (check) {﻿
          for (var i=0; i<=rowCnt; i++){
           if(chkObj[i].type == "checkbox")
               chkObj[i].checked = true;
          }
      } else {
          for (var i=0; i<=rowCnt; i++) {
           if(chkObj[i].type == "checkbox"){
               chkObj[i].checked = false;
           }
          }
      }
      function fn_userDel(){

    	  var dcartNo = "";
    	  var dcartNoChk = document.getElementsByName("RowCheck");
    	  var chked = false;
    	  var indexid = false;
    	  for(i=0; i < dcartNoChk.length; i++){
    	   if(dcartNoChk[i].checked){
    	    if(indexid){
    	    	dcartNo = dcartNo + '-';
    	    }
    	    dcartNo = dcartNo + dcartNoChk[i].value;
    	    indexid = true;
    	   }
    	  }
    	  if(!indexid){
    	   alert("구매하시거나 장바구니에서 뺴실 상품을 선택해 주세요.");
    	   return;
    	  }
 	  }
  } 
</script>
<%@include file="Header.jsp" %>
<body>

<%request.setCharacterEncoding("utf-8"); %>
<div id="notice">
<div id="home3"><a href="javascript:history.back();">뒤로 가기</a></div>
<h2>&nbsp;장바구니 목록</h2><br>

	<form action="selectCartAction.five" method="get" name ="userForm">
		<table>
			<tr>
				<th width="15px;"><input id="allCheck" type="checkbox" onclick="allChk(this);"/></th>
				<th width="200px;">상품 사진</th>
				<th width="120px;">상품 유형</th>
				<th width="40px;">상품<br>번호</th>
				<th width="150px;">상품 이름</th>
				<th colspan="2" width="400px;">상품 수량</th>
				<th width="150px;">상품 가격</th>
			</tr>
			<c:forEach items="${userCart}" var="dto">
				<tr>
					<td> <input type="checkbox" name="RowCheck" value="${dto.dcartNo}"> </td>
					<td>&nbsp;<img src="${pageContext.request.contextPath}/resources/image/${dto.prdAFilename}"></td>
					<td>&nbsp;&nbsp;${dto.ctgType}</td>
					<td>&nbsp;&nbsp;&nbsp;${dto.prdNo}</td>
					<td><a href = "productShowMain.five?prdNo=${dto.prdNo}&ctgType=${dto.ctgType}&prdName=${dto.prdName}&prdPrice=${dto.prdPrice}
					&prdStock=${dto.prdStock}&prdFilename=${dto.prdFilename}&prdDFilename=${dto.prdDFilename}">&nbsp;${dto.prdName}</a></td>
					<td>&nbsp;${dto.prdPrice}&nbsp;</td>
					<td> <input type=hidden name="sell_price" value="sum">
				<input type="text" name="cartQuantity" id="qty" class="qty"  value="${dto.cartQty }" size="3" onchange="change();">
			
				<a href="updateCart.five?cartNo=${dto.cartNo }&cartQuantity=${dto.cartQty }&chk=up&goods_prdNo=${dto.goods_prdNo}&user_userId=${dto.user_userId}&DcartNo=${dto.dcartNo}&cartTotalPrice=${dto.cartTotalPrice}&prdPrice=${dto.prdPrice}">+</a>
				<a href="updateCart.five?cartNo=${dto.cartNo }&cartQuantity=${dto.cartQty }&chk=down&goods_prdNo=${dto.goods_prdNo}&user_userId=${dto.user_userId}&DcartNo=${dto.dcartNo}&cartTotalPrice=${dto.cartTotalPrice}&prdPrice=${dto.prdPrice}">-</a>
				<input type="hidden" name="cartNo" value="${dto.cartNo }">
			
					</td>
					<td>금액 : <input type="text" name="sum" class="price" value="${dto.cartQty * dto.prdPrice}" size="11" readonly>&nbsp;&nbsp;원</td>
				
				</tr>
				<tr>
        			<td colspan="8"></td>
    			</tr>
		</c:forEach>
        			<td colspan="8">총 금액 : <%= session.getAttribute("total") %></td>
	</table><br><br>

	<button type="submit" name="action" value="선택한 물건 구매하기" >선택한 물건 구매하기</button>&nbsp;&nbsp;
	
	<button type="submit" name="action" style="margin-left: 220px;" value="선택한 물건 장바구니에서 삭제하기">삭제</button>
	</form>
	<br>
	
	</div>
	
</body>
<%@include file="Footer.jsp" %>
</html>
