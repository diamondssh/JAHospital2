<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title></head><body>
<div class="container">
	<h2 class="text-primary">게시글 목록</h2>
<table class="table table-hover">
	<tr><th>번호</th><th>제목 </th><th>작성자</th>
		<th>조회수</th><th>작성일</th></tr>
<c:if test="${pp.total == 0 }">
	<tr><th colspan="5">데이터가 없습니다</th></tr>
</c:if>
<c:if test="${pp.total > 0 }">
	<c:forEach var="board" items="${list}">
		<tr><td>${no}</td>
		<c:if test="${board.del=='y' }">
			<th colspan="4">삭제된 글 입니다</th>
		</c:if>
		<c:if test="${board.del!='y' }">
			<td title="${board.content}">				
				<c:if test="${board.re_level >0 }">
					<img alt="" src="${path}/images/level.gif" height="2"
						width="${board.re_level*10}">
					<img alt="" src="${path}/images/re.gif"></c:if>
					<a class="btn btn-success btn-sm" 
					href="${path}/view/num/${board.num}/pageNum/${pp.currentPage}">
						${board.subject }</a>
				<c:if test="${board.readcount > 30 }">
					<img alt="" src="${path}/images/hot.gif"></c:if></td>
			<td>${board.writer }</td><td>${board.readcount }</td>
			<td>${board.reg_date}</td>
		</c:if></tr>
			<c:set var="no" value="${no - 1}"></c:set>
	</c:forEach>
</c:if>
</table>
<c:url var="url" value="/list"></c:url>
<%-- <form action="${path }/list"> --%>
<form action="${url}">
	<input type="hidden" name="pageNum" value="1">
	<select name="search">
	<c:forTokens var="s" items="subject,writer,content,subcon" 
		delims=","	varStatus="vs">
		<c:if test="${s==search}">
			<option value="${s}" selected="selected">${ops[vs.index] }</option>
		</c:if>
		<c:if test="${s!=search}">
			<option value="${s}">${ops[vs.index] }</option>
		</c:if>
	</c:forTokens>
<!-- 	<option value="subject">제목</option>
		<option value="writer">작성자</option>
		<option value="content">내용</option>
		<option value="subcon">제목+내용</option> -->
	</select>
	<input type="text" name="keyword" value="${keyword}">
	<input type="submit" value="확인">
</form>
<div align="center">
<ul class="pagination">
	
		<c:if test="${pp.startPage > pp.pagePerBlock }">
			<li><a href="${path}/list/pageNum/${pp.startPage-1}?search=${search}&keyword=${keyword}">
				<span class="glyphicon glyphicon-triangle-left"></span>
			</a></li>
		</c:if>
		<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage }">
			<c:if test="${pp.currentPage==i }">
				<li class="active">
					<a href="${path}//list/pageNum/${i}?search=${search}&keyword=${keyword}">${i}</a></li>
			</c:if>
			<c:if test="${pp.currentPage!=i }">
				<li><a href="${path}/list/pageNum/${i}?search=${search}&keyword=${keyword}">${i}</a></li>
			</c:if>						 
		</c:forEach>
		<c:if test="${pp.endPage < pp.totalPage }">
			<li><a href="${path}/list/pageNum/${pp.endPage+1}?search=${search}&keyword=${keyword}">
				<span class="glyphicon glyphicon-triangle-right"></span>
			</a></li>
		</c:if>	
	
</ul>	
</div>
<a class="btn btn-info" href="${path}/insertForm?pageNum=1">글 입력</a>
</div>
</body>
</html>


