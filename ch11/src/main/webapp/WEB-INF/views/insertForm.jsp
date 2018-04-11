<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<h2 class="text-primary">게시판 글쓰기</h2>
<form action="${path}/insert" method="post">
	<input type="hidden" name="num" value="${num}">
	<input type="hidden" name="ref" value="${ref}">
	<input type="hidden" name="re_level" value="${re_level}">
	<input type="hidden" name="re_step" value="${re_step}">
	<input type="hidden" name="pageNum" value="${pageNum}">
 <table class="table table-bordered">
 <tr><th>제목</th><td><input type="text" name="subject" required="required" autofocus="autofocus"></td></tr>
 <tr><th>작성자</th><td><input type="text" name="writer" required="required"></td></tr>
 <tr><th>이메일</th><td><input type="text" name="email" required="required"></td></tr>
 <tr><th>암호</th><td><input type="password" name="passwd" required="required"></td></tr>
 <tr><th>내용</th><td><textarea rows="5" cols="30" name="content" required="required"></textarea></td></tr>
 <tr><th colspan="2"><input type="submit" value="OK"></th></tr>
 </table>
 </form>
 </div>
</body>
</html>