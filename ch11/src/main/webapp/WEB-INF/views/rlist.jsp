<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function rDelete(rno,bno){
		var frmData = "rno="+rno+"&bno"+bno;
		$.post('${path}/rDelete',frmData, function(data){
			alert("삭제되었습니다.");
			$('#rlist').html(data);
		});
	}
	function rUpdate(rno, bno){
		var txt = $('#td_'+rno).text();
		$('#td_'+rno).html(
				'<textarea name = "replytext" cols="30" rows="3" id="rt">' 
				+txt+'</textarea>');
		$('#btn_'+rno).html(
			'<input type = "button" value="확인" onlick'		
		)
		
	}
</script>
</head>
<body>
	<div class="container">
		<h3>
			<span class="label label-danger">댓글</span>
		</h3>
		<table class="table table-boarded">
			<tr>
				<th>작성자</th>
				<th>내용</th>
				<th>수정일</th>
				<th>권한</th>
			</tr>
			<c:forEach var="rb" items="${rlist}">
				<tr>
					<c:if test="${rb.del=='y' }">
						<th colspan="4">삭제 됨</th>
					</c:if>
					<c:if test="${rb.del !='y' }">
						<td>${rb.replyer }</td>
						<td>${rb.replytext}</td>
						<td>${rb.updatedate}</td>
						<!-- 실제는 로그인 한 아이디와 댓글 아이디와 비교 하는게 맞다. -->
						<td id="td_${rb.rno}">
							<c:if test="${rb.replyer==board.writer }">
								<input type="button" value="수정" onclick="rUpdate(${rb.rno},${rb.bno })">
								<input type="button" value="삭제" onclick="rDelete(${rb.rno},${rb.bno })">
							</c:if></td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>