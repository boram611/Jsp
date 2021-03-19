
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<html>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
<link href="css/member.css" rel="stylesheet" type="text/css">
<link href="css/common.css" rel="stylesheet" type="text/css">
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/subMenu.js"></script>
<script src="js/index.js"></script>
<script src="js/moveTop.js"></script>
<script type="javascript" src="js/js_package.js"> </script>
<style>
#insert{
width: 100%;
}
/*취소버튼*/
#home3{
	width:200px;
	line-height:50px;
	height: 50px;
	margin-right:170px;
	margin-top:20px;
	background-color:#fff;
	border:2px solid #6fa168;
	text-align:center;
	border-radius:2px;
	font-size:10px;
	float: right;
}

/*확인버튼*/
#home2{
	width:200px;
	line-height:50px;
	height: 50px;
	margin-left:170px;
	margin-top:21px;
	background-color:#fff;
	border:2px solid #6fa168;
	text-align:center;
	border-radius:2px;
	float: left;
}
</style>

<body>

<div id="agree_01">
	<div id="signup">
        <div id="signup02">
        	<div class="sign_img1"><img src="img/sing_img1.png" width="30" height="35"></div>
            <div class="sign_text1">약관동의</div>
        </div>
        <div id="signup03">
        	<div class="sign_img2"><img src="img/sing_img2.png" width="30" height="35"></div>
            <div class="sign_text2">회원정보입력</div>
        </div> 
        <div id="signup01">
       		 <div class="sign_img3"><img src="img/sing_img3.png" width="30" height="35"></div>
            <div class="sign_text3"> 회원가입완료</div>
        </div>
   </div>
<div id="agree_02">
<br>
<table width="810" border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td align="left">
    <table width="810" border="0" cellspacing="0" cellpadding="0">
    <hr>
<tr>
<td width="19"height="43"></td>
<td width="140" align="left" class="insert_text"> 아이디</td>
<td width="170"><%=request.getAttribute("Id") %></td>
<td width="11"></td>
<td width="470" align="left"></td>
</tr>
<tr height="1">
<td colspan="5" bgcolor="#cccccc"></td>
</tr>
<tr>
<td height="43"></td>
<td align="left" class="insert_text">비밀번호</td>
<td width="170"><%=request.getAttribute("Pw") %></td>
                        <td></td>
                        <td align="left"></td>
                      </tr>
                      <tr height="1">
                        <td colspan="5" bgcolor="#cccccc"></td>
                      </tr>
					  <tr>
                        <td height="43"></td>
                        <td align="left" class="insert_text">성 명</td>
                        <td width="170"><%=request.getAttribute("Name") %></td>
                        <td></td>
                        <td align="left">&nbsp;</td>
                      </tr>
                      
                      <tr height="1">
                        <td colspan="5" bgcolor="#cccccc"></td>
                      </tr>
                       <tr>
                        <td height="43"></td>
                        <td align="left" class="insert_text">생년월일</td>
                        <td colspan="3"><%=request.getAttribute("Birth") %>
						</td>
                      </tr>
                      
                      <tr height="1">
                        <td colspan="5" bgcolor="#cccccc"></td>
                      </tr>
                       <tr>
                        <td height="43"></td>
                        <td align="left" class="insert_text">주소</td>
                        <td width="170"><%=request.getAttribute("Add") %></td>
                        <td></td>
                        <td align="left"></td>
                      </tr>
                      
                      
                      
                      <tr height="1">
                        <td colspan="5" bgcolor="#cccccc"></td>
                      </tr>
                       <tr>
                        <td height="43"></td>
                        <td align="left" class="insert_text">연락처</td>
                        <td width="170"><%=request.getAttribute("Tel") %></td>
                        <td></td>
                        <td align="left"></td>
                      </tr>
                      
                      
                      <tr height="1">
                        <td colspan="5" bgcolor="#cccccc"></td>
                      </tr>
                       <tr>
                        <td height="43"></td>
                        <td align="left" class="insert_text">이메일</td>
                        <td width="170"><%=request.getAttribute("Email") %></td>
                        <td></td>
                        <td align="left"></td>
                      </tr>
                      
                      
                      
						</table>
						</td>
                      </tr>
                      
                      <tr height="1">
                        <td colspan="5" bgcolor="black"></td>
                      </tr>
                    </table></td>
                </tr>
            </table>
				<tr>
  <td>
  <form action="selectPage.five" method="get">
  <div id="home2"><input type="submit" value="미쁘다 메인" name="click"
  style="width: 200px; height: 50px; font-size: 18px;"></div>
  <div id="home3"><input type="submit" value="로그인" name="click"
   style="font-size: 18px; width: 200px; height: 50px;"></div>
  </form>
   </td>
  </tr>
			</div> 
</div>
	<p>


</center>
</body>
</html>