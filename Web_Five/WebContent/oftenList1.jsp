<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주 묻는 질문[전체보기]</title>
<script src="./js/jquery-3.3.1.min.js"></script>
	<style>
		* {margin:0; padding:0;}
		#accordion {position:relative;left:50%;transform:translateX(-50%);width:800px; margin-bottom: 20px; margin-top: 20px;}
		input[id*="answer"] {display:none;}
		input[id*="answer"] + label
		 {display:block;padding:20px;border:1px solid white;border-bottom:0;color:#fff;font-weight:900;background:#6fa168
		 ;cursor:pointer;position:relative;}
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
	<label for="answer01">비회원도 주문 가능한가요?<em></em></label>
	<div><p>저희 미쁘다 홈페이지는 비회원 주문이 불가능합니다.</p></div>
	
	<input type="radio" name="accordion" id="answer02">
	<label for="answer02">주문을 취소하려면 어떻게 해야 하나요?<em></em></label>
	<div><p>
	홈페이지 상단,우측 마이페이지 -> 주문/배송조회에서, <br>
결제완료 상태 주문건은 고객님께서 마이페이지에서 직접 취소 하실수 있습니다.<br>
* 무통장입금 취소 시에는 직접 계좌정보를 입력가능하고<br>
  한번 입력된 계좌정보는 수정 및 취소 불가하오니 이점 유념하셔서 이용부탁드립니다. <br>

* 실시간계좌이체 취소는 결제하신 계좌로 환불이 됩니다.<br>
※ 환불요청후 2~7일후에 고객님 통장으로 환불이 됩니다.(주말/공휴일제외) <br>
배송준비단계부턴 Q&A 게시판 혹은 고객센터(02-1227-0102) 로 연락주셔야 합니다.<br>
준비된 상품은 오전부터 배송출고가 되기에<br>
상품 취소를 하실경우 오후 12시 이전으로 알려주셔야 처리해드릴수 있습니다.<br>
상품이 먼저 출고되고 나중에 배송문자가 들어갑니다. 배송준비중이라도 오후 12시 이후엔 취소가 어려우시니 이점 착오 없으시길 부탁드립니다.<br>
	</p></div>
	
	<input type="radio" name="accordion" id="answer03">
	<label for="answer03">입금확인 되었는지 확인해보고 싶습니다.<em></em></label>
	<div><p>입금확인 된경우 [마이페이지의 주문/배송조회] 에서 조회하실 수 있습니다.
정상적으로 확인되면 홈페이지에 등록된 핸드폰번호로 문자 발송됩니다.</p></div>
	<input type="radio" name="accordion" id="answer04">
	<label for="answer04">무통장 입금 하려는데 계좌번호가 알고싶어요<em></em></label>
	<div><p>국민은행 350601-04-281109<br>예금주 : 박지은<br>

</p></div>

<input type="radio" name="accordion" id="answer04">

	<label for="answer04">가입 후에 아이디를 변경할 수 있나요?<em></em></label>
	<div><p>
 	한 번 가입한 아이디는 변경이 불가합니다.<br>회원 가입 시 기재한 아이디는 변경이 불가합니다.<br>반드시 아이디 변경이 필요한 경우 탈퇴 후 재가입 처리가 필요합니다.<br><br>
 	궁금하신 사항은 언제든지 고객지원센터 1:1게시판으로 문의해주세요.	<a href="#">[문의하기]</a>
 	</p></div>
	<input type="radio" name="accordion" id="answer05">
	<label for="answer05">주소와 전화번호등 개인정보 변경은 어떻게 하나요?<em></em></label>
	<div><p>전화번호 및 주소등 개인정보 변경을 하실경우엔 사이트-마이페이지-개인정보수정에서 변경해주시면 됩니다.</p></div>
	
	
	<input type="radio" name="accordion" id="answer06">
	<label for="answer06">ID와 비밀번호를 잊어버렸어요!
	<em></em></label>
	<div><p>
	＊ 아이디를 잊어버렸을경우<br>
	로그인-아이디 찾기-> 이름,이메일 입력-> 아이디 바로 확인됩니다.<br><br>
	
	＊ 비밀번호를 잊어버렸을경우<br>
	
	로그인-비밀번호 찾기-> 이름, 아이디, 이메일 입력-> 비밀번호가 바로 확인됩니다.<br><br>
	
	아이디는 가입 하셨던분의 성함과 이메일 주소로 확인이 가능 합니다.<br>
	위와 같이 하셨는데도 확인이 어려울실경우,<br>
	미쁘다 고객센터(02-1227-0102)로 전화를 주시면 확인하여 도움 드리겠습니다.</p></div>
	
	<input type="radio" name="accordion" id="answer07">
	<label for="answer07">회원 가입은 어떻게 하나요?<em></em></label>
	<div><p>사이트 상단 로그인을 클릭해주세요.</p></div>
	
	<input type="radio" name="accordion" id="answer08">
	<label for="answer08">회원 탈퇴는 어떻게 하나요?<em></em></label>
	<div><p>로그인 후 마이페이지 > 개인정보수정 > 하단의 탈퇴버튼을 클릭해주시면 됩니다.</p></div>

<input type="radio" name="accordion" id="answer09">
	<label for="answer09">주문 후 상품을 받아보기까지 얼마나 걸리나요?<em></em></label>
	<div><p>주문제작 상품(7~10일,공휴일제외)을 제외한 대부분의 상품은 배송준비중 으로 부터 3~5일(공휴일제외)정도 소요 되십니다.<br>
* 품절,지연시 따로 연락드리고 있습니다.<br>
단, 목요일의 경우 입금마감시간 5시 이후에 주문건의 경우는<br>
금요일 주문건으로 처리되어 준비된 상품은 토요일에 배송되어 돌아오는 월요일에 수령 가능하십니다.	</p></div>

	<input type="radio" name="accordion" id="answer10">
	<label for="answer10">배송지연은 몇일이 걸리는 건가요?<em></em></label>
	<div><p>일반배송기간은 3-5일정도 소요됩니다.(주문제작 및 재고소진후 제작되는 상품은 7~15일정도 더 소요)<br>
보통은 지연문자나 메일을 드린후 이틀내로 상품준비가 되어 배송되지만<br>
상품재고가 없어 상품을 새로이 제작하는 경우등은 7-15일정도 걸리기도 합니다.<br>
※지연안내는 결제후 2일째 되는날부터 문자로 보내드리고 있습니다.<br>
기다리시기가 불편하실경우 다른 상품으로도 교환가능하시오니<br>
변경사항이 있으신 경우 저희쪽에 미리 연락을 주셔도 됩니다.</p></div>

	<input type="radio" name="accordion" id="answer11">
	<label for="answer11">배송비는 얼마인가요?<em></em></label>
	<div><p>저희 미쁘다의 상품의 배송비는 2,500원입니다.</p></div>
	
	<input type="radio" name="accordion" id="answer12">
	<label for="answer12">배송준비중인데 취소하고 싶습니다.<em></em></label>
	<div><p>오후 12시 이전 Q&A 게시판 혹은 고객센타(02-1227-0102) 로 연락주셔야 합니다.<br>
준비된 상품은 오후 부터 모두 배송출고가 되기에<br>
상품 취소를 하실경우 오후 12시 이전으로 알려주셔야 처리해드릴수 있습니다.<br>
(상품이 먼저 출고되고 나중에 배송문자 발송됩니다. 배송준비중이라도 오후 12시 이후엔 취소가 어려우시니 이점 착오 없으시길 바랍니다.)</p></div>

<input type="radio" name="accordion" id="answer13">
	<label for="answer13">	배송지연 연락은 언제주시나요?<em></em></label>
	<div><p>주문건 배송준비된 상태에서 2일째 되는날부터<br>
	순차적으로 지연문자로 안내 드리고 있습니다.<br>
	때문에 미리 지연여부 확인을 원하시는 고객님들께서는<br>
	배송준비 다음날 문의주시면 지연상품이 있는지 확인이 가능하십니다.	</p></div>
<input type="radio" name="accordion" id="answer14">
	<label for="answer14">할인쿠폰 및 적립금<em></em></label>
	<div><p>저희 미쁘다는 할인쿠폰 및 적립금은 따로 없습니다.</p></div>
	<input type="radio" name="accordion" id="answer14
	">
	<label for="answer14">미쁘다는 어떤 홈페이지인가요?<em></em></label>
	<div><p>메뉴 상단 왼쪽에 보시면 미쁘다? 라는 메뉴를 클릭하시면 저희 홈페이지에 대한 설명이 뜹니다.</p></div>

</div>

	 
<%@include file="Footer.jsp" %>

</body>

</html>
