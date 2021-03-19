<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제페이지</title>
<script src="./js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"> 
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script>

//특수문자 정규식 변수(공백 미포함)
var replaceChar = /[~!@\#$%^&*\()\-=+_'\;<>\/.\`:\"\\,\[\]?|{}]/gi;

//완성형 아닌 한글 정규식
var replaceNotFullKorean = /[ㄱ-ㅎㅏ-ㅣ]/g;

//완성형 한글
var replaceFullKorean = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g;

//숫자
var replaceInt = /[0-9]+$/g;

//영문
var replaceEng = /[a-zA-z]/gi;

//주문자 정보 동일
var submit = 0;

document.addEventListener('keydown', function(event) {
	  if (event.keyCode === 13) {
	    event.preventDefault();
	  };
	}, true);

$(document).ready(function(){
    
    $("#recieverName").on("focusout", function() {
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
    
    $("#receiverTel1").on("focusout", function() {
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
    
    $("#receiverTel2").on("focusout", function() {
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
    
    $("#receiverTel3").on("focusout", function() {
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
    
    $("#cardNum1").on("focusout", function() {
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
    
    $("#cardNum2").on("focusout", function() {
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
    
    $("#cardNum3").on("focusout", function() {
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
    
    $("#cardPassword").on("focusout", function() {
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

function check(){
	var recieverName = document.getElementById('recieverName').value;
	var receiverAddr1 = document.getElementById('receiverAddr1').value;
	var receiverAddr2 = document.getElementById('receiverAddr2').value;
	var receiverAddr3 = document.getElementById('receiverAddr3').value;
	var receiverTel1 = document.getElementById('receiverTel1').value;
	var receiverTel2 = document.getElementById('receiverTel2').value;
	var receiverTel3 = document.getElementById('receiverTel3').value;
	var select = document.getElementById("selectBank");
	var selectBank = select.options[select.selectedIndex].value;
	var cardNum1 = document.getElementById('cardNum1').value;
	var cardNum2 = document.getElementById('cardNum2').value;
	var cardNum3 = document.getElementById('cardNum3').value;
	var cardNum4 = document.getElementById('cardNum4').value;
	var cardPassword = document.getElementById('cardPassword').value;
	
	console.log(receiverTel1.length);
	console.log(receiverTel2.length);
	console.log(receiverTel3.length);
	
	if(submit == 1){
		return true;
	}
	
	if(recieverName.length == 0){
		alert('받는 분 성명을 입력해주세요.');
		return false;
	}
	if(receiverAddr1.length == 0 || receiverAddr2.length == 0){
		alert('주소를 입력해주세요.');
		return false;
	}
	if(receiverAddr3.length == 0){
		alert('상세주소를 입력해주세요');
		return false;
	}
	if(receiverTel1.length < 2 || receiverTel2.length < 3 || receiverTel3.length != 4){
		alert('올바른 연락처를 입력해주세요.');
		return false;
	}
	if(selectBank.length == 0){
		alert('카드 은행을 선택해주세요.');
		return false;
	}
	if(cardNum1.length < 4 || cardNum2.length < 4 || cardNum3.length < 4 || cardNum4.length < 4 ){
		alert('올바른 카드번호를 입력해주세요');
		return false;
	}
	if(cardPassword.length < 4){
		alert('카드 비밀번호 4자리를 입력해주세요');
		return false;
	}
		


	
	
}
function showMyInfo(){
	submit = 1;
}









function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("jusoPopup.jsp","pop", 'left='+(screen.availWidth-570)/2+',top='+(screen.availHeight-420)/2+', width=570px,height=420px', "width=570,height=420, scrollbars=yes, resizable=yes"); 
	
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}
function jusoCallBack(receiverAddr1,receiverAddr2,receiverAddr3){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	document.form.receiverAddr1.value = receiverAddr3;
	document.form.receiverAddr2.value = receiverAddr1;
	document.form.receiverAddr3.value = receiverAddr2;

	
}
</script>
<style>
#main{
	width: 800px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 30px;
	margin-bottom: 80px;
	
}
#home{
width:360px;
margin-left: auto;
margin-right: auto;
margin-top: 20px;
margin-bottom: 20px;
}


#home1{
width:150px;
line-height:36px;
height: 36px;
 margin-bottom:10px;
 background-color:#fff;
	border:2px solid red;
	text-align:center;
	border-radius:2px;
	float: left;
}

#home1 a {
	text-decoration:none;
	display:block;
	color:black;
	font-family:midnight;
	font-size:18px;
}

#home1 a:hover {
	color:blue;
}


#home2{
width:150px;
line-height:36px;
height: 36px;
 margin-bottom:10px;
 background-color:#fff;
	border:2px solid black;
	text-align:center;
	border-radius:2px;
	float: left;
	margin-left: 50px;
}

#home2 a {
	text-decoration:none;
	display:block;
	color:black;
	font-family:midnight;
	font-size:18px;
}

#home2 a:hover {
	color:blue;
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
	float: center;
	margin-left: 25px;
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

</head>
<%@include file="Header.jsp" %>
<body>

<div id="main">
<form name="form" id="form" action="orderInsertSelect.jsp" method="post" onsubmit="return check()">
<br><h2>주문자 정보</h2><br>
<table width="810" border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td align="left">
    <table width="810" border="0" cellspacing="0" cellpadding="0">
    <hr>
<tr>
<td width="19"height="43"></td>
<td width="160" align="left" class="insert_text"> 주문자 아이디</td>
<td width="170"><input type="text" name="ordererId" size="12" maxlength="15" value="${userDto.userId}" readonly="readonly" style="color:#757575; font-size:12px; width:150px; height:27px;"/></td>
<td width="11"></td>
<td width="470" align="left">
</tr>
<tr height="1">
<td colspan="5" bgcolor="#cccccc"></td>
</tr>
<tr>
<td height="43"></td>
<td align="left" class="insert_text">주문자 성명</td>
<td width="170"><input type="text" name="ordererName"  size="12" maxlength="10" value="${userDto.userName}" readonly="readonly" style="color:#757575; font-size:12px; width:150px; height:27px;"/>
                        <td></td>
                        <td align="left"></td>
                      </tr>
                      <tr height="1">
                        <td colspan="5" bgcolor="#cccccc"></td>
                      </tr>
<tr height="1">
<td></td>
</tr>
<tr>
<td height="43"></td>
<td align="left" class="insert_text">주소1(우편번호)</td>
<td width="170"><input type="text" name="ordererAddress" size="12" maxlength="20" value="${userDto.beforeUserAddress1}" readonly="readonly" style="color:#757575; font-size:12px; width:150px; height:27px;"/></td>
                        <td></td>
                        <td align="left"></span></td>
                      </tr>
						 <tr>
                        <td height="43"></td>
                        <td align="left" class="insert_text">주소2(도로명주소)</td>
                        <td width="170"><input type="text" name="username" id="username" size="25" value="${userDto.beforeUserAddress2}"  readonly="readonly" maxlength="15" style="color:#757575; font-size:12px; width:150px; height:27px;"/></td>
                        <td></td>
                        <td align="left"></td>
                      </tr>
                       <tr>
                        <td height="43"></td>
                        <td align="left" class="insert_text">주소3(상세주소)</td>
                        <td width="170"><input type="text" name="username" id="username" size="25" value="${userDto.beforeUserAddress3}"  readonly="readonly" maxlength="15" style="color:#757575; font-size:12px; width:150px; height:27px;"/></td>
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
                        <td align="left" class="insert_text" >주문자 연락처</td>
                        <td colspan="4">
                        <input type="text" name="ordererTel"  size="30" value="${userDto.beforeUserTel1}" maxlength="45" readonly="readonly"  style="color:#757575; font-size:12px; width:100px; height:27px;"/>-
                       <input type="text" name="ordererTel"  size="30" value="${userDto.beforeUserTel2}" maxlength="45" readonly="readonly"  style="color:#757575; font-size:12px; width:100px; height:27px;"/>-
                  	 <input type="text" name="ordererTel"  size="30" value="${userDto.beforeUserTel3}" maxlength="45" readonly="readonly"  style="color:#757575; font-size:12px; width:100px; height:27px;"/>
                  </td>
                        <td></td>
                        <td align="left"></td>
                      </tr>
                      
                      <tr height="1">
                        <td colspan="5" bgcolor="#cccccc"></td>
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
                   
                 <br>   <h2>배송 정보</h2> &emsp;<div id="home3"><input type="submit" style="background-color: white; width: 150px; height: 36px;" name="click" value="주문자정보와 동일" onclick="showMyInfo()" ></div>
                    
                    <table width="810" border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td align="left">
    <table width="810" border="0" cellspacing="0" cellpadding="0">
    <tr>
<tr>
<td width="19"height="43"></td>
<td width="300" align="left" class="insert_text"> 받으실 분 성명</td>
<td width="170"><input type="text" name="recieverName" id="recieverName" size="12" maxlength="10" value="${orderDto.ordReceiver}" placeholder="
RECIEVER NAME"  style="color:#757575; font-size:12px; width:150px; height:27px;"/></td>
<td width="11"></td>
<td width="470" align="left">
</tr>
<tr height="1">
<td colspan="5" bgcolor="#cccccc"></td>
</tr>
<tr>
<td height="43"></td>
<td align="left" class="insert_text">주소1(우편번호)</td>
<td width="170"><input type="text" name="receiverAddr1" id="receiverAddr1" size="12" maxlength="20" value="${orderDto.userAddress1}" onclick="goPopup();" placeholder="ADDRESS(CLICK HERE)" readonly="readonly"   style="color:#757575; font-size:12px; width:150px; height:27px;"/>
                        <td></td>
                        <td align="left"></td>
                      </tr>
<tr height="1">
<td></td>
</tr>
<tr>
<td height="43"></td>
<td align="left" class="insert_text">주소2(도로명주소)</td>
<td width="170"><input type="text" name="receiverAddr2" id="receiverAddr2" size="12" maxlength="45" value="${orderDto.userAddress2}"  placeholder="ROADNAME ADDRESS" readonly="readonly"   style="color:#757575; font-size:12px; width:150px; height:27px;"/></td>
                        <td></td>
                        <td align="left"></td>
                      </tr>
					
					  <tr>
                        <td height="43"></td>
                        <td align="left" class="insert_text">주소3(상세주소)</td>
                        <td width="170"><input type="text" name="receiverAddr3" id="receiverAddr3" size="12" value="${orderDto.userAddress3}" maxlength="45"  placeholder="DETAILED ADDRESS" style="color:#757575; font-size:12px; width:150px; height:27px;"/></td>
                        <td></td>
                        <td align="left"></td>
                      </tr>
                      <tr height="1">
                        <td colspan="5" bgcolor="#cccccc"></td>
                      </tr>
                    
                      <tr>
                        <td height="43"></td>
                        <td align="left" class="insert_text">받으실 분 연락처</td>
                        <td width="170"><input type="text" name="receiverTel1" id="receiverTel1"  size="30" value="${orderDto.userTel1}" maxlength="4" placeholder="ex)010" style="color:#757575; font-size:12px; width:150px; height:27px;"/>-
                        </td>
                        <td width="170"><input type="text" name="receiverTel2" id="receiverTel2" size="30" value="${orderDto.userTel2}" maxlength="4"  placeholder="ex)1234" style="color:#757575; font-size:12px; width:150px; height:27px;"/>-
                        </td>
                        <td width="170"><input type="text" name="receiverTel3" id="receiverTel3" size="30" value="${orderDto.userTel3}" maxlength="4"  placeholder="ex)5678" style="color:#757575; font-size:12px; width:150px; height:27px;"/>
                        </td>
                        <td></td>
                        <td align="left"></td>
                      </tr>
                      <tr height="1">
                        <td colspan="5" bgcolor="#cccccc"></td>
                      </tr>
				
                      
						</table>
						</td>
                      </tr>
                      <tr height="1">
                      </tr>
                      <tr height="1">
                        <td colspan="5" bgcolor="black"></td>
                      </tr>
                    </table>
                   <br> <h2>결제 정보</h2><br>
                                <table width="810" border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td align="left">
    <table width="810" border="0" cellspacing="0" cellpadding="0">
    <hr>
<tr>
<td width="19"height="43"></td>
<td width="140" align="left" class="insert_text"> 결제 총 금액</td>
<td width="170"><input type="text" name="total" id="total" size="12" maxlength="15" value="<%=session.getAttribute("realTotal")%>"   readonly="readonly" style="color:#757575; font-size:12px; width:150px; height:27px;"/></td>
<td width="11"></td>
<td width="470" align="left">
</tr>
<tr height="1">
<td colspan="5" bgcolor="#cccccc"></td>
</tr>
<tr>
<td height="43"></td>
<td align="left" class="insert_text">결제할 카드 은행</td>
<td width="170">
				<select name="selectBank" id="selectBank">
				 <option value="">은행명을 선택하세요</option>
                        <option value="경남은행">경남은행</option>
                        <option value="광주은행">광주은행</option>
                        <option value="국민은행">국민은행</option>
                        <option value="기업은행">기업은행</option>
                        <option value="농협중앙회">농협중앙회</option>
                        <option value="농협회원조합">농협회원조합</option>
                        <option value="대구은행">대구은행</option>
                        <option value="도이치은행">도이치은행</option>
                        <option value="부산은행">부산은행</option>
                        <option value="산업은행">산업은행</option>
                        <option value="상호저축은행">상호저축은행</option>
                        <option value="새마을금고">새마을금고</option>
                        <option value="수협중앙회">수협중앙회</option>
                        <option value="신한금융투자">신한금융투자</option>
                        <option value="신한은행">신한은행</option>
                        <option value="신협중앙회">신협중앙회</option>
                        <option value="외환은행">외환은행</option>
                        <option value="우리은행">우리은행</option>
                        <option value="우체국">우체국</option>
                        <option value="전북은행">전북은행</option>
                        <option value="제주은행">제주은행</option>
                        <option value="카카오뱅크">카카오뱅크</option>
                        <option value="케이뱅크">케이뱅크</option>
                        <option value="하나은행">하나은행</option>
                        <option value="한국씨티은행">한국씨티은행</option>
                        <option value="HSBC">HSBC은행</option>
                        <option value="SC제일은행">SC제일은행</option>
				</select>

                        <td align="left"></td>
                      </tr>
<tr height="1">
<td></td>
</tr>
<tr>
<td height="43"></td>
<td align="left" class="insert_text" width="160px;">카드번호</td>
<td width="400" colspan="5">
						<input type="text" name="cardNum1" id="cardNum1" size="12" maxlength="4"    style="color:#757575; font-size:12px; width:100px; height:27px;"/>
						- <input type="text" name="cardNum2" id="cardNum2" size="12" maxlength="4"  style="color:#757575; font-size:12px; width:100px; height:27px;"/>
						- <input type="text" name="cardNum3" id="cardNum3" size="12" maxlength="4"    style="color:#757575; font-size:12px; width:100px; height:27px;"/>
                  		- <input type="password" name="cardNum4" id="cardNum4" size="12" maxlength="4"  style="color:#757575; font-size:12px; width:100px; height:27px;"/>
                        <td></td>
                        <td align="left"></td>
                      </tr>
					
                      <tr height="1">
                        <td colspan="5" bgcolor="#cccccc"></td>
                      </tr>
					  <tr>
                        <td height="43"></td>
                        <td align="left" class="insert_text">카드 비밀번호</td>
                        <td width="170"><input type="password" name="cardPassword" id="cardPassword" size="12"  maxlength="4" style="color:#757575; font-size:12px; width:150px; height:27px;"/></td>
                        <td></td>
                        <td align="left"></td>
                      </tr>
                      <tr height="1">
                        <td colspan="5" bgcolor="#cccccc"></td>
                      </tr>
				
                      
						</table>
						</td>
                      </tr>
                      <tr height="1">
                      </tr>
                      <tr height="1">
                        <td colspan="5" bgcolor="black"></td>
                      </tr>
                    </table>
					        <div id="home">         
					  <div id="home1"><input type="submit" name="click" value="결제" style="width: 150px; height: 36px; background-color: white;"></div>
					  <div id="home2"><input type="submit" name="click" value="취소" style="width: 150px; height: 36px; background-color: white;"></div>
					  </div>  
</form>
</div> 
</body>
<%@include file="Footer.jsp" %>
</html>