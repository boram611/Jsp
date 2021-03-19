<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 보기</title>
</head>
<script src="./js/jquery-3.3.1.min.js"></script>
<style>
input{border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;}
input:focus {outline:none;}
textarea{border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;}
textarea:focus {outline:none;}
#notice{
	width:700px;
	margin:0 auto;
	margin-top:50px;
}
  table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  th {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }
  td{
   border-bottom: 1px solid #444444;
   padding: 10px;
  }
</style>
<body>
<%@include file="Header.jsp" %>
<div id="notice">
	<h2>&nbsp;공지사항</h2>
	
	<table>
		<form method="post">
			<tr>
				<th style="width: 100px; height: 30px;">번호</th>
				<td style="width: 200px"><input type = "text" name = "nSeqno" size = "10" value="${noticeView.nSeqno}" readonly="readonly"></td>
			</tr>
			<tr>
				<th style="height: 30px;"> 작성 날짜</th>
				<td> <input type = "text" name = "nDate" size = "30" value="${noticeView.nDate}" readonly="readonly"></td>
			</tr>
			<tr>
				<th style="height: 30px;">제목</th>
				<td><input type = "text" name = "nTitle" size = "50" value="${noticeView.nTitle}" readonly="readonly"></td>
			</tr>
			
			<tr>
				<th style="height: 30px;">내용</th>
				<td><textarea style="resize: none;" rows="20" cols="90"  name="nContent" readonly="readonly">${noticeView.nContent}</textarea></td>
			</tr>
			<tr>
				<td colspan="2"><button type="button" style="height:30px; width:80px; font-size:15px; font-family:돋움; background-color:#eff7f9; border:1 solid #A0DBE4" onclick="location.href='noticeList.five'">&nbsp; 목 록 &nbsp;</button></td>
			</tr>
		</form>
	</table><br><br>
	</div>
	<%@include file="Footer.jsp" %>
</body>
</html>