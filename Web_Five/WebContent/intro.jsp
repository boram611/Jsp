<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>about</title>
<link rel="stylesheet" type="text/css" href="./css/intro.css">
<%@include file="Header.jsp" %>
</head>
<body>
	<section>
		<img src="./image/bg.jpg" id="bg">
		<img src="./image/moon.png" id="moon">
		<img src="./image/mountain.png" id="mountain">
		<img src="./image/road.png" id="road">
		<h2 id="text">BYE PLASTIC</h2>
		
	</section>
	
	<div class="text" id="alltext">
		<div class="title" id="title">
			<h4> ABOUT 미쁘다</h4>
		</div>
		
		<div class="textarea" id="textarea">
			<h5 id="no"> 우리는 'NO PLASTIC'을 외칩니다.</h5><br>
			
			<p> 우리가 편리함때문에 사용하는 일회용 플라스틱은 지구를 아프게 하고 있습니다.</p>
			<a>일회용 플라스틱을 생산하는데 5초, 사용하는데 5분 , 분해되는데 500년이 걸립니다.<br>
			하지만  이제는 플라스틱이 없는 생활을 상상하기 어려울 정도로 플라스틱은 정말 많은 곳에 사용되고 있습니다.<br>
			<br>
			1년 동안 만들어지는 플라스틱 양은 약 2억 5000t, <br>
				바다에 버려지는 양은 약 800t ,<br>
				세계 인구 1명당 사용하는 양은 42kg,<br>
				한국인 1명당 쓰는 양 108kg 입니다.<br>
				<br>
		
			</a>
			
			<h5 id="no"> 'PLA'를 쓰자</h5><br>
			
			<p> 친환경 소재의 플라스틱으로 각광받고 있는 물질이 있습니다.</p>
			<a>‘PAL’ Polylatic Acid의 약자이며 ‘폴리젖산’ 이라고도 합니다.<br>

			다른 플라스틱과는 다르게 옥수수나 사탕수수같은 식물에서 전분을 추출하여 원재료로 사용하는 친환경 수지입니다.<br>
			<br>
			가장 큰 장점 중 하나는 ‘생분해성 플라스틱’이라는 것입니다.<br>
			 특정 조건에서 미생물에 의해 6개월~1년 사이에 자연분해 되어집니다.<br>
			 <br>
			분해되는데 500년이 넘게 걸리는 일반 플라스틱에 비해 훨씬 환경 친화적인 소재입니다.<br>
			</a>
			
			<h4 id="fin"> 지구를 생각한다면 지금 '미쁘다'에서 PLA 플라스틱을 구매해보세요. </h4><br>
		</div>
	</div>
	
	<script type="text/javascript">
	let bg = document.getElementById("bg");
	let moon = document.getElementById("moon");
	let mountain = document.getElementById("mountain");
	let road = document.getElementById("road");
	let text = document.getElementById("text");
	
	window.addEventListener('scroll', function(){
		var value = window.scrollY;
		
		bg.style.top = value * 0.5 + 'px' ; 
		moon.style.left = -value * 0.5 + 'px' ; 
		mountain.style.top = -value * 0.15 + 'px' ; 
		road.style.top = value * 0.15 + 'px' ; 
		text.style.top = value * 1 + 'px' ; 
		
	})
	
	</script>
</body>
<%@include file="Footer.jsp" %>
</html>