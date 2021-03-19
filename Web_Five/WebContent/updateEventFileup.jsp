<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
이전 파일<br>
<img src="${pageContext.request.contextPath}/resources/image/<%=session.getAttribute("eventfilenameO")%>"><br>
<form action="eventFileUpload.five" enctype="multipart/form-data" method="post">
		<input type="file" name="file"/><br>
		
		<input type="submit" name="submit" value="파일 확인"/>
</body>
</html>