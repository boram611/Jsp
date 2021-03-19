<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
<script src="./js/jquery-3.3.1.min.js"></script>
</head>
<body>
<%
	session.invalidate();
	response.sendRedirect("logOut.five");
%>

</body>
</html>