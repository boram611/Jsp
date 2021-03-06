
<%@page import="com.web_five.dto.prdDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/main.css" rel="stylesheet" type="text/css">
<script src="./js/index.js"></script>
<script src="./js/jquery-3.3.1.min.js"></script>

<title>Main</title>
<style>
a{
	color: black;
    text-decoration: none;
}
#prd_real
{
	width:1250px;
	height:350px;
	margin:0 auto;
	margin-bottom:30px;
	text-align:center;
}

#prd_real .image{
	text-align: center;
}


#prd_real .image img{
	width:200px;
	height:160px;
	
}


#prd_real h3{

	text-align:center;
	padding-bottom:50px;
	padding-top:50px;

}

#prd_real .prdtext a{
	text-align: left;
	text-decoration: none;
	color: black;
}

#prd_real .prdtext a:link{
	text-align: left;
	text-decoration: none;
	color: black;
}

#prd_real .prdtext a:visited{
	text-align: left;
	text-decoration: none;
	color: black;
}

#prd_real .prdtext td{
	float:left;
}

#prd_new
{
	width:1250px;
	height:350px;
	margin:0 auto;
	margin-bottom:120px;
	text-align:center;
}

#prd_new .image{
	text-align: center;
}


#prd_new .image img{
	width:200px;
	height:160px;
	
}


#prd_new h3{

	text-align:center;
	padding-bottom:50px;
	padding-top:50px;

}

#prd_new .prdtext a{
	text-align: left;
	text-decoration: none;
	color: black;
}

#prd_new .prdtext a:link{
	text-align: left;
	text-decoration: none;
	color: black;
}

#prd_new .prdtext a:visited{
	text-align: left;
	text-decoration: none;
	color: black;
}

#prd_new .prdtext td{
	float:left;
}

#content {
	width:1250px;
	height:200px;
	margin:0 auto;
	margin-bottom: 50px;
	margin-top: 30px;
	
}

#content ul {
	list-style:none;
}

#content ul li {
	margin-bottom:4px;
}

#content a {
	color:#000;
	text-decoration:none;
}

#content .title {
	width:400px;
	height:30px;
	margin-bottom:20px;
	float:left;
	font-size:22px;
	font-weight:bold;
	clear:both;
}

#content .notice {
	width:400px;
	height:200px;
	float:left;
	font-size:18px;
	margin-right:25px;
}

#content .notice ul li a:hover {
	color:#6fa168;
}


#content .cscenter {
	width:400px;
	height:200px;
	float:left;
	font-size:18px;
	margin-right:25px;
}

#content .cscenter .title {
	margin-bottom:30px;
	background-color: white;
}

#content .cscenter .tel {
	font-size:22px;
	margin-bottom:14px;
}

#content .cscenter .time {
	font-size:17px;
}


#content #staticMap {
	width:398px;
	height:200px;
	float:right;
	background-color: white;
	
}



</style>
 <style>
    .screen_out {display:block;overflow:hidden;position:absolute;left:-9999px;width:1px;height:1px;font-size:0;line-height:0;text-indent:-9999px}
    .wrap_content {overflow:hidden;height:330px}
    .wrap_map {width:50%;height:300px;float:left;position:relative}
    .wrap_roadview {width:50%;height:300px;float:left;position:relative}
    .wrap_button {position:absolute;left:15px;top:12px;z-index:2}
    .btn_comm {float:left;display:block;width:70px;height:27px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/sample_button_control.png) no-repeat}
    .btn_linkMap {background-position:0 0;}
    .btn_resetMap {background-position:-69px 0;}
    .btn_linkRoadview {background-position:0 0;}
    .btn_resetRoadview {background-position:-69px 0;}
</style>
<script type="text/javascript">
$(function() {
	var movedIndex = 0;
	
	function moveSlide(index) {
		movedIndex = index;
		
		var moveLeft = -(index * 1250);
		$('#slidePanel').animate({'left':moveLeft}, 'slow');
	}
	
	
	$('#prevButton').on('click', function() {
		if(movedIndex != 0)
			movedIndex = movedIndex - 1;
		moveSlide(movedIndex);
	});
	
	$('#nextButton').on('click', function() {
		if(movedIndex != 3)
			movedIndex = movedIndex + 1;
		moveSlide(movedIndex);
	});
	
	setInterval(function() {
		
		if(movedIndex != 3)
			movedIndex = movedIndex + 1;
		else
			movedIndex = 0;
			
		moveSlide(movedIndex);
	},3000);

	$('#controlPanel img').each(function (index) {
		$(this).hover(
			function() {
				
				$(this).attr('src', 'img/controlButton2.png');
			},
			function() {
				$(this).attr('src', 'img/controlButton1.png');
			}
		);
		
		
		$(this).on('click', function() {
			moveSlide(index);
		});
	}); 
});</script>
</head>

<body>

<%@include file="Header.jsp" %>



        <div id="slideShow">
        	<div id="prevNectButtonBox">
            	<img id="prevButton" src="img/prevButton.png" width="15" height="28">
                <img id="nextButton" src="img/nextButton.png" width="15" height="28">
            </div>
            <div id="slideShowBox">
            	<div id="slidePanel">
                	<img src="img/banner1.png" class="slideImage">
                	<img src="img/banner2.png" class="slideImage">
                	<img src="img/banner3.png" class="slideImage">
 
                	<img src="img/banner4.png" class="slideImage">
                </div>
			</div>
			
			<div id="controlPanel">
				<img src="img/controlButton1.png">
				<img src="img/controlButton1.png">
				<img src="img/controlButton1.png">
				<img src="img/controlButton1.png">
			</div>
        </div>
        
        <div id="prd_real">
        	<h3>????????? ?????? ????????????</h3>
       <div class="pr">
	        <table width="1280px">
	         	<colgroup>
    				<col width="280px"/>
    			</colgroup>
	       <tr>
	        <c:forEach items="${real}" var="dto" begin="0" end="4">
	       <td>
				<div class="image">
	        		<a href="productShowMain.five?prdNo=${dto.prdNo }&prdName=${dto.prdName }&prdPrice=${dto.prdPrice }"><img src="${pageContext.request.contextPath}/resources/image/${dto.prdFilename}"></a>
	        	</div>	
	        </td>
	        </c:forEach>
	       </tr>
	     
	        	 <tr>
	        	<div class="prdtext">
	        	 <c:forEach items="${real}" var="dto" begin="0" end="4">
		        	
			        	<td><a href="productShowMain.five?prdNo=${dto.prdNo }&prdName=${dto.prdName }&prdPrice=${dto.prdPrice }">${fn:substring(dto.prdName,0,10)}???</a></td>
			        	</c:forEach>
			        	 </tr>
			        	 <tr>
			        	<c:forEach items="${real}" var="dto" begin="0" end="4">
			        	
			        	<td><a>??? ${dto.prdPrice }</a></td>
			        
	        	</c:forEach>
	        	</tr>
	        	</div>
	     
	         </table>
	      </div>
	      </div>
	      
	     
	   <div id="prd_new">
        	<h3>?????????</h3>
       <div class="pr">
	        <table width="1280px">
	         	<colgroup>
    				<col width="280px"/>
    			</colgroup>
	       <tr>
	        <c:forEach items="${nw}" var="dto" begin="0" end="4">
	       <td>
				<div class="image">
	        		<a href="productShowMain.five?prdNo=${dto.prdNo }&prdName=${dto.prdName }&prdPrice=${dto.prdPrice }"><img src="${pageContext.request.contextPath}/resources/image/${dto.prdFilename}"></a>
	        	</div>	
	        </td>
	        </c:forEach>
	       </tr>
	     
	        	 <tr>
	        	<div class="prdtext">
	        	 <c:forEach items="${nw}" var="dto" begin="0" end="4">
		        	
			        	<td><a href="productShowMain.five?prdNo=${dto.prdNo }&prdName=${dto.prdName }&prdPrice=${dto.prdPrice }">${fn:substring(dto.prdName,0,10)}???</a></td>
			        	</c:forEach>
			        	 </tr>
			        	 <tr>
			        	<c:forEach items="${nw}" var="dto" begin="0" end="4">
			        	
			        	<td><a>??? ${dto.prdPrice }</a></td>
			        
	        	</c:forEach>
	        	</tr>
	        	</div>
	     
	         </table>
	      </div>
	      </div>
        
      
      
        <div id="content">
			<div class="notice">
            	<div class="title">????????????</div>
            	<ul>
                    
                    <c:forEach items="${notice}" var="ddto" begin="0" end="4">
            	 	<li>
		        		<a href="noticeView.five?nSeqno=${ddto.nSeqno }&nTitle=${ddto.nTitle }"> ${ddto.nTitle }</a>
                    </li>
			        </c:forEach>
                    
                    
            	</ul>
			
			</div>
			<div class="cscenter">
            	<div class="title">????????????</div>
            	<div class="tel">02-1227-0102</div>
                    <div class="time">
                    	<ul>
                        	<li>???????????? : AM 10:00 ~ PM 17:00 ( ??????,????????? ?????? )</li>
                            <li>???????????? : AM 11:30 ~ 12:30</li>
                        </ul>
                    </div>
            </div>
            
            
            
            
            
            <div id="staticMap">
            	<div class="wrap_content">
            	<div class="title">????????? ???????????? ??????</div>
    <div class="wrap_map">
        <div id="map" style="width:398px;height:140px"></div> <!-- ????????? ????????? div ????????? -->
        <div class="wrap_button">
            <a href="javascript:;" class="btn_comm btn_linkMap" target="_blank" onclick="moveKakaoMap(this)"><span class="screen_out">?????? ????????????</span></a> <!-- ?????? ???????????? ??????????????? -->
            <a href="javascript:;" class="btn_comm btn_resetMap" onclick="resetKakaoMap()"><span class="screen_out">?????? ?????????</span></a> <!-- ?????? ???????????? ??????????????? -->
        </div>
    </div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f2627f8e80f9c5c5af23b1f5cbcbd833"></script>
<script>
var mapContainer = document.getElementById('map'), // ????????? ????????? div 
    mapCenter = new kakao.maps.LatLng(37.50159768503334, 127.02544570676253), // ????????? ?????? ??????
    mapOption = {
        center: mapCenter, // ????????? ?????? ??????
        level: 4 // ????????? ?????? ??????
    };

// ????????? ????????? div???  ?????? ????????????  ????????? ???????????????
var map = new kakao.maps.Map(mapContainer, mapOption);

// ????????? ?????? ????????? ???????????????.
var mMarker = new kakao.maps.Marker({
    position: mapCenter, // ????????? ??????????????? ????????????.
    map: map // ??????????????? ????????? ????????????.
});

// ????????? ?????? ????????? ??????????????? ?????????.
var mLabel = new kakao.maps.InfoWindow({
    position: mapCenter, // ????????? ??????????????? ????????????.
    content: '????????? ???????????? ??????' // ??????????????? ????????? ????????? ????????? ?????????.
});
mLabel.open(map, mMarker); // ????????? ????????????, ????????? ????????? ????????? ?????? ?????? ??????????????? ???????????????.


var rvContainer = document.getElementById('roadview'); // ???????????? ????????? div
var rv = new kakao.maps.Roadview(rvContainer); // ????????? ?????? ??????
var rc = new kakao.maps.RoadviewClient(); // ????????? ?????? ???????????? panoid??? ???????????? ?????? ????????? help?????? ??????
var rvResetValue = {} //???????????? ????????? ?????? ????????? ??????
rc.getNearestPanoId(mapCenter, 50, function(panoId) {
    rv.setPanoId(panoId, mapCenter);//????????? ????????? panoId??? ?????? ???????????? ???????????????.
    rvResetValue.panoId = panoId;
});

//?????? ?????? ????????? ?????????
function moveKakaoMap(self){
    
    var center = map.getCenter(), 
        lat = center.getLat(),
        lng = center.getLng();

    self.href = 'https://map.kakao.com/link/map/' + encodeURIComponent('????????? ???????????? ??????') + ',' + lat + ',' + lng; //Kakao ????????? ????????? ??????
}

//?????? ????????? ????????? ?????????
function resetKakaoMap(){
    map.setCenter(mapCenter); //????????? ????????? ?????? ????????? ?????? ???????????????.
    map.setLevel(mapOption.level);
}


</script>
			</div>
            
        </div>
        

<%@include file="Footer.jsp" %>

</body>
</html>