<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 정보 수정</title>
	<script src="<c:url value="/javascript/jquery/jquery-3.6.0.js" />"></script>
	<script src="<c:url value="/javascript/users.js" />"></script>
</head>
<body>
	<h1>회원 정보 수정</h1>
	
	<form
		id="modify-form"
		name="updateForm" 
		action="<c:url value="/users/modify"/>"
		method="POST">
		<input type="hidden" name="no" value="${authUser.no }">
		
		<label for="name">이름</label>
		<input name="name" type="text" value="${authUser.name }"><br>
	
		<label for="password">비밀번호</label>
		<input name="password" type="password" placeholder="새로운 비밀번호를 입력하십시오"><br>
	
		<label for="gender">성별</label>
		<input type="radio" name="gender" value="M" 
			checked="${authUser.gender == 'M' }">남성</radio>
		<input type="radio" name="gender" value="F"
			checked="${authUser.gender == 'F' }">여성</radio><br>
		<input type="submit" value="저장"> 
	
	</form>
	
</body>
</html>