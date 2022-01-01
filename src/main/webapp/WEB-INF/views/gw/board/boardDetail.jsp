<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<fmt:requestEncoding value="utf-8"/> 
<jsp:include page="/WEB-INF/views/common/gw_header.jsp">
	<jsp:param value="" name="title"/>
</jsp:include>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="loginMember"/>
</sec:authorize>

<div class="workspace-box">
  <div class="p-4">
    <hr>
    <div class="groupware-board-detail-title pl-2 pr-2">
      <div class="d-flex justify-content-between align-items-center">
      	  <h3 class="m-0">${post.postTitle}</h3>
	      <div class="groupware-board-detail-title-btns">
		      <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-share" viewBox="0 0 16 16">
		        <path d="M13.5 1a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zM11 2.5a2.5 2.5 0 1 1 .603 1.628l-6.718 3.12a2.499 2.499 0 0 1 0 1.504l6.718 3.12a2.5 2.5 0 1 1-.488.876l-6.718-3.12a2.5 2.5 0 1 1 0-3.256l6.718-3.12A2.5 2.5 0 0 1 11 2.5zm-8.5 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zm11 5.5a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3z"/>
		      </svg>
		      <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-bookmark" viewBox="0 0 16 16">
		        <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>
		      </svg>
	      </div>
      </div>
   	  <div class="d-flex justify-content-between align-items-center">
        <p class="m-0">${memberWithGroupMap[post.memberId]}<span><fmt:formatDate value="${post.postRegDate}" pattern="yy-MM-dd"/></span></p>
        <div class="post-button-set">
			<button class="btn btn-primary" type="button" onclick="location.href='${pageContext.request.contextPath}/gw/board/postModify.do?postNo=${post.postNo}'">수정</button>&nbsp;
			<button class="btn btn-primary" type="button" onclick="location.href='${pageContext.request.contextPath}/gw/board/deletePostBoard.do?postNo=${post.postNo}'">삭제</button>
        </div>
  	  </div>
    </div>
    <hr>
  

  <div class="groupware-board-detail-content ml-3 mt-3">
  		${post.postContent }
		<img class="post-content-img" src="${pageContext.request.contextPath }/resources/upFile/fileboard/${attach.renamedFilename}" alt="">
  </div>
  <div class="card mb-2">
	<div class="card-header bg-light">
	</div>
	<form:form action="${pageContext.request.contextPath }/gw/board/postReplyEnroll.do" method="post" >
		<div class="d-flex mt-3 ml-2 mr-2">
			<input type="hidden" value="${post.postNo}" name ="postNo">
			<input type="text" class="form-control" placeholder="댓글을 입력하세요" name="content">
			<button type="submit" class="btn btn-dark ml-1   board-post-rep-btn-enroll">등록</button>
		</div>
	</form:form>
	<hr class="ml-2 mr-2 border-0">
	<div class="post-rep-box">
			<c:forEach items="${replyList}" var="reply">
				<form:form action="${pageContext.request.contextPath }/main/deleteQueReply.do" method="post">
				<div class="rep-profile-box">
				<%-- <img class="member-profile-img" src="${pageContext.request.contextPath }/resources/upFile/fileboard/${attach.renamedFilename}" alt=""> --%>
				</div>
					<div class="d-flex bd-highlight" style="text-align-last: start;">
						<div class="p-2 bd-highlight">${memberWithGroupMap[reply.memberId]}:</div>
						<div class="p-2 flex-grow-1 bd-highlight">${reply.content}</div>
						<div class="p-2 bd-highlight" style="font-size: 10px;">
							<fmt:formatDate value="${reply.regDate}" pattern="yy-MM-dd" />
							<c:if test="${reply.memberId eq loginMember.id}">
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
</div>
<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>

