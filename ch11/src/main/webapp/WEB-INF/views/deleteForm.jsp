<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function chk() {
		if (frm.passwd.value != frm.passwd2.value) {
			alert("암호가 다릅니다"); frm.passwd.focus();
			frm.passwd.value= "";  return false;
		}
	}
</script></head><body>
<div class="container">
	<h2><span class="label label-success">게시글 삭제</span></h2>
<form action="${path}/delete" onsubmit="return chk()" name="frm">
	<input type="hidden" name="num" value="${board.num}">
	<input type="hidden" name="passwd2" value="${board.passwd}">
	<input type="hidden" name="pageNum" value="${pageNum}">
<table class="table table-bordered">
	<tr><th>암호</th><td><input type="password" name="passwd" 
		required="required" autofocus="autofocus"></td></tr>
	<tr><th colspan="2"><input type="submit" value="확인"></th></tr>
</table></form>
</div>
</body>
</html>