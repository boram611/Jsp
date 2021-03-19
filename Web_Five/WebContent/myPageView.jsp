<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>메인 MyPage</title>
</head>
<style>


#wrap1 {
		margin:0 auto;
		width:1000px;
}

#intro{
	margin:0 auto;
	width:1000px;
	text-align: left;
	margin-top: 20px;
	font-size: 25px;
	
}
#intro .intro_text{

margin-left: 20px;

}

#header2 {
	height:180px;
	padding:0;
	margin-top:10px;
	background-color:#588f50;
	margin-bottom: 30px;
	
}

#mainMenuBox1 {
	width:1000px;
	height:60px;
	line-height:60px;
	padding:0;
	margin:0 auto;
	
}

#mainMenuBox1 ul {
	padding-left:0;
	margin:0;
	list-style:none;
}

#mainMenuBox1 ul li {
	float:left;
	text-align:center;
	width:200px;
}

#mainMenuBox1 a {
	text-decoration:none;
	display:block;
	color:#fff;
	font-family:midnight;
	font-size:18px;
}

#mainMenuBox1 a:hover {
	color:#053517;
}

.my01{
background-image: url("img/my01.png");
margin-left:70px;
width: 70px;
height: 70px;
text-align: center;
}
.my02{
background-image: url("img/my02.png");
margin-left:62px;
width: 70px;
height: 70px;
}
.my03{
background-image: url("img/my03.png");
margin-left:65px;
width: 70px;
height: 70px;
}
.my04{
background-image: url("img/my04.png");
margin-left:65px;
width: 70px;
height: 70px;
}
.my05{
background-image: url("img/my05.png");
margin-left:65px;
width: 70px;
height: 70px;
}



</style>

<body>
<%@include file="Header.jsp" %>


<div id="wrap1">
<div id="intro">
	<div class="intro_text">
	[<%=session.getAttribute("userName") %>] 님의 마이페이지 입니다. 
	</div>
</div>

         <br><div id="header2">
        	<div id="mainMenuBox1">
            	<ul id="menuItem1">
                    <li><a href="myOrderList.five">주문 조회<div class="my02"></div></a></li>
                    <li><a href="myProfile.five">프로필 수정<div class="my01"></div></a></li>
                    <li><a href="cartList.five">장바구니<div class="my03"></div></a></li>
                    <li><a href="myEventList.five">참여한 이벤트 보기<div class="my04"></div></a></li>
                    <li><a href="myQnaList.five">게시물 관리<div class="my05"></div></a></li>
                </ul>
            </div>
        </div>
 </div>
 
 
</body>

</html>