<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$('#rlist').load('${path}/rlist/num/${board.num}');
		$('#list').load('${path}/list/pageNum/${pageNum}');
		$('#repInsert').click(function() {
			if (!frm.replytext.value) {
				alert("댓글 입력 후 확인을 누르세요");
				frm.replytext.focus();
				return false;
			}
			var frmData = $('#frm').serialize();
			$.post('${path}/rInsert', frmData, function(data) {
				$('#rlist').html(data);
				frm.replytext.value = "";
			});
		});
	});
</script>
</head>
<body>
	<div class="container">
		<h2 class="text-primary">게시글 상세정보</h2>
		<table class="table table-striped">
			<tr>
				<th>제목</th>
				<td>${board.subject }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${board.writer }</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${board.readcount }</td>
			</tr>
			<tr>
				<th>IP</th>
				<td>${board.ip }</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${board.email }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><pre>${board.content }</pre></td>
			</tr>

		</table>
		<a class="btn btn-warning"
			href="${path}/updateForm/num/${board.num }/pageNum/${pageNum}">수정</a>
		<a class="btn btn-danger"
			href="${path}/deleteForm/num/${board.num }/pageNum/${pageNum}">삭제</a>
		<a class="btn btn-info"
			href="${path}/insertForm/nm/${board.num }&pageNum=${pageNum}">답변</a>
		<a class="btn btn-default" href="${path}/list/pageNum/${pageNum }">목록</a>
		<p>
		<form name="frm" id="frm">
			<input type="hidden" name="replyer" value="${board.writer }">
			<input type="hidden" name="bno" value="${board.num }"> 댓글 :
			<textarea rows="3" cols="50" name="replytext"
				placeholder="댓글을 입력하세요."></textarea>
			<input type="button" value="OK" id="repInsert">
			<!-- 버튼처리 한이유는 아작스로 하기 위해서 -->
		</form>
		<div id="rlist"></div>
		<div id="list"></div>
	</div>
</body>
</html>