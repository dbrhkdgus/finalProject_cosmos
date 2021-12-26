<%@page import="com.kh.cosmos.main.model.vo.Question"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="문의사항 상세보기" name="title"/>
</jsp:include>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="loginMember"/>
</sec:authorize>

<style>
div#board-container{width: 80%;}
/* input, button, textarea {margin-bottom:15px;}
button { overflow: hidden; } */
/* 부트스트랩 : 파일라벨명 정렬*/
div#board-container label.custom-file-label{text-align:left;}
</style>
<div id="board-container" class="mx-auto">
	<div class="text-center" style="display: flex; justify-content: space-between; width: 100%;">
		<table class="table text-center">
			<thead>
				<tr>
					<th scope="col">제목</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${que.queTitle} <span class="mr-5 text-secondary"><fmt:formatDate value="${que.regDate}" pattern="yy-MM-dd" /></span></td>
				</tr>
			</tbody>
		</table>
	</div>
		<span class="text-right">작성자 : ${fn:startsWith(memberProfileRenamedFileName, 'http') ? que.memberName : que.memberId}</span>
	<div class="card text-center">
		<div class="card-body">
			<img src="${pageContext.request.contextPath }/resources/upFile/question/${att.renamedFilename}" alt="" style="width: 50%" /> ${que.queContent}
		</div>
	</div>
	<br />
<form:form action="${pageContext.request.contextPath }/main/queReplyEnroll.do" method="post" >
	<input type="hidden" value="${que.queNo}" name ="queNo">
		
		<div class="input-group mb-3">
		  <input type="text" class="form-control" placeholder="댓글을 입력하세요" name="content">
		  <button class="btn btn-outline-secondary" type="submit" id="button-addon2" style="margin-bottom: 0px;">댓글작성</button>
		</div>
</form:form>
		
	<!--댓글유무분기처리  -->


	<div class="card text-center">
		<div class="reply-outer ">
			<c:forEach items="${replyList}" var="reply">
		<form:form action="${pageContext.request.contextPath }/main/deleteQueReply.do" method="post">
				<div class="d-flex bd-highlight" style="text-align-last: start;">
					<div class="p-2 bd-highlight">${fn:startsWith(memberProfileRenamedFileName, 'http') ? reply.memberName : reply.memberId}:</div>
					<div class="p-2 flex-grow-1 bd-highlight">${reply.content}</div>
					<div class="p-2 bd-highlight" style="font-size: 10px;">
						<fmt:formatDate value="${reply.regDate}" pattern="yy-MM-dd" />
						<c:if test="${reply.memberId eq loginMember.id || loginMember.authorities eq '[ROLE_ADMIN]'}">
						 <button class="btn" type="submit" id="button-addon2" style="margin-bottom: 0px; font-size:12px">댓글삭제</button>
							<input type="hidden" name = "replyNo" value="${reply.replyNo}"> 
							<input type="hidden" name = "queNo" value="${que.queNo}"> 
						</c:if>
					</div>
					
				</div>
				</form:form>
			</c:forEach>
		</div>
	</div>

</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
