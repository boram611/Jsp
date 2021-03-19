<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주 묻는 질문[배송관련]</title>
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
	<label for="answer01">주문 후 상품을 받아보기까지 얼마나 걸리나요?<em></em></label>
	<div><p>주문제작 상품(7~10일,공휴일제외)을 제외한 대부분의 상품은 배송준비중 으로 부터 3~5일(공휴일제외)정도 소요 되십니다.<br>
* 품절,지연시 따로 연락드리고 있습니다.<br>
단, 목요일의 경우 입금마감시간 5시 이후에 주문건의 경우는<br>
금요일 주문건으로 처리되어 준비된 상품은 토요일에 배송되어 돌아오는 월요일에 수령 가능하십니다.	</p></div>

	<input type="radio" name="accordion" id="answer02">
	<label for="answer02">배송지연은 몇일이 걸리는 건가요?<em></em></label>
	<div><p>일반배송기간은 3-5일정도 소요됩니다.(주문제작 및 재고소진후 제작되는 상품은 7~15일정도 더 소요)<br>
보통은 지연문자나 메일을 드린후 이틀내로 상품준비가 되어 배송되지만<br>
상품재고가 없어 상품을 새로이 제작하는 경우등은 7-15일정도 걸리기도 합니다.<br>
※지연안내는 결제후 2일째 되는날부터 문자로 보내드리고 있습니다.<br>
기다리시기가 불편하실경우 다른 상품으로도 교환가능하시오니<br>
변경사항이 있으신 경우 저희쪽에 미리 연락을 주셔도 됩니다.</p></div>

	<input type="radio" name="accordion" id="answer03">
	<label for="answer03">배송비는 얼마인가요?<em></em></label>
	<div><p>저희 미쁘다의 상품의 배송비는 2,500원입니다.</p></div>
	
	<input type="radio" name="accordion" id="answer04">
	<label for="answer04">배송준비중인데 취소하고 싶습니다.<em></em></label>
	<div><p>오후 12시 이전 Q&A 게시판 혹은 고객센타(02-1227-0102) 로 연락주셔야 합니다.<br>
준비된 상품은 오후 부터 모두 배송출고가 되기에<br>
상품 취소를 하실경우 오후 12시 이전으로 알려주셔야 처리해드릴수 있습니다.<br>
(상품이 먼저 출고되고 나중에 배송문자 발송됩니다. 배송준비중이라도 오후 12시 이후엔 취소가 어려우시니 이점 착오 없으시길 바랍니다.)</p></div>

<input type="radio" name="accordion" id="answer05">
	<label for="answer05">	배송지연 연락은 언제주시나요?<em></em></label>
	<div><p>주문건 배송준비된 상태에서 2일째 되는날부터<br>
	순차적으로 지연문자로 안내 드리고 있습니다.<br>
	때문에 미리 지연여부 확인을 원하시는 고객님들께서는<br>
	배송준비 다음날 문의주시면 지연상품이 있는지 확인이 가능하십니다.	</p></div>
</div>
 
<%@include file="Footer.jsp" %>

</body>

</html>
