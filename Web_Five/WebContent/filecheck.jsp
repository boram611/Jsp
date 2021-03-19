<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>첨부파일 확인</title>
<script language="javascript">
//버튼클릭시 javascript 호출합니다.
function javascript(){
    self.close();   //자기자신창을 닫습니다.
}
</script>
</head>
<body>
<img src="${pageContext.request.contextPath}/resources/image/<%=session.getAttribute("filename")%>"><br>
<input type='button' onclick='javascript()' value='전송'/><br>
<form action="qnafileup.jsp" enctype="multipart/form-data" method="post">
<input type="submit" name="submit" value="이전으로 돌아가기"/>

</body>
</html>