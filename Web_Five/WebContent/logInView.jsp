<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="./js/jquery-3.3.1.min.js"></script>
<title>미쁘다</title>
<script src="./js/jquery-3.3.1.min.js"></script>
<script type ="text/javascript">
//영문
var replaceEng = /[a-zA-z]/gi;
//숫자
var replaceInt = /[0-9]+$/g;


window.onload = function(){
	document.getElementById('loginForm').onsubmit = function() {
		
		var Id = document.getElementById('Id');
		if(Id.value == ""){
			alert("아이디를 입력하세요.");
			Id.focus();
			return false;
		}
		
		var Pw = document.getElementById('Pw');
		if(Pw.value == ""){
			alert("패스워드를 입력하세요.");
			Pw.focus();
			return false;
		}
		
		
		
		}

};

function findId(){
	var go = window.open("yourId.jsp","findId", 'left='+(screen.availWidth-570)/2+',top='+(screen.availHeight-420)/2+', width=600px,height=400px', "width=570,height=500, scrollbars=yes, resizable=yes"); 
	
}
function findPw(){
	var go = window.open("yourPw.jsp","findPw", 'left='+(screen.availWidth-570)/2+',top='+(screen.availHeight-500)/2+', width=700px,height=400px', "width=570,height=500, scrollbars=yes, resizable=yes"); 
	
}


</script>

<style>
#login{
	width:1250px;
	margin:0 auto;
	margin-top:50px;
}

form{
	width:400px;
	margin-left:425px;
	margin-top:20px;
}


#form1{
	width:700px;;
	height:400px;
	margin-left:275px;
	margin-top:40px;
}


input{
	margin:0;
	margin-bottom:10px;
	margin-top:10px;
}

.in-line{
   width:400px;
   height:40px;
}
input[type="text"]{
	width:100%;
    height:100%;
    font-size:1em;
    padding-left: 5px;
    font-style: oblique;
    display:inline;
    outline:none;
    box-sizing: border-box;
    color:black;
	border:1px solid #000;
	border-radius:3px;
}
	
input[type='text']{
font-size:1.2em;
}

input[type="password"]{
	width:100%;
    height:100%;
    font-size:1em;
    padding-left: 5px;
    font-style: oblique;
    display:inline;
    outline:none;
    box-sizing: border-box;
    color:black;
	border:1px solid #000;
	border-radius:3px;
}
	
input[type='password']{
font-size:1.2em;
}

#text1{
	text-align:right;
	margin-bottom:10px;
	margin-top:100px;
	color:black;
}
#text1 a{
	color:black;
	text-decoration:none;
}
#text1 a:hover{
	color:#6fa168;	
}

#button a {
	color:#fff;
	text-decoration:none;
}

#button1 {
	width:400px;
	height:40px;
	line-height:40px;
	text-align:center;
	border:1px solid #6fa168;
	border-radius:3px;
	font-weight:bold;
	display:block;
	margin-bottom:10px;
	background-color:#6fa168;
}

#button1:hover {
	color:#000;
	background-color:#fff;
}

#button2 {
	width:400px;
	height:40px;
	line-height:40px;
	text-align:center;
	border:1px solid #6fa168;
	border-radius:3px;
	display:block;
	font-weight:bold;
	color:black;
	margin-bottom: 30px;
	margin-top: 15px;
}

#button2:hover {
	color:#000;
	background-color:#fff;
	
}
h2{
margin-bottom: 20px;
}

</style>
</head> 
<%@include file="Header.jsp" %>
<body>
<%
	session.setAttribute("beforeEmail3", null);
	session.setAttribute("checkValue", null);
	session.setAttribute("idCheckValue", null);
%>

        <div id="login">
	<form name="login" id="loginForm" method="post" action="logInTry.five"> 
<h2>미쁘다 로그인</h2>
	 <div class="in-line">
		<input type="text" name="id" id="Id" placeholder="아이디" >
        <input type="password" placeholder="비밀번호"  name="pass" id="Pw" onkeydown="onEnterSubmit()"></div>
        <div id="text1">
        <input type="button" name="findIdBtn" id="findIdBtn" value="아이디 찾기" onclick="findId()">
        <input type="button" name="findPwBtn" id="findPwBtn" value="비밀번호 찾기" onclick="findPw()">
        </div>
        <div id="errMsg" style="color:red"> <%
					if(session.getAttribute("errMsg") == null){ 
						out.println(" ");
					}else{
						String userid = (String)session.getAttribute("errMsg");
						out.println(session.getAttribute("errMsg"));
					}
					%>
       </div>
        
        <div id="button">
       
        <input type="submit" value="로그인" name="click" id="button1">
        </div>
    </form>
    <form action="agree.five">
         <input type="submit" value="회원가입" name="click" id="button2"></div>
    </form>
    </div>
</body>
<%@include file="Footer.jsp" %>
</html>