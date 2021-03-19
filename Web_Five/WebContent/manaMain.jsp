<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인페이지</title>
<script src="./js/jquery-3.3.1.min.js"></script>
</head>
<style>
#wrap1 {
	margin:0 auto;
	width:1200px;
}


#header2 {
	height:150px;
	padding:0;
	margin-top:10px;
	background-color:#588f50;
	margin-bottom: 30px;
}

#mainMenuBox1 {
	width:1200px;
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
	background-image: url("jieun_img/ma01.png");
	margin-left:66px;
	width: 60px;
	height: 60px;
	text-align: center;
}
.my02{
	background-image: url("jieun_img/ma02.png");
	margin-left:70px;
	width: 60px;
	height: 60px;
}
.my03{
	background-image: url("jieun_img/ma03.png");
	margin-left:70px;
	width: 60px;
	height: 60px;
}
.my04{
	background-image: url("jieun_img/ma04.png");
	margin-left:68px;
	width: 60px;
	height: 60px;
}
.my05{
	background-image: url("jieun_img/ma05.png");
	margin-left:70px;
	width: 60px;
	height: 60px;
}
.my06{
	background-image: url("jieun_img/ma06.png");
	margin-left:70px;
	width: 60px;
	height: 60px;
}

#left{
	margin-right:30px;
	float:right;
}

#left a {
	text-decoration:none;
	color:black;
	font-family:midnight;
	font-size:18px;
}

#left a:hover {
	color:pink;
}

</style>


<body>

<div id="wrap1">
<h4>Copyright 2020. Web 5조 김대환, 김보람, 박지은, 이민우</h4>
<center>
<h2>미쁘다 관리자 페이지</h2>
</center>

	
	<div id="left">
	<a href="mibbdaMain.five">미쁘다메인</a>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="salesList.five">매출 현황</a>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="logOut.five">관리자 로그아웃</a>
	</div>
	
         <br><div id="header2">
        	<div id="mainMenuBox1">
            	<ul id="menuItem1">
            	 <li><a href="manageNotice.five">공지사항 관리<div class="my01"></div></a></li>
            		<li><a href="manageUser.five">회원 관리<div class="my02"></div></a></li>
                    <li><a href="manageProduct.five">상품 관리<div class="my03"></div></a></li>
                    <li><a href="manageDelivery.five">배송 관리<div class="my04"></div></a></li>
                    <li><a href="manageEvent.five">이벤트 관리<div class="my05"></div></a></li>
                    <li><a href="oneToOneList.five">1:1문의 관리<div class="my06"></div></a></li>
                   
                </ul>
            </div>
        </div>
 </div>



</body>


</html>