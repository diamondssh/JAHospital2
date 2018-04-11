<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html><html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function chk() {
		if (frm.passwd.value != frm.passwd2.value) {
			alert("암호가 다릅니다");  frm.passwd2.focus();
			frm.passwd2.value="";	return false;
		}
	}
</script></head><body>
<div class="container">
	<h2 class="text-primary">게시판 글수정</h2>
<form action="${path}/update" method="post" name="frm" 
	onsubmit="return chk()">
	<input type="hidden" name="num" value="${board.num}">
	<input type="hidden" name="passwd" value="${board.passwd}">
	<input type="hidden" name="pageNum" value="${pageNum}">
<table class="table table-bordered">
	<tr><th>제목</th><td><input type="text" name="subject" 
		required="required" autofocus="autofocus"
		value="${board.subject}"></td></tr>
	<tr><th>작성자</th><td><input type="text" name="writer" 
		required="required" value="${board.writer}"></td></tr>
	<tr><th>이메일</th><td><input type="email" name="email" 
		required="required" value="${board.email}"></td></tr>
	<tr><th>암호</th><td><input type="password" name="passwd2" 
		required="required"></td></tr>
	<tr><th>내용</th><td><pre><textarea rows="5" cols="30" 
		name="content" required="required">${board.content}</textarea>
		</pre></td></tr>
	<tr><th colspan="2"><input type="submit" value="확인"></th></tr>
</table></form>
</div>
</body>
</html>
