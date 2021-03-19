<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 완료</title>
</head>
<style>
#main{
	width: 800px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 30px;
	margin-bottom: 80px;
}

#home{
width:150px;
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
	border:2px solid black;
}

</style>


<script src="./js/jquery-3.3.1.min.js"></script>
<%@include file="Header.jsp" %>
<body>
<div id="main">
<form name="form" id="form" action="mibbdaMain.five" method="post" >
<td>
<h2>배송지 정보</h2>
<table>
    <tr>
    <td align="left">
    <table>
    <hr>
<tr>
<td width="19"height="43"></td>
<td width="140" align="left" class="insert_text"> 받는 분</td>
<td width="170"><input type="text" name="receiverName" size="12" maxlength="15" value="${orderDto.ordReceiver}"  readonly="readonly" style="color:#757575; font-size:12px; width:150px; height:27px;"/></td>
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
                        <td align="left" class="insert_text">주소</td>
                        <td width="170"><input type="text" name="receiverAddr" value="${orderDto.ordRcvAddress}" readonly="readonly" style="color:#757575; font-size:12px; width:150px; height:27px;"/></td>
                        <td></td>
                        <td align="left"></td>
                      </tr>
                       <tr height="1">
                        <td colspan="5" bgcolor="#cccccc"></td>
                      </tr>
<tr>

<td height="43"></td>
<td align="left" class="insert_text">연락처</td>
<td width="170"><input type="text" name="receiverTel" size="12" maxlength="20" value="${orderDto.ordRcvPhone}" readonly="readonly" style="color:#757575; font-size:12px; width:150px; height:27px;"/>
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
                    <h2>결제 내역</h2>
                    <table width="810" border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td align="left">
    <table width="810" border="0" cellspacing="0" cellpadding="0">
    <hr>
<tr>
<td width="19"height="43"></td>
<td width="140" align="left" class="insert_text"> 총 금액 </td>
<td width="170"><input type="text" name="userid" id="id" size="12" maxlength="15" value="<%=session.getAttribute("total") %>" readonly="readonly" style="color:#757575; font-size:12px; width:150px; height:27px;"/></td>
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
                        <td width="170"><input type="text" id="zipNo" name="zipNo" value="${orderDto.ordBank}"  readonly="readonly" style="color:#757575; font-size:12px; width:150px; height:27px;"/></td>
                        <td></td>
                        <td align="left"></td>
                      </tr>
                       <tr height="1">
                        <td colspan="5" bgcolor="#cccccc"></td>
                      </tr>
<tr>

<td height="43"></td>
<td align="left" class="insert_text">카드번호</td>
<td width="100" colspan="5">
<input type="text" name="userpw1" id="pw1" size="12" maxlength="20" value="${orderDto.ordCard1}" readonly="readonly" style="color:#757575; font-size:12px; width:100px; height:27px;"/>-
          <input type="text" name="userpw1" id="pw1" size="12" maxlength="20" value="${orderDto.ordCard2}" readonly="readonly" style="color:#757575; font-size:12px; width:100px; height:27px;"/>-
                        
               <input type="text" name="userpw1" id="pw1" size="12" maxlength="20" value="${orderDto.ordCard3}" readonly="readonly" style="color:#757575; font-size:12px; width:100px; height:27px;"/>-<input type="password" name="userpw1" id="pw1" size="12" maxlength="20" value="${orderDto.ordCard4}" readonly="readonly" style="color:#757575; font-size:12px; width:100px; height:27px;"/>
                
                        </td>
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
                    </table>
                    
                    
                    
       <div id="home">      
       <div id="home1">
  <input type="submit" name="click" id="back" value="확인"  style="width: 150px; height: 36px; background-color: white;"></div>
  </div>
</form>

</div> 
</body>
<%@include file="Footer.jsp" %>
</html>