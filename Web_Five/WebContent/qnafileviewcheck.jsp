<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>첨부 파일 확인</title>
</head>
<body>
<img src="${pageContext.request.contextPath}/resources/image/<%=session.getAttribute("qnafileviewcheck")%>">
</body>
</html>