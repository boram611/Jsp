<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주 묻는 질문[기타문의]</title>
<script src="./js/jquery-3.3.1.min.js"></script>
	<style>
		* {margin:0; padding:0;}
		#accordion {position:relative;left:50%;transform:translateX(-50%);width:800px; margin-bottom: 20px; margin-top: 20px;}
		input[id*="answer"] {display:none;}
		input[id*="answer"] + label
		 {display:block;padding:20px;border:1px solid white;border-bottom:0;color:#fff;font-weight:900;background:#6fa168;cursor:pointer;position:relative;}
		input[id*="answer"] + label em {position:absolute;top:50%;right:10px;width:30px;height:30px;margin-top:-15px;display:inline-block;background:url('./img/arrow.png') 0 0 no-repeat;}
		input[id*="answer"] + label + div {max-height:0;transition: all .35s;overflow:hidden;background:#ebf8ff;font-size:15px;}
		input[id*="answer"] + label + div p {display:inline-block;padding:20px;}
		input[id*="answer"]:checked + label + div {max-height:500px;}
		input[id*="answer"]:checked + label em {background-position:0 -30px;}
	</style>

</head>

<body>

<%@include file="oftenHeader.jsp" %>
<div id="accordion">

<input type="radio" name="accordion" id="answer01">
	<label for="answer01">할인쿠폰 및 적립금<em></em></label>
	<div><p>저희 미쁘다는 할인쿠폰 및 적립금은 따로 없습니다.</p></div>
	<input type="radio" name="accordion" id="answer02">
	<label for="answer02">미쁘다는 어떤 홈페이지인가요?<em></em></label>
	<div><p>메뉴 상단 왼쪽에 보시면 미쁘다? 라는 메뉴를 클릭하시면 저희 홈페이지에 대한 설명이 뜹니다.</p></div>
</div>
 
<%@include file="Footer.jsp" %>

</body>

</html>
