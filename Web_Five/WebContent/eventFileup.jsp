<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>첨부 파일</title>
<script type="text/javascript" language="javascript">
function closeWin(){  
		self.close();  
}  
</script>
</head>
<body>
<form action="eventFileUpload.five" enctype="multipart/form-data" method="post">
		<input type="file" name="file"/><br>
		
		<input type="submit" name="submit" value="파일 확인"/>
		
		
</form>
</body>
</html>