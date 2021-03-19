<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 수정</title>
<link href="css/member.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"> 
<script src="//code.jquery.com/jquery.min.js"></script>
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

// 영문
var replaceEng = /[a-zA-z]/gi;

// 아이디 중복 버튼 체크 확인
var checkBtn = '';

// 비밀번호 일치 여부
var checkPw = -1;

var checkEmail = null;

var return_Check_DuplEmailValue = <%=session.getAttribute("checkValue")%>;

var beforeEmail = "<%=session.getAttribute("beforeEmail3")%>";

var chkValue = 0;

var noUpdateValue = 0;

var checkOk = 0;

var tryCheck = 0;

var tryCheckEmail = 0;

document.addEventListener('keydown', function(event) {
	  if (event.keyCode === 13) {
	    event.preventDefault();
	  };
	}, true);
$(function() {
	
	
	  $( "#Date" ).datepicker({
	    dateFormat: 'yy-mm-dd',
	   	changeMonth: true,
	   	changeYear: true,
	   	monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], // 월의 한글 형식.
	   	dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], // 요일의 한글 형식.
	    yearRange: 'c-100:c',
	    minDate: '-100y',


	  });
	});
	$("#Date").datepicker({

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

$(document).ready(function(){
    
    $("#useremail1").on("focusout", function() {
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
    
    $("#useremail2").on("focusout", function() {
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

$(document).ready(function(){
    
    $("#id").on("focusout", function() {
        var x = $(this).val();
        if (x.length > 0) {
            if (x.match(replaceChar) || x.match(replaceNotFullKorean) || x.match(replaceFullKorean)) {
                x = x.replace(replaceChar, "").replace(replaceNotFullKorean, "").replace(replaceFullKorean, "");
            }
            $(this).val(x);
        }
        }).on("keyup", function() {
            $(this).val($(this).val().replace(replaceChar, "").replace(replaceNotFullKorean, "").replace(replaceFullKorean, ""));

   });

});




$(document).ready(function(){
    
    $("#rrn1").on("focusout", function() {
        var x = $(this).val();
        if (x.length > 0) {
            if (x.match(replaceChar) || x.match(replaceNotFullKorean) || x.match(replaceEng)) {
                x = x.replace(replaceChar, "").replace(replaceNotFullKorean, "").replace(replaceEng, "");
            }
            $(this).val(x);
        }
        }).on("keyup", function() {
            $(this).val($(this).val().replace(replaceChar, "").replace(replaceNotFullKorean, "").replace(replaceEng, ""));

   });

});

$(document).ready(function(){
    
    $("#rrn2").on("focusout", function() {
        var x = $(this).val();
        if (x.length > 0) {
            if (x.match(replaceChar) || x.match(replaceNotFullKorean) || x.match(replaceEng)) {
                x = x.replace(replaceChar, "").replace(replaceNotFullKorean, "");
            }
            $(this).val(x);
        }
        }).on("keyup", function() {
            $(this).val($(this).val().replace(replaceChar, "").replace(replaceNotFullKorean, "").replace(replaceEng, ""));

   });

});



$(document).ready(function(){
    
    $("#username").on("focusout", function() {
        var x = $(this).val();
        if (x.length > 0) {
            if (x.match(replaceChar) || x.match(replaceNotFullKorean) || x.match(replaceInt)) {
                x = x.replace(replaceChar, "").replace(replaceNotFullKorean, "").replace(replaceInt, "");
            }
            $(this).val(x);
        }
        }).on("keyup", function() {
            $(this).val($(this).val().replace(replaceChar, "").replace(replaceNotFullKorean, "").replace(replaceInt, ""));
        	
            
	
   });

});

$(document).ready(function(){
    
    $("#usertel1").on("focusout", function() {
        var x = $(this).val();
        if (x.length > 0) {
            if (x.match(replaceChar) || x.match(replaceNotFullKorean) || x.match(replaceEng) || x.match(replaceFullKorean)) {
                x = x.replace(replaceChar, "").replace(replaceNotFullKorean, "").replace(replaceEng, "").replace(replaceFullKorean, "");
            }
            $(this).val(x);
        }
        }).on("keyup", function() {
            $(this).val($(this).val().replace(replaceChar, "").replace(replaceNotFullKorean, "").replace(replaceEng, "").replace(replaceFullKorean, ""));
        	
            
	
   });

}); 
$(document).ready(function(){
    
    $("#usertel2").on("focusout", function() {
        var x = $(this).val();
        if (x.length > 0) {
            if (x.match(replaceChar) || x.match(replaceNotFullKorean) || x.match(replaceEng) || x.match(replaceFullKorean)) {
                x = x.replace(replaceChar, "").replace(replaceNotFullKorean, "").replace(replaceEng, "").replace(replaceFullKorean, "");
            }
            $(this).val(x);
        }
        }).on("keyup", function() {
            $(this).val($(this).val().replace(replaceChar, "").replace(replaceNotFullKorean, "").replace(replaceEng, "").replace(replaceFullKorean, ""));
        	
            
	
   });

}); 
$(document).ready(function(){
    
    $("#usertel3").on("focusout", function() {
        var x = $(this).val();
        if (x.length > 0) {
            if (x.match(replaceChar) || x.match(replaceNotFullKorean) || x.match(replaceEng) || x.match(replaceFullKorean)) {
                x = x.replace(replaceChar, "").replace(replaceNotFullKorean, "").replace(replaceEng, "").replace(replaceFullKorean, "");
            }
            $(this).val(x);
        }
        }).on("keyup", function() {
            $(this).val($(this).val().replace(replaceChar, "").replace(replaceNotFullKorean, "").replace(replaceEng, "").replace(replaceFullKorean, ""));
        	
            
	
   });

}); 



function selectEmail(ele){ 
	var $ele = $(ele); 
	var $email2 = $('input[name=useremail2]'); 
	if($ele.val() == "WRITE HERE"){ 
		$email2.attr('readonly', false); 
		$email2.val(''); 
		$("#useremail2").attr("placeholder", "WRITE HERE");	
		$('#useremail2').focus();
	} 
	else { 
		$email2.attr('readonly', true); 
		$email2.val($ele.val()); } }
		
function validate() {
    var re = /^[a-zA-Z0-9]{4,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식 이용해서 아이디 패스워드 체크하기
    
    
    
    var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    // 이메일이 적합한지 검사할 정규식

    var num1 = document.getElementById("rrn1");
    var num2 = document.getElementById("rrn2");
    var rrn1 = document.getElementById("rrn1").value;
    var rrn2 = document.getElementById("rrn2").value;

    var arrNum1 = new Array(); // 주민번호 앞자리숫자 6개를 담을 배열
    var arrNum2 = new Array(); // 주민번호 뒷자리숫자 7개를 담을 배열

    // -------------- 주민번호 -------------

    for (var i=0; i<num1.value.length; i++) {
        arrNum1[i] = num1.value.charAt(i);
    } // 주민번호 앞자리를 배열에 순서대로 담는다.

    for (var i=0; i<num2.value.length; i++) {
        arrNum2[i] = num2.value.charAt(i);
    } // 주민번호 뒷자리를 배열에 순서대로 담는다.

    var tempSum=0;

    for (var i=0; i<num1.value.length; i++) {
        tempSum += arrNum1[i] * (2+i);
    } // 주민번호 검사방법을 적용하여 앞 번호를 모두 계산하여 더함

    for (var i=0; i<num2.value.length-1; i++) {
        if(i>=2) {
            tempSum += arrNum2[i] * i;
        }
        else {
            tempSum += arrNum2[i] * (8+i);
        }
    } // 같은방식으로 앞 번호 계산한것의 합에 뒷번호 계산한것을 모두 더함

    if((rrn1.length > 0 && rrn2.length > 0) && (11-(tempSum%11))%10!=arrNum2[6]) {
        document.getElementById('validRRN').innerHTML='올바른 주민등록번호가 아닙니다.';
        document.getElementById('validRRN').style.color='red';
        num1.value = "";
        num2.value = "";
        num1.focus();
        return false;
    }else if((rrn1.length == 6 && rrn2.length == 7) && (11-(tempSum%11))%10==arrNum2[6]){
        document.getElementById('validRRN').innerHTML='올바른 주민등록번호입니다.';
        document.getElementById('validRRN').style.color='blue';
    }
    
   	
}

function check(re, what, message) {
    if(re.test(what.value)) {
        return true;
    }
    alert(message);
    what.value = "";
    what.focus();
    //return false;
}

function check_id() {
	var id = document.getElementById('id').value;
	
	if((id.length > 0 && id.length < 4) || id.length > 15){
	        window.alert('아이디는 4글자 이상, 15글자 이하만 이용 가능합니다.');
	        document.getElementById('id').value='';
	        $('#id').focus();
	    	document.getElementById('nullId').innerHTML='아이디를 입력해주세요.';
            document.getElementById('nullId').style.color='red';
	    }else if(id.replace(/ /gi, "").length != id.length){
	    	window.alert('아이디에는 공백을 사용하실 수 없습니다.');
		    document.getElementById('id').value='';
	        $('#id').focus();
	    }else{
	    	document.getElementById('nullId').innerHTML='';
	    	document.getElementById('pwCheck2').innerHTML='입력해주세요.';
            document.getElementById('pwCheck2').style.color='red';
            document.getElementById('pwCheck1').innerHTML='입력해주세요.';
            document.getElementById('pwCheck1').style.color='red';
            $('#pw1').focus();
	    }	
}



function check_pw(){
    var pw1 = document.getElementById('pw1').value;
    var pw2 = document.getElementById('pw2').value;
	var id = document.getElementById('id').value;

   if(pw1.replace(/ /gi, "").length != pw1.length){
    	window.alert('비밀번호에는 공백을 사용하실 수 없습니다.');
	    document.getElementById('pw1').value='';
	    document.getElementById('pw2').value='';
	    
	    $('#pw1').focus();
    }else if((pw1.length > 0 && pw1.length < 8) || pw1.length > 20){
        window.alert('비밀번호는 8글자 이상, 20글자 이하만 이용 가능합니다.');
        document.getElementById('pw1').value='';
        document.getElementById('pw2').value='';
      
        $('#pw1').focus();
       
    }
  

    if(document.getElementById('pw1').value !='' && document.getElementById('pw2').value!=''){
        if(document.getElementById('pw1').value==document.getElementById('pw2').value){
            document.getElementById('pwCheck2').innerHTML='비밀번호가 일치합니다.'
            document.getElementById('pwCheck2').style.color='blue';
            document.getElementById('nullUserName').innerHTML='입력해주세요.';
            document.getElementById('nullUserName').style.color='red';
            $('#username').focus();
        }
        else{
            document.getElementById('pwCheck2').innerHTML='비밀번호가 일치하지 않습니다.';
            document.getElementById('pwCheck2').style.color='red';
            $('#pw1').focus();
        }
    }
    if(pw1.length > 0){
            document.getElementById('pwCheck1').innerHTML='';
            $('#pw2').focus();
    }
    
  
    if(pw2.length > 0){
            $('#pw2').focus();
    }
    
    if(pw1.length == 0){
    	document.getElementById('pwCheck1').innerHTML='입력해주세요.';
        document.getElementById('pwCheck1').style.color='red';
    }
    if(pw2.length == 0){
    	document.getElementById('pwCheck2').innerHTML='입력해주세요.';
        document.getElementById('pwCheck2').style.color='red';
    }
    
    
    
}


function check_name() {
	var username = document.getElementById('username').value;
	
	
	   if(username.replace(/ /gi, "").length != username.length){
	    	window.alert('이름에는 공백을 사용하실 수 없습니다.');
		    document.getElementById('username').value='';
		    $('#username').focus();
	    }else if(isNaN(username) == false){
		    document.getElementById('username').value='';
		    $('#username').focus();
	    }else{
	    	 document.getElementById('nullUserName').innerHTML='';
	    	 document.getElementById('nullUserBirth').innerHTML='입력해주세요.';
	         document.getElementById('nullUserBirth').style.color='red';
	         $('#Date').focus();
	    }
	
	   if(username.length == 0){
		   document.getElementById('nullUserName').innerHTML='입력해주세요.';
           document.getElementById('nullUserName').style.color='red';
           document.getElementById('nullUserBirth').innerHTML='';
           $('#username').focus();
	   }
}

function check_Birth(){
	var birth = document.getElementById('Date').value;
	var username = document.getElementById('username').value;
	
		if(username.length > 0 && birth.length == 0){
			document.getElementById('nullUserBirth').innerHTML='';
			document.getElementById('nullUserAdd').innerHTML='입력해주세요.';
	        document.getElementById('nullUserAdd').style.color='red';
	        $('#zipNo').focus();
	        
		}else{
			
		}
		if(birth.length == 0){
			document.getElementById('nullUserBirth').innerHTML='입력해주세요.';
	        document.getElementById('nullUserBirth').style.color='red';
			document.getElementById('nullUserAdd').innerHTML='';
		}
}

function check_Add(){
	var zipNo = document.getElementById('zipNo').value;
	var birth = document.getElementById('Date').value;
	
		if(birth.length > 0 && zipNo.length == 0){
			document.getElementById('nullUserAdd').innerHTML='';
			document.getElementById('nullUserTel').innerHTML='입력해주세요.';
	        document.getElementById('nullUserTel').style.color='red';
	        $('#userTel1').focus();
		}else{
			
		}
		if(zipNo.length == 0){
			document.getElementById('nullUserAdd').innerHTML='입력해주세요.';
	        document.getElementById('nullUserAdd').style.color='red';
			document.getElementById('nullUserTel').innerHTML='';
		}
}
function check_Tel(){
	var tel1 = document.getElementById('userTel1').value;
	var tel2 = document.getElementById('userTel2').value;
	var tel3 = document.getElementById('userTel3').value;
	
		if(tel1.length > 0 && tel2.length > 0 && tel3.length > 0){
			document.getElementById('nullUserTel').innerHTML='';
			document.getElementById('nullUserEmail').innerHTML='입력해주세요.';
	        document.getElementById('nullUserEmail').style.color='red';
	        $('#useremail1').focus();
		}else{
		}
}
function check_Email(){
	var email1 = document.getElementById('useremail1').value;
	var email2 = document.getElementById('useremail2').value;
	
	if(email1.replace(/ /gi, "").length != email1.length || email2.replace(/ /gi, "").length != email2.length){
		window.alert('이메일에는 공백을 사용하실 수 없습니다.');
    	$('#useremail1').focus();
	}else if(email1.length == 0){
			 $('#useremail1').focus();
	}
}


function check_rrn1() {
	var rrn1 = document.getElementById('rrn1').value;
	var rrn2 = document.getElementById('rrn2').value;
	
	
	   if(rrn1.replace(/ /gi, "").length != rrn1.length){
	    	window.alert('주민번호에는 공백을 사용하실 수 없습니다.');
		    document.getElementById('rrn1').value='';
	    }else if(isNaN(rrn1) == true){
		    document.getElementById('rrn1').value='';
	    }else{
	    	
	    }
	  if(rrn1.length == 0 || rrn2.length == 0){
	    	document.getElementById('validRRN').innerHTML=''
	    }
	
}
function check_rrn2() {
	var rrn2 = document.getElementById('rrn2').value;
	var rrn1 = document.getElementById('rrn1').value;
	
	
	   if(rrn2.replace(/ /gi, "").length != rrn2.length){
	    	window.alert('주민번호에는 공백을 사용하실 수 없습니다.');
		    document.getElementById('rrn2').value='';
	    }else if(isNaN(rrn2) == true){
		    document.getElementById('rrn2').value='';
	    }else{
	    	
	    }
	   
	   if(rrn1.length <= 5 || rrn2.length <= 6){
	    	document.getElementById('validRRN').innerHTML='주민등록번호를 입력해주세요.';
	    }
	
}

function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("jusoPopup.jsp","pop", 'left='+(screen.availWidth-570)/2+',top='+(screen.availHeight-420)/2+', width=570px,height=420px', "width=570,height=420, scrollbars=yes, resizable=yes"); 
	
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}
function jusoCallBack(roadAddrPart1,addrDetail,zipNo){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	document.form.roadAddrPart1.value = roadAddrPart1;
	document.form.addrDetail.value = addrDetail;
	document.form.zipNo.value = zipNo;

	
}

window.onload = function check_Dupl(){
	console.log('TCE2 : ' + sessionStorage.getItem("TCE2"));
	console.log('UpdateOk : ' + sessionStorage.getItem("UpdateOk"));
	var TCE2 = sessionStorage.getItem("TCE2");
	var UpdateOk = sessionStorage.getItem("UpdateOk");

	
	if(TCE2 == 1){
		if(return_Check_DuplEmailValue == true){
			alert('사용가능한 이메일입니다.');
		}else{
			alert('중복된 이메일입니다.');
		}
		sessionStorage.setItem("TCE2", 0); 
	}
	
	
	if(UpdateOk == 1){
		alert('수정이 완료되었습니다.');
	}
	
}


function check(){

	var userPw1 = document.getElementById('pw1').value;
	var userPw2 = document.getElementById('pw2').value;
	var userName = document.getElementById('username').value;
	var userBirth = document.getElementById('Date').value;
	var zipNo = document.getElementById('zipNo').value;
	var roadAddrPart1 = document.getElementById('roadAddrPart1').value;
	var addrDetail = document.getElementById('addrDetail').value;
	var userTel1 = document.getElementById('usertel1').value;
	var userTel2 = document.getElementById('usertel2').value;
	var userTel3 = document.getElementById('usertel3').value;
	var userEmail1 = document.getElementById('useremail1').value;
	var userEmail2 = document.getElementById('useremail2').value;
	var selectOption = document.getElementById('select_email');
	selectOption = selectOption.options[selectOption.selectedIndex].value;
	var findString = ".";

	console.log('이메일 체크 결과 selectOption : ' + selectOption);
	console.log('이메일 : ' + userEmail2.indexOf('.'));
	
	if(userPw1.length == 0 || userPw2.length == 0){
		document.getElementById('pwCheck2').innerHTML='';
		alert('비밀번호를 입력해주세요.');
		return false;
	}else if(userName.length == 0){
		alert('이름을 입력해주세요.');
		return false;
	}else if(userBirth.length == 0){
		alert('생일을 입력해주세요.');
		return false;
	}else if(zipNo.length == 0 || roadAddrPart1 == 0){
		alert('주소를 입력해주세요.');
		return false;
	}else if(addrDetail.length == 0){
		alert('상세주소를 입력해주세요.');
		return false;
	}else if(userTel1.trim().length != userTel1.length || userTel2.trim().length != userTel2.length || userTel3.trim().length != userTel3.length){
		alert('연락처에는 공백을 입력하실 수 없습니다.');
		return false;
	}else if(userTel1.length < 2 || userTel2.length < 3 || userTel3.length != 4){
		alert('올바른 연락처를 입력해주세요.');
		return false;
	}else if(userEmail1.length == 0 || userEmail2.length == 0){
		alert('이메일을 입력해주세요.');
		return false;
	}else if(userEmail2.indexOf('.') == -1 || userEmail2.length < 5){
		alert('올바른 이메일 형식으로 입력해주세요.');
		return false;
	}else if(return_Check_DuplEmailValue == null && tryCheckEmail == 2){ // 이메일 중복확인 안했을 때
		alert('이메일 중복확인을 해주세요.');
		return false;
	}else if(tryCheckEmail == 1){
		return true;
	}else if(tryCheckEmail == 2){
		alert('이메일 중복확인을 해주세요');
		return false;
	}else if(return_Check_DuplEmailValue == false){ // 중복된 이메일 
		alert('중복된 이메일은 사용하실 수 없습니다.');
		return false;
	}

	
	
}


function tryCheckE(){
	tryCheckEmail = 1;
	sessionStorage.setItem("TCE2", 1);
	sessionStorage.setItem("UpdateOk", 0); 
	
}
function changetryCheckEmail(){
	tryCheckEmail = 2;
}

function tryUpdate(){
	sessionStorage.setItem("UpdateOk", 1); 
}

function noUpdate(){
	sessionStorage.setItem("UpdateOk", 0); 
}



</script>
<style>
#home3{
width:150px;
line-height:36px;
height: 36px;
 background-color:#fff;
	border:2px solid pink;
	text-align:center;
	border-radius:2px;
	float: left;
	margin-right: 10px;
	margin-top: 10px;
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
#main{
margin-left: auto;
margin-right: auto;
width: 850px;
margin-bottom: 20px;
padding-bottom: 30px;
}
</style>
</head>
<body>
<%@include file="myPageView.jsp" %>
<c:set var = "fieldCheck" value="${userDto.checkMsg }"></c:set>
<div id="main">
<h2>&nbsp;나의 프로필 수정</h2>
<form name="form" id="form" action="myPageSelect.jsp" method="post" onsubmit="return check()" >
<td>
<table width="810" border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td align="left">
    <table width="810" border="0" cellspacing="0" cellpadding="0">
    <hr>
<tr>
<td width="19"height="43"></td>
<td width="140" align="left" class="insert_text"> 아이디</td>
<td width="170"><input type="text" name="userid" id="id" size="12" maxlength="15" value="${userDto.userId}" onchange="check_id();" placeholder="YOUR ID" readonly="readonly" style="color:#757575; font-size:12px; width:150px; height:27px;"/></td>
<td width="11"></td>
<td width="470" align="left">
</tr>
<tr height="1">
<td colspan="5" bgcolor="#cccccc"></td>
</tr>
<tr>
<td height="43"></td>
<td align="left" class="insert_text">패스워드</td>
<td width="170"><input type="password" name="userpw1" id="pw1" size="12" maxlength="20" value="${userDto.userPw2}" onchange="check_pw()" placeholder="YOUR PW" style="color:#757575; font-size:12px; width:150px; height:27px;"/>
                        <td></td>
                        <td align="left"></td>
                      </tr>
<tr height="1">
<td></td>
</tr>
<tr>
<td height="43"></td>
<td align="left" class="insert_text">패스워드 확인</td>
<td width="170"><input type="password" name="userpw2" id="pw2" size="12" maxlength="20" value="${userDto.userPw2}" onchange="check_pw()" placeholder="CONFIRM PW" style="color:#757575; font-size:12px; width:150px; height:27px;"/></td>
                        <td></td>
                        <td align="left"></td>
                      </tr>
					
                      <tr height="1">
                        <td colspan="5" bgcolor="#cccccc"></td>
                      </tr>
					  <tr>
                        <td height="43"></td>
                        <td align="left" class="insert_text">이름</td>
                        <td width="170"><input type="text" name="username" id="username" size="12" value="${userDto.userName}" maxlength="15" onchange="check_name()" placeholder="YOUR NAME" pattern="[^!@#$%^&*()_-+=[]{}~?:;`|/<>'"]+" style="color:#757575; font-size:12px; width:150px; height:27px;"/></td>
                        <td></td>
                        <td align="left"></td>
                      </tr>
                      <tr height="1">
                        <td colspan="5" bgcolor="#cccccc"></td>
                      </tr>
				
                      <tr height="1">
                        <td colspan="5" bgcolor="#cccccc"></td>
                      </tr>
                       <tr>
                        <td height="43"></td>
                        <td align="left" class="insert_text">생년월일</td>
                        <td colspan="3">
						<input type="text" id="Date" name="userBirth" placeholder="YOUR BIRTH" value="${userDto.userBirth}" onchange="check_Birth()" readonly="readonly" size=15 style="height:27px;">  &nbsp;
				
			</td>
						<td align="left"></td>
                      </tr>
                      
                      <tr height="1">
                        <td colspan="5" bgcolor="#cccccc"></td>
                      </tr>
                       <tr>
                        <td height="43"></td>
                        <td align="left" class="insert_text">주소(빈칸 클릭)</td>
                        <td width="170"><input placeholder="ADDRESS(CLICK HERE)" type="text" id="zipNo" name="zipNo" value="${userDto.beforeUserAddress1}" onclick="goPopup();" onchange="check_Add()" readonly="readonly" style="color:#757575; font-size:12px; width:150px; height:27px;"/></td>
                        <td></td>
                        <td align="left"></td>
                      </tr>
                       <tr height="1">
                        <td></td>
                      </tr>
                       <tr>
                        <td height="43"></td>
                        <td align="left" class="insert_text">도로명 주소</td>
                        <td colspan="5" width="170"><input placeholder="ROADNAME ADDRESS" type="text" id="roadAddrPart1" value="${userDto.beforeUserAddress2}" name="roadAddrPart1" readonly="readonly" style="color:#757575; font-size:12px; width:400px; height:27px;"/></td>
                        
                        <td align="left"></span></span>
						</td>
                      </tr>
                       <tr height="1">
                        <td></td>
                      </tr>
                       <tr>
                        <td height="43"></td>
                        <td align="left" class="insert_text">상세주소</td>
                        <td colspan="5" width="170"><input placeholder="DETAILED ADDRESS" type="text" id="addrDetail" value="${userDto.beforeUserAddress3}"  name="addrDetail"  style="color:#757575; font-size:12px; width:400px; height:27px;"/></td>
                        <td align="left"></span></span>
						</td>
                      </tr>
                     	<!-- ******************************* -->
                     
                      <tr height="1">
                        <td colspan="5" bgcolor="#cccccc"></td>
                      </tr>
                      <tr>
                        <td height="43"></td>
                        <td align="left" class="insert_text">휴대폰번호</td>
                        <td colspan="3">
						<table border="0">
							<tr>
								<td>
								<input type="text" name="tel1" id="usertel1" value="${userDto.beforeUserTel1}" placeholder="ex)010" size="7" maxlength="3" style="font-size:12px; width:60px; height:27px;">
								
								</td>
								<td>&nbsp;-&nbsp;</td>
								<td>
								<input type="text" name="tel2" id="usertel2" value="${userDto.beforeUserTel2}" placeholder="ex)1234" size="7" maxlength="4" style="color:#757575; font-size:12px; width:60px; height:27px;"/>
								</td>
								<td>&nbsp;-&nbsp;</td>
								<td>
								<input type="text" name="tel3" id="usertel3" value="${userDto.beforeUserTel3}" placeholder="ex)5678" size="7" maxlength="4" onchange="check_Tel()" style="color:#757575; font-size:12px; width:60px; height:27px;"/>
								</td>
								<td align="left"></td>
							</tr>
						</table>
						</td>
                      </tr>
                      <tr height="1">
                        <td colspan="5" bgcolor="#cccccc"></td>
                      </tr>
                      <tr>
                        <td height="43"></td>
                        <td align="left" class="insert_text">이메일</td>
                        <td colspan="3">
						<table>
							<tr>
								<td valign="top" style="padding-top:10px;">
								<input type="text" placeholder="YOUR EMAIL" name="useremail1" id="useremail1" value="${userDto.beforeUserEmail1}" onchange="check_Email()" size="15" maxlength="29" style="color:#757575; font-size:12px; vertical-align:top; width:150px; height:27px;"/>
								&nbsp;@ &nbsp;
								</td>
								<td style="padding-top:5px;"> <input type="text" placeholder="SELECT =>" name="useremail2" id="useremail2" value="${userDto.beforeUserEmail2}" readonly="readonly" size="8" maxlength="20" onchange="check_Email()" style="color:#757575; font-size:12px; vertical-align:top; width:150px; height:27px;"></td>
								
								<td style="line-height:220%; padding-top:6px; padding-bottom:3px;">
								<select name="select_email" id="select_email" onchange="selectEmail(this); changetryCheckEmail();" style="width:150px; height:27px;">
									<option value="SELECT =>">선택</option>
									<option value="naver.com">naver.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="nate.com">nate.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="daum.net">daum.net</option>
									<option value="hotmail.com">hotmail.com</option>
									<option value="WRITE HERE">직접입력</option>
								</select>
								<input type="submit" value="이메일 중복확인" name="click" onclick="tryCheckE()">
								<td align="left"></td>
								</td>
							</tr>
						</table>
						</td>
                      </tr>
                      <tr height="1">
                      </tr>
                      <tr height="1">
                        <td colspan="5" bgcolor="black"></td>
                      </tr>
                    </table></td>
                </tr>
            </table></td>
          </tr>
  <div id="home3"><input type="submit" style="width: 150px; height: 36px;" name="click" id="joinUsBtn" value="수정" onclick="tryUpdate()"></div>
  <div id="home3"><input type="submit" style="width: 150px; height: 36px;" name="click" id="cancelBtn" value="회원탈퇴"></div>
  <div id="home3"><input type="submit" style="width: 150px; height: 36px;" name="click" id="backBtn" value="이전" onclick="noUpdate()"></div>
</form>
	<tr>
  <td>

   </td>
  </tr>
        </table>
		</td>
      </tr>
</div>
</body>
<%@include file="Footer1.jsp" %>
</html>