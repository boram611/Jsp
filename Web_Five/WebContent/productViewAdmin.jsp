
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 보기 관리자</title>
<script type="text/javascript" language="javascript">
	function openPro1(){  
		window.open("proFileup1.jsp", "첨부파일", "menubar=no, scrollbars=no, resizable=yes" );  
	} 
</script>
</head>
<style>
button {
	float:left;
	width:150px;
	height:40px;
	line-height:40px;
	text-align:center;
	border:1px solid #6fa168;
	border-radius:3px;
	font-weight:bold;
	background-color:#6fa168;
	margin-right: 20px;
	margin-left: 340px;
}

button:hover {
	color:#000;
	background-color:#fff;
}
#wrap {
	margin:0 auto;
	width:100%;
}
#Main{
	width:700px;
	margin:0 auto;
	margin-top:50px;
}
#content{
	width:800px;
	margin:0 auto;
	margin-top:50px;
}
#home3{
	width:150px;
	line-height:36px;
	height: 36px;
	background-color:#fff;
	border:2px solid pink;
	text-align:center;
	border-radius:2px;
	margin-bottom: 30px;
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
#home2{
	width:300px;
	line-height:25px;
	height: 25px;
	background-color:#fff;
	border:2px solid purple;
	text-align:center;
	border-radius:2px;
	margin-bottom: 10px;
	margin-left: 250px;
}

#home2 a {
	text-decoration:none;
	display:block;
	color:black;
	font-family:midnight;
	font-size:18px;
}

#home2 a:hover {
	color:red;
}
</style>
<%@include file="manaMain.jsp" %>
<body>
<%request.setCharacterEncoding("utf-8"); %>
<% session.setAttribute("prdFilename", null);%>
<% session.setAttribute("prdDFilename", null);%>

<div id="wrap">
<div id="Main">
<h2>&nbsp;상품 입력</h2>

	<div id="home3"><a href="manageProduct.five">목록</a></div>
	<table>
		<form action="updateProductView.five" method="post">
			<tr>
				<td colspan="3"><div id="home2"><a href = "" onclick="openPro1();">상품 ( 1 / 2 / 3 ) 사진 업로드</a></div></td>
			</tr>
			<tr>
		     <td rowspan=8 align=center width=100> 
		     <img src="${pageContext.request.contextPath}/resources/image/${productView.prdFilename}" width="330px"></td>
		     <td>번호</td>
			<td><input type = "text" name = "prdNo" size = "10" value="${productView.prdNo}" readonly="readonly"></td>
		</tr>
		<tr>
				<td>상품 유형</td>
				<td><select name = "ctgType" >
					<option value="생활/주방" selected="selected">생활/주방</option>
					<option value="화장품">화장품</option>
					<option value="유아/완구">유아/완구</option>
					<option value="태블릿/휴대폰">태블릿/휴대폰</option>
				</select></td>
			</tr>
			<tr>
				<td>상품 이름</td>
				<td><input type = "text" name = "prdName" value="${productView.prdName}" size = "20"></td>
			</tr>
			<tr>
				<td>상품 가격</td>
				<td><input type = "text" name = "prdPrice" value="${productView.prdPrice}" size = "10"> &nbsp;원</td>
			</tr>
			<tr>
				<td>재고 수량</td>
				<td><input type = "text" name = "prdStock" value="${productView.prdStock}" size = "10"> &nbsp;개</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="10" cols="50" name="prdContent">${productView.prdContent}</textarea></td>
			</tr>
			<tr>
				<td colspan="2"><button type="submit">입 력</button>
			</tr>
		</form>
			</table>
			</div>
		  <hr>
		<div id="content">
		<h3>리스트에 뜰 상품 사진</h3>
       <img src="${pageContext.request.contextPath}/resources/image/${productView.prdAFilename}">
       </div>
       <div id="content">
       <h3>상품 디테일 사진</h3>
       <img src="${pageContext.request.contextPath}/resources/image/${productView.prdDFilename}" width="900px">
       </div>

	</div>
</body>
</html>