<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"> 
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script>
//특수문자 정규식 변수(공백 미포함)
var replaceChar = /[~!@\#$%^&*\()\-=+_'\;<>\/.\`:\"\\,\[\]?|{}]/gi;
var replaceChar2 = /[~!@\#$%^&*\()\-=+_'\;<>\/\`:\"\\,\[\]?|{}]/gi;

// 완성형 아닌 한글 정규식
var replaceNotFullKorean = /[ㄱ-ㅎㅏ-ㅣ]/g;

// 완성형 한글
var replaceFullKorean = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g;

// 숫자
var replaceInt = /[0-9]+$/g;

// 이메일 @
var replaceAt = /[@]/gi;

// 리턴받은 값
var resultId = '<%=request.getAttribute("id")%>';


$(document).ready(function(){
    
    $("#inputEmail1").on("focusout", function() {
        var x = $(this).val();
        if (x.length > 0) {
            if (x.match(replaceAt) || x.match(replaceNotFullKorean)) {
                x = x.replace(replaceAt, "").replace(replaceNotFullKorean, "");
            }
            $(this).val(x);
        }
        }).on("keyup", function() {
            $(this).val($(this).val().replace(replaceAt, "").replace(replaceNotFullKorean, ""));

   });

});

$(document).ready(function(){
    
    $("#inputEmail2").on("focusout", function() {
        var x = $(this).val();
        if (x.length > 0) {
            if (x.match(replaceChar2) || x.match(replaceNotFullKorean) || x.match(replaceFullKorean)) {
                x = x.replace(replaceChar2, "").replace(replaceNotFullKorean, "").replace(replaceFullKorean, "");
            }
            $(this).val(x);
        }
        }).on("keyup", function() {
            $(this).val($(this).val().replace(replaceChar2, "").replace(replaceNotFullKorean, "").replace(replaceFullKorean, ""));

   });

});

document.addEventListener('keydown', function(event) {
	  if (event.keyCode === 13) {
	    event.preventDefault();
	  };
	}, true);

$(function() {
	
	
	  $( "#inputBirth" ).datepicker({
	    dateFormat: 'yy-mm-dd',
	   	changeMonth: true,
	   	changeYear: true,
	   	monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], // 월의 한글 형식.
	   	dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], // 요일의 한글 형식.
	    yearRange: 'c-100:c',
	    minDate: '-100y',


	  });
	});
	$("#inputBirth").datepicker({

		  showOn: "both", // 버튼과 텍스트 필드 모두 캘린더를 보여준다.

		  buttonImage: "/application/db/jquery/images/calendar.gif", // 버튼 이미지

		  buttonImageOnly: true, // 버튼에 있는 이미지만 표시한다.

		  changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.

		  changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.

		  minDate: '-20y', // 현재날짜로부터 100년이전까지 년을 표시한다.

		  nextText: '다음 달', // next 아이콘의 툴팁.

		  prevText: '이전 달', // prev 아이콘의 툴팁.

		  numberOfMonths: [1,1], // 한번에 얼마나 많은 월을 표시할것인가. [2,3] 일 경우, 2(행) x 3(열) = 6개의 월을 표시한다.

		  stepMonths: 3, // next, prev 버튼을 클릭했을때 얼마나 많은 월을 이동하여 표시하는가. 

		  yearRange: 'c-100:c', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.

		  showButtonPanel: true, // 캘린더 하단에 버튼 패널을 표시한다. 

		  currentText: '오늘 날짜' , // 오늘 날짜로 이동하는 버튼 패널

		  closeText: '닫기',  // 닫기 버튼 패널

		  dateFormat: "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.

		  showAnim: "slide", //애니메이션을 적용한다.

		  showMonthAfterYear: true , // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 

		  dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], // 요일의 한글 형식.

		  monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], // 월의 한글 형식.

		  yearRange: "1920:2000" //연도 범위

		 });
	$(document).ready(function () {
	    $.datepicker.setDefaults($.datepicker.regional['ko']); 
	    $( "#startDate" ).datepicker({
	         changeMonth: true, 
	         changeYear: true,
	         nextText: '다음 달',
	         prevText: '이전 달', 
	         dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	         dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
	         monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	         dateFormat: "yymmdd",
	         maxDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
	         onClose: function( selectedDate ) {    
	              //시작일(startDate) datepicker가 닫힐때
	              //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
	             $("#endDate").datepicker( "option", "minDate", selectedDate );
	         }    

	    });
	    $( "#endDate" ).datepicker({
	         changeMonth: true, 
	         changeYear: true,
	         nextText: '다음 달',
	         prevText: '이전 달', 
	         dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	         dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
	         monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	         dateFormat: "yymmdd",
	         maxDate: 0,                       // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
	         onClose: function( selectedDate ) {    
	             // 종료일(endDate) datepicker가 닫힐때
	             // 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
	             $("#startDate").datepicker( "option", "maxDate", selectedDate );
	         }    

	    });    
	});

window.onload = function id(){
	console.log(resultId);

		
		if(resultId == ''){
			document.getElementById('resultId').value = '조건에 맞는 아이디가 존재하지 않습니다.';
		}
		if(resultId.length > 4){
			document.getElementById('resultId').value = '아이디는 < ' + '<%=request.getAttribute("id")%>' + ' >입니다.';
		}
	
	
}




function selectEmail(ele){ 
	var $ele = $(ele); 
	var $email2 = $('input[name=inputEmail2]'); 
	if($ele.val() == "WRITE HERE"){ 
		$email2.attr('readonly', false); 
		$email2.val(''); 
		$("#inputEmail2").attr("placeholder", "WRITE HERE");	
		$('#inputEmail2').focus();
	} 
	else { 
		$email2.attr('readonly', true); 
		$email2.val($ele.val()); } }

function check(){	
	var inputEmail1 = document.getElementById('inputEmail1').value;
	var inputEmail2 = document.getElementById('inputEmail2').value;
	var inputBirth = document.getElementById('inputBirth').value;
	
	if(inputEmail1.length == 0 || inputEmail2.length == 0){
		alert('이메일을 입력해주세요.');
		return false;
	}
	if(inputBirth.length == 0){
		alert('생년월일을 입력해주세요.');
		return false;
	}
}

</script>
<style>
#find{
background-color: #C3E2DD;
width: 570px;
height:270px;
margin-left: auto;
margin-right: auto;
}
th{
width:150px;
}
td{
width:400px;
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
	margin-left: 200px;
	margin-top: 30px;
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
width:250px;
line-height:36px;
height: 36px;
 margin-bottom:10px;
 background-color:#fff;
	border:2px solid pink;
	text-align:center;
	border-radius:2px;
	margin-left: 125px;
	margin-top: 30px;
}

#home2 a {
	text-decoration:none;
	display:block;
	color:black;
	font-family:midnight;
	font-size:18px;
}

#home2 a:hover {
	color:grey;
}
h2{
margin-top:30px;
margin-bottom: 15px;
}
tr{
height: 35px;
}

</style>
</head>
<body>
<div id="find">
<h2>미쁘다 아이디 찾기</h2>
회원가입 시 입력하신 이메일과 생년월일로 아이디를 찾으실 수 있습니다.<br>
	
	<form action="idFind.five" method="post" onsubmit="return check()">
	<table>
		<tr>
			<th>이메일 : </th>
			<td><input type="text" placeholder="YOUR EMAIL" name="inputEmail1" id="inputEmail1"  >&nbsp;@ &nbsp;
			<input type="text" placeholder="SELECT =>" name="inputEmail2" id="inputEmail2"  size="8" maxlength="20" readonly="readonly">
								
								<select name="select_em
								ail" id="select_email" onchange="selectEmail(this)">
									<option value="SELECT =>">선택</option>
									<option value="naver.com">naver.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="nate.com">nate.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="daum.net">daum.net</option>
									<option value="hotmail.com">hotmail.com</option>
									<option value="WRITE HERE">직접입력</option>
								</select></td>
		<tr>
			<th>생년월일 : </th>
			<td><input type="text" name="inputBirth" placeholder="YOUR BIRTH" id="inputBirth" size="10" maxlength="15" readonly="readonly"></td>
		</tr>
		<tr>
		<td colspan="3">
				<div id="home3">
				<input type="submit" style="width: 150px; height: 36px; background-color: white;" name="find" id="find" value="아이디 찾기"></div>
					</td>
		</tr>
		<tr>
			<th>아이디 :</th>
			 <td><input type="text" name="resultId" id="resultId" placeholder="ID" size="25"  readonly="readonly">
			
		</tr>
		

	
	</table>
	</form>
	</div>
	

</body>
</html>