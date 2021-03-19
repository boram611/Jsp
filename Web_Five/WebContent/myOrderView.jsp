<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 상세내용</title>
<script src="./js/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
window.onload = function getInfo(){
	var delivery =  document.getElementById('delivery').value;
	var D = document.getElementById("D");
	
	if(delivery == "배송 완료"){
		D.type= "submit";
		document.getElementById('D').value = "구매 확정";
	}
	if(delivery == "구매 확정"){
		D.type= "submit";
		document.getElementById('D').value = "리뷰 쓰기";
	}
	if(delivery == "리뷰 작성 완료"){
		D.type= "submit";
		document.getElementById('D').value = "리뷰 작성 완료";
		D.disabled = true;

	}
	
	
	
}
</script>


<style>
#Main{
width: 850px;
margin-left: auto;
margin-right: auto;
margin-bottom: 20px;
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
<%@include file="myPageView.jsp" %>
<body>
<div id="Main">
<div id="home3"><a href="javascript:history.back();">뒤로 가기</a></div>
<form name="form" id="form" action="click.five" method="post" >
<td>
<h2>주문 정보</h2>
<table width="810" border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td align="left">
    <table width="810" border="0" cellspacing="0" cellpadding="0">
    <hr>
<tr>
<td width="19"height="43"></td>
<td width="140" align="left" class="insert_text"> 주문번호</td>
<td width="170"><input type="text" name="ordNo" size="12" maxlength="15" value="<%=session.getAttribute("ordNo") %>"  readonly="readonly" style="color:#757575; font-size:12px; width:150px; height:27px;"/></td>
<td width="11"></td>
<td width="470" align="left">
</tr>
<tr height="1">
<td colspan="5" bgcolor="#cccccc"></td>
</tr>

     <tr height="1">
                        <td colspan="5" bgcolor="#cccccc"></td>
                      </tr>
                       <tr>
                        <td height="43"></td>
                        <td align="left" class="insert_text">상품명</td>
                        <td width="170"><input type="text" name="prdName" value="${productDto.prdName}" readonly="readonly" style="color:#757575; font-size:12px; width:150px; height:27px;"/></td>
                        <td></td>
                        <td align="left"></td>
                      </tr>
                       <tr height="1">
                        <td colspan="5" bgcolor="#cccccc"></td>
                      </tr>
<tr>

<td height="43"></td>
<td align="left" class="insert_text">상품가격</td>
<td width="170"><input type="text" name="receiverTel" size="12" maxlength="20" value="${productDto.prdPrice}" readonly="readonly" style="color:#757575; font-size:12px; width:150px; height:27px;"/>
                        <td></td>
                        <td align="left"></td>
                      </tr>
                      <tr height="1">
                        <td colspan="5" bgcolor="#cccccc"></td>
                      </tr>
<tr>

<td height="43"></td>
<td align="left" class="insert_text">주문수량</td>
<td width="170"><input type="text" name="receiverTel" size="12" maxlength="20" value="${orderdetailDto.ordQty}" readonly="readonly" style="color:#757575; font-size:12px; width:150px; height:27px;"/>
                        <td></td>
                        <td align="left"></td>
                      </tr>
                      <tr height="1">
                        <td colspan="5" bgcolor="#cccccc"></td>
                      </tr>
<tr>

<td height="43"></td>
<td align="left" class="insert_text">주문날짜</td>
<td width="170"><input type="text" name="receiverTel" size="12" maxlength="20" value="${orderinfoDto.ordDate}" readonly="readonly" style="color:#757575; font-size:12px; width:150px; height:27px;"/>
                        <td></td>
                        <td align="left"></td>
                      </tr>
<tr height="1">
<tr height="1">
                        <td colspan="5" bgcolor="#cccccc"></td>
                      </tr>
<td></td>
</tr>

					
                      <tr height="1">
                        <td colspan="5" bgcolor="#cccccc"></td>
                      </tr>
				
                      
                     
						</table>
						</td>
						
                      </tr>
                      <tr height="1">
                        <td colspan="5" bgcolor="#cccccc"></td>
                      </tr>
                      <tr height="1">
                        <td colspan="5" bgcolor="black"></td>
                      </tr>
                    </table></td>
                    <h2>배송 정보</h2>
                    <table width="810" border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td align="left">
    <table width="810" border="0" cellspacing="0" cellpadding="0">
    <hr>
<tr>
<td width="19"height="43"></td>
<td width="140" align="left" class="insert_text"> 받는 분 </td>
<td width="170"><input type="text" name="userid" id="id" size="12" maxlength="15" value="${orderinfoDto.receiver}" readonly="readonly" style="color:#757575; font-size:12px; width:150px; height:27px;"/></td>
<td width="11"></td>
<td width="470" align="left">
</tr>
<tr height="1">
<td colspan="5" bgcolor="#cccccc"></td>
</tr>


                       <tr>
                        <td height="43"></td>
                        <td align="left" class="insert_text">배송지 주소</td>
                        <td width="170"><input type="text" id="zipNo" name="zipNo" value="${orderinfoDto.deliveryAddr}"  readonly="readonly" style="color:#757575; font-size:12px; width:150px; height:27px;"/></td>
                        <td></td>
                        <td align="left"></td>
                      </tr>
                      <tr height="1">
                        <td colspan="5" bgcolor="#cccccc"></td>
                      </tr>
<tr>

<td height="43"></td>
<td align="left" class="insert_text">받는 분 연락처</td>
<td width="170"><input type="text" name="receiverTel" size="12" maxlength="20" value="${orderinfoDto.receiverTel}" readonly="readonly" style="color:#757575; font-size:12px; width:150px; height:27px;"/>
                        <td></td>
                        <td align="left"></td>
                      </tr>
<tr height="1">
<tr height="1">
                        <td colspan="5" bgcolor="#cccccc"></td>
                      </tr>
                      <tr height="1">
                        
<tr>

<td height="43"></td>
<td align="left" class="insert_text">배송상태</td>
<td width="170"><input type="text" name="delivery" id="delivery" size="12" maxlength="20" value="${orderinfoDto.ordDelivery}" readonly="readonly" style="color:#757575; font-size:12px; width:150px; height:27px;"/>
				<input type="hidden" name="click" id="D" value="" >
                        <td></td>
                        <td align="left"></td>
                      </tr>
<tr height="1">
<tr height="1">
                        <td colspan="5" bgcolor="#cccccc"></td>
                      </tr>
<tr>

<td height="43"></td>
<td align="left" class="insert_text">배송완료 날짜</td>
<td width="170"><input type="text" name="receiverTel" size="12" maxlength="20" value="${orderinfoDto.deliveryDate}" readonly="readonly" style="color:#757575; font-size:12px; width:150px; height:27px;"/>
                        <td></td>
                        <td align="left"></td>
                      </tr>
<tr height="1">
<tr height="1">
                        <td colspan="5" bgcolor="#cccccc"></td>
                      </tr>
<td></td>
</tr>

					
                      <tr height="1">
                        <td colspan="5" bgcolor="#cccccc"></td>
                      </tr>
				
                      
                     
						</table>
						</td>
						
                      </tr>
                      <tr height="1">
                        <td colspan="5" bgcolor="#cccccc"></td>
                      </tr>
                      <tr height="1">
                        <td colspan="5" bgcolor="black"></td>
                      </tr>
                    </table></td>
                    
                    
                    
             
          </tr>
           <h2>결제 정보</h2>
                    <table width="810" border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td align="left">
    <table width="810" border="0" cellspacing="0" cellpadding="0">
    <hr>
<tr>
<td width="19"height="43"></td>
<td width="80" align="left" class="insert_text"> 총 금액 </td>
<td width="170"><input type="text" name="userid" id="id" size="12" maxlength="15" value="${orderinfoDto.total}" readonly="readonly" style="color:#757575; font-size:12px; width:150px; height:27px;"/></td>
<td width="11"></td>
<td width="470" align="left">
</tr>
<tr height="1">
<td colspan="5" bgcolor="#cccccc"></td>
</tr>

     <tr height="1">
                        <td colspan="5" bgcolor="#cccccc"></td>
                      </tr>
                       <tr>
                        <td height="43"></td>
                        <td align="left" class="insert_text">카드 은행</td>
                        <td width="170"><input type="text" id="zipNo" name="zipNo" value="${orderinfoDto.cardBank}"  readonly="readonly" style="color:#757575; font-size:12px; width:150px; height:27px;"/></td>
                        <td></td>
                        <td align="left"></td>
                      </tr>
                       <tr height="1">
                        <td colspan="5" bgcolor="#cccccc"></td>
                      </tr>
<tr>

<td height="43"></td>
<td align="left" class="insert_text">카드번호</td>
<td colspan="5"><input type="text" name="userpw1" id="pw1" size="12" maxlength="20" value="${orderinfoDto.cardNumber1}" readonly="readonly" style="color:#757575; font-size:12px; width:100px; height:27px;"/> - 
                      
                      <input type="text" name="userpw1" id="pw1" size="12" maxlength="20" value="${orderinfoDto.cardNumber2}" readonly="readonly" style="color:#757575; font-size:12px; width:100px; height:27px;"/> - 
                       
                      <input type="text" name="userpw1" id="pw1" size="12" maxlength="20" value="${orderinfoDto.cardNumber3}" readonly="readonly" style="color:#757575; font-size:12px; width:100px; height:27px;"/> - 
                       
                     <input type="password" name="userpw1" id="pw1" size="12" maxlength="20" value="${orderinfoDto.cardNumber4}" readonly="readonly" style="color:#757575; font-size:12px; width:100px; height:27px;"/>
            
                        <td align="left">&nbsp;<span id="pwCheck1"></span></td>
                      </tr>
<tr height="1">
<tr height="1">
                        <td colspan="5" bgcolor="#cccccc"></td>
                      </tr>
<td></td>
</tr>

					
                      <tr height="1">
                        <td colspan="5" bgcolor="#cccccc"></td>
                      </tr>
				
                      
                     
						</table>
						</td>
						
                      </tr>
                      <tr height="1">
                        <td colspan="5" bgcolor="#cccccc"></td>
                      </tr>
                      <tr height="1">
                        <td colspan="5" bgcolor="black"></td>
                      </tr>
                    </table></td>
                    
                    
                    
             
          </tr>
</form>
	<tr>
  <td>

   </td>
  </tr>
        </table>
		</td>
      </tr>
</div> 
</div>
</body>
<%@include file="Footer.jsp" %>
</html>