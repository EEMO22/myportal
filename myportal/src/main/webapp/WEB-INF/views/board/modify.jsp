<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>My Homepage</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
</head>
<body>
	<form method="post" action="<c:url value="/board/modify"/>">
		<table border="1" width="640">
			<input name="no" type="hidden" value="${vo.no }">
			<tr>
				<td colspan="2"><h3>게시판</h3></td>
			</tr>
			<tr>
				<th colspan="2">글수정</th>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" value="${vo.getTitle()}"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea id="content" name="content">${vo.getContent()}</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<a href="<c:url value="/board/view/${no }" />">취소</a>
					<input type="submit" value="수정">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
