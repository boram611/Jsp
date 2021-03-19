<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>qnaHeader</title>

<script src="js/jquery-3.3.1.min.js"></script>
</head>
<style>


#wrap1 {
		margin:0 auto;
		width:1000px;
}

#header1 {
	height:60px;
	padding:0;
	margin-top:10px;
	background-color:#588f50;
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

</style>

<body>
<%@include file="Header.jsp" %>
<div id="wrap1"><br>
<h2>&nbsp;자주 묻는 질문</h2>
         <br><div id="header1">
        	<div id="mainMenuBox1">
            	<ul id="menuItem1">
                	<li><a href="oftenList1.jsp">[전체보기]</a></li>
                    <li><a href="oftenList2.jsp">[주문/결제]</a></li>
                    <li><a href="oftenList3.jsp">[회원가입/로그인]</a></li>
                    <li><a href="oftenList4.jsp">[배송관련]</a></li>
                    <li><a href="oftenList5.jsp">[기타문의]</a></li>
                </ul>
            </div>
        </div>
 </div>

 
 
</body>

</html>