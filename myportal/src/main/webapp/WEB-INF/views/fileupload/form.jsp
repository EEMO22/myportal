<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드 폼</title>
</head>
<body>
	<form method="post"
		action="<c:url value="/fileupload/upload" />"
		enctype="multipart/form-data">
		<label>업로드 할 파일</label>
		<input type="file" name="file1"	/>
		<input type="submit" value="업로드" />
	</form>
</body>
</html>