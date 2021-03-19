<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자용 상품 상세 보기</title>
</head>
<script src="./js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

//장바구니에 추가하기 누르면 나오는 알림
function addcart() {
	switch (<%=session.getAttribute("cartcheck")%>) {
	case 0:
		break;
	case 1:
		
		break;
	default:
		break;
	}
}


//수량에 따른 가격 변화
var sell_price;
var cartQty;
function init () {
	prdPrice = document.form.prdPrice.value;
	amount = document.form.amount.value;
	document.form.sum.value = prdPrice;
	change();
}
function add () {
	hm = document.form.cartQty;
	sum = document.form.sum;
	hm.value ++ ;
	sum.value = parseInt(hm.value) * prdPrice;
}
function del () {
	hm = document.form.cartQty;
	sum = document.form.sum;
		if (hm.value > 1) {
			
			hm.value -- ;
			sum.value = parseInt(hm.value) * prdPrice;
		}
}
function change () {
	hm = document.form.cartQty;
	sum = document.form.sum;
		if (hm.value < 0) {
			hm.value = 0;
		}
	sum.value = parseInt(hm.value) * prdPrice;
} 
</script>

<style>
input{border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;}
input:focus {outline:none;}
textarea{border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;}
textarea:focus {outline:none;}
#wrap {
	margin:0 auto;
	width:100%;
}
#Main{
	width:900px;
	margin-left:auto;
	margin-right:auto;
	margin-top:50px;
}
#content{
	width:900px;
	margin:0 auto;
	margin-top:50px;
}
#cartMain{
	width: 800px;
	
}
#cart {
	width:200px;
	height:50px;
	line-height:50px;
	text-align:center;
	border:1px solid #009680;
	border-radius:3px;
	font-weight:bold;
	display:block;
	margin-bottom:10px;
	margin-top:20px;
	margin-right:20px;
	background-color:#009680;
	float: left;
}

#cart:hover {
	color:#000;
	background-color:#fff;
}
#cart2 {
float:left;
	width:200px;
	height:50px;
	line-height:50px;
	text-align:center;
	border:1px solid #009680;
	border-radius:3px;
	font-weight:bold;
	display:block;
	margin-bottom:10px;
	margin-top:20px;
	margin-right:20px;
	background-color:#009680;
}

#cart2:hover {
	color:#000;
	background-color:#fff;
}

#review {
	width:16%;
	height:55px;
	line-height:55px;
	position:fixed;
	bottom:5px;
	margin-left:42%;
	margin-right:42%;
	background-color:#fff;
	border:2px solid #6fa168;
	text-align:center;
	border-radius:2px;
}

#reviewM a {
	text-decoration:none;
	display:block;
	color:black;
	font-family:midnight;
	font-size:18px;
}

#reviewM a:hover {
	color:pink;
}
#home3{
width:150px;
line-height:36px;
height: 36px;
 margin-bottom:10px;
 margin-top:20px;
 background-color:#fff;
	border:2px solid pink;
	text-align:center;
	border-radius:2px;
	float: left;
	margin-left: 10px;
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
input{
font-size: 16px;
margin-left: 10px;
}
td{
height: 30px;
}
</style>
<%@include file="Header.jsp" %>

<body onload="init()">
<div id="wrap">
<div id="Main">
<h2>[ 상품 상세 정보 ]</h2><br><hr style="border: 2">
<!-- 장바구니 담는 action 필요 -->
<center>
	<form name="form"  method="post">   
	<table border=0  cellpadding=10>
		<tr>
		     <td rowspan=8 align=center> 
		     <img src="${pageContext.request.contextPath}/resources/image/${storeMain.prdFilename}" width="330px"></td>
		      <td align=left width=70><font size=2><b>&nbsp;</b></font></td>
			  <td colspan=2 align=left  width=100><input type=hidden name=prdNo  value="${storeMain.prdNo}"><font size=2></font></td>		      
		</tr>
		<tr>
		      <td align=right  width=60 height=100><font size=4><b>&nbsp;상품 타입 :</b></font></td>
		      <td colspan=2  align=left  width=100><font size=4>
		      <input type = "text" name = "ctgType" size = "10" value="${storeMain.ctgType}" readonly="readonly">
		      </font></td>
		</tr>
		<tr>
		      <td align=right  width=100><font size=4><b>&nbsp;상품명 :</b></font></td>
		      <td colspan=2  align=left  width=100><font size=4>
		      <input type = "text" name = "prdName" value="${storeMain.prdName}" size = "40" readonly="readonly">
		      </font></td>
		</tr>
		<tr style="padding-top: 10px;">
		      <td align=right  width=100><font size=4><b>&nbsp;상품 설명 :</b></font></td>
			  <td colspan=2  align=left  width=300><textarea rows="2" cols="50" name="prdContent" readonly="readonly" style="text-align: left;">   ${storeMain.prdContent}</textarea><font size=2>
			  
			  </font></td>
		</tr>
		<tr>
		      <td align=right  width=100><font size=4><b>&nbsp;상품 가격 :</b></font></td>
			  <td colspan=2  align=left  width=100><font size=4>
			  <input type = "text" name = "prdPrice" value="${storeMain.prdPrice}" size = "10" readonly="readonly">
			  원</font></td>
		</tr>
		<tr>
			  <td align=right  width=100 ><font size=4><b>&nbsp;주문 수량 :</b></font></td>
			  <td align=left  width=100 ><input type="text" name="cartQty" value="1" size="4" onchange="change()"> 개</td>
			  <td align=left width=240 >
			  
<input type="button" value=" + " onclick="add()"><input type="button" value=" - " onclick="del()">
              </td>
		</tr>
		<tr>
		<td align=right  width=100><font size=4><b>&nbsp;총 금액 :</b></font></td>
			  <td colspan=2  align=left  width=100><font size=2>
			   <input type="text" name="sum" size="11" readonly>
			  원</font></td>
		</tr>
		<tr>
		<td colspan="4">
			<input type="hidden" name="prdNo" value=<%=request.getParameter("prdNo") %>>
			
			
				<!-- 로그인 안했을때 창 못넘어가게 -->
		
		<div id="home3">
	
		
	
		
		 <%
			if(session.getAttribute("Log_userId") == null){ 
				out.println("<a href = 'logInView.jsp'> 장바구니 </a>");
			}else{
				String userid = (String)session.getAttribute("Log_userId");%>
		
				<input type="submit" formaction="insertCart.five" value="장바구니에 추가" onclick="addcart()">
		<%
			}
		%>
		</div>
		
		<!-- 로그인 안했을때 창 못넘어가게 -->
			<div id="home3">
		
		 <%
			if(session.getAttribute("Log_userId") == null){ 
				out.println("<a href = 'logInView.jsp'> 바로 구매하기 </a>");
			}else{
				String userid = (String)session.getAttribute("Log_userId");%>
		<input type="submit" formaction="purchase.five" value="즉시구매"  onclick="addcart()">
		<% 
			}
		%>

		</div>

		<td>
		</tr>
    </table>
	</form>
	</div>
	<p>
	<br><br>
       <hr>
       <div id="content">
       <img src="${pageContext.request.contextPath}/resources/image/${storeMain.prdDFilename}" width="900px">
       <br>
       </div>

</div>
</center>
<!-- 상품에 따른 리뷰 보기 -->
<div id="reviewM">
<a href = "review.five?prdNo=<%=request.getParameter("prdNo") %>"><div id="review">리뷰보기</div></a>
</div>
</body>
<%@include file="Footer.jsp" %>
</html>