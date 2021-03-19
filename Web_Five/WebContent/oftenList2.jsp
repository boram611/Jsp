<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주 묻는 질문[주문/결제]</title>
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
		input[id*="answer"]:checked + label + div {max-height:400px;}
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


</div>
 
<%@include file="Footer.jsp" %>

</body>

</html>
