<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주 묻는 질문[회원가입/로그인]</title>
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
		input[id*="answer"]:checked + label + div {max-height:300px;}
		input[id*="answer"]:checked + label em {background-position:0 -30px;}
	</style>

</head>

<body>

<%@include file="oftenHeader.jsp" %>
<div id="accordion">

<input type="radio" name="accordion" id="answer01">

	<label for="answer01">가입 후에 아이디를 변경할 수 있나요?<em></em></label>
	<div><p>
 	한 번 가입한 아이디는 변경이 불가합니다.<br>회원 가입 시 기재한 아이디는 변경이 불가합니다.<br>반드시 아이디 변경이 필요한 경우 탈퇴 후 재가입 처리가 필요합니다.<br><br>
 	궁금하신 사항은 언제든지 고객지원센터 1:1게시판으로 문의해주세요.	<a href="#">[문의하기]</a>
 	</p></div>
	<input type="radio" name="accordion" id="answer02">
	<label for="answer02">주소와 전화번호등 개인정보 변경은 어떻게 하나요?<em></em></label>
	<div><p>전화번호 및 주소등 개인정보 변경을 하실경우엔 사이트-마이페이지-개인정보수정에서 변경해주시면 됩니다.</p></div>
	
	
	<input type="radio" name="accordion" id="answer03">
	<label for="answer03">ID와 비밀번호를 잊어버렸어요!
	<em></em></label>
	<div><p>
	＊ 아이디를 잊어버렸을경우<br>
	로그인-아이디 찾기-> 이름,이메일 입력-> 아이디 바로 확인됩니다.<br><br>
	
	＊ 비밀번호를 잊어버렸을경우<br>
	
	로그인-비밀번호 찾기-> 이름, 아이디, 이메일 입력-> 비밀번호가 바로 확인됩니다.<br><br>
	
	아이디는 가입 하셨던분의 성함과 이메일 주소로 확인이 가능 합니다.<br>
	위와 같이 하셨는데도 확인이 어려울실경우,<br>
	미쁘다 고객센터(02-1227-0102)로 전화를 주시면 확인하여 도움 드리겠습니다.</p></div>
	
	<input type="radio" name="accordion" id="answer04">
	<label for="answer04">회원 가입은 어떻게 하나요?<em></em></label>
	<div><p>사이트 상단 로그인을 클릭해주세요.</p></div>
	
	<input type="radio" name="accordion" id="answer05">
	<label for="answer05">회원 탈퇴는 어떻게 하나요?<em></em></label>
	<div><p>로그인 후 마이페이지 > 개인정보수정 > 하단의 탈퇴버튼을 클릭해주시면 됩니다.</p></div>
</div>
 
<%@include file="Footer.jsp" %>

</body>

</html>
