<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업로드 된 파일</title>
</head>
<body>
	<h1>업로드 된 이미지</h1>
	<img src="<c:url value="/upload/${urlImage }"/>" />
	<a href="<c:url value="/fileupload/form" />">다시 업로드</a>
</body>
</html>