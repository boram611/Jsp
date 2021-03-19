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
<form action="proFileUpload1.five" enctype="multipart/form-data" method="post">
		상품 사진(디테일)<input type="file" name="file1"/><br>
		상품 설명 사진<input type="file" name="file2"/><br>
		상품사진(리스트)<input type="file" name="file3"/><br>
		<input type="submit" name="submit" value="파일 확인"/>
		
		
</form>
</body>
</html>