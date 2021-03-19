<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Header</title>
<link href="css/header.css" rel="stylesheet" type="text/css">
<script src="js/subMenu.js"></script>
</head>
<script type="text/javascript">

var switchValue = 0;


function searchToggle(obj, evt){
    var container = $(obj).closest('.search-wrapper');
        if(!container.hasClass('active')){
            container.addClass('active');
            evt.preventDefault();
        }
        else if(container.hasClass('active') && $(obj).closest('.input-holder').length == 0){
            container.removeClass('active');
            // clear input
            container.find('.search-input').val('');
            
        }
}
function go() { 
	var searchinput = document.getElementById('searchinput').value;
	if(searchinput.length > 0){
	console.log('section1----------------')
	location.href="searchProduct.five?search=" + searchinput;
		}
	var searchinput = document.getElementById('searchinput').value = '';
	
		
	
}

</script>
<style>

::selection {
   background: #212129;
}

.search-wrapper {
    position: absolute;
    transform: translate(-0%, -50%);
    top:70px;
    left:900px;
}
.search-wrapper.active {}

.search-wrapper .input-holder {    
    height: 70px;
    width:70px;
    overflow: hidden;
    background: rgba(255,255,255,0);
    border-radius:6px;
    position: relative;
    transition: all 0.3s ease-in-out;
}
.search-wrapper.active .input-holder {
    width:450px;
    border-radius: 50px;
    background: #adb5bd;
    transition: all .5s cubic-bezier(0.000, 0.105, 0.035, 1.570);
}
.search-wrapper .input-holder .search-input {
    width:100%;
    height: 50px;
    padding:0px 70px 0 20px;
    opacity: 0;
    position: absolute;
    top:0px;
    left:0px;
    background: transparent;
    box-sizing: border-box;
    border:none;
    outline:none;
    font-family:"Open Sans", Arial, Verdana;
    font-size: 16px;
    font-weight: 400;
    line-height: 20px;
    color:#FFF;
    transform: translate(0, 60px);
    transition: all .3s cubic-bezier(0.000, 0.105, 0.035, 1.570);
    transition-delay: 0.3s;
}
.search-wrapper.active .input-holder .search-input {
    opacity: 1;
    transform: translate(0, 10px);
}
.search-wrapper .input-holder .search-icon {
    width:70px;
    height:70px;
    border:none;
    border-radius:6px;
    background: #FFF;
    padding:0px;
    outline:none;
    position: relative;
    z-index: 2;
    float:right;
    cursor: pointer;
    transition: all 0.3s ease-in-out;
}
.search-wrapper.active .input-holder .search-icon {
    width: 50px;
    height:50px;
    margin: 10px;
    border-radius: 30px;
}
.search-wrapper .input-holder .search-icon span {
    width:22px;
    height:22px;
    display: inline-block;
    vertical-align: middle;
    position:relative;
    transform: rotate(45deg);
    transition: all .4s cubic-bezier(0.650, -0.600, 0.240, 1.650);
}
.search-wrapper.active .input-holder .search-icon span {
    transform: rotate(-45deg);
}
.search-wrapper .input-holder .search-icon span::before, .search-wrapper .input-holder .search-icon span::after {
    position: absolute; 
    content:'';
}
.search-wrapper .input-holder .search-icon span::before {
    width: 4px;
    height: 11px;
    left: 9px;
    top: 18px;
    border-radius: 2px;
    background: #6fa168;
}
.search-wrapper .input-holder .search-icon span::after {
    width: 14px;
    height: 14px;
    left: 0px;
    top: 0px;
    border-radius: 16px;
    border: 4px solid #6fa168;
}
.search-wrapper .close {
    position: absolute;
    z-index: 1;
    top:24px;
    right:20px;
    width:25px;
    height:25px;
    cursor: pointer;
    transform: rotate(-180deg);
    transition: all .3s cubic-bezier(0.285, -0.450, 0.935, 0.110);
    transition-delay: 0.2s;
}
.search-wrapper.active .close {
    right:-50px;
    transform: rotate(45deg);
    transition: all .6s cubic-bezier(0.000, 0.105, 0.035, 1.570);
    transition-delay: 0.5s;
}
.search-wrapper .close::before, .search-wrapper .close::after {
    position:absolute;
    content:'';
    background: #6fa168;
    border-radius: 2px;
}
.search-wrapper .close::before {
    width: 5px;
    height: 25px;
    left: 10px;
    top: 0px;
}
.search-wrapper .close::after {
    width: 25px;
    height: 5px;
    left: 0px;
    top: 10px;
}
</style>
<style>
* {
	padding:0;
	margin:0;
	font-family:font;
}

img { border:0; }

#wrap {
		margin:0 auto;
		width:100%;
}

#topMenuBox {
	width:400px;
	height:20px;
	line-height:20px;
	padding:0;
	float:right;
	margin-right:20px;
	
}

#topMenuBox ul {
	padding-left:0;
	margin:0;
	list-style:none;
}

#topMenuBox ul li {
	float:left;
	text-align:center;
	width:100px;
}

#topMenuBox a {
	color:#000;
	text-decoration:none;
	display:block; 
	
}

#logo {
	width: 180px;
	height: 104px;
	margin-top: 10px;
	margin-right: auto;
	margin-bottom: 0px;
	margin-left: 550px;
}

#header {
	height:60px;
	line-height:60px;
	padding:0;
	margin-top:10px;
	background-color:#6fa168;
}

#mainMenuBox {
	width:1250px;
	height:60px;
	line-height:60px;
	padding:0;
	margin:0 auto;
}

#mainMenuBox ul {
	padding-left:0;
	margin:0;
	list-style:none;
}

#mainMenuBox ul li {
	float:left;
	
	text-align:center;
	width:300px;
}

#mainMenuBox a {
	text-decoration:none;
	display:block;
	color:#fff;
	font-family:midnight;
	font-size:18px;
}

#mainMenuBox a:hover {
	color:#053517;
}

#subMenuBox {
	width:1250px;
	line-height:60px;
	text-align:center;
	padding-bottom:0;
	margin:0 auto;
	visibility:hidden;
	position:relative;
	z-index:10;
}

.subMenuItem {
	width:300px;
	padding:0;
	background-color:#6fa168;
}

.subMenuItem ul {
	list-style:none;
}

#subMenuItem1 {
	margin-left:300px;
	position:absolute;
}

#subMenuItem2 {
	margin-left:600px;
	position:absolute;
}

#subMenuItem3 {
	margin-left:900px;
	position:absolute;
}

.subMenuItem a {
	display:inline-block;
	color:#fff;
	text-decoration:none;
	font-family:midnight;
}

.subMenuItem a:hover {
	color:#053517;
	display:block;
	text-decoration:none;
}
</style>
<body>
<div id="wrap">

        <div id="topMenuBox">
        	<ul id="topMenuItem">
            		<li>
            	<%
					if(session.getAttribute("Log_userId") == null){ 
						out.println("<a href = 'agree.five'> 회원가입 </a>");
					}else{
						String userid = (String)session.getAttribute("Log_userId");
						out.println(" ");
					}
					%>
					</li>
            	<li>
            	
            	<%
					if(session.getAttribute("Log_userId") == null){ 
						out.println("<a href = 'logInView.jsp'>로그인 </a>");
					}else{
						String userid = (String)session.getAttribute("Log_userId");
						out.println("<a href = 'logOut.jsp'> 로그아웃 </a>");
					}
					%>
					</li>
					
                <li>
                <%
					if(session.getAttribute("Log_userId") == null){ 
						out.println("<a href = 'logInView.jsp'> 마이페이지 </a>");
					}else{
						String userid = (String)session.getAttribute("Log_userId");
						out.println("<a href = 'myOrderList.five'> 마이페이지 </a>");
					}
					%>
					</li>
                <li>
                 <%
					if(session.getAttribute("Log_userId") == null){ 
						out.println("<a href = 'logInView.jsp'> 장바구니 </a>");
					}else{
						String userid = (String)session.getAttribute("Log_userId");
						out.println("<a href = 'cartList.five'> 장바구니 </a>");
					}
					%>
                </li>
            </ul>
        </div>
        <div id="logo"><a href="mibbdaMain.five"><img src="img/logo.png" width="200" height="116"></a></div>
        <div class="search-wrapper">
    <div class="input-holder">
  
        <input type="text" class="search-input" id="searchinput" name="search" placeholder="Type to search">
       
        <button class="search-icon" onclick="searchToggle(this, event); go(); "><span></span></button>
    </div>
    <span class="close" onclick="searchToggle(this, event);"></span>
</div>
         <br><div id="header">
         
        	<div id="mainMenuBox">
            	<ul id="menuItem">
                	<li><a href="intro.five
                	">미쁘다?</a></li>
                    <li class="menuItemHover"><a href="storeMain.five">스토어</a></li>
                    <li class="menuItemHover"><a href="eventList.five">이벤트</a></li>
                    
                    <li class="menuItemHover"><a href="noticeList.five">공지사항</a></li>
                </ul>
            </div>
            <div id="subMenuBox">
            	<div class="subMenuItem" id="subMenuItem1">
                	<ul>
                    	<li><a href="store1.five">생활/주방</a></li>
                        <li><a href="store2.five">화장품</a></li>
                        <li><a href="store3.five">유아/완구</a></li>
                        <li><a href="store4.five">태블릿/휴대폰</a></li>
                    </ul>
                </div>
                <div class="subMenuItem" id="subMenuItem2">
                	<ul>
                    </ul>
                </div>
                <div class="subMenuItem" id="subMenuItem3">
                	<ul>
                    	<li><a href="oftenList1.jsp">자주 묻는 질문</a></li>
	                  <li>
              		<%
						if(session.getAttribute("Log_userId") == null){ 
							out.println("<a href = 'logInView.jsp'> 1:1문의 </a>");
						}else{
							String userid = (String)session.getAttribute("Log_userId");
							out.println("<a href = 'qnaListView.five'> 1:1문의 </a>");
						}
					%>
					</li>
                    </ul>
                </div>
            </div>
        </div>
 </div>
 

 
 
</body>

</html>