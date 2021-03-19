
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 상세 보기</title>
<script src="./js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
window.onload = function(){
	document.getElementById('eResult').onsubmit = function() {
		var bResult = document.getElementById('Result');
		if(<%=request.getAttribute("participant")%> == 1){
			alert("이미 이벤트에 참여하셨습니다.");
			bName.focus();
			return false;
		}else if(<%=request.getAttribute("participant")%> == 0){
			alert("이벤트 참여가 완료되셨습니다.");
			bName.focus();
			return true;
		}
	}
};
</script>
</head>
<style>
input{border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;}
input:focus {outline:none;}
textarea{border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;}
textarea:focus {outline:none;}
#notice{
	width:600px;
	margin:0 auto;
	margin-top:50px;
}
tr{
height: 30px;
}
table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
 th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
 }
 button a {
	color:#fff;
	text-decoration:none;
}
button {
	width:150px;
	height:40px;
	line-height:40px;
	text-align:center;
	border:1px solid #6fa168;
	border-radius:3px;
	font-weight:bold;
	background-color:#6fa168;
}

button:hover {
	color:#000;
	background-color:#fff;
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

/*이벤트 참여 버튼*/
#home2{
	width:200px;
	line-height:50px;
	height: 50px;
	margin-left:180px;
	margin-top:6px;
	background-color:#fff;
	border:2px solid purple;
	text-align:center;
	border-radius:2px;
	float: left;
}
</style>
</head>
<%@include file="Header.jsp" %>
<body>
<div id="notice">
<h2>&nbsp;이벤트 상세 보기</h2><br>
<div id="home3"><a href="eventList.five">목 록</a></div>
	<form id = "eResult" action="participateInEvent.five?eSeqno=<%=request.getParameter("eSeqno") %>&startDate=<%=request.getParameter("startDate") %>&endDate=<%=request.getParameter("endDate") %>&eTitle=<%=request.getParameter("eTitle") %>&eContent=<%=request.getParameter("eContent") %>" method="post">
	<table>
	<tr>
		<td colspan="2">
		 <div id="home2"><input type="submit" value = "이벤트 참여" id = "Result"
  								style="width: 200px; height: 50px; font-size: 18px;"></div>
		
		</tr>
		<tr>
			<th>번호</th>
			<td><input type="text" name="eSeqno" size="10" value="<%=request.getParameter("eSeqno") %>" readonly="readonly"></td>
		</tr>
		<tr>
			<th>이벤트 시작 날짜</th>
			<td><input type="text" name="startDate" size="30" value="<%=request.getParameter("startDate") %>" readonly="readonly"></td>
		</tr>
		<tr>
			<th>이벤트 종료 날짜</th>
			<td><input type="text" name="endDate" size="50" value="<%=request.getParameter("endDate") %>" readonly="readonly"></td> 
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="eTitle" value="<%=request.getParameter("eTitle") %>" readonly="readonly" size="50"></td> 
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="3" cols="50" name="eContent" readonly="readonly"><%=request.getParameter("eContent") %></textarea></td> 
		</tr>
		<tr>
			<td colspan="2"><img src="${pageContext.request.contextPath}/resources/image/<%=session.getAttribute("eventfilenameD")%>" width="550px"></td>
		</tr>
		
		<tr>
			<th colspan="2">당첨자 결과</th> <!--  참여한 유저 정보 불러오기 -->
		</tr>
	</table>
	</form>
		<table>
		<tr>
			<td><input type="hidden" name="eSeqno" size="10" value="<%=request.getParameter("eSeqno") %>" readonly="readonly"></td>
		</tr>
		
		<tr colspan="2">
				<c:forEach items="${eventResultView}" var="dto">
				<h4 style="margin-top: 10px; margin-bottom:10px; margin-left: 190px;">
				당첨 아이디 :&nbsp;[  ${dto.user_userId}  ]</h4><!-- 번호 -->
		</c:forEach>
		</tr>
		
	</table>
	</div>
</body>
<%@include file="Footer.jsp" %>
</html>